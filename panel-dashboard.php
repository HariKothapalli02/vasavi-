<?php require_once __DIR__ . '/src/includes/auth_check.php'; require_auth(['panel']); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel Dashboard | Best Outgoing Student</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <style>
        .admin-body { background: #f8fafc; font-family: 'Outfit', sans-serif; }
        
        .student-list-container { display: grid; gap: 1rem; }
        .student-item { background: #fff; padding: 1.25rem; border-radius: 12px; border: 1px solid var(--border-color); display: flex; justify-content: space-between; align-items: center; transition: all 0.2s; cursor: pointer; }
        .student-item:hover { transform: translateY(-2px); box-shadow: var(--shadow-sm); border-color: var(--primary-color); }
        
        .empty-state { text-align: center; padding: 4rem 2rem; color: var(--text-muted); }
        .empty-state i { font-size: 3rem; margin-bottom: 1rem; opacity: 0.5; }
    </style>
</head>
<body class="admin-body">
    <div class="dashboard-container">
        <!-- Sidebar -->
        <nav class="sidebar mobile-mode">
            <div class="sidebar-header">
                <div class="logo-icon">
                    <i class="fa-solid fa-graduation-cap"></i>
                </div>
                <div class="logo-text">
                    <h2>AdminPanel</h2>
                    <?php 
                    $user = $_SESSION['user'];
                    if ($user['role'] === 'panel') {
                        echo '<span class="sidebar-branch">Panel Dashboard</span>';
                    } else {
                        if (empty($user['department'])) {
                            echo '<span class="sidebar-branch">IQAC Dashboard</span>';
                        } else {
                            echo '<span class="sidebar-branch">' . htmlspecialchars($user['department']) . ' Branch</span>';
                        }
                    }
                    ?>
                </div>
            </div>

            <div class="nav-links">
                <a href="panel-dashboard.php" class="nav-item active">
                    <i class="fa-solid fa-list-check"></i>
                    <span>Assigned Students</span>
                </a>
                <a href="admin-winner.php" class="nav-item"><i class="fa-solid fa-crown"></i> Winner 2026</a>
            </div>
            <div class="sidebar-footer">
                <button id="logoutBtn" class="logout-btn">
                    <i class="fa-solid fa-right-from-bracket"></i> Logout
                </button>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="main-content">
            <header class="top-bar">
                <div class="welcome-text" id="welcomeText" style="width:100%;"></div>
            </header>

            <div id="loading" style="text-align:center; padding: 3rem;">
                <i class="fa-solid fa-spinner fa-spin" style="font-size: 2rem; color: var(--primary-color);"></i>
            </div>

            <div id="studentList" class="student-list-container"></div>
        </main>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        window.APP_BASE_URL = "<?php echo get_base_url(); ?>";
        window.userRole = "panel";
        window.IS_SUPER_ADMIN = false;
    </script>
    <script src="js/responsive.js"></script>
    <script type="module" src="js/panel-dashboard.js?v=2"></script>
</body>
</html>
