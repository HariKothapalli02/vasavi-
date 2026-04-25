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
        }
    </style>
</head>

<body class="admin-body">
    <div class="dashboard-container">
        <!-- Sidebar -->
        <?php include_once __DIR__ . '/src/includes/sidebar.php'; ?>

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

    <?php include_once __DIR__ . '/src/includes/modals.php'; ?>

    <script src="js/responsive.js"></script>
    <script src="js/admin.js?v=27"></script>
</body>

</html>