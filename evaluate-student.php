<?php require_once __DIR__ . '/src/includes/auth_check.php'; require_auth(['admin']); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Evaluate Student | Best Outgoing Student</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script>
        window.APP_BASE_URL = "<?php echo get_base_url(); ?>";
        window.USER_ROLE = "admin";
        window.IS_SUPER_ADMIN = <?php echo (!isset($_SESSION['user']['department']) || empty($_SESSION['user']['department'])) ? 'true' : 'false'; ?>;
    </script>
    <style>
        .evaluate-page-container {
            height: 100vh;
            display: flex;
            flex-direction: column;
            background: var(--bg-body); /* Restore premium background */
        }

        .evaluate-header {
            padding: 1rem 2rem;
            border-bottom: 1px solid var(--border-color);
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
            box-shadow: var(--shadow-sm);
            z-index: 10;
        }

        .evaluate-body-split {
            display: grid;
            grid-template-columns: 1fr 1fr;
            flex: 1;
            gap: 1.5rem; /* Add gap for card separation */
            padding: 1.5rem; /* Padding for the container */
            overflow: hidden;
        }

        @media (max-width: 992px) {
            .evaluate-body-split {
                grid-template-columns: 1fr;
                overflow-y: auto;
            }
        }

        .details-col {
            padding: 2rem;
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(20px);
            border-radius: var(--radius-lg);
            border: 1px solid var(--glass-border);
            box-shadow: var(--shadow-lg);
            overflow-y: auto;
        }

        .scoring-col {
            padding: 2rem;
            overflow-y: auto;
            background: #fff;
        }

        /* Mobile Tab Styles */
        .mobile-eval-tabs {
            display: none;
            background: #fff;
            border-bottom: 1px solid var(--border-color);
            padding: 0.5rem;
            position: sticky;
            top: 0;
            z-index: 20;
        }

        .mobile-tab-btn {
            flex: 1;
            padding: 0.75rem;
            border: none;
            background: transparent;
            font-weight: 600;
            color: var(--text-muted);
            border-radius: 8px;
            font-size: 0.9rem;
        }

        .mobile-tab-btn.active {
            background: var(--primary-light);
            color: var(--primary-color);
        }

        @media (max-width: 992px) {
            .mobile-eval-tabs {
                display: flex;
                gap: 0.25rem;
                padding: 0.5rem;
                position: sticky;
                top: 0;
                background: #fff;
                z-index: 100;
                border-bottom: 1px solid var(--border-color);
                box-shadow: 0 4px 6px -1px rgba(0,0,0,0.1);
            }
            .mobile-tab-btn {
                flex: 1;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0.5rem;
                padding: 0.6rem 0.25rem;
            }

            .evaluate-body-split {
                display: block; /* Stack on mobile */
                overflow-y: visible; /* Let the page handle scroll or individual columns */
                height: auto;
                padding: 0;
                gap: 0;
            }

            .details-col, .scoring-col {
                padding: 1.5rem 1rem;
                height: auto;
                overflow: visible;
                border: none;
                width: 100%;
            }

            /* Hide inactive col on mobile */
            .details-col.mobile-hide, .scoring-col.mobile-hide {
                display: none;
            }
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
            .profile-header-mini {
                width: 100%;
            }
        }

        /* Responsive SGPA Grid Utility */
        .responsive-sgpa-grid {
            display: grid;
            gap: 8px;
            width: 100%;
        }
        @media (min-width: 768px) {
            .responsive-sgpa-grid {
                grid-template-columns: repeat(4, 1fr);
            }
        }
        @media (max-width: 767px) {
            .responsive-sgpa-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        .back-btn {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            color: var(--text-muted);
            font-weight: 600;
            transition: color 0.2s;
            cursor: pointer;
        }

        .back-btn:hover {
            color: var(--primary-color);
        }

        .profile-header-mini {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .avatar-mini {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: var(--primary-light);
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
    </style>
</head>

<body class="admin-body">
    <?php $isSuperAdmin = !isset($_SESSION['user']['department']) || empty($_SESSION['user']['department']); ?>
    <div class="evaluate-page-container">
        <header class="evaluate-header">
            <div class="profile-header-mini">
                <div class="back-btn" onclick="window.location.href='admin-dashboard.php'">
                    <i class="fa-solid fa-arrow-left"></i>
                </div>
                <div class="avatar-mini" id="studentAvatar"></div>
                <div>
                    <h2 id="studentName" style="margin:0; font-size:1.2rem;">Loading...</h2>
                    <p id="studentMeta" style="margin:0; font-size:0.8rem; color:var(--text-muted);">Roll Number | Dept
                    </p>
                </div>
            </div>
            <div class="header-actions">
                <button onclick="window.location.href='admin-dashboard.php'" class="btn-secondary"
                    style="padding: 0.5rem 1rem;">
                    Back to Dashboard
                </button>
            </div>
        </header>

        <main class="evaluate-body-split">
            <!-- Mobile Switcher -->
            <div class="mobile-eval-tabs">
                <button class="mobile-tab-btn active" onclick="switchMobileTab('submissions', this)">
                    <i class="fa-solid fa-file-lines"></i> Submissions
                </button>
                <button class="mobile-tab-btn" onclick="switchMobileTab('evaluation', this)">
                    <i class="fa-solid fa-star-half-stroke"></i> Evaluation
                </button>
            </div>

            <!-- Left: Submissions Details -->
            <div class="details-col" id="detailsCol">
                <div class="tabs">
                    <button class="tab-btn active">Student Submissions</button>
                </div>
                <div id="submissionDetails" class="submission-scroll">
                    <!-- Populated by JS -->
                    <div style="text-align:center; padding: 2rem;">
                        <i class="fa-solid fa-circle-notch fa-spin fa-2x" style="color:var(--primary-color);"></i>
                        <p>Loading details...</p>
                    </div>
                </div>
            </div>

            <!-- Right: Scoring Form -->
            <div class="scoring-col mobile-hide" id="scoringCol">
                <div class="tabs">
                    <button class="tab-btn active">Evaluation & Scoring</button>
                </div>
                <div id="evaluationTab" class="tab-content active" style="margin-top:1.5rem;">
                    <form id="scoreForm">
                        <input type="hidden" id="evalUserId">

                        <!-- Dynamic comments will be rendered in the Left Column -->
                        <div id="dynamicScoreInputs"></div>

                        <?php if ($isSuperAdmin): ?>
                        <!-- SCORING SECTIONS (SUPER ADMIN ONLY) -->
                        <div style="background: #f0fdf4; padding: 1.5rem; border-radius: 8px; border: 1px solid #bbf7d0; margin-bottom: 2rem;">
                             <h4 style="color: #166534; margin-top:0;"><i class="fa-solid fa-star"></i> Scoring (Super Admin Only)</h4>
                            
                            <!-- Academic Granular -->
                            <div class="slider-group" style="background:#fff; padding:15px; border-radius:8px; border:1px solid #e2e8f0; margin-bottom:15px;">
                                <label style="margin-bottom:0.5rem; display:block;">Academic: CGPA Score (Max 55) <span class="score-display"
                                        id="valAcademicCGPA" style="float:right; margin-top:-10px;">0</span></label>
                                <div style="font-size:0.85rem; color:var(--text-muted); margin-bottom:10px;" id="cgpaFormulaText">
                                    Formula: (Student CGPA / Dept Topper CGPA) × 55
                                </div>
                                <input type="hidden" id="scAcademicCGPA" value="0">
                            </div>
                            <div class="slider-group">
                                <label>Academic: Honours/Minors (Max 5) <span class="score-display"
                                        id="valAcademicHonours">0</span></label>
                                <input type="range" id="scAcademicHonours" min="0" max="5" step="0.1" value="0"
                                    oninput="document.getElementById('valAcademicHonours').innerText = this.value">
                            </div>
                            <div class="slider-group">
                                <label>Academic: Competitive Exams (Max 5) <span class="score-display"
                                        id="valAcademicExams">0</span></label>
                                <input type="range" id="scAcademicExams" min="0" max="5" step="0.1" value="0"
                                    oninput="document.getElementById('valAcademicExams').innerText = this.value">
                            </div>

                            <div class="slider-group">
                                <label>Co-Curricular (Max 15) <span class="score-display" id="valCo">0</span></label>
                                <input type="range" id="scCo" min="0" max="15" step="0.1" value="0"
                                    oninput="document.getElementById('valCo').innerText = this.value">
                                <small style="color:var(--text-muted);">Sum of individual items: <span
                                        id="valCoSum">0</span></small>
                            </div>

                            <div class="slider-group">
                                <label>Extracurricular (Max 15) <span class="score-display" id="valExtra">0</span></label>
                                <input type="range" id="scExtra" min="0" max="15" step="0.1" value="0"
                                    oninput="document.getElementById('valExtra').innerText = this.value">
                                <small style="color:var(--text-muted);">Sum of individual items: <span
                                        id="valExtraSum">0</span></small>
                            </div>
                        </div>
                        <?php else: ?>
                            <div class="alert alert-info">
                                <i class="fa-solid fa-info-circle"></i> Only Super Admin can assign scores. You can provide comments for each section.
                            </div>
                            <!-- Hidden inputs to prevent JS errors if script tries to access them, or we update script to handle missing elements -->
                            <input type="hidden" id="scAcademicCGPA" value="0">
                            <input type="hidden" id="scAcademicHonours" value="0">
                            <input type="hidden" id="scAcademicExams" value="0">
                            <input type="hidden" id="scCo" value="0">
                            <input type="hidden" id="scExtra" value="0">
                        <?php endif; ?>

                        <button type="submit" class="btn-primary full-width" style="margin-top:1rem;">
                            <i class="fa-solid fa-save"></i> <?php echo $isSuperAdmin ? 'Save Final Evaluation' : 'Save Comments'; ?>
                        </button>
                    </form>
                </div>
            </div>
        </main>
    </div>

    <!-- Custom Document Preview Modal (Restored Overlay Style) -->
    <div id="certModal" class="modal-overlay" style="display: none;">
        <div class="modal-content" style="height: 90vh; border-radius: 16px; border: none; overflow: hidden; box-shadow: 0 25px 50px -12px rgba(0,0,0,0.25);">
            <div class="modal-header" style="background: #fff; border-bottom: 1px solid #f1f5f9; padding: 1.25rem 1.5rem; display: flex; justify-content: space-between; align-items: center;">
                <h5 class="modal-title" style="font-weight: 700; color: #1e293b; display: flex; align-items: center; gap: 10px; margin: 0;">
                    <i class="fa-solid fa-file-invoice" style="color: #4f46e5;"></i> Document Preview
                </h5>
                <button type="button" class="btn-close" onclick="closeDocModal()"></button>
            </div>
            <div class="modal-body p-0" style="background: #f8fafc; position: relative; display: flex; justify-content: center; align-items: center; overflow: hidden; flex: 1; min-height: 0;">
                <!-- Loading Spinner -->
                <div id="modalLoader" style="position: absolute; display: flex; flex-direction: column; align-items: center; gap: 1rem; z-index: 5;">
                    <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
                    <p style="color: #64748b; font-weight: 500; margin: 0;">Loading...</p>
                </div>
                
                <iframe id="docFrame" style="width:100%; height:100%; border:none; display:none; z-index: 10;" src="" onload="document.getElementById('modalLoader').style.display='none';"></iframe>
                <img id="docImage" style="max-width:100%; max-height:100%; object-fit:contain; display:none; z-index: 10; padding: 0; margin: auto;" alt="Document Preview" onload="document.getElementById('modalLoader').style.display='none';">
            </div>
            <div class="modal-footer" style="background: #fff; border-top: 1px solid #f1f5f9; padding: 0.75rem 1.5rem; display: flex; justify-content: center; align-items: center;">
                <button type="button" class="btn btn-link text-muted text-decoration-none" onclick="closeDocModal()" style="font-weight: 700; font-size: 1rem;">Close Preview</button>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/responsive.js"></script>
    <script src="js/evaluate.js?v=14"></script>
    <script>
        function switchMobileTab(tab, btn) {
            const details = document.getElementById('detailsCol');
            const scoring = document.getElementById('scoringCol');
            const btns = document.querySelectorAll('.mobile-tab-btn');
            
            btns.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            
            if (tab === 'submissions') {
                details.classList.remove('mobile-hide');
                scoring.classList.add('mobile-hide');
            } else {
                details.classList.add('mobile-hide');
                scoring.classList.remove('mobile-hide');
            }
            
            // Scroll to top of container
            document.querySelector('.evaluate-body-split').scrollTop = 0;
        }
    </script>
</body>

</html>