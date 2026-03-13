<?php
require_once 'src/includes/db.php';

try {
    $pdo->exec("ALTER TABLE academic_records ADD COLUMN competitive_exams_comments TEXT");
    echo "SUCCESS: Added competitive_exams_comments to academic_records\n";
} catch (PDOException $e) {
    echo "INFO: competitive_exams_comments might already exist or error: " . $e->getMessage() . "\n";
}
?>
