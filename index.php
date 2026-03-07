<?php require_once __DIR__ . '/src/includes/auth_check.php'; require_guest(); ?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Best Outgoing Student System</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <script>
        window.APP_BASE_URL = "<?php echo get_base_url(); ?>";
    </script>
</head>

<body class="landing-page">
    <div id="canvas-container"></div>
    <div class="container" style="padding-bottom: 0;">
        <header class="top-bar" style="margin-bottom: 0; min-height: 120px;">
        </header>
    </div>

    <div class="container auth-container">
        <div class="login-wrapper-modern">
            <!-- Student Login Card -->
            <div class="modern-login-card">
                <div class="card-header-logo">
                    <div class="logo-icon-large">🎓</div>
                    <h2>Student Login</h2>
                    <p class="subtitle">Access your student dashboard</p>
                </div>
                <div class="card-body">
                    <form id="studentLoginForm">
                        <div id="studentLoginAlert" class="hidden"></div>
                        <div class="input-group">
                            <label for="studentEmail">Username / Email</label>
                            <input type="email" id="studentEmail" placeholder="Enter your email" required>
                        </div>
                        <div class="input-group">
                            <label for="studentPassword">Password</label>
                            <div class="password-field-container">
                                <input type="password" id="studentPassword" placeholder="Enter your password" required>
                                <button type="button" class="password-toggle" aria-label="Toggle password visibility">
                                    <svg class="eye-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                    <svg class="eye-off-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
                                        <line x1="1" y1="1" x2="23" y2="23"></line>
                                    </svg>
                                </button>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn-login-modern">Sign In as Student</button>
                        </div>
                    </form>
                    <div class="register-link">
                        Don't have an account? <a href="register.php">Register here</a>
                    </div>
                </div>
            </div>

            <!-- Employee / Panel Login Card -->
            <div class="modern-login-card">
                <div class="card-header-logo">
                    <div class="logo-icon-large">👨‍💼</div>
                    <h2>Staff Login</h2>
                    <p class="subtitle">Admin & Panel Access</p>
                </div>
                <div class="card-body">
                    <form id="adminLoginForm">
                        <div id="adminLoginAlert" class="hidden"></div>
                        <div class="input-group">
                            <label for="adminEmail">Employee ID / Email</label>
                            <input type="email" id="adminEmail" placeholder="Enter your ID or Email" required>
                        </div>
                        <div class="input-group">
                            <label for="adminPassword">Password</label>
                            <div class="password-field-container">
                                <input type="password" id="adminPassword" placeholder="Enter your password" required>
                                <button type="button" class="password-toggle" aria-label="Toggle password visibility">
                                    <svg class="eye-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                    <svg class="eye-off-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path>
                                        <line x1="1" y1="1" x2="23" y2="23"></line>
                                    </svg>
                                </button>
                            </div>
                        </div>
                        <div class="form-actions">
                            <button type="submit" class="btn-login-modern">Sign In</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <footer class="login-footer" style="text-align: center; padding: 2rem 0; margin-top: auto;">
        <p style="color: #64748b; font-size: 0.9rem;">
            Need help? <a href="instructions.php" style="color: #4f46e5; font-weight: 600; text-decoration: none; border-bottom: 2px solid rgba(79, 70, 229, 0.2); transition: all 0.2s;">Click here for Instructions</a>
        </p>
    </footer>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
    <script src="js/background-3d.js"></script>
    <script src="js/main.js?v=3"></script>
</body>

</html>