<?php
// src/api/auth.php
require_once __DIR__ . '/../includes/db.php';

$method = $_SERVER['REQUEST_METHOD'];
$action = $path;
if (strpos($path ?? '', 'auth/') === 0) {
    $action = substr($path, 5);
}

// Support direct access via ?action=logout for backward compatibility or direct calls
if (isset($_GET['action']) && $_GET['action'] === 'logout') {
    $action = 'logout';
}

if ($action === 'logout') {
    require_once __DIR__ . '/../includes/auth_check.php';
    
    // 1. Unset all session variables
    $_SESSION = array();

    // 2. Clear session cookie if it exists
    if (ini_get("session.use_cookies")) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000,
            $params["path"], $params["domain"],
            $params["secure"], $params["httponly"]
        );
    }

    // 3. Destroy the session
    session_destroy();
    
    // If it's an AJAX/Fetch request, return JSON. Otherwise redirect.
    if (!empty($_SERVER['HTTP_X_REQUESTED_WITH']) || strpos($_SERVER['HTTP_ACCEPT'] ?? '', 'application/json') !== false || $_SERVER['REQUEST_METHOD'] === 'POST') {
        echo json_encode(['success' => true, 'message' => 'Logged out successfully']);
    } else {
        header("Location: " . get_base_url() . "/");
    }
    exit;
}

if ($method === 'POST') {
    $input = json_decode(file_get_contents('php://input'), true);

    if ($action === 'register') {
        // ... (existing register logic)
    } elseif ($action === 'login') {
        $email = $input['email'] ?? null;
        $password = $input['password'] ?? null;
        $role = $input['role'] ?? null;

        if (!$email || !$password) {
            http_response_code(400);
            echo json_encode(['error' => 'Please provide email and password']);
            exit;
        }

        $user = db_get("SELECT * FROM users WHERE email = ? OR roll_number = ?", [$email, $email]);

        if (!$user || $password !== $user['password']) {
            http_response_code(400);
            echo json_encode(['error' => 'Invalid email or password']);
            exit;
        }

        if ($role) {
            if ($role === 'staff') {
                if (!in_array($user['role'], ['admin', 'panel'])) {
                    http_response_code(403);
                    echo json_encode(['error' => 'Access denied: Only Admin or Panel members can login here.']);
                    exit;
                }
            } elseif ($user['role'] !== $role) {
                http_response_code(403);
                echo json_encode(['error' => 'Access denied: You are not authorized to login here.']);
                exit;
            }
        }

        // Regenerate session ID before storing user data
        session_regenerate_id(true);

        $_SESSION['user'] = [
            'id' => $user['id'],
            'name' => $user['name'],
            'role' => $user['role'],
            'department' => $user['department']
        ];
        
        session_write_close();

        if (!isset($authenticated_user_role)) { 
             require_once __DIR__ . '/../includes/auth_check.php';
        }

        echo json_encode([
            'message' => 'Login successful',
            'role' => $user['role'],
            'redirect' => get_base_url() . ($user['role'] === 'admin' ? '/admin-dashboard' : ($user['role'] === 'panel' ? '/panel-dashboard' : '/dashboard'))
        ]);
        exit;
    }
}
