-- Database Selection
CREATE DATABASE IF NOT EXISTS best_outgoing;
USE best_outgoing;

-- Table: users
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('student', 'admin', 'panel') NOT NULL,
    department VARCHAR(255),
    roll_number VARCHAR(50),
    contact_number VARCHAR(20),
    bio TEXT,
    profile_photo VARCHAR(255),
    is_submitted TINYINT DEFAULT 0,
    is_sent_to_panel TINYINT DEFAULT 0,
    declaration_place VARCHAR(255) DEFAULT NULL,
    declaration_date VARCHAR(50) DEFAULT NULL,
    signature_path VARCHAR(255) DEFAULT NULL,
    recommendation_letter_path VARCHAR(255) DEFAULT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table: academic_records
CREATE TABLE IF NOT EXISTS academic_records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL UNIQUE,
    cgpa FLOAT,
    cgpa_score FLOAT DEFAULT 0,
    honours_score FLOAT DEFAULT 0,
    exams_score FLOAT DEFAULT 0,
    sgpa_sem1 FLOAT, sgpa_sem2 FLOAT, sgpa_sem3 FLOAT, sgpa_sem4 FLOAT,
    sgpa_sem5 FLOAT, sgpa_sem6 FLOAT, sgpa_sem7 FLOAT, sgpa_sem8 FLOAT,
    research_papers TEXT,
    certifications TEXT,
    honours_minors TEXT,
    competitive_exams TEXT,
    present_backlogs INT DEFAULT 0,
    history_of_backlogs INT DEFAULT 0,
    hod_name VARCHAR(255),
    hod_evaluation_date VARCHAR(50),
    hod_overall_comments TEXT,
    is_hod_submitted TINYINT DEFAULT 0,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Table: co_curricular
CREATE TABLE IF NOT EXISTS co_curricular (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    activity_type VARCHAR(255),
    title VARCHAR(255),
    description TEXT,
    date VARCHAR(50),
    certificate_path VARCHAR(255),
    score FLOAT,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Table: extracurricular
CREATE TABLE IF NOT EXISTS extracurricular (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    activity_type VARCHAR(255),
    title VARCHAR(255),
    description TEXT,
    level VARCHAR(50),
    certificate_path VARCHAR(255),
    score FLOAT,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Table: final_scores
CREATE TABLE IF NOT EXISTS final_scores (
    user_id INT PRIMARY KEY,
    academic_score FLOAT DEFAULT 0,
    co_curricular_score FLOAT DEFAULT 0,
    extracurricular_score FLOAT DEFAULT 0,
    interview_score FLOAT DEFAULT 0,
    total_score FLOAT DEFAULT 0,
    is_final_submitted TINYINT DEFAULT 0,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Table: file_uploads
CREATE TABLE IF NOT EXISTS file_uploads (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    filename VARCHAR(255),
    mime_type VARCHAR(100),
    data LONGBLOB,
    iv VARCHAR(32),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE SET NULL
);

-- Table: interview_marks
CREATE TABLE IF NOT EXISTS interview_marks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    panel_id INT NOT NULL,
    score FLOAT DEFAULT 0,
    comments TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY (user_id, panel_id),
    FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY(panel_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Table: department_toppers
CREATE TABLE IF NOT EXISTS department_toppers (
    department VARCHAR(255) PRIMARY KEY,
    topper_cgpa FLOAT DEFAULT 0
);
