<?php
// Mock Session
session_start();
$_SESSION['user'] = ['id' => 1, 'role' => 'student'];

// Mock Request
$_SERVER['REQUEST_METHOD'] = 'POST';
$path = 'student/co-curricular/bulk';
$action = str_replace('student/', '', $path);

// Mock POST Data
$_POST['activity_type'] = 'Paper Publications';
$_POST['items'] = json_encode([
    [
        'name' => 'Test Paper With File',
        'description' => 'Test Journal',
        'score' => 3
    ]
]);

// Mock FILES
// We need to match the key logic in student.php which is "file_$index"
$_FILES = [
    'file_0' => [
        'name' => 'test_file.txt',
        'type' => 'text/plain',
        'tmp_name' => __DIR__ . '/test_file.txt', // Point to local file
        'error' => 0, // UPLOAD_ERR_OK
        'size' => 123
    ]
];

// Include the API file
require_once 'src/api/student.php';

?>
