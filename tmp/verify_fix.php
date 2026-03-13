<?php
require_once 'src/includes/db.php';
$res = db_all('SELECT * FROM department_toppers');
$grouped = [];
$individual = [];
foreach ($res as $r) {
    if (strpos($r['department'], ',') !== false) {
        $grouped[] = $r['department'];
    } else {
        $individual[] = $r['department'];
    }
}

echo "TOTAL BRANCHES: " . count($res) . "\n";
echo "INDIVIDUAL BRANCHES: " . implode(", ", $individual) . "\n";
if (count($grouped) > 0) {
    echo "ERROR: FOUND GROUPED BRANCHES: " . implode(", ", $grouped) . "\n";
} else {
    echo "SUCCESS: No grouped branches found!\n";
}
?>
