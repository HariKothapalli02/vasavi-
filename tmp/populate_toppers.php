<?php
require_once 'src/includes/db.php';

try {
    // 1. Get unique departments from users table (where role is student)
    $stmt = $pdo->query("SELECT DISTINCT department FROM users WHERE department IS NOT NULL AND department != ''");
    $departments = $stmt->fetchAll(PDO::FETCH_COLUMN);

    echo "Found departments: " . implode(", ", $departments) . "\n";

    // 2. Insert into department_toppers if not exists
    foreach ($departments as $dept) {
        // Use INSERT IGNORE or check for existence
        $pdo->prepare("INSERT INTO department_toppers (department, topper_cgpa) VALUES (?, 0) 
                       ON DUPLICATE KEY UPDATE department = department") // No-op update if exists
            ->execute([$dept]);
        echo "Ensured department '$dept' exists in department_toppers with default 0.\n";
    }

    echo "Population completed successfully!\n";

} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
?>
