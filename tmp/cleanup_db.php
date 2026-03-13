<?php
require_once 'src/includes/db.php';

try {
    $pdo->beginTransaction();

    // 1. Disable foreign key checks for truncation
    $pdo->exec("SET FOREIGN_KEY_CHECKS = 0");

    $tablesToTruncate = [
        "academic_records",
        "co_curricular",
        "department_toppers",
        "extracurricular",
        "file_uploads",
        "final_scores",
        "interview_marks"
    ];

    foreach ($tablesToTruncate as $table) {
        $pdo->exec("TRUNCATE TABLE $table");
        echo "Truncated $table\n";
    }

    // 2. Reset user details in 'users' table
    $updateUsers = "UPDATE users SET 
        contact_number = NULL,
        bio = NULL,
        profile_photo = NULL,
        is_submitted = 0,
        is_sent_to_panel = 0,
        declaration_place = NULL,
        declaration_date = NULL,
        signature_path = NULL,
        recommendation_letter_path = NULL";
    
    $pdo->exec($updateUsers);
    echo "Reset details for all users in 'users' table\n";

    // 3. Re-enable foreign key checks
    $pdo->exec("SET FOREIGN_KEY_CHECKS = 1");

    $pdo->commit();
    echo "Cleanup completed successfully!\n";

} catch (Exception $e) {
    if ($pdo->inTransaction()) {
        $pdo->rollBack();
    }
    echo "Error during cleanup: " . $e->getMessage() . "\n";
}
?>
