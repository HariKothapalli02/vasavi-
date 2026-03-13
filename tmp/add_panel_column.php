<?php
// add_panel_column.php
require_once __DIR__ . '/src/includes/db.php';

try {
    echo "Checking if is_sent_to_panel column exists...\n";
    
    // Check if column exists
    $columns = db_all("SHOW COLUMNS FROM users LIKE 'is_sent_to_panel'");
    
    if (empty($columns)) {
        echo "Column not found. Adding is_sent_to_panel...\n";
        db_run("ALTER TABLE users ADD COLUMN is_sent_to_panel TINYINT DEFAULT 0 AFTER is_submitted");
        echo "Column added successfully.\n";
    } else {
        echo "Column already exists.\n";
    }
    
    echo "Done.\n";

} catch (Exception $e) {
    echo "Error: " . $e->getMessage() . "\n";
}
?>
