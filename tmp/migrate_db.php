<?php
// migrate_db.php
require_once __DIR__ . '/src/includes/db.php';

try {
    echo "Starting migration...\n";
    
    // Check if is_sent_to_panel exists in users table
    $columns = db_all("DESCRIBE users");
    $hasSentCol = false;
    foreach ($columns as $col) {
        if ($col['Field'] === 'is_sent_to_panel') {
            $hasSentCol = true;
            break;
        }
    }
    
    if (!$hasSentCol) {
        echo "Adding 'is_sent_to_panel' column to 'users' table...\n";
        db_run("ALTER TABLE users ADD COLUMN is_sent_to_panel TINYINT DEFAULT 0 AFTER is_submitted");
        echo "Column added successfully.\n";
    } else {
        echo "Column 'is_sent_to_panel' already exists.\n";
    }
    
    echo "Migration complete.\n";

} catch (Exception $e) {
    die("Migration Error: " . $e->getMessage());
}
