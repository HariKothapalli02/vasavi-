<?php
// update_schema_comments.php
require_once __DIR__ . '/src/includes/db.php';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    echo "Updating schema...\n";

    // Academic Records
    try {
        $pdo->exec("ALTER TABLE academic_records ADD COLUMN academic_comments TEXT");
        echo "Added academic_comments to academic_records\n";
    } catch (Exception $e) {
        echo "academic_comments might already exist: " . $e->getMessage() . "\n";
    }

    try {
        $pdo->exec("ALTER TABLE academic_records ADD COLUMN honours_minors_comments TEXT");
        echo "Added honours_minors_comments to academic_records\n";
    } catch (Exception $e) {
        echo "honours_minors_comments might already exist: " . $e->getMessage() . "\n";
    }

    // Co-curricular
    try {
        $pdo->exec("ALTER TABLE co_curricular ADD COLUMN hod_comments TEXT");
        echo "Added hod_comments to co_curricular\n";
    } catch (Exception $e) {
        echo "hod_comments might already exist in co_curricular: " . $e->getMessage() . "\n";
    }

    // Extracurricular
    try {
        $pdo->exec("ALTER TABLE extracurricular ADD COLUMN hod_comments TEXT");
        echo "Added hod_comments to extracurricular\n";
    } catch (Exception $e) {
        echo "hod_comments might already exist in extracurricular: " . $e->getMessage() . "\n";
    }

    echo "Schema update complete.\n";

} catch (PDOException $e) {
    die("Error: " . $e->getMessage());
}
?>
