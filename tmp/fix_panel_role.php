<?php
// fix_panel_role.php
require_once __DIR__ . '/src/includes/db.php';

try {
    echo "Checking for inconsistent panel roles...\n";
    
    // Check how many users have the wrong role
    $check = db_get("SELECT COUNT(*) as count FROM users WHERE role = 'panel_member' OR role = 'panel member'");
    $count = $check['count'] ?? 0;
    
    echo "Found $count users with inconsistent role names.\n";
    
    if ($count > 0) {
        $sql = "UPDATE users SET role = 'panel' WHERE role = 'panel_member' OR role = 'panel member'";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();
        $updated = $stmt->rowCount();
        
        echo "Successfully updated $updated users to role 'panel'.\n";
    } else {
        echo "No updates needed.\n";
    }
    
    // Verify
    $verify = db_get("SELECT COUNT(*) as count FROM users WHERE role = 'panel'");
    echo "Total users with correct role 'panel': " . ($verify['count'] ?? 0) . "\n";
    
} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
?>
