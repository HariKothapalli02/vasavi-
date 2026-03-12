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

if ($method === 'GET') {
    // Release session lock early for read operations to improve performance
    session_write_close();
    
    if ($action === 'profile') {
        $user = db_get("SELECT name, email, department, roll_number, contact_number, bio, is_submitted, profile_photo, recommendation_letter_path, declaration_place, declaration_date, signature_path FROM users WHERE id = ?", [$_SESSION['user']['id']]);
        echo json_encode($user);
    } elseif ($action === 'academic') {
        $row = db_get("SELECT *, present_backlogs, history_of_backlogs FROM academic_records WHERE user_id = ?", [$_SESSION['user']['id']]);
        echo json_encode($row ?: new stdClass());
    } elseif ($action === 'co-curricular') {
        $rows = db_all("SELECT * FROM co_curricular WHERE user_id = ?", [$_SESSION['user']['id']]);
        echo json_encode($rows);
    } elseif ($action === 'extracurricular') {
        $rows = db_all("SELECT * FROM extracurricular WHERE user_id = ?", [$_SESSION['user']['id']]);
        echo json_encode($rows);
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
            
            $photoId = null;
            if (isset($_FILES['profile_photo'])) {
                if ($_FILES['profile_photo']['error'] === UPLOAD_ERR_OK) {
                    $fileData = file_get_contents($_FILES['profile_photo']['tmp_name']);
                    $encrypted = encrypt_data($fileData);
                    
                    db_run("INSERT INTO file_uploads (user_id, filename, mime_type, data, iv) VALUES (?, ?, ?, ?, ?)", [
                        $userId, $_FILES['profile_photo']['name'], $_FILES['profile_photo']['type'], $encrypted['encrypted'], $encrypted['iv']
                    ]);
                    $photoId = "FILE:" . db_last_id();
                } elseif ($_FILES['profile_photo']['error'] !== UPLOAD_ERR_NO_FILE) {
                    http_response_code(400);
                    echo json_encode(['error' => 'Profile photo upload failed with error code: ' . $_FILES['profile_photo']['error']]);
                    exit;
                }
            }

            if ($photoId) {
                db_run("UPDATE users SET bio = ?, profile_photo = ? WHERE id = ?",
                    [$bio, $photoId, $userId]);
                echo json_encode(['message' => 'Profile updated successfully', 'profile_photo' => $photoId]);
            } else {
                db_run("UPDATE users SET bio = ? WHERE id = ?",
                    [$bio, $userId]);
                echo json_encode(['message' => 'Profile updated successfully']);
            }
        }
 elseif ($action === 'academic') {
            $cgpa = $_POST['cgpa'] ?: null;
            $projects = $_POST['projects'] ?? '';
            $research_papers = $_POST['research_papers'] ?? '';
            $certifications = $_POST['certifications'] ?? '';
            
            $sgpas = [];
            for($i=1; $i<=8; $i++) {
                $sgpas[] = $_POST["sgpa_sem$i"] ?: null;
            }

            // Honours/Minors Logic
            $finalHonoursMinors = 'No';
            if (isset($_POST['honours_minors_type']) && $_POST['honours_minors_type'] !== 'No') {
                $courses = json_decode($_POST['nptel_courses'] ?? '[]', true);
                $updatedCourses = [];
                foreach($courses as $index => $course) {
                    $certPath = $course['existing_path'] ?? null;
                    $fileKey = "nptel_file_$index";
                    if (isset($_FILES[$fileKey])) {
                        if ($_FILES[$fileKey]['error'] === UPLOAD_ERR_OK) {
                            $fileData = file_get_contents($_FILES[$fileKey]['tmp_name']);
                            $encrypted = encrypt_data($fileData);
                            db_run("INSERT INTO file_uploads (user_id, filename, mime_type, data, iv) VALUES (?, ?, ?, ?, ?)", [
                                $userId, $_FILES[$fileKey]['name'], $_FILES[$fileKey]['type'], $encrypted['encrypted'], $encrypted['iv']
                            ]);
                            $certPath = "FILE:" . db_last_id();
                        } elseif ($_FILES[$fileKey]['error'] !== UPLOAD_ERR_NO_FILE) {
                            http_response_code(400);
                            echo json_encode(['error' => "NPTEL file upload failed for course '$index' with error code: " . $_FILES[$fileKey]['error']]);
                            exit;
                        }
                    }
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
                    $fileKey = "exam_file_$index";
                    if (isset($_FILES[$fileKey])) {
                        if ($_FILES[$fileKey]['error'] === UPLOAD_ERR_OK) {
                            $fileData = file_get_contents($_FILES[$fileKey]['tmp_name']);
                            $encrypted = encrypt_data($fileData);
                            db_run("INSERT INTO file_uploads (user_id, filename, mime_type, data, iv) VALUES (?, ?, ?, ?, ?)", [
                                $userId, $_FILES[$fileKey]['name'], $_FILES[$fileKey]['type'], $encrypted['encrypted'], $encrypted['iv']
                            ]);
                            $certPath = "FILE:" . db_last_id();
                        } elseif ($_FILES[$fileKey]['error'] !== UPLOAD_ERR_NO_FILE) {
                            http_response_code(400);
                            echo json_encode(['error' => "Exam file upload failed for '$index' with error code: " . $_FILES[$fileKey]['error']]);
                            exit;
                        }
                    }
                    $updatedExams[] = ['name' => $exam['name'], 'score' => $exam['score'], 'certificate_path' => $certPath];
                }
                $finalCompetitiveExams = json_encode($updatedExams);
            }

            // Fetch existing records to protect official data
            $existing = db_get("SELECT * FROM academic_records WHERE user_id = ?", [$userId]);
            $role = $_SESSION['user']['role'] ?? '';
            $isStudent = (strcasecmp($role, 'student') === 0);

            if ($isStudent) {
                if ($existing) {
                    $cgpa = $existing['cgpa'];
                    foreach($sgpas as $i => $val) {
                        $sgpas[$i] = $existing["sgpa_sem" . ($i + 1)];
                    }
                    $p_backlogs = $existing['present_backlogs'];
                    $h_backlogs = $existing['history_of_backlogs'];
                } else {
                    $cgpa = 0;
                    $sgpas = array_fill(0, 8, 0);
                    $p_backlogs = 0;
                    $h_backlogs = 0;
                }
            } else {
                $p_backlogs = $_POST['present_backlogs'] ?? ($existing['present_backlogs'] ?? 0);
                $h_backlogs = $_POST['history_of_backlogs'] ?? ($existing['history_of_backlogs'] ?? 0);
            }

            if ($existing) {
                $sql = "UPDATE academic_records SET cgpa = ?, projects = ?, research_papers = ?, certifications = ?, 
                        sgpa_sem1 = ?, sgpa_sem2 = ?, sgpa_sem3 = ?, sgpa_sem4 = ?, 
                        sgpa_sem5 = ?, sgpa_sem6 = ?, sgpa_sem7 = ?, sgpa_sem8 = ?, 
                        honours_minors = ?, competitive_exams = ?, 
                        present_backlogs = ?, history_of_backlogs = ? WHERE user_id = ?";
                $params = array_merge([$cgpa, $projects, $research_papers, $certifications], $sgpas, [$finalHonoursMinors, $finalCompetitiveExams, $p_backlogs, $h_backlogs, $userId]);
                db_run($sql, $params);
                echo json_encode(['message' => 'Academic records updated']);
            } else {
                $sql = "INSERT INTO academic_records (user_id, cgpa, projects, research_papers, certifications, 
                        sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, 
                        sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, 
                        honours_minors, competitive_exams, present_backlogs, history_of_backlogs) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                $params = array_merge([$userId, $cgpa, $projects, $research_papers, $certifications], $sgpas, [$finalHonoursMinors, $finalCompetitiveExams, $p_backlogs, $h_backlogs]);
                db_run($sql, $params);
                echo json_encode(['message' => 'Academic records saved']);
            }
        } elseif ($action === 'activities/save-all') {
            // New Consolidate endpoint for co-curricular/extracurricular activities
            $type = $_POST['type'] ?? 'co_curricular'; // 'co_curricular' or 'extracurricular'
            $activityMap = json_decode($_POST['data'] ?? '[]', true);
            $tableName = ($type === 'co_curricular') ? 'co_curricular' : 'extracurricular';

            foreach ($activityMap as $activity_type => $items) {
                // Delete existing for this specific activity type
                db_run("DELETE FROM $tableName WHERE user_id = ? AND activity_type = ?", [$userId, $activity_type]);
                
                foreach ($items as $index => $item) {
                    $certPath = $item['existing_path'] ?? null;
                    // File keys are structured as file_ACTIVITYTYPE_INDEX
                    $fileKey = "file_" . str_replace(' ', '_', $activity_type) . "_" . $index;
                    
                    if (isset($_FILES[$fileKey]) && $_FILES[$fileKey]['error'] === UPLOAD_ERR_OK) {
                        $fileData = file_get_contents($_FILES[$fileKey]['tmp_name']);
                        $encrypted = encrypt_data($fileData);
                        db_run("INSERT INTO file_uploads (user_id, filename, mime_type, data, iv) VALUES (?, ?, ?, ?, ?)", [
                            $userId, $_FILES[$fileKey]['name'], $_FILES[$fileKey]['type'], $encrypted['encrypted'], $encrypted['iv']
                        ]);
                        $certPath = "FILE:" . db_last_id();
                    }

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
        } elseif ($action === 'co-curricular/bulk' || $action === 'extracurricular/bulk') {
            $type = ($action === 'co-curricular/bulk') ? 'co_curricular' : 'extracurricular';
            $activity_type = $_POST['activity_type'] ?? null;
            $items = json_decode($_POST['items'] ?? '[]', true);

            if (!$activity_type) {
                http_response_code(400);
                echo json_encode(['error' => 'Activity type required']);
                exit;
            }

            db_run("DELETE FROM $type WHERE user_id = ? AND activity_type = ?", [$userId, $activity_type]);

            foreach ($items as $index => $item) {
                $certPath = $item['existing_path'] ?? null;
                $fileKey = "file_$index";
                if (isset($_FILES[$fileKey]) && $_FILES[$fileKey]['error'] === UPLOAD_ERR_OK) {
                    $fileData = file_get_contents($_FILES[$fileKey]['tmp_name']);
                    $encrypted = encrypt_data($fileData);
                    db_run("INSERT INTO file_uploads (user_id, filename, mime_type, data, iv) VALUES (?, ?, ?, ?, ?)", [
                        $userId, $_FILES[$fileKey]['name'], $_FILES[$fileKey]['type'], $encrypted['encrypted'], $encrypted['iv']
                    ]);
                    $certPath = "FILE:" . db_last_id();
                }

                if ($type === 'co_curricular') {
                    db_run("INSERT INTO co_curricular (user_id, activity_type, title, description, date, certificate_path, score) VALUES (?, ?, ?, ?, ?, ?, ?)",
                        [$userId, $activity_type, $item['name'], $item['description'] ?? '', date('Y-m-d H:i:s'), $certPath, $item['score'] ?? 0]);
                } else {
                    db_run("INSERT INTO extracurricular (user_id, activity_type, title, description, level, certificate_path, score) VALUES (?, ?, ?, ?, ?, ?, ?)",
                        [$userId, $activity_type, $item['name'], $item['description'] ?? '', $item['level'] ?? 'District', $certPath, $item['score'] ?? 0]);
                }
            }
            echo json_encode(['message' => 'Bulk update successful']);
        } elseif ($action === 'recommendation') {
            if (!isset($_FILES['recommendation_letter']) || $_FILES['recommendation_letter']['error'] !== UPLOAD_ERR_OK) {
                http_response_code(400);
                echo json_encode(['error' => 'File upload failed']);
                exit;
            }

            $fileData = file_get_contents($_FILES['recommendation_letter']['tmp_name']);
            $encrypted = encrypt_data($fileData);
            db_run("INSERT INTO file_uploads (user_id, filename, mime_type, data, iv) VALUES (?, ?, ?, ?, ?)", [
                $userId, $_FILES['recommendation_letter']['name'], $_FILES['recommendation_letter']['type'], $encrypted['encrypted'], $encrypted['iv']
            ]);
            $recId = "FILE:" . db_last_id();

            db_run("UPDATE users SET recommendation_letter_path = ? WHERE id = ?", [$recId, $userId]);
            echo json_encode(['message' => 'Recommendation letter uploaded']);

        } elseif ($action === 'submit') {
            $place = $_POST['declaration_place'] ?? null;
            $date = $_POST['declaration_date'] ?? null;
            $sigId = null;

            if (isset($_FILES['signature'])) {
                if ($_FILES['signature']['error'] === UPLOAD_ERR_OK) {
                    $fileData = file_get_contents($_FILES['signature']['tmp_name']);
                    $encrypted = encrypt_data($fileData);
                    db_run("INSERT INTO file_uploads (user_id, filename, mime_type, data, iv) VALUES (?, ?, ?, ?, ?)", [
                        $userId, $_FILES['signature']['name'], $_FILES['signature']['type'], $encrypted['encrypted'], $encrypted['iv']
                    ]);
                    $sigId = "FILE:" . db_last_id();
                } else {
                    http_response_code(400);
                    echo json_encode(['error' => 'Signature upload failed.']);
                    exit;
                }
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
        http_response_code(500);
        echo json_encode(['error' => 'Server Error: ' . $e->getMessage()]);
    }
}


