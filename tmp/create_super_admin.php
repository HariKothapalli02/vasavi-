<?php
// create_super_admin.php
require_once __DIR__ . '/src/includes/db.php';

$email = 'super_admin@admin.com';
$password = 'SuperSecretPass123!'; // Or generate random
$hashedPassword = password_hash($password, PASSWORD_BCRYPT);

try {
    // Check if exists
    $existing = db_get("SELECT id FROM users WHERE email = ?", [$email]);
    
    if ($existing) {
        db_run("UPDATE users SET password = ?, role = 'admin', department = NULL, name = 'Super Admin' WHERE id = ?", 
            [$hashedPassword, $existing['id']]);
        echo "Updated existing Super Admin account.\n";
    } else {
        db_run("INSERT INTO users (name, email, password, role, department) VALUES ('Super Admin', ?, ?, 'admin', NULL)", 
            [$email, $hashedPassword]);
        echo "Created new Super Admin account.\n";
    }

    echo "Super Admin Credentials:\n";
    echo "Email: $email\n";
    echo "Password: $password\n";
    
    // Append to credentials file
    $creds = "\n\nRole: SUPER_ADMIN\nEmail: $email\nPassword: $password\n-----------------------\n";
    file_put_contents('admin_credentials.txt', $creds, FILE_APPEND);
    echo "Added to admin_credentials.txt\n";

} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
?>
