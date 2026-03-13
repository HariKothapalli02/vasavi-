<?php
// create_hods.php
require_once __DIR__ . '/src/includes/db.php';

// Define the HOD groups
$hod_groups = [
    'AIML_CAI_HOD' => ['branches' => 'AIML,CAI', 'email' => 'hod_aiml_cai@admin.com'],
    'CSE_CST_HOD' => ['branches' => 'CSE,CST', 'email' => 'hod_cse_cst@admin.com'],
    'ECE_ECT_HOD' => ['branches' => 'ECE,ECT', 'email' => 'hod_ece_ect@admin.com'],
    'EEE_HOD' => ['branches' => 'EEE', 'email' => 'hod_eee@admin.com'],
    'CIVIL_HOD' => ['branches' => 'CIVIL', 'email' => 'hod_civil@admin.com'],
    'MECH_HOD' => ['branches' => 'MECH', 'email' => 'hod_mech@admin.com'],
];

$output = "ADMIN LOGIN CREDENTIALS\n=======================\n\n";

echo "Generating HOD accounts...\n";

foreach ($hod_groups as $name => $info) {
    $password = bin2hex(random_bytes(4)); // Generate a random 8-character password
    $hashedPassword = password_hash($password, PASSWORD_BCRYPT);
    $email = $info['email'];
    $branches = $info['branches'];

    try {
        // Check if user exists
        $existing = db_get("SELECT id FROM users WHERE email = ?", [$email]);
        
        if ($existing) {
            // Update existing user
            db_run("UPDATE users SET password = ?, role = 'admin', department = ? WHERE id = ?", 
                [$hashedPassword, $branches, $existing['id']]);
            echo "Updated existing account for $name\n";
        } else {
            // Create new user
            db_run("INSERT INTO users (name, email, password, role, department) VALUES (?, ?, ?, 'admin', ?)", 
                [$name, $email, $hashedPassword, $branches]);
            echo "Created new account for $name\n";
        }

        $output .= "Role: $name\n";
        $output .= "Branches: $branches\n";
        $output .= "Email: $email\n";
        $output .= "Password: $password\n";
        $output .= "-----------------------\n";

    } catch (Exception $e) {
        echo "Error for $name: " . $e->getMessage() . "\n";
    }
}

file_put_contents('admin_credentials.txt', $output);
echo "\nCredentials saved to admin_credentials.txt\n";
?>
