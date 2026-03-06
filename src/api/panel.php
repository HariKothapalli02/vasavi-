<?php
// src/api/panel.php
require_once __DIR__ . '/../includes/db.php';

$method = $_SERVER['REQUEST_METHOD'];

// Get action from global $path variable provided by router
$action = str_replace('panel/', '', $path);

// Middleware: Ensure user is a Panel Member
function isPanel() {
    if (!isset($_SESSION['user']) || $_SESSION['user']['role'] !== 'panel') {
        http_response_code(401);
        echo json_encode(['error' => 'Unauthorized: Panel access required']);
        exit;
    }
}

isPanel();

if ($method === 'GET') {
    try {
        if ($action === 'students') {
            // Fetch students assigned to panel (is_sent_to_panel = 1)
            $query = "
                SELECT u.id, u.name, u.department, u.roll_number, u.is_submitted,
                       (SELECT COUNT(*) FROM interview_marks WHERE user_id = u.id AND panel_id = ?) as is_evaluated
                FROM users u
                WHERE u.role = 'student' 
                  AND u.is_submitted = 1 
                  AND u.is_sent_to_panel = 1
            ";
            
            echo json_encode(db_all($query, [$_SESSION['user']['id']]));
        } elseif ($action === 'students/details') {
            $userId = $_GET['id'] ?? null;
            if (!$userId) {
                http_response_code(400);
                echo json_encode(['error' => 'Student ID required']);
                exit;
            }

            // Verify assignment (Stricter for HOD/SuperAdmin logic, but for Panel browsing we allow viewing)
            // If they are a panel member, they can browse details of any submitted student.
            $check = db_get("SELECT id FROM users WHERE id = ? AND is_submitted = 1", [$userId]);
            if (!$check) {
                http_response_code(403);
                echo json_encode(['error' => 'Student details not available or not submitted']);
                exit;
            }

            $user = db_get("SELECT id, name, email, department, roll_number, contact_number, bio, profile_photo, is_submitted, declaration_place, declaration_date, signature_path, recommendation_letter_path FROM users WHERE id = ?", [$userId]);
            $academic = db_get("SELECT * FROM academic_records WHERE user_id = ?", [$userId]);
            $coCurricular = db_all("SELECT * FROM co_curricular WHERE user_id = ?", [$userId]);
            $extracurricular = db_all("SELECT * FROM extracurricular WHERE user_id = ?", [$userId]);
            $interview = db_all("SELECT * FROM interview_marks WHERE user_id = ?", [$userId]);
            $finalScore = db_get("SELECT * FROM final_scores WHERE user_id = ?", [$userId]);
            
            // Fetch current panel member's score
            $panelId = $_SESSION['user']['id'];
            $myScore = db_get("SELECT score FROM interview_marks WHERE user_id = ? AND panel_id = ?", [$userId, $panelId]);

            echo json_encode([
                'user' => $user,
                'academic' => $academic,
                'coCurricular' => $coCurricular,
                'extracurricular' => $extracurricular,
                'interview' => $interview,
                'finalScore' => $finalScore,
                'myScore' => $myScore ? $myScore['score'] : 0
            ]);
        }
    } catch (Exception $e) {
        http_response_code(500);
        echo json_encode(['error' => 'API Error: ' . $e->getMessage()]);
    }
}
 elseif ($method === 'POST') {
    if ($action === 'evaluate/interview') {
        $input = json_decode(file_get_contents('php://input'), true);
        $userId = $input['user_id'] ?? null;
        $score = $input['interview_score'] ?? 0;

        if (!$userId) {
             http_response_code(400);
             echo json_encode(['error' => 'User ID required']);
             exit;
        }
        
        // Verify assignment (Allow panel members to evaluate any submitted student)
        $check = db_get("SELECT id FROM users WHERE id = ? AND is_submitted = 1", [$userId]);
        if (!$check) {
            http_response_code(403);
            echo json_encode(['error' => 'Student not available for evaluation or not submitted']);
            exit;
        }

        // Update Interview Score
        // interview_marks table is for multiple panel members if we want average, but user requirement is simple panel score.
        // HOD interface uses final_scores directly for total logic.
        // Let's stick to final_scores interview_score for now as simplistic approach, or creating interview_marks entry.
        // Given existing code references final_scores interview_score, we update that.
        
        // However, wait. Previous code in admin.php handles total calculation.
        // If panel sets score, we should update final_scores.
        
        try {
            $panelId = $_SESSION['user']['id'];

            // 0. Check if already evaluated by THIS panel member
            $existing = db_get("SELECT id FROM interview_marks WHERE user_id = ? AND panel_id = ?", [$userId, $panelId]);
            if ($existing) {
                http_response_code(403);
                echo json_encode(['error' => 'You have already submitted your evaluation for this student and it cannot be modified.']);
                exit;
            }

            // 1. Save individual score
            db_run("INSERT INTO interview_marks (user_id, panel_id, score) VALUES (?, ?, ?)",
                    [$userId, $panelId, $score]);

            // 2. Calculate average
            $avgData = db_get("SELECT AVG(score) as average FROM interview_marks WHERE user_id = ?", [$userId]);
            $avgScore = $avgData['average'] ?? 0;

            // 3. Update Final Scores
            $current = db_get("SELECT * FROM final_scores WHERE user_id = ?", [$userId]);
            
            $ac = $current['academic_score'] ?? 0;
            $co = $current['co_curricular_score'] ?? 0;
            $ex = $current['extracurricular_score'] ?? 0;
            
            // Total = academic + co + extra + AVERAGE interview
            $total = floatval($ac) + floatval($co) + floatval($ex) + floatval($avgScore);

            db_run("INSERT INTO final_scores (user_id, interview_score, total_score) VALUES (?, ?, ?)
                    ON DUPLICATE KEY UPDATE interview_score = VALUES(interview_score), total_score = VALUES(total_score)", 
                    [$userId, $avgScore, $total]);

            echo json_encode(['message' => 'Interview score saved and average updated', 'average' => $avgScore]);
        } catch (Exception $e) {
            http_response_code(500);
            echo json_encode(['error' => $e->getMessage()]);
        }
    }
}
?>
