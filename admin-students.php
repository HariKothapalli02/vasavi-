<?php require_once __DIR__ . '/src/includes/auth_check.php'; require_auth(['admin']); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students | Admin Dashboard</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script>
        window.APP_BASE_URL = "<?php echo get_base_url(); ?>";
        window.IS_SUPER_ADMIN = <?php echo (empty($_SESSION['user']['department'])) ? 'true' : 'false'; ?>;
        window.userRole = "<?php echo $_SESSION['user']['role']; ?>";
    </script>
    <style>
        .nav-item {
            cursor: pointer;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 12px 20px;
            color: var(--text-color);
            border-radius: 8px;
            transition: all 0.3s;
        }

        .nav-item i {
            width: 20px;
            text-align: center;
        }

        .nav-item.active {
            background: var(--primary-color);
            color: white;
        }

        .nav-item:hover:not(.active) {
            background: rgba(99, 102, 241, 0.1);
        }
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
                    if (empty($user['department'])) {
                        echo '<span class="sidebar-branch">IQAC Dashboard</span>';
                    } else {
                        echo '<span class="sidebar-branch">' . htmlspecialchars($user['department']) . ' Branch</span>';
                    }
                    ?>
                </div>
            </div>

            <div class="nav-links">
                <a href="admin-dashboard.php" class="nav-item">
                    <i class="fa-solid fa-chart-line"></i>
                    <span>Overview</span>
                </a>
                <a href="admin-winner.php" class="nav-item">
                    <i class="fa-solid fa-crown"></i>
                    <span>Winner 2026</span>
                </a>
                <a href="admin-students.php" class="nav-item active">
                    <i class="fa-solid fa-users"></i>
                    <span>Students</span>
                </a>
                <a href="admin-performance.php" class="nav-item">
                    <i class="fa-solid fa-trophy"></i>
                    <span>Performance</span>
                </a>
                <?php $isSuperAdmin = !isset($_SESSION['user']['department']) || empty($_SESSION['user']['department']); ?>
                <?php if ($isSuperAdmin): ?>
                <a href="#" class="nav-item" onclick="openTopperModal(); return false;" id="navTopperBtn">
                    <i class="fa-solid fa-ranking-star"></i>
                    <span>Set Topper CGPA</span>
                </a>
                <?php endif; ?>
            </div>

            <div class="sidebar-footer">
                <button id="logoutBtn" class="logout-btn">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    <span>Logout</span>
                </button>
            </div>
        </nav>

        <!-- Main Content -->
        <main class="main-content">
            <header class="top-bar">
                <div class="welcome-text"></div>
            </header>

            <div class="content-wrapper">
                <div class="glass-card">
                    <div class="card-header">
                        <h2><i class="fa-solid fa-users"></i> Registered Students</h2>
                    </div>
                    <div class="search-bar">
                        <i class="fa-solid fa-search"></i>
                        <input type="text" id="studentSearch"
                            placeholder="Search students by name, roll no, or dept...">
                    </div>
                    <div id="studentList" class="student-list-container">
                        Loading students...
                    </div>
                </div>
            </div>
        </main>
    </div>

    <script src="js/responsive.js"></script>
    <script type="module" src="js/admin.js?v=20"></script>
</body>

</html>