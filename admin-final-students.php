<?php 
require_once __DIR__ . '/src/includes/auth_check.php'; 
require_auth(['admin']); 
if (!empty($_SESSION['user']['department'])) {
    header("Location: admin-dashboard.php");
    exit;
}
?>
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
                        <h2><i class="fa-solid fa-users"></i> Final Submitted Students</h2>
                    </div>
                    <div style="display: flex; gap: 10px; margin-bottom: 1rem; align-items: center;">
                        <div class="search-bar" style="margin-bottom: 0; flex: 1;">
                            <i class="fa-solid fa-search"></i>
                            <input type="text" id="finalStudentSearch"
                                placeholder="Search students by name, roll no, or dept...">
                        </div>
                        <select id="finalStudentBranchFilter" style="padding: 0.8rem; border-radius: 8px; border: 1px solid var(--border-color); background: white; color: var(--text-dark); outline: none; min-width: 150px;">
                            <option value="">All Branches</option>
                            <option value="CSE">CSE</option>
                            <option value="CST">CST</option>
                            <option value="AIM">AIM</option>
                            <option value="CAI">CAI</option>
                            <option value="ECE">ECE</option>
                            <option value="ECT">ECT</option>
                            <option value="CE">CE</option>
                            <option value="ME">ME</option>
                            <option value="EEE">EEE</option>
                        </select>
                    </div>
                    <div id="finalStudentList" class="student-list-container">
                        Loading final submitted students...
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