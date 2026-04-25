<?php require_once __DIR__ . '/src/includes/auth_check.php'; require_auth(['panel']); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Evaluate Student | Panel</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css?v=25">
    <style>
        .admin-body { background: #f8fafc; font-family: 'Outfit', sans-serif; }
        .top-bar .back-link { color: var(--text-muted); text-decoration: none; font-weight: 500; display: flex; align-items: center; gap: 0.5rem; transition: color 0.2s; }
        .top-bar .back-link:hover { color: var(--primary-color); }

        .content-card { background: #fff; border-radius: 12px; border: 1px solid var(--border-color); overflow: hidden; padding: 2rem; }
        
        .section-title { font-size: 1.1rem; font-weight: 700; margin: 2rem 0 1rem; color: var(--text-dark); display: flex; align-items: center; gap: 0.5rem; padding-bottom: 0.5rem; border-bottom: 2px solid #f1f5f9; }
        .info-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1rem; }
        .info-card { background: #f8fafc; padding: 1rem; border-radius: 8px; border: 1px solid var(--border-color); }
        .info-card label { display: block; font-size: 0.8rem; color: var(--text-muted); margin-bottom: 0.25rem; }
        .info-card .value { font-size: 1.1rem; font-weight: 600; color: var(--text-dark); }
        
        .custom-table { width: 100%; border-collapse: collapse; margin-top: 1rem; }
        .custom-table th, .custom-table td { padding: 1rem; text-align: left; border-bottom: 1px solid var(--border-color); }
        .custom-table th { background: #f8fafc; font-weight: 600; color: var(--text-muted); }
        
        .evaluation-box { 
            background: rgba(255, 255, 255, 0.9); 
            backdrop-filter: blur(20px);
            border: 1px solid var(--glass-border); 
            border-radius: var(--radius-lg); 
            padding: 2rem; 
            margin-bottom: 2rem; 
            box-shadow: var(--shadow-lg); 
        }
        .content-card {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(20px);
            border-radius: var(--radius-lg);
            border: 1px solid var(--glass-border);
            padding: 2rem;
            box-shadow: var(--shadow-lg);
            margin-bottom: 2rem;
        }
        .score-slider-container { display: flex; align-items: center; gap: 2rem; margin: 2rem 0; }
        .score-slider { flex: 1; height: 10px; background: #e2e8f0; border-radius: 5px; -webkit-appearance: none; }
        .score-slider::-webkit-slider-thumb { -webkit-appearance: none; width: 32px; height: 32px; background: var(--primary-color); border-radius: 50%; cursor: pointer; border: 4px solid #fff; box-shadow: 0 4px 6px rgba(0,0,0,0.1); }
        .score-display { width: 64px; height: 64px; background: var(--primary-color); color: #fff; border-radius: 16px; display: flex; align-items: center; justify-content: center; font-size: 1.75rem; font-weight: 700; }
        
        .file-link { color: var(--primary-color); text-decoration: none; font-weight: 500; display: inline-flex; align-items: center; gap: 0.4rem; padding: 0.4rem 0.8rem; background: #eff6ff; border-radius: 6px; transition: background 0.2s; }
        .file-link:hover { background: #dbeafe; }
        
        .header-profile { display: flex; gap: 1.5rem; align-items: center; margin-bottom: 2rem; }
        .profile-avatar { width: 80px; height: 80px; border-radius: 50%; background: #e2e8f0; overflow: hidden; display: flex; align-items: center; justify-content: center; font-size: 2rem; font-weight: 700; color: #64748b; }

        @media (max-width: 991.98px) {
            .header-profile { flex-direction: column; align-items: center; text-align: center; }
            .score-slider-container { flex-direction: column; align-items: stretch; gap: 1rem; }
            .score-display { margin: 0 auto; }

            /* Mobile Tab Styles */
            .content-card, .evaluation-box {
                padding: 1rem;
                border-radius: 12px;
                margin-bottom: 1rem;
            }
            .mobile-eval-tabs {
                display: flex;
                background: #fff;
                border-bottom: 1px solid var(--border-color);
                padding: 0.5rem;
                z-index: 100;
                gap: 0.25rem;
                box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
            }

            .mobile-tab-btn {
                flex: 1;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0.5rem;
                padding: 0.75rem 0.25rem;
                border: none;
                background: transparent;
                font-weight: 600;
                color: var(--text-muted);
                border-radius: 8px;
                font-size: 0.85rem;
            }

            .mobile-tab-btn.active {
                background: var(--primary-light);
                color: var(--primary-color);
            }

            .evaluation-box.mobile-hide, .content-card.mobile-hide {
                display: none;
            }

            .evaluate-header {
                padding: 0.75rem 1rem;
                flex-direction: column;
                align-items: flex-start;
                gap: 0.75rem;
                height: auto;
            }
            .header-actions {
                width: 100%;
            }
            .header-actions button {
                width: 100%;
                justify-content: center;
                padding: 0.8rem !important;
            }
            .dashboard-main {
                padding: 0;
            }
            .main-content {
                overflow-y: visible;
            }
        }

        /* Desktop SGPA Grid */
        .academic-performance-grid {
            display: grid;
            gap: 1rem;
            grid-template-columns: repeat(5, 1fr);
        }
        @media (max-width: 992px) {
            .academic-performance-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }
        @media (max-width: 576px) {
            .academic-performance-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        .main-content {
            background: var(--bg-body);
            min-height: 100vh;
        }

        .mobile-eval-tabs { display: none; }
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
            <div style="padding: 0 2rem 1.5rem;">
                <a href="panel-dashboard.php" class="back-link btn btn-light" style="color:var(--text-dark); background:#fff; border:1px solid #e2e8f0; font-weight:600; display:inline-flex; align-items:center; gap:0.5rem; text-decoration:none; padding: 0.5rem 1rem; border-radius: 8px; box-shadow: var(--shadow-sm);">
                    <i class="fa-solid fa-arrow-left"></i> <span class="d-none d-sm-inline">Back to Dashboard</span><span class="d-inline d-sm-none">Back</span>
                </a>
            </div>

            <div id="loadingState" style="text-align:center; padding: 5rem;">
                <i class="fa-solid fa-spinner fa-spin" style="font-size: 3rem; color: var(--primary-color);"></i>
                <p style="margin-top: 1rem; color: var(--text-muted);">Loading student documents...</p>
            </div>

            <div id="errorState" style="display:none; text-align:center; padding: 5rem; color: #ef4444;">
                <i class="fa-solid fa-circle-exclamation" style="font-size: 3rem;"></i>
                <p style="margin-top: 1rem; font-size: 1.2rem;" id="errorMessage">Failed to load data</p>
                <a href="panel-dashboard" class="btn-action" style="display:inline-block; margin-top:1rem; text-decoration:none;">Go Back</a>
            </div>

            <div id="contentArea" style="display:none;">
                <!-- Profile Header -->
                <div class="header-profile">
                    <div class="profile-avatar" id="stAvatar"></div>
                    <div>
                        <h1 style="margin:0; font-size:2rem; color:var(--text-dark);" id="stName">Student Name</h1>
                        <p style="margin:0.5rem 0 0; color:var(--text-muted); font-size:1.1rem;" id="stRoll">Roll No | Dept</p>
                        <div style="margin-top: 1rem; display: flex; gap: 1.5rem; flex-wrap: wrap;">
                            <span style="font-size: 0.95rem; color: var(--text-muted);"><i class="fa-solid fa-envelope"></i> <span id="stEmail">--</span></span>
                            <span style="font-size: 0.95rem; color: var(--text-muted);"><i class="fa-solid fa-phone"></i> <span id="stContact">--</span></span>
                        </div>
                    </div>
                </div>

                <div class="content-card mb-4" id="bioCard">
                    <h4 class="section-title" style="margin-top:0;"><i class="fa-solid fa-user"></i> About Student</h4>
                    <p id="stBio" style="line-height:1.6; color:var(--text-main); margin:0;">--</p>
                </div>

                <div class="mobile-eval-tabs">
                    <button class="mobile-tab-btn active" onclick="switchMobileTab('submissions', this)">
                        <i class="fa-solid fa-file-lines"></i> Submissions
                    </button>
                    <button class="mobile-tab-btn" onclick="switchMobileTab('evaluation', this)">
                        <i class="fa-solid fa-star"></i> Evaluation
                    </button>
                </div>

                <!-- Evaluation Section -->
                <div class="evaluation-box mobile-hide" id="evaluationBox">
                    <h3 style="margin-top:0; color:var(--primary-color); border-bottom:1px solid #e2e8f0; padding-bottom:1rem; display:flex; justify-content:space-between; flex-wrap:wrap; gap:0.5rem;">
                        <span><i class="fa-solid fa-user-pen"></i> Interview Assessment</span>
                        <span style="font-size:0.9rem; font-weight:normal; color:var(--text-muted);">Score Limit: 5.0</span>
                    </h3>
                    
                    <div class="score-slider-container">
                        <span style="font-weight:600; color:var(--text-muted);">Score:</span>
                        <input type="range" min="0" max="5" step="0.5" value="0" class="score-slider" id="evalSlider">
                        <div class="score-display" id="evalDisplay">0</div>
                    </div>
                    
                    <div style="display:flex; justify-content:flex-end;">
                        <button id="saveScoreBtn" class="btn-action" style="padding: 1rem 2rem; font-size:1.1rem; border-radius:8px;">
                            <i class="fa-solid fa-save"></i> Save Interview Score
                        </button>
                    </div>
                </div>

                <div class="content-card" id="submissionsCard">
                    <h4 class="section-title"><i class="fa-solid fa-book"></i> Academic Performance</h4>
                    <div class="academic-performance-grid">
                        <div class="info-card" style="background: #eef2ff; border-color: #c7d2fe; grid-column: span 2;">
                            <label style="color: #4338ca; font-weight:700;">OVERALL CGPA</label>
                            <div class="value" id="acCgpa" style="color: #3730a3; font-size: 1.25rem;">--</div>
                        </div>
                        <div class="info-card"><label>Sem 1</label><div class="value" id="acS1">--</div></div>
                        <div class="info-card"><label>Sem 2</label><div class="value" id="acS2">--</div></div>
                        <div class="info-card"><label>Sem 3</label><div class="value" id="acS3">--</div></div>
                        <div class="info-card"><label>Sem 4</label><div class="value" id="acS4">--</div></div>
                        <div class="info-card"><label>Sem 5</label><div class="value" id="acS5">--</div></div>
                        <div class="info-card"><label>Sem 6</label><div class="value" id="acS6">--</div></div>
                        <div class="info-card"><label>Sem 7</label><div class="value" id="acS7">--</div></div>
                        <!-- Removed Sem 8 -->
                    </div>
                    
                    <div style="margin-top: 1.5rem; display: grid; gap: 1rem;">
                        <div class="info-card" style="background: #fff; border: 1px solid var(--border-color);">
                            <label style="font-weight: 600; color: var(--primary-color); margin-bottom: 0.5rem; display: block;">HONOURS / MINORS</label>
                            <div id="acHonours" style="font-size: 0.95rem; line-height: 1.5;">--</div>
                        </div>
                        <div class="info-grid" style="grid-template-columns: 1fr;">
                            <div class="info-card">
                                <label>COMPETITIVE EXAMS</label>
                                <div class="value" id="acExams" style="font-weight: 500;">--</div>
                            </div>
                        </div>
                    </div>
                    
                    <div style="margin-top:1.5rem;" id="recLetterContainer"></div>

                    <!-- Overall HOD Remarks Section -->
                    <div id="hodOverallSection" style="margin-top:2rem; padding:1.5rem; background:#f0f9ff; border-radius:12px; border:1px solid #bae6fd; display:none;">
                        <h4 style="margin-top:0; color:#0369a1; font-size:1rem; text-transform:uppercase; letter-spacing:0.05em; margin-bottom:1rem;"><i class="fa-solid fa-comment-dots"></i> Overall HOD Remarks</h4>
                        <div id="hodOverallText" style="color:#075985; font-size:1.05rem; line-height:1.6; font-weight:500;">--</div>
                        <div style="margin-top:1rem; display:flex; justify-content:space-between; align-items:center; border-top:1px solid #bae6fd; padding-top:1rem;">
                            <div style="color:#0369a1; font-size:0.85rem;"><i class="fa-solid fa-user-tie"></i> Evaluated by: <span id="hodName" style="font-weight:600;">--</span></div>
                            <div style="color:#0369a1; font-size:0.85rem;"><i class="fa-solid fa-calendar"></i> Date: <span id="hodDate" style="font-weight:600;">--</span></div>
                        </div>
                    </div>

                    <h4 class="section-title"><i class="fa-solid fa-medal"></i> Co-Curricular Activities</h4>
                    <div id="coContainer" class="table-responsive"></div>

                    <h4 class="section-title"><i class="fa-solid fa-futbol"></i> Extracurricular Activities</h4>
                    <div id="extraContainer" class="table-responsive"></div>

                    <!-- Declaration Section -->
                    <div id="declarationArea" style="margin-top:3rem; padding: 2rem; background: #f8fafc; border-radius: 12px; border: 1px solid var(--border-color); display:none;">
                        <h4 style="margin-top:0; color:var(--text-dark); margin-bottom:1.5rem;"><i class="fa-solid fa-file-signature"></i> Student Declaration</h4>
                        <p style="margin-bottom:2rem; font-style:italic; color:var(--text-muted);">
                            "I hereby declare that all the details furnished above are true to my knowledge. I forfeit the award if I furnish wrong information."
                        </p>
                        <div style="display:grid; grid-template-columns: 1fr 1fr; gap:2rem;">
                            <div>
                                <label style="display:block; font-size:0.8rem; color:var(--text-muted);">Place</label>
                                <div style="font-weight:600;" id="declPlace">--</div>
                                <label style="display:block; font-size:0.8rem; color:var(--text-muted); margin-top:1rem;">Date</label>
                                <div style="font-weight:600;" id="declDate">--</div>
                            </div>
                            <div style="text-align:right;">
                                <label style="display:block; font-size:0.8rem; color:var(--text-muted);">Student Signature</label>
                                <div id="declSignature"></div>
                            </div>
                        </div>
                    </div>
        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        window.APP_BASE_URL = "<?php echo get_base_url(); ?>";
        window.IS_SUPER_ADMIN = false;
    </script>
    <script src="js/responsive.js"></script>
    <script type="module" src="js/panel-evaluate.js?v=20"></script>
    <script>
        function switchMobileTab(tab, btn) {
            const evalBox = document.getElementById('evaluationBox');
            const subCard = document.getElementById('submissionsCard');
            const btns = document.querySelectorAll('.mobile-tab-btn');
            
            btns.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            
            if (tab === 'submissions') {
                evalBox.classList.add('mobile-hide');
                subCard.classList.remove('mobile-hide');
            } else {
                evalBox.classList.remove('mobile-hide');
                subCard.classList.add('mobile-hide');
            }
            
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    </script>
</body>
</html>
