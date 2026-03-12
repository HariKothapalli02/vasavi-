<?php require_once __DIR__ . '/src/includes/auth_check.php'; require_auth(['admin', 'panel']); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Winner Details | Admin Dashboard</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script>
        window.APP_BASE_URL = "<?php echo get_base_url(); ?>";
        window.IS_SUPER_ADMIN = <?php echo (!isset($_SESSION['user']['department']) || empty($_SESSION['user']['department'])) ? 'true' : 'false'; ?>;
        window.userRole = "<?php echo $_SESSION['user']['role']; ?>";
    </script>
    <style>
        .nav-item { cursor: pointer; text-decoration: none; display: flex; align-items: center; gap: 10px; padding: 12px 20px; color: var(--text-color); border-radius: 8px; transition: all 0.3s; }
        .nav-item i { width: 20px; text-align: center; }
        .nav-item.active { background: var(--primary-color); color: white; }
        .nav-item:hover:not(.active) { background: rgba(99, 102, 241, 0.1); }

        .winner-card {
            background: white;
            border-radius: 20px;
            overflow: visible; /* Changed from hidden to allow trophy to pop out */
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
            position: relative;
            margin-top: 1rem;
        }
        .winner-header {
            background: linear-gradient(135deg, #6366f1 0%, #a855f7 100%);
            height: 150px;
            position: relative;
            border-radius: 20px 20px 0 0; /* Add radius here since card overflow is visible */
        }
        .winner-photo-large {
            width: 200px;
            height: 200px;
            border-radius: 50%;
            border: 8px solid white;
            background: white;
            position: absolute;
            bottom: -100px;
            left: 50%;
            transform: translateX(-50%);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            overflow: hidden;
        }
        .winner-photo-large img { width: 100%; height: 100%; object-fit: cover; }
        .winner-info {
            margin-top: 110px;
            text-align: center;
            padding: 2rem;
        }
        .winner-name { font-size: 2.5rem; font-weight: 700; color: #1e293b; margin-bottom: 0.5rem; }
        .winner-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background: #fef3c7;
            color: #d97706;
            padding: 8px 20px;
            border-radius: 50px;
            font-weight: 700;
            font-size: 1.1rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
        }
        .details-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 1.5rem;
            padding: 2rem;
            background: #f8fafc;
            border-top: 1px solid #e2e8f0;
        }

        @media (max-width: 1200px) {
            .details-grid { grid-template-columns: repeat(2, 1fr); }
        }

        @media (max-width: 600px) {
            .details-grid { grid-template-columns: 1fr; }
        }

        .detail-item {
            background: white;
            padding: 1.25rem;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            display: flex;
            align-items: center;
            gap: 1rem;
            min-width: 0; /* Important for grid item overflow */
        }
        .detail-icon {
            flex-shrink: 0;
            width: 45px; height: 45px; border-radius: 12px;
            display: flex; align-items: center; justify-content: center;
            font-size: 1.25rem;
        }
        .icon-blue { background: #e0e7ff; color: #4338ca; }
        .icon-green { background: #dcfce7; color: #15803d; }
        .icon-orange { background: #ffedd5; color: #c2410c; }
        .icon-purple { background: #f3e8ff; color: #7e22ce; }
        
        .detail-text {
            min-width: 0;
            overflow: hidden;
        }
        .detail-text h4 { margin:0; font-size: 0.8rem; color: #64748b; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 4px; }
        .detail-text p { 
            margin:0; 
            font-size: 1.1rem; 
            font-weight: 600; 
            color: #1e293b;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .detail-item:hover .detail-text p {
            white-space: normal;
            word-break: break-all;
        }

        .bio-section {
            padding: 2rem;
            background: white;
            border-top: 1px solid #e2e8f0;
        }
        .bio-section h3 { margin-bottom: 1rem; color: #1e293b; display: flex; align-items: center; gap: 10px; }
        .bio-content { color: #475569; line-height: 1.8; font-size: 1.1rem; font-style: italic; }

        #noWinnerView {
            text-align: center;
            padding: 5rem 2rem;
        }

        /* 3D background container */
        #canvas-container {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            pointer-events: none;
            background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
        }

        .winner-card {
            transform-style: preserve-3d;
            transition: transform 0.1s ease-out;
        }

        .trophy-container {
            position: absolute;
            top: -60px; /* Moved slightly more up */
            right: 15px; /* Shifted left slightly */
            width: 180px; /* Increased size for better detail */
            height: 180px;
            z-index: 10;
        }

        /* Entrance Animations */
        @keyframes reveal3d {
            0% { transform: perspective(2000px) rotateX(-20deg) scale(0.9); opacity: 0; }
            100% { transform: perspective(2000px) rotateX(0) scale(1); opacity: 1; }
        }

        @keyframes slideUp {
            0% { transform: translateY(30px); opacity: 0; }
            100% { transform: translateY(0); opacity: 1; }
        }

        #winnerDetails.revealed .winner-card {
            animation: reveal3d 1s cubic-bezier(0.34, 1.56, 0.64, 1) forwards;
        }

        #winnerDetails.revealed .details-grid {
            animation: slideUp 0.8s ease-out 0.5s both;
        }

        #winnerDetails.revealed .bio-section {
            animation: slideUp 0.8s ease-out 0.8s both;
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
                <h2>AdminPanel</h2>
            </div>

            <div class="nav-links">
                <a href="admin-dashboard.php" class="nav-item">
                    <i class="fa-solid fa-chart-line"></i>
                    <span>Overview</span>
                </a>
                <a href="admin-winner.php" class="nav-item active">
                    <i class="fa-solid fa-crown"></i>
                    <span>Winner 2026</span>
                </a>
                <a href="admin-students.php" class="nav-item">
                    <i class="fa-solid fa-users"></i>
                    <span>Students</span>
                </a>
                <a href="admin-performance.php" class="nav-item">
                    <i class="fa-solid fa-trophy"></i>
                    <span>Performance</span>
                </a>
                <?php if (empty($_SESSION['user']['department'])): ?>
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

            <!-- 3D Background -->
            <div id="canvas-container"></div>

            <div class="content-wrapper">
                <div id="loadingWinner" style="text-align: center; padding: 5rem;">
                    <i class="fa-solid fa-spinner fa-spin fa-3x" style="color: var(--primary-color);"></i>
                    <p style="margin-top: 1rem; color: var(--text-muted);">Fetching winner details...</p>
                </div>

                <div id="winnerDetails" style="display: none;">
                    <div class="winner-card">
                        <div class="winner-header">
                            <div class="winner-photo-large">
                                <img id="wPhoto" src="https://cdn-icons-png.flaticon.com/512/3135/3135715.png" alt="Winner">
                            </div>
                            <!-- 3D Trophy Holder -->
                            <div class="trophy-container" id="trophy-canvas"></div>
                        </div>
                        <div class="winner-info">
                            <h1 class="winner-name" id="wName">Student Name</h1>
                            <div class="winner-badge">
                                <i class="fa-solid fa-crown"></i> Winner of the Year 2026
                            </div>
                        </div>

                        <div class="details-grid">
                            <div class="detail-item">
                                <div class="detail-icon icon-blue"><i class="fa-solid fa-id-card"></i></div>
                                <div class="detail-text">
                                    <h4>Roll Number</h4>
                                    <p id="wRoll">--</p>
                                </div>
                            </div>
                            <div class="detail-item">
                                <div class="detail-icon icon-purple"><i class="fa-solid fa-sitemap"></i></div>
                                <div class="detail-text">
                                    <h4>Department</h4>
                                    <p id="wDept">--</p>
                                </div>
                            </div>
                            <div class="detail-item">
                                <div class="detail-icon icon-green"><i class="fa-solid fa-envelope"></i></div>
                                <div class="detail-text">
                                    <h4>Email Address</h4>
                                    <p id="wEmail">--</p>
                                </div>
                            </div>
                            <div class="detail-item">
                                <div class="detail-icon icon-orange"><i class="fa-solid fa-phone"></i></div>
                                <div class="detail-text">
                                    <h4>Contact Number</h4>
                                    <p id="wPhone">--</p>
                                </div>
                            </div>
                        </div>

                        <div class="bio-section">
                            <h3><i class="fa-solid fa-quote-left" style="color: var(--primary-color);"></i> About the Student</h3>
                            <div class="bio-content" id="wBio">
                                "The bio details of the winner will be displayed here, showcasing their journey and achievements."
                            </div>
                        </div>
                    </div>
                </div>

                <div id="noWinnerView" style="display: none;">
                    <i class="fa-solid fa-triangle-exclamation fa-4x" style="color: #cbd5e1; margin-bottom: 1.5rem;"></i>
                    <h2 style="color: #64748b;">No Winner Announced Yet</h2>
                    <p style="color: #94a3b8; max-width: 500px; margin: 0 auto;">The Best Outgoing Student has not been officially announced. Please check back after the evaluation process is complete.</p>
                </div>
            </div>
        </main>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.browser.min.js"></script>
    <script src="js/responsive.js"></script>
    <script src="js/background-3d.js"></script>
    <script src="js/tilt-effect.js"></script>
    <script src="js/trophy-3d.js"></script>
    <script src="js/celebration-effects.js"></script>
    <script type="module" src="js/admin.js?v=21"></script>
</body>

</html>
