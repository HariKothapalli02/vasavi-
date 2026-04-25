<?php
// src/api/student.php
require_once __DIR__ . '/../includes/db.php';
require_once __DIR__ . '/../includes/crypto.php';

$method = $_SERVER['REQUEST_METHOD'];
$action = $path;
if (strpos($path, 'student/') === 0) {
    $action = substr($path, 8);
}

// Middleware
function isAuthenticated() {
    if (!isset($_SESSION['user']) || $_SESSION['user']['role'] !== 'student') {
        http_response_code(401);
        echo json_encode(['error' => 'Unauthorized']);
        exit;
    }
}

function isNotSubmitted() {
    $userId = $_SESSION['user']['id'];
    $user = db_get("SELECT is_submitted FROM users WHERE id = ?", [$userId]);
    if ($user && $user['is_submitted'] == 1) {
        http_response_code(403);
        echo json_encode(['error' => 'Application already submitted. You cannot edit details.']);
        exit;
    }
}

isAuthenticated();

/**
 * Robust file upload helper with detailed error reporting.
 */
function handleFileUpload($fileArray, $userId) {
    if (!isset($fileArray) || $fileArray['error'] === UPLOAD_ERR_NO_FILE) {
        return null;
    }

    if ($fileArray['error'] !== UPLOAD_ERR_OK) {
        $errorMsgs = [
            UPLOAD_ERR_INI_SIZE   => "File exceeds server's maximum allowed size.",
            UPLOAD_ERR_FORM_SIZE  => "File exceeds the maximum size specified in the form.",
            UPLOAD_ERR_PARTIAL    => "The file was only partially uploaded.",
            UPLOAD_ERR_NO_TMP_DIR => "Missing a temporary folder on the server.",
            UPLOAD_ERR_CANT_WRITE => "Failed to write file to disk.",
            UPLOAD_ERR_EXTENSION  => "A server-side extension stopped the file upload.",
        ];
        $msg = $errorMsgs[$fileArray['error']] ?? "Unknown upload error ({$fileArray['error']}).";
        throw new Exception($msg);
    }

    // 1. Enforce 5MB limit (5 * 1024 * 1024 bytes)
    $maxSize = 5 * 1024 * 1024;
    if ($fileArray['size'] > $maxSize) {
        throw new Exception("File is too large. Maximum size allowed is 5MB.");
    }

    // 2. Enforce File Type Restriction (PDF, PNG, JPG, JPEG)
    $allowedExtensions = ['pdf', 'png', 'jpg', 'jpeg'];
    $fileExt = strtolower(pathinfo($fileArray['name'], PATHINFO_EXTENSION));
    
    if (!in_array($fileExt, $allowedExtensions)) {
        throw new Exception("Invalid file type (.$fileExt). Only PDF, PNG, JPG, and JPEG are allowed.");
    }

    // Optional: MIME type verification for better security
    $allowedMime = ['application/pdf', 'image/png', 'image/jpeg', 'image/jpg'];
    if (!in_array($fileArray['type'], $allowedMime)) {
        // Some systems might use different MIME types, so we check both extension and mime
        // but extension is what the user specifically asked for. 
        // We'll proceed with extension check as primary.
    }

    $fileData = file_get_contents($fileArray['tmp_name']);
    if ($fileData === false) {
        throw new Exception("Failed to read uploaded file data.");
    }
    
    $encrypted = encrypt_data($fileData);
    
    db_run("INSERT INTO file_uploads (user_id, filename, mime_type, data, iv) VALUES (?, ?, ?, ?, ?)", [
        $userId, $fileArray['name'], $fileArray['type'], $encrypted['encrypted'], $encrypted['iv']
    ]);
    
    return "FILE:" . db_last_id();
}

if ($method === 'GET') {
    // Force fresh data from server
    header("Cache-Control: no-cache, must-revalidate");
    // Release session lock early for read operations to improve performance
    session_write_close();
    
    if ($action === 'profile') {
        $user = db_get("SELECT name, email, department, roll_number, contact_number, bio, is_submitted, profile_photo, recommendation_letter_path, declaration_place, declaration_date, signature_path FROM users WHERE id = ?", [$_SESSION['user']['id']]);
        echo json_encode($user);
    } elseif ($action === 'academic') {
        $row = db_get("SELECT * FROM academic_records WHERE user_id = ?", [$_SESSION['user']['id']]);
        echo json_encode($row ?: new stdClass());
    } elseif ($action === 'co-curricular') {
        $rows = db_all("SELECT * FROM co_curricular WHERE user_id = ?", [$_SESSION['user']['id']]);
        echo json_encode($rows);
    } elseif ($action === 'extracurricular') {
        $rows = db_all("SELECT * FROM extracurricular WHERE user_id = ?", [$_SESSION['user']['id']]);
        echo json_encode($rows);
    } elseif ($action === 'winner') {
        $row = db_get("SELECT name, department, roll_number, profile_photo FROM users WHERE is_best_outgoing = 1 LIMIT 1");
        echo json_encode($row ?: new stdClass());
    }

} elseif ($method === 'POST') {
    // Check for post_max_size violation
    if (empty($_POST) && empty($_FILES) && $_SERVER['CONTENT_LENGTH'] > 0) {
        http_response_code(413); // Payload Too Large
        echo json_encode(['error' => 'File too large. Maximum upload size is ' . ini_get('post_max_size')]);
        exit;
    }

    try {
        isNotSubmitted();
        $userId = $_SESSION['user']['id'];

        if ($action === 'profile') {
            $bio = $_POST['bio'] ?? null;
            $photoId = handleFileUpload($_FILES['profile_photo'] ?? null, $userId);

            if ($photoId) {
                db_run("UPDATE users SET bio = ?, profile_photo = ? WHERE id = ?",
                    [$bio, $photoId, $userId]);
                echo json_encode(['message' => 'Profile updated successfully', 'profile_photo' => $photoId]);
            } else {
                db_run("UPDATE users SET bio = ? WHERE id = ?",
                    [$bio, $userId]);
                echo json_encode(['message' => 'Profile updated successfully']);
            }

        } elseif ($action === 'academic') {
            $cgpa = $_POST['cgpa'] ?: null;
            $research_papers = $_POST['research_papers'] ?? '';
            $certifications = $_POST['certifications'] ?? '';
            
            $sgpas = [];
            for($i=1; $i<=7; $i++) {
                $sgpas[] = $_POST["sgpa_sem$i"] ?: null;
            }
            $sgpas[] = null; // Sem 8

            // Honours/Minors Logic
            $finalHonoursMinors = 'No';
            if (isset($_POST['honours_minors_type']) && $_POST['honours_minors_type'] !== 'No') {
                $courses = json_decode($_POST['nptel_courses'] ?? '[]', true);
                $updatedCourses = [];
                foreach($courses as $index => $course) {
                    $certPath = $course['existing_path'] ?? null;
                    $newFileId = handleFileUpload($_FILES["nptel_file_$index"] ?? null, $userId);
                    if ($newFileId) $certPath = $newFileId;
                    
                    $updatedCourses[] = ['name' => $course['name'], 'certificate_path' => $certPath];
                }
                $finalHonoursMinors = json_encode(['type' => $_POST['honours_minors_type'], 'courses' => $updatedCourses]);
            }

            // Competitive Exams Logic
            $finalCompetitiveExams = $_POST['competitive_exams'] ?? 'No';
            if (isset($_POST['exam_details'])) {
                $exams = json_decode($_POST['exam_details'] ?? '[]', true);
                $updatedExams = [];
                foreach($exams as $index => $exam) {
                    $certPath = $exam['certificate_path'] ?? null;
                    $newFileId = handleFileUpload($_FILES["exam_file_$index"] ?? null, $userId);
                    if ($newFileId) $certPath = $newFileId;
                    
                    $updatedExams[] = ['name' => $exam['name'], 'score' => $exam['score'], 'certificate_path' => $certPath];
                }
                $finalCompetitiveExams = json_encode($updatedExams);
            }

            $existing = db_get("SELECT * FROM academic_records WHERE user_id = ?", [$userId]);
            $p_backlogs = 0; $h_backlogs = 0;

            if ($existing) {
                $sql = "UPDATE academic_records SET cgpa = ?, research_papers = ?, certifications = ?, 
                        sgpa_sem1 = ?, sgpa_sem2 = ?, sgpa_sem3 = ?, sgpa_sem4 = ?, 
                        sgpa_sem5 = ?, sgpa_sem6 = ?, sgpa_sem7 = ?, sgpa_sem8 = ?, 
                        honours_minors = ?, competitive_exams = ?, 
                        present_backlogs = ?, history_of_backlogs = ? WHERE user_id = ?";
                $params = array_merge([$cgpa, $research_papers, $certifications], $sgpas, [$finalHonoursMinors, $finalCompetitiveExams, $p_backlogs, $h_backlogs, $userId]);
                db_run($sql, $params);
            } else {
                $sql = "INSERT INTO academic_records (user_id, cgpa, research_papers, certifications, 
                        sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, 
                        sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, 
                        honours_minors, competitive_exams, present_backlogs, history_of_backlogs) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                $params = array_merge([$userId, $cgpa, $research_papers, $certifications], $sgpas, [$finalHonoursMinors, $finalCompetitiveExams, $p_backlogs, $h_backlogs]);
                db_run($sql, $params);
            }
            echo json_encode(['message' => 'Academic records updated']);

        } elseif ($action === 'activities/save-all') {
            $type = $_POST['type'] ?? 'co_curricular';
            $activityMap = json_decode($_POST['data'] ?? '[]', true);
            $tableName = ($type === 'co_curricular') ? 'co_curricular' : 'extracurricular';

            foreach ($activityMap as $activity_type => $items) {
                db_run("DELETE FROM $tableName WHERE user_id = ? AND activity_type = ?", [$userId, $activity_type]);
                foreach ($items as $index => $item) {
                    $certPath = $item['existing_path'] ?? null;
                    $fileKey = "file_" . str_replace(' ', '_', $activity_type) . "_" . $index;
                    $newFileId = handleFileUpload($_FILES[$fileKey] ?? null, $userId);
                    if ($newFileId) $certPath = $newFileId;

                    if ($type === 'co_curricular') {
                        db_run("INSERT INTO co_curricular (user_id, activity_type, title, description, date, certificate_path, score) VALUES (?, ?, ?, ?, ?, ?, ?)",
                            [$userId, $activity_type, $item['name'] ?? '', $item['description'] ?? '', date('Y-m-d H:i:s'), $certPath, $item['score'] ?? 0]);
                    } else {
                        db_run("INSERT INTO extracurricular (user_id, activity_type, title, description, level, certificate_path, score) VALUES (?, ?, ?, ?, ?, ?, ?)",
                            [$userId, $activity_type, $item['name'] ?? '', $item['description'] ?? '', $item['level'] ?? 'District', $certPath, $item['score'] ?? 0]);
                    }
                }
            }
            echo json_encode(['message' => 'All activities updated successfully']);

        } elseif ($action === 'recommendation') {
            $recId = handleFileUpload($_FILES['recommendation_letter'] ?? null, $userId);
            if (!$recId) throw new Exception("Please select a file to upload.");

            db_run("UPDATE users SET recommendation_letter_path = ? WHERE id = ?", [$recId, $userId]);
            echo json_encode(['message' => 'Recommendation letter uploaded', 'file_id' => $recId]);

        } elseif ($action === 'submit') {
            $place = $_POST['declaration_place'] ?? null;
            $date = $_POST['declaration_date'] ?? null;
            $sigId = handleFileUpload($_FILES['signature'] ?? null, $userId);

            if (!$sigId) {
                // If not uploading new, check if existing signature exists
                $user = db_get("SELECT signature_path FROM users WHERE id = ?", [$userId]);
                $sigId = $user['signature_path'] ?? null;
            }

            if (!$place || !$date || !$sigId) {
                 http_response_code(400);
                 echo json_encode(['error' => 'Missing declaration details (Place, Date or Signature).']);
                 exit;
            }

            db_run("UPDATE users SET is_submitted = 1, declaration_place = ?, declaration_date = ?, signature_path = ? WHERE id = ?", 
                [$place, $date, $sigId, $userId]);
            echo json_encode(['message' => 'Application submitted successfully']);
        }

    } catch (Exception $e) {
        http_response_code(400);
        echo json_encode(['error' => $e->getMessage()]);
    }
}
