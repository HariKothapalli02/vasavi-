<?php
require_once 'src/includes/db.php';

try {
    // 1. Get all raw department strings
    $stmt = $pdo->query("SELECT DISTINCT department FROM users WHERE department IS NOT NULL AND department != ''");
    $rawDepartments = $stmt->fetchAll(PDO::FETCH_COLUMN);

    $individualDepts = [];
    foreach ($rawDepartments as $raw) {
        $parts = explode(',', $raw);
        foreach ($parts as $p) {
            $trimmed = trim($p);
            if ($trimmed !== '') {
                $individualDepts[] = $trimmed;
            }
        }
    }

    $uniqueDepts = array_unique($individualDepts);
    echo "Identified individual departments: " . implode(", ", $uniqueDepts) . "\n";

    // 2. Clear table sequentially (no transaction needed for this simple cleanup if preferred, or handle implicit commits)
    $pdo->exec("DELETE FROM department_toppers");
    echo "Cleared department_toppers table.\n";

    // 3. Insert individual departments
    $insertStmt = $pdo->prepare("INSERT INTO department_toppers (department, topper_cgpa) VALUES (?, 0)");
    foreach ($uniqueDepts as $dept) {
        try {
            $insertStmt->execute([$dept]);
            echo "Added individual department: '$dept'\n";
        } catch (PDOException $e) {
            // Likely duplicate if the same dept appeared multiple times in different comma strings
            echo "Skipped duplicate insert for: '$dept'\n";
        }
    }

    echo "Cleanup and repopulation completed successfully!\n";

} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
?>
