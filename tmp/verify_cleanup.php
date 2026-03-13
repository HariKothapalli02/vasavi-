<?php
require_once 'src/includes/db.php';

$tables = [
    "academic_records",
    "co_curricular",
    "department_toppers",
    "extracurricular",
    "file_uploads",
    "final_scores",
    "interview_marks"
];

$results = [];
foreach ($tables as $table) {
    try {
        $stmt = $pdo->query("SELECT COUNT(*) FROM $table");
        $count = $stmt->fetchColumn();
        $results[$table] = $count;
    } catch (Exception $e) {
        $results[$table] = "Error: " . $e->getMessage();
    }
}

// Check some users for reset details
$sampleUser = db_get("SELECT name, contact_number, bio, is_submitted FROM users WHERE role = 'student' LIMIT 1");
$results['sample_user_reset_check'] = $sampleUser;

echo json_encode($results, JSON_PRETTY_PRINT);
?>
