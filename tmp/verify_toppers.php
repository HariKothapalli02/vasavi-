<?php
require_once 'src/includes/db.php';
try {
    $toppers = db_all("SELECT * FROM department_toppers");
    echo json_encode($toppers, JSON_PRETTY_PRINT);
} catch (Exception $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>
