@echo off
echo Starting PHP Server on http://localhost:8000 ...
php -S localhost:8000 src/router.php
if %errorlevel% neq 0 (
    echo.
    echo ERROR: PHP not found in your PATH. 
    echo Please ensure PHP is installed and added to your system environment variables.
    echo If you use XAMPP, you can use the XAMPP Control Panel to start Apache.
    pause
)
