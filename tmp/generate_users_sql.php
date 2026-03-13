<?php
// generate_users_sql.php

$content = file_get_contents('generated_credentials.txt');
$lines = explode("\n", $content);

$users = [];
$currentRole = '';
$currentBranch = '';
$tempUser = [];

foreach ($lines as $line) {
    $line = trim($line);
    if (empty($line)) continue;

    if (strpos($line, 'SUPER ADMIN:') !== false) {
        $currentRole = 'admin';
        continue;
    }
    if (strpos($line, 'HODs:') !== false) {
        $currentRole = 'hod';
        continue;
    }
    if (strpos($line, 'PANEL MEMBERS:') !== false) {
        $currentRole = 'panel';
        continue;
    }
    if (strpos($line, 'STUDENTS:') !== false) {
        $currentRole = 'student';
        continue;
    }

    if ($currentRole === 'student' && preg_match('/--- (.+) ---/', $line, $matches)) {
        $currentBranch = $matches[1];
        continue;
    }

    if (preg_match('/Email: (.+)/', $line, $matches)) {
        $tempUser['email'] = trim($matches[1]);
    } elseif (preg_match('/Password: (.+)/', $line, $matches)) {
        $tempUser['password'] = trim($matches[1]);
    } elseif (preg_match('/Name: (.+)/', $line, $matches)) {
        $tempUser['name'] = trim($matches[1]);
    } elseif (preg_match('/Roll: (.+)/', $line, $matches)) {
        $tempUser['roll_number'] = trim($matches[1]);
    } elseif (preg_match('/Branches: (.+)/', $line, $matches)) {
        $tempUser['department'] = trim($matches[1]);
    } elseif (preg_match('/Role: (.+)/', $line, $matches)) {
        // For HODs, we use the role field in text but they are 'admin' in DB with specific depts
        $tempUser['name'] = str_replace('_', ' ', trim($matches[1]));
    }

    // Check if we have enough to finalize a user entry
    if (isset($tempUser['email']) && isset($tempUser['password'])) {
        // We assume email and password are the last fields for Super Admin/HOD/Panel
        // For students, roll is last.
        
        $isComplete = false;
        if ($currentRole === 'admin' && isset($tempUser['email']) && isset($tempUser['password'])) {
            $tempUser['name'] = 'Super Admin';
            $tempUser['role'] = 'admin';
            $tempUser['department'] = null;
            $tempUser['roll_number'] = null;
            $isComplete = true;
        } elseif ($currentRole === 'hod' && isset($tempUser['department'])) {
            $tempUser['role'] = 'admin';
            $tempUser['roll_number'] = null;
            $isComplete = true;
        } elseif ($currentRole === 'panel' && isset($tempUser['name'])) {
            $tempUser['role'] = 'panel';
            $tempUser['department'] = null;
            $tempUser['roll_number'] = null;
            $isComplete = true;
        } elseif ($currentRole === 'student' && isset($tempUser['roll_number'])) {
            $tempUser['role'] = 'student';
            $tempUser['department'] = $currentBranch;
            $isComplete = true;
        }

        if ($isComplete) {
            $tempUser['password_hash'] = password_hash($tempUser['password'], PASSWORD_BCRYPT);
            $users[] = $tempUser;
            $tempUser = [];
        }
    }
}

$sql = "USE best_outgoing;\n\n";
$sql .= "TRUNCATE TABLE users;\n\n"; // Standardize with truncate to avoid duplicates if re-run
$sql .= "INSERT INTO users (name, email, password, role, department, roll_number) VALUES \n";

$rows = [];
foreach ($users as $u) {
    $name = addslashes($u['name']);
    $email = addslashes($u['email']);
    $pass = addslashes($u['password_hash']);
    $role = $u['role'];
    $dept = $u['department'] ? "'" . addslashes($u['department']) . "'" : "NULL";
    $roll = $u['roll_number'] ? "'" . addslashes($u['roll_number']) . "'" : "NULL";
    
    $rows[] = "('$name', '$email', '$pass', '$role', $dept, $roll)";
}

$sql .= implode(",\n", $rows) . ";\n";

file_put_contents('insert_users.sql', $sql);
echo "Generated insert_users.sql with " . count($users) . " users.\n";
?>
