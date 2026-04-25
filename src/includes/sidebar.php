<?php
// Function to determine if a nav link should be active
function is_nav_active($page_name) {
    return basename($_SERVER['PHP_SELF']) === $page_name ? 'active' : '';
}

$user = $_SESSION['user'];
$role = $user['role'] ?? '';
$isSuperAdmin = !isset($user['department']) || empty($user['department']);
?>

<nav class="sidebar mobile-mode">
    <div class="sidebar-header">
        <div class="logo-icon">
            <?php if ($role === 'panel'): ?>
                📋
            <?php else: ?>
                <i class="fa-solid fa-graduation-cap"></i>
            <?php endif; ?>
        </div>
        <div class="logo-text">
            <h2>AdminPanel</h2>
            <?php 
            if ($role === 'panel') {
                echo '<span class="sidebar-branch">Panel Dashboard</span>';
            } else {
                if ($isSuperAdmin) {
                    echo '<span class="sidebar-branch">IQAC Dashboard</span>';
                } else {
                    echo '<span class="sidebar-branch">' . htmlspecialchars($user['department']) . ' Branch</span>';
                }
            }
            ?>
        </div>
    </div>

    <div class="nav-links">
        <?php if ($role === 'panel'): ?>
            <a href="panel-dashboard.php" class="nav-item <?php echo is_nav_active('panel-dashboard.php'); ?>">
                <i class="fa-solid fa-list-check"></i>
                <span>Assigned Students</span>
            </a>
            <a href="admin-winner.php" class="nav-item <?php echo is_nav_active('admin-winner.php'); ?>">
                <i class="fa-solid fa-crown"></i>
                <span>Winner 2026</span>
            </a>
        <?php else: ?>
            <a href="admin-dashboard.php" class="nav-item <?php echo is_nav_active('admin-dashboard.php'); ?>">
                <i class="fa-solid fa-chart-line"></i>
                <span>Overview</span>
            </a>
            <a href="admin-winner.php" class="nav-item <?php echo is_nav_active('admin-winner.php'); ?>">
                <i class="fa-solid fa-crown"></i>
                <span>Winner 2026</span>
            </a>
            <a href="admin-students.php" class="nav-item <?php echo is_nav_active('admin-students.php'); echo is_nav_active('evaluate-student.php'); ?>">
                <i class="fa-solid fa-users"></i>
                <span>Students</span>
            </a>
            <a href="admin-performance.php" class="nav-item <?php echo is_nav_active('admin-performance.php'); ?>">
                <i class="fa-solid fa-trophy"></i>
                <span>Performance</span>
            </a>

            <?php if ($isSuperAdmin): ?>
                <a href="#" class="nav-item" onclick="openTopperModal(); return false;" id="navTopperBtn">
                    <i class="fa-solid fa-ranking-star"></i>
                    <span>Set Topper CGPA</span>
                </a>
                <a href="#" class="nav-item" onclick="openPanelModal(); return false;">
                    <i class="fa-solid fa-id-card-clip"></i>
                    <span>Panel Members</span>
                </a>
            <?php endif; ?>
        <?php endif; ?>
    </div>

    <div class="sidebar-footer">
        <button id="logoutBtn" class="logout-btn" onclick="window.location.href='auth/logout'">
            <i class="fa-solid fa-right-from-bracket"></i>
            <span>Logout</span>
        </button>
    </div>
</nav>
