<?php
// src/config.example.php

// Database Configuration
define('DB_HOST', 'localhost');
define('DB_USER', 'your_username');
define('DB_PASS', 'your_password');
define('DB_NAME', 'best_outgoing');

// Encryption Configuration
define('ENCRYPTION_ALGORITHM', 'aes-256-cbc');
define('ENCRYPTION_SECRET', 'your_secret_key_here'); // Must be 32 characters for AES-256

// session settings
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
