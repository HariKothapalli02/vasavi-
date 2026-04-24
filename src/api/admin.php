<?php
// src/api/admin.php
require_once __DIR__ . '/../includes/db.php';

$method = $_SERVER['REQUEST_METHOD'];
$action = $path;
if (strpos($path, 'admin/') === 0) {
    $action = substr($path, 6);
}

// Middleware: Admin or Panel for browsing
function isStaff() {
    if (!isset($_SESSION['user']) || !in_array($_SESSION['user']['role'], ['admin', 'panel'])) {
        http_response_code(401);
        echo json_encode(['error' => 'Unauthorized: Staff access required']);
        exit;
    }
}

// Global check for GET, stricter for POST
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    isStaff();
} else {
    // POST/PUT/DELETE still requires admin for management
    if (!isset($_SESSION['user']) || $_SESSION['user']['role'] !== 'admin') {
        http_response_code(401);
        echo json_encode(['error' => 'Unauthorized: Admin access required']);
        exit;
    }
}

if ($method === 'GET') {
    if ($action === 'students') {
        $departmentFilter = "";
        $params = [];
        
        if (isset($_SESSION['user']['department']) && !empty($_SESSION['user']['department'])) {
            // HOD: Filter by department(s) with normalization
            $depts = explode(',', $_SESSION['user']['department']);
            $placeholders = [];
            foreach ($depts as $dept) {
                $placeholders[] = "UPPER(TRIM(u.department)) = UPPER(TRIM(?))";
                $params[] = trim($dept);
            }
            if (!empty($placeholders)) {
                $departmentFilter = " AND (" . implode(' OR ', $placeholders) . ")";
            }
        } else {
            // Super Admin & Panel: Show ONLY students that HOD has submitted
            $departmentFilter = " AND ar.is_hod_submitted = 1"; 
        }

        $query = "
            SELECT u.id, u.name, u.department, u.roll_number, u.is_submitted, u.is_sent_to_panel,
                   ar.cgpa, ar.is_hod_submitted,
                   (SELECT COUNT(*) FROM co_curricular WHERE user_id = u.id) as co_curricular_count,
                   (SELECT COUNT(*) FROM extracurricular WHERE user_id = u.id) as extracurricular_count,
                   (SELECT COUNT(*) FROM final_scores WHERE user_id = u.id) as is_evaluated,
                   fs.total_score
            FROM users u
            LEFT JOIN academic_records ar ON u.id = ar.user_id
            LEFT JOIN final_scores fs ON u.id = fs.user_id
            WHERE u.role = 'student' AND u.is_submitted = 1" . $departmentFilter . "
            ORDER BY fs.total_score DESC, u.name ASC";
        
        try {
            $data = db_all($query, $params);
            echo json_encode($data);
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['error' => 'Database Query Error: ' . $e->getMessage()]);
        }
    } elseif ($action === 'stats') {
        $deptFilter = "";
        $params = [];
        if (isset($_SESSION['user']['department']) && !empty($_SESSION['user']['department'])) {
            $depts = explode(',', $_SESSION['user']['department']);
            $placeholders = [];
            foreach ($depts as $dept) {
                $placeholders[] = "UPPER(TRIM(department)) = UPPER(TRIM(?))";
                $params[] = trim($dept);
            }
            if (!empty($placeholders)) {
                $deptFilter = " AND (" . implode(' OR ', $placeholders) . ")";
            }
        }

        if (!empty($deptFilter)) {
            $total = db_get("SELECT COUNT(*) as count FROM users WHERE role = 'student' AND is_submitted = 1" . $deptFilter, $params);
            // HOD: 'Evaluated' means 'HOD Submitted'
            $evaluated = db_get("SELECT COUNT(ar.user_id) as count FROM academic_records ar JOIN users u ON ar.user_id = u.id WHERE ar.is_hod_submitted = 1 " . str_replace('department', 'u.department', $deptFilter), $params);
            $branches = db_all("SELECT department, COUNT(*) as count FROM users WHERE role = 'student' AND is_submitted = 1" . $deptFilter . " GROUP BY department", $params);
        } else {
            // Super Admin: Track progress of evaluating HOD-submitted students
            // total = count students where HOD finished their evaluation
            $total = db_get("SELECT COUNT(*) as count FROM academic_records WHERE is_hod_submitted = 1");
            
            // evaluated = count students where Super Admin finished final scores
            $evaluated = db_get("SELECT COUNT(*) as count FROM final_scores fs JOIN academic_records ar ON fs.user_id = ar.user_id WHERE ar.is_hod_submitted = 1");
            
            // Super Admin branches: only those that reached the hand-off (HOD submitted)
            $branches = db_all("SELECT u.department, COUNT(*) as count FROM users u JOIN academic_records ar ON u.id = ar.user_id WHERE u.role = 'student' AND ar.is_hod_submitted = 1 GROUP BY u.department");
        }

        $top = db_get("SELECT MAX(total_score) as score FROM final_scores");

        echo json_encode([
            'totalStudents' => is_array($total) ? ($total['count'] ?? 0) : 0,
            'evaluated' => is_array($evaluated) ? ($evaluated['count'] ?? 0) : 0,
            'topScore' => is_array($top) ? ($top['score'] ?? 0) : 0,
            'branches' => $branches
        ]);
    } elseif ($action === 'winner-details') {
        $row = db_get("SELECT name, email, department, roll_number, contact_number, bio, profile_photo 
                       FROM users 
                       WHERE is_best_outgoing = 1 LIMIT 1");
        echo json_encode($row ?: new stdClass());
    } elseif ($action === 'toppers') {
        $query = "
            SELECT d.department, IFNULL(dt.topper_cgpa, 0) as topper_cgpa
            FROM (SELECT DISTINCT department FROM users WHERE role = 'student') d
            LEFT JOIN department_toppers dt ON d.department = dt.department
            ORDER BY d.department ASC";
        $toppers = db_all($query);
        echo json_encode($toppers);
    } elseif ($action === 'panels') {
        $panels = db_all("SELECT id, name, email FROM users WHERE role = 'panel' ORDER BY id ASC");
        echo json_encode($panels);
    } elseif (preg_match('/students\/(\d+)/', $action, $matches)) {
        try {
            $userId = $matches[1];
            $user = db_get("SELECT u.id, u.name, u.email, u.department, u.roll_number, u.profile_photo, u.is_submitted, u.declaration_place, u.declaration_date, u.signature_path, u.recommendation_letter_path, dt.topper_cgpa 
                            FROM users u 
                            LEFT JOIN department_toppers dt ON u.department = dt.department 
                            WHERE u.id = ?", [$userId]);
            if (!$user) {
                http_response_code(404);
                echo json_encode(['error' => 'Student not found']);
                exit;
            }
            $academic = db_get("SELECT * FROM academic_records WHERE user_id = ?", [$userId]);
            $coCurricular = db_all("SELECT * FROM co_curricular WHERE user_id = ?", [$userId]);
            $extracurricular = db_all("SELECT * FROM extracurricular WHERE user_id = ?", [$userId]);
            $interview = db_all("SELECT im.*, u.name as actual_name, u.email as panel_email 
                                 FROM interview_marks im 
                                 JOIN users u ON im.panel_id = u.id 
                                 WHERE im.user_id = ?", [$userId]);
            $finalScore = db_get("SELECT * FROM final_scores WHERE user_id = ?", [$userId]);

            echo json_encode([
                'user' => $user,
                'academic' => $academic,
                'coCurricular' => $coCurricular,
                'extracurricular' => $extracurricular,
                'interview' => $interview,
                'finalScore' => $finalScore
            ]);
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['error' => 'Failed to retrieve student details: ' . $e->getMessage()]);
        }
    } elseif ($action === 'leaderboard') {
        $type = $_GET['type'] ?? 'after'; // Default to after for general view
        $deptFilter = "";
        $params = [];
        
        /* 
        if (isset($_SESSION['user']['department']) && !empty($_SESSION['user']['department'])) {
            $depts = explode(',', $_SESSION['user']['department']);
            $placeholders = [];
            foreach ($depts as $dept) {
                $placeholders[] = "?";
                $params[] = trim($dept);
            }
            if (!empty($placeholders)) {
                $deptFilter = " AND u.department IN (" . implode(',', $placeholders) . ")";
            }
            $type = 'after'; // HODs always see overall view
        }
        */

        if ($type === 'before') {
            // Before Interview: Sum of academic, co-curricular, and extracurricular
            $scoreExpr = "(IFNULL(fs.academic_score, 0) + IFNULL(fs.co_curricular_score, 0) + IFNULL(fs.extracurricular_score, 0))";
            $interviewFilter = "";
        } else {
            // After Interview: Total score (Include only those actually interviewed)
            $scoreExpr = "IFNULL(fs.total_score, 0)";
            $interviewFilter = " AND EXISTS (SELECT 1 FROM interview_marks WHERE user_id = u.id)";
        }
 
        $query = "
            SELECT u.id, u.name, u.department, u.roll_number, u.is_best_outgoing,
                   $scoreExpr as score
            FROM users u
            JOIN final_scores fs ON u.id = fs.user_id
            WHERE u.role = 'student' AND u.is_submitted = 1 " . $deptFilter . $interviewFilter . "
            ORDER BY score DESC
        ";
        echo json_encode(db_all($query, $params));
    }
} elseif ($method === 'POST') {
    if ($action === 'toppers') {
        $isSuperAdmin = !isset($_SESSION['user']['department']) || empty($_SESSION['user']['department']);
        if (!$isSuperAdmin) {
            http_response_code(403);
            echo json_encode(['error' => 'Only Super Admin can edit toppers']);
            exit;
        }
        
        $input = json_decode(file_get_contents('php://input'), true);
        if (!is_array($input)) {
            http_response_code(400);
            echo json_encode(['error' => 'Invalid data format']);
            exit;
        }
        foreach ($input as $row) {
            $dept = $row['department'] ?? '';
            $cgpa = floatval($row['topper_cgpa'] ?? 10.0);
            if ($dept) {
                db_run("INSERT INTO department_toppers (department, topper_cgpa) VALUES (?, ?) 
                        ON DUPLICATE KEY UPDATE topper_cgpa = VALUES(topper_cgpa)", [$dept, $cgpa]);
            }
        }
        echo json_encode(['success' => true]);
        
    } elseif ($action === 'panels') {
        $isSuperAdmin = !isset($_SESSION['user']['department']) || empty($_SESSION['user']['department']);
        if (!$isSuperAdmin) {
            http_response_code(403);
            echo json_encode(['error' => 'Only Super Admin can manage panel members']);
            exit;
        }
        
        $input = json_decode(file_get_contents('php://input'), true);
        if (!is_array($input)) {
            http_response_code(400);
            echo json_encode(['error' => 'Invalid data format']);
            exit;
        }
        
        foreach ($input as $row) {
            $id = intval($row['id'] ?? 0);
            $name = $row['name'] ?? '';
            if ($id > 0) {
                db_run("UPDATE users SET name = ? WHERE id = ? AND role = 'panel'", [$name, $id]);
            }
        }
        echo json_encode(['success' => true]);
        
    } elseif ($action === 'evaluate') {
        $input = json_decode(file_get_contents('php://input'), true);
        $user_id = $input['user_id'] ?? null;
        
        // Determine role
        $isAdmin = true; 
        $isSuperAdmin = !isset($_SESSION['user']['department']) || empty($_SESSION['user']['department']);

        // HODs can only update overall comments
        // Super Admins can update scores AND comments
        
        // Comments provided by HOD or Super Admin
        $co_scores = $input['co_scores'] ?? [];
        $extra_scores = $input['extra_scores'] ?? [];

        try {
            // Save Comments (Available ONLY to HODs, Restricted for Super Admin)
            if (!$isSuperAdmin) {
                // Check if already submitted
                $existing = db_get("SELECT is_hod_submitted FROM academic_records WHERE user_id = ?", [$user_id]);
                if ($existing && $existing['is_hod_submitted'] == 1) {
                    echo json_encode(['error' => 'This evaluation has already been submitted and locked.']);
                    exit;
                }

                $hod_name = $input['hod_name'] ?? '';
                $hod_date = $input['hod_evaluation_date'] ?? '';
                $hod_overall = $input['hod_overall_comments'] ?? '';

                // 1. Update HOD Submission Details
                db_run("INSERT INTO academic_records (user_id, hod_name, hod_evaluation_date, hod_overall_comments, is_hod_submitted) VALUES (?, ?, ?, ?, 1) 
                        ON DUPLICATE KEY UPDATE 
                        hod_name = VALUES(hod_name),
                        hod_evaluation_date = VALUES(hod_evaluation_date),
                        hod_overall_comments = VALUES(hod_overall_comments),
                        is_hod_submitted = 1",
                        [$user_id, $hod_name, $hod_date, $hod_overall]);
            }

            // Scoring (Available ONLY to Super Admin)
            $total_score = 0;
            if ($isSuperAdmin) {
                // Check if already final submitted
                $existingFinal = db_get("SELECT is_final_submitted FROM final_scores WHERE user_id = ?", [$user_id]);
                if ($existingFinal && $existingFinal['is_final_submitted'] == 1) {
                    echo json_encode(['error' => 'This final evaluation has already been submitted and locked by Super Admin.']);
                    exit;
                }

                $academic_cgpa_score = $input['academic_cgpa_score'] ?? 0;
                $academic_honours_score = $input['academic_honours_score'] ?? 0;
                $academic_exams_score = $input['academic_exams_score'] ?? 0;
                $co_curricular_score = $input['co_curricular_score'] ?? 0;
                $extracurricular_score = $input['extracurricular_score'] ?? 0;
                $is_final = ($input['is_final_submission'] ?? false) ? 1 : 0;

                // Fetch existing interview score to preserve it
                $currentScores = db_get("SELECT interview_score FROM final_scores WHERE user_id = ?", [$user_id]);
                $interview_score_preserved = $currentScores['interview_score'] ?? 0;

                $academic_total = floatval($academic_cgpa_score) + floatval($academic_honours_score) + floatval($academic_exams_score);
                $co_score_final = min(floatval($co_curricular_score), 15);
                $extra_score_final = min(floatval($extracurricular_score), 15);
                
                // Total = Academic + Co + Extra + Preserved Interview
                $total_score = $academic_total + $co_score_final + $extra_score_final + floatval($interview_score_preserved);

                // Update Academic Scores
                db_run("UPDATE academic_records SET cgpa_score = ?, honours_score = ?, exams_score = ? WHERE user_id = ?",
                        [$academic_cgpa_score, $academic_honours_score, $academic_exams_score, $user_id]);

                // Update Co-curricular Scores
                foreach ($co_scores as $item) {
                     if(isset($item['score'])) {
                         db_run("UPDATE co_curricular SET score = ? WHERE id = ? AND user_id = ?", [$item['score'], $item['id'], $user_id]);
                     }
                }
                foreach ($extra_scores as $item) {
                     if(isset($item['score'])) {
                         db_run("UPDATE extracurricular SET score = ? WHERE id = ? AND user_id = ?", [$item['score'], $item['id'], $user_id]);
                     }
                }

                // Update Final Scores
                db_run("INSERT INTO final_scores (user_id, academic_score, co_curricular_score, extracurricular_score, interview_score, total_score, is_final_submitted)
                        VALUES (?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE 
                        academic_score = VALUES(academic_score), co_curricular_score = VALUES(co_curricular_score), 
                        extracurricular_score = VALUES(extracurricular_score), interview_score = VALUES(interview_score), 
                        total_score = VALUES(total_score), is_final_submitted = VALUES(is_final_submitted)",
                        [$user_id, $academic_total, $co_score_final, $extra_score_final, $interview_score_preserved, $total_score, $is_final]);
                
                $msg = $is_final ? 'Final Evaluation saved and LOCKED' : 'Evaluation scores and comments saved';
                echo json_encode(['message' => $msg, 'total_score' => $total_score, 'is_locked' => $is_final]);
            } else {
                // HOD: Only comments saved
                echo json_encode(['message' => 'Comments saved successfully (Scoring restricted to Super Admin)']);
            }
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['error' => 'Database Error: ' . $e->getMessage()]);
        }
    } elseif ($action === 'send_to_panel') {
        try {
            // Only Super Admin should be able to send to panel
            if (!empty($_SESSION['user']['department'])) {
                http_response_code(403);
                echo json_encode(['error' => 'Unauthorized: Only Super Admin can send students to the panel']);
                exit;
            }

            $input = json_decode(file_get_contents('php://input'), true);
            $user_id = $input['user_id'] ?? null;
            
            if (!$user_id) {
                http_response_code(400);
                echo json_encode(['error' => 'User ID required']);
                exit;
            }

            db_run("UPDATE users SET is_sent_to_panel = 1 WHERE id = ?", [$user_id]);
            echo json_encode(['message' => 'Student sent to panel successfully']);
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['error' => 'Database Error: ' . $e->getMessage()]);
        }
        exit;
    } elseif ($action === 'announce-winner') {
        try {
            // Only Super Admin
            if (!empty($_SESSION['user']['department'])) {
                http_response_code(403);
                echo json_encode(['error' => 'Unauthorized: Only Super Admin can announce the winner']);
                exit;
            }

            $input = json_decode(file_get_contents('php://input'), true);
            $user_id = $input['user_id'] ?? null;

            if (!$user_id) {
                http_response_code(400);
                echo json_encode(['error' => 'User ID required']);
                exit;
            }

            // Transaction-like behavior: Reset all, then set one
            db_run("UPDATE users SET is_best_outgoing = 0 WHERE role = 'student'");
            db_run("UPDATE users SET is_best_outgoing = 1 WHERE id = ?", [$user_id]);

            echo json_encode(['message' => 'Best Outgoing Student announced successfully!']);
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['error' => 'Database Error: ' . $e->getMessage()]);
        }
        exit;
    } elseif ($action === 'reset-submission') {
        try {
            if (!empty($_SESSION['user']['department'])) {
                http_response_code(403);
                echo json_encode(['error' => 'Unauthorized: Only Super Admin can reset submissions']);
                exit;
            }
            $input = json_decode(file_get_contents('php://input'), true);
            $user_id = $input['user_id'] ?? null;
            if (!$user_id) {
                http_response_code(400);
                echo json_encode(['error' => 'User ID required']);
                exit;
            }
            db_run("UPDATE users SET is_submitted = 0, is_sent_to_panel = 0 WHERE id = ?", [$user_id]);
            db_run("UPDATE academic_records SET is_hod_submitted = 0 WHERE user_id = ?", [$user_id]);
            db_run("UPDATE final_scores SET is_final_submitted = 0 WHERE user_id = ?", [$user_id]);
            echo json_encode(['message' => 'Student submission has been reset successfully.']);
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['error' => 'Database Error: ' . $e->getMessage()]);
        }
        exit;
    }
}
