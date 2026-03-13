<?php
require_once 'src/includes/db.php';

try {
    $pdo->exec("ALTER TABLE academic_records ADD COLUMN hod_name VARCHAR(255)");
    echo "Added hod_name\n";
} catch (PDOException $e) {}

try {
    $pdo->exec("ALTER TABLE academic_records ADD COLUMN hod_evaluation_date VARCHAR(50)");
    echo "Added hod_evaluation_date\n";
} catch (PDOException $e) {}

try {
    $pdo->exec("ALTER TABLE academic_records ADD COLUMN hod_overall_comments TEXT");
    echo "Added hod_overall_comments\n";
} catch (PDOException $e) {}

try {
    $pdo->exec("ALTER TABLE academic_records ADD COLUMN is_hod_submitted TINYINT DEFAULT 0");
    echo "Added is_hod_submitted\n";
} catch (PDOException $e) {}

echo "Schema update complete.\n";
?>
