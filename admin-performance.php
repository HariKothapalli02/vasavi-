<?php require_once __DIR__ . '/src/includes/auth_check.php'; require_auth(['admin']); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Performance | Admin Dashboard</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/3.5.25/jspdf.plugin.autotable.min.js"></script>
    <script>
        window.APP_BASE_URL = "<?php echo get_base_url(); ?>";
        window.IS_SUPER_ADMIN = <?php echo (!isset($_SESSION['user']['department']) || empty($_SESSION['user']['department'])) ? 'true' : 'false'; ?>;
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

        .leaderboard-tabs {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
            background: rgba(255, 255, 255, 0.5);
            padding: 0.5rem;
            border-radius: 12px;
            border: 1px solid var(--border-color);
        }

        .l-tab {
            flex: 1;
            padding: 0.75rem;
            border: none;
            background: transparent;
            font-weight: 600;
            color: var(--text-muted);
            border-radius: 8px;
            transition: all 0.2s;
        }

        .l-tab.active {
            background: var(--primary-color);
            color: white;
            box-shadow: 0 4px 12px rgba(99, 102, 241, 0.3);
        }

        .btn-pdf {
            background: #ef4444;
            color: white;
            border: none;
            padding: 0.6rem 1.2rem;
            border-radius: 8px;
            font-weight: 600;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            transition: all 0.2s;
            cursor: pointer;
        }

        .btn-pdf:hover {
            background: #dc2626;
            transform: translateY(-1px);
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
                <a href="admin-students.php" class="nav-item">
                    <i class="fa-solid fa-users"></i>
                    <span>Students</span>
                </a>
                <a href="admin-performance.php" class="nav-item active">
                    <i class="fa-solid fa-trophy"></i>
                    <span>Performance</span>
                </a>
                <?php $isSuperAdmin = !isset($_SESSION['user']['department']) || empty($_SESSION['user']['department']); ?>
                <?php if ($isSuperAdmin): ?>
                <a href="#" class="nav-item" onclick="openTopperModal(); return false;" id="navTopperBtn">
                    <i class="fa-solid fa-ranking-star"></i>
                    <span>Set Topper CGPA</span>
                </a>
                <a href="admin-dashboard.php?openPanel=true" class="nav-item">
                    <i class="fa-solid fa-id-card-clip"></i>
                    <span>Panel Members</span>
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
                    <?php $isSuper = (!isset($_SESSION['user']['department']) || empty($_SESSION['user']['department'])); ?>
                    <div class="card-header" style="display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 1rem;">
                        <h2 style="margin:0;"><i class="fa-solid fa-trophy"></i> Student Leaderboard</h2>
                        <div style="display: flex; align-items: center; gap: 1rem;">
                            <?php if ($isSuper): ?>
                            <div class="leaderboard-controls" style="display: flex; gap: 10px; align-items: center; background: rgba(99, 102, 241, 0.05); padding: 5px 15px; border-radius: 8px; border: 1px solid var(--border-color);">
                                <span style="font-size: 0.85rem; font-weight: 600; color: var(--text-color);">Show Top:</span>
                                <select id="leaderboardLimit" style="padding: 4px 8px; border-radius: 6px; border: 1px solid var(--border-color); font-family: inherit; font-size: 0.85rem; font-weight: 600; color: var(--primary-color); cursor: pointer; outline: none;">
                                    <option value="all">All Students</option>
                                    <option value="5">Top 5</option>
                                    <option value="10">Top 10</option>
                                    <option value="15">Top 15</option>
                                    <option value="20">Top 20</option>
                                </select>
                            </div>
                            <button id="downloadPdfBtn" class="btn-pdf">
                                <i class="fa-solid fa-file-pdf"></i> Download PDF
                            </button>
                            <?php endif; ?>
                        </div>
                    </div>


                    <?php if ($isSuper): ?>
                    <div class="leaderboard-tabs" style="margin-top: 1.5rem;">
                        <button class="l-tab active" data-type="before">
                            <i class="fa-solid fa-hourglass-start"></i> Before Interview
                        </button>
                        <button class="l-tab" data-type="after">
                            <i class="fa-solid fa-circle-check"></i> After Interview
                        </button>
                    </div>
                    <?php endif; ?>

                    <div id="pdfContent" class="table-responsive leaderboard-table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Rank</th>
                                    <th>Student</th>
                                    <th>Dept</th>
                                    <th>Roll No</th>
                                    <th>Score</th>
                                    <?php if ($isSuper): ?>
                                    <th style="text-align: center;">Action</th>
                                    <?php endif; ?>
                                </tr>
                            </thead>
                            <tbody id="leaderboardBody">
                                <!-- Populated by JS -->
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Topper CGPA Modal -->
    <div id="topperModal" class="modal-overlay" style="display: none; align-items: center; justify-content: center; padding: 1rem;">
        <div class="modal-content" style="width: 100%; max-width: 500px; padding: 1.5rem; max-height: 90vh; display: flex; flex-direction: column;">
            <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:1rem;">
                <h3 style="margin:0;"><i class="fa-solid fa-ranking-star" style="color:var(--primary-color);"></i> Set Topper CGPAs</h3>
                <button class="btn-close" onclick="closeTopperModal()"></button>
            </div>
            <p style="color:var(--text-muted); font-size:0.9rem; margin-bottom:1rem;">
                Set the baseline for calculating the Academic CGPA Score (Max-55).
            </p>
            <form id="topperForm" style="display: flex; flex-direction: column; overflow: hidden; flex: 1;">
                <div id="topperInputsContainer" style="overflow-y: auto; padding-right: 10px; margin-bottom: 5px; flex: 1;">
                    <div style="text-align:center;"><i class="fa-solid fa-spinner fa-spin"></i> Loading...</div>
                </div>
                <div style="display:flex; justify-content:flex-end; gap:1rem; margin-top:1rem; padding-top: 1rem; border-top: 1px solid var(--border-color);">
                    <button type="button" class="btn-secondary" onclick="closeTopperModal()" style="border:none; background:transparent; color:#64748b;">Cancel</button>
                    <button type="submit" class="btn-primary"><i class="fa-solid fa-save"></i> Save Configuration</button>
                </div>
            </form>
        </div>
    </div>

    <script src="js/responsive.js"></script>
    <script type="module" src="js/admin.js?v=26"></script>
</body>

</html>