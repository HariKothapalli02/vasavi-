<?php
require_once 'src/includes/db.php';

function checkColumn($table, $col) {
    global $pdo;
    try {
        $stmt = $pdo->query("SHOW COLUMNS FROM $table LIKE '$col'");
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        echo "$table.$col: " . ($result ? "EXISTS" : "MISSING") . "\n";
    } catch (Exception $e) {
        echo "$table.$col: ERROR (" . $e->getMessage() . ")\n";
    }
}

checkColumn('academic_records', 'academic_comments');
checkColumn('academic_records', 'honours_minors_comments');
checkColumn('co_curricular', 'hod_comments');
checkColumn('extracurricular', 'hod_comments');
?>
