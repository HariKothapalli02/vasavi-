<?php
require_once 'src/includes/db.php';

try {
    echo "Updating users table schema...<br>";
    
    // Add declaration_place
    try {
        $pdo->exec("ALTER TABLE users ADD COLUMN declaration_place VARCHAR(255) DEFAULT NULL");
        echo "Added declaration_place.<br>";
    } catch (PDOException $e) { echo "declaration_place might already exist: " . $e->getMessage() . "<br>"; }

    // Add declaration_date
    try {
        $pdo->exec("ALTER TABLE users ADD COLUMN declaration_date VARCHAR(50) DEFAULT NULL");
        echo "Added declaration_date.<br>";
    } catch (PDOException $e) { echo "declaration_date might already exist: " . $e->getMessage() . "<br>"; }

    // Add signature_path
    try {
        $pdo->exec("ALTER TABLE users ADD COLUMN signature_path VARCHAR(255) DEFAULT NULL");
        echo "Added signature_path.<br>";
    } catch (PDOException $e) { echo "signature_path might already exist: " . $e->getMessage() . "<br>"; }

    echo "Schema update complete.";

} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
}
?>
