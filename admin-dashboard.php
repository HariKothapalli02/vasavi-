<?php require_once __DIR__ . '/src/includes/auth_check.php'; require_auth(['admin']); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Best Outgoing Student</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        window.APP_BASE_URL = "<?php echo get_base_url(); ?>";
        window.IS_SUPER_ADMIN = <?php echo (!isset($_SESSION['user']['department']) || empty($_SESSION['user']['department'])) ? 'true' : 'false'; ?>;
        window.userRole = "<?php echo $_SESSION['user']['role']; ?>";
    </script>
    <style>
        .nav-item {
            cursor: pointer;
            border: none;
            background: none;
            width: 100%;
            text-align: left;
        }

        .section-content {
            display: none;
        }

        .section-content.active {
            display: block;
        }

        .chart-container {
            background: #ffffff;
            border-radius: 12px;
            padding: 1.5rem;
            margin-top: 1rem;
            border: 1px solid var(--border-color);
            box-shadow: var(--shadow-sm);
            position: relative;
            min-height: 350px;
        }

        .charts-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
            margin-top: 2rem;
        }

        @media (max-width: 992px) {
            .charts-row {
                grid-template-columns: 1fr;
            }
        }
        
        .topper-input-group {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 0.75rem;
            padding: 0.5rem;
            background: #f8fafc;
            border-radius: 8px;
            border: 1px solid var(--border-color);
        }
        .topper-input-group label {
            font-weight: 600;
            color: var(--text-dark);
            width: 100px;
        }
        .topper-input-group input {
            width: 120px;
            padding: 0.5rem;
            border: 1px solid var(--border-color);
            border-radius: 6px;
            text-align: right;
            font-weight: bold;
            color: var(--primary-color);
        }
        /* Modal Styling */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            backdrop-filter: blur(4px);
            z-index: 9999;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .modal-content {
            background: white;
            border-radius: 12px;
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
            animation: modalFadeIn 0.3s ease-out;
            position: relative;
        }

        @keyframes modalFadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        .btn-close {
            background: none;
            border: none;
            font-size: 1.5rem;
            cursor: pointer;
            color: var(--text-muted);
            transition: color 0.2s;
        }

        .btn-close:hover {
            color: var(--error-color);
        }

        .btn-close::before {
            content: "\f00d";
            font-family: "Font Awesome 6 Free";
            font-weight: 900;
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
                <!-- Overview Section -->
                <div id="overviewSection" class="section-content active">
                    <!-- Stats Row -->
                    <div class="stats-grid">
                        <div class="stat-card">
                            <div class="stat-icon purple"><i class="fa-solid fa-users"></i></div>
                            <div class="stat-info">
                                <h3>Total Students</h3>
                                <p class="stat-value" id="statTotal">--</p>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon blue"><i class="fa-solid fa-clipboard-check"></i></div>
                            <div class="stat-info">
                                <h3>Evaluated</h3>
                                <p class="stat-value" id="statEvaluated">--</p>
                            </div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-icon orange"><i class="fa-solid fa-star"></i></div>
                            <div class="stat-info">
                                <h3>Top Score</h3>
                                <p class="stat-value" id="statTop">--</p>
                            </div>
                        </div>
                    </div>

                    <!-- Charts Row -->
                    <div class="charts-row">
                        <div class="chart-container">
                            <h3><i class="fa-solid fa-pie-chart"></i> Evaluation Progress</h3>
                            <div style="height: 300px; position: relative;">
                                <canvas id="progressChart"></canvas>
                            </div>
                        </div>
                        <div class="chart-container">
                            <h3><i class="fa-solid fa-chart-bar"></i> Score Distribution</h3>
                            <div style="height: 300px; position: relative;">
                                <canvas id="scoreChart"></canvas>
                            </div>
                        </div>
                    </div>
                    <!-- New Branch Chart -->
                    <div class="chart-container" style="margin-top: 2rem;">
                        <h3><i class="fa-solid fa-sitemap"></i> Registered Students per Branch</h3>
                        <div style="height: 350px; position: relative;">
                            <canvas id="branchChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    </div>

    <?php include_once __DIR__ . '/src/includes/modals.php'; ?>
    <script src="js/responsive.js"></script>
    <script src="js/admin.js?v=27"></script>
</body>

</html>