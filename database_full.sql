-- BEST OUTGOING STUDENT SYSTEM - FULL DATABASE SCRIPT
CREATE DATABASE IF NOT EXISTS best_outgoing;
USE best_outgoing;

-- Database Selection
CREATE DATABASE IF NOT EXISTS best_outgoing;
USE best_outgoing;

-- Table: users
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
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


-- Schema Updates for Student Import
ALTER TABLE users MODIFY COLUMN email VARCHAR(255) UNIQUE DEFAULT NULL;
ALTER TABLE academic_records ADD COLUMN IF NOT EXISTS present_backlogs INT DEFAULT 0;
ALTER TABLE academic_records ADD COLUMN IF NOT EXISTS history_of_backlogs INT DEFAULT 0;

-- Student Data Inserts
SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ARAPUREDDY RAMA RANJITHA', '22A81A0103@sves.org.in', '$2y$10$QJ6iGRMlo36fQb2rj6jqhuaWUJ41RT7vT/N.aCXY3HJogdVP/Ptqi', 'student', 'CE', '22A81A0103', '9398576433', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.7, 6.77, 7.69, 7.88, 7.42, 8.12, 7.74, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOLLA RAVI TEJA', '22A81A0106@sves.org.in', '$2y$10$69FqV50K.lfRm.QJ4Saby.1NXxjP6aa1KeDVYQ21ATURlXSqRlIRa', 'student', 'CE', '22A81A0106', '7095337142', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.6, 8.38, 8.92, 9.29, 8.33, 9.02, 8.26, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOMMIDI HARSHA PRIYA', '22A81A0107@sves.org.in', '$2y$10$ak6IYr9rKPWAo1lkWYBgceDsHo9k4.f30V/0oVgKlTjAZXwGu8JWe', 'student', 'CE', '22A81A0107', '7396110435', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 7.77, 8.38, 8.25, 8.14, 8.47, 7.56, 8.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DANGETI KAVYASRI', '22A81A0110@sves.org.in', '$2y$10$.keE7OFtXCn.QfXQ7Zmz6exE2dacmrUG2kicgzCDP2YTqQ6.MT3x2', 'student', 'CE', '22A81A0110', '7981556235', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.47, 6.85, 6.69, 7.59, 7.65, 8.05, 7.74, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DARAPUREDDI RAJESWARI', '22A81A0111@sves.org.in', '$2y$10$mhzVnABYPyQUIq4xIbFMBOz7hkGTmZDhGv5JJN4V6vd8PzvR5rVwq', 'student', 'CE', '22A81A0111', '9550334625', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.37, 7.15, 8.69, 8.29, 8.28, 8.6, 8.74, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANDHAM BALA ANUHARIKA', '22A81A0115@sves.org.in', '$2y$10$tDB1OL8gd3E85SKSKkcsqO6NZLuUg.w0CdfM5vPaXaCsQ8zsrMysG', 'student', 'CE', '22A81A0115', '8919613022', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.23, 6.62, 7.38, 7.33, 7.21, 7.35, 7.49, 7.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANDIREDDY HEMANTH', '22A81A0117@sves.org.in', '$2y$10$02fSr4Jmbpmof2igig9JWuH7rsk0XAyPNjKquvkQK7TQKIeyK5Epq', 'student', 'CE', '22A81A0117', '6300229412', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.76, 8.23, 8.92, 8.88, 8.67, 9.16, 8.47, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOLUGURI TANUJA', '22A81A0118@sves.org.in', '$2y$10$gEAa7u/9QIpaQp5DPF1wEuOt4y1DqXEAawiWi6yv4tQbwcxqf8YRe', 'student', 'CE', '22A81A0118', '7569225179', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.24, 5.92, 6.31, 7.59, 7.33, 7.67, 7.42, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KALAVAKUNTLA PAVANI DURGA', '22A81A0120@sves.org.in', '$2y$10$j4A005uFwJ04lwX4hMYhzOIPJPzFxQ95PLbi/vRv2./gau0RIoCme', 'student', 'CE', '22A81A0120', '8125765299', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.36, 8.08, 7.69, 8.53, 8.12, 8.95, 8.4, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOMMIREDDY JAYASRI', '22A81A0122@sves.org.in', '$2y$10$VokfMi5lgaLTr/xW1NgPc.8QPNz3Xk0zoiFqqZ168pCvJVqzYYp2C', 'student', 'CE', '22A81A0122', '9515585575', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 8.54, 8.77, 8.35, 8.09, 8.88, 8.05, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANNE PUJITA', '22A81A0128@sves.org.in', '$2y$10$rHMFWlAsEaNIK02/RRijP.SgoGVA7OpzjI7jDfYQzeVUbganqLZ4C', 'student', 'CE', '22A81A0128', '9912515727', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.3, 6.46, 7.08, 7.35, 7.53, 7.63, 7.21, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MIDATANI SINDHUSHA NAGA SRI', '22A81A0129@sves.org.in', '$2y$10$xMeIJiHabFEWI/ufSeFleOOA86FrnkMhSpgRodytBWmcYf7qXUlhu', 'student', 'CE', '22A81A0129', '7337586784', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.93, 8.92, 8.92, 9.41, 8.6, 9.58, 8.19, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TARAGALLA YASASRI VENKATA LAKSHMI', '22A81A0141@sves.org.in', '$2y$10$fltg8yYaGaXBv6RmPayige5f27TbBB/jdD5MWK//.xMn/8RHxuy4C', 'student', 'CE', '22A81A0141', '8500058067', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.39, 6.46, 7.38, 7.51, 6.79, 7.91, 7.63, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AMBATI SURYA CHARAN', '23A85A0102@sves.org.in', '$2y$10$r.creecNPb4hADUKvmd0K.FDa9JqQUHkGTyoscuv3RotO2iUWKO9m', 'student', 'CE', '23A85A0102', '8121643757', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 0.0, 0.0, 8.35, 8.58, 8.74, 8.12, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AMMIREDDI ESWARI DEVI', '23A85A0103@sves.org.in', '$2y$10$5Bo9Jr2r9j.DWrgmuY641.beVMRAa5Cpk9lt31WzIwo.nyRHDJ5em', 'student', 'CE', '23A85A0103', '9182639275', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.39, 0.0, 0.0, 8.84, 8.33, 8.51, 8.19, 8.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADHAVARAPU SAI SIVA SANTHOSH BABU', '23A85A0105@sves.org.in', '$2y$10$Kn7tYkdi6t2Nmix4Al7NHeBF8vt3XwDsWCG4XAEWwNT1nsiGK632y', 'student', 'CE', '23A85A0105', '7386592365', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.74, 0.0, 0.0, 9.18, 8.88, 8.6, 8.4, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NANDURI BHARATH UMA LAKSHMAN', '23A85A0107@sves.org.in', '$2y$10$NF7kli2jUyIeyvBNjXl83.Y/vKAIYMcKyn.JOYFYmhtlmkH1ThY0G', 'student', 'CE', '23A85A0107', '7013749946', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.07, 0.0, 0.0, 8.43, 7.79, 7.98, 7.63, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NETHALA TEJASWI', '23A85A0108@sves.org.in', '$2y$10$GVqaFetHQciYu5PvybX79.acAD6vPrnX8K3GiQET5Zq4VL1Ldhp7W', 'student', 'CE', '23A85A0108', '8317676245', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.39, 0.0, 0.0, 9.65, 9.44, 9.58, 9.02, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SARIDE PRASANTH', '23A85A0110@sves.org.in', '$2y$10$VmDRQ71At6yTOII/gjLw8.FuAUUYPNhv.t6gGWax.ClEMYzBS37.u', 'student', 'CE', '23A85A0110', '8885019667', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.88, 0.0, 0.0, 9.25, 8.6, 9.02, 8.88, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VINUKONDA RAMA SATYANARAYANA', '23A85A0111@sves.org.in', '$2y$10$.CUwNOCJeHDlenra0bb2fub67Cj6YhixoWkk5E.9iWNrylaPOHK.O', 'student', 'CE', '23A85A0111', '7815866367', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.46, 0.0, 0.0, 9.14, 8.05, 8.6, 8.12, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ANEGONDI TARUN KUMAR', '22A81A0501@sves.org.in', '$2y$10$CaWq3IjafVjeK8J04oBkTeLbJ5/VuBcJx2vBZu7hjAMyKr5CRbnL2', 'student', 'CSE', '22A81A0501', '8309196931', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.47, 8.85, 8.0, 8.94, 8.67, 8.16, 8.09, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BEELLA RUPADEVI', '22A81A0502@sves.org.in', '$2y$10$l27MW9RNZlApBIalvqueDOsaNVxFpMbf2TrUpyoJ.abXuiNXS2Spe', 'student', 'CSE', '22A81A0502', '7672009595', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.84, 9.54, 8.54, 9.06, 8.95, 8.37, 8.72, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BHIMASINGI VENKATESWARA RAO', '22A81A0503@sves.org.in', '$2y$10$IXZKnWNUEFXwq2KjQ/Mfe.CyMBqrZRPRUlgODTyDnwOwvnsfsq9Yi', 'student', 'CSE', '22A81A0503', '9491019773', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.56, 8.92, 9.08, 8.59, 8.33, 8.47, 8.47, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DONGA SANKAR', '22A81A0506@sves.org.in', '$2y$10$dZ7vqCUFHCaciPBIiZIrBeBhPgca3p79Km27dYZRAt4Zxkd5yRERa', 'student', 'CSE', '22A81A0506', '7569505631', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.27, 9.31, 8.08, 8.35, 8.6, 7.88, 7.47, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('EDUPALLI JESHITHA VENKAT', '22A81A0507@sves.org.in', '$2y$10$XaitC5CN6.60c9VhKXinBuJ9CxzcWoa/cQxrU.t5x8X7.3VmJl9be', 'student', 'CSE', '22A81A0507', '9182960108', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.82, 8.62, 6.85, 8.06, 7.49, 7.47, 8.02, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GARAKA TEJASWINI', '22A81A0509@sves.org.in', '$2y$10$1spmFP0YQKjciVwK0Q2mKOVUKFNNb2NhDU.KYeEAo.yrqPaLhnUTe', 'student', 'CSE', '22A81A0509', '6304787664', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.67, 9.23, 9.08, 8.71, 8.47, 8.74, 8.3, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GAVARA SREEJA', '22A81A0510@sves.org.in', '$2y$10$amNSErlpH7fVjsNszyX2ZOagbEvGyoZddt2yfgZ8t41WSWCIIva6W', 'student', 'CSE', '22A81A0510', '8688363045', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.72, 9.31, 9.38, 8.59, 8.88, 8.4, 8.23, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUBBALA MEGHANA', '22A81A0512@sves.org.in', '$2y$10$h.kYaFx6FG3NSBLpgKB02uyoPo02dat/TS9Sl0tdUzCMkUdTu0Kku', 'student', 'CSE', '22A81A0512', '9398934454', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.92, 8.46, 6.85, 7.94, 7.84, 7.98, 7.98, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('IMMIDISETTI SAI GANESH', '22A81A0513@sves.org.in', '$2y$10$cg5MRwo0zA.IfQT7841U4OdYDj2DTBQLbsIeJWqRNc7J5f62/Bd1a', 'student', 'CSE', '22A81A0513', '9346797159', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.2, 8.54, 7.54, 8.35, 8.33, 8.4, 7.98, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('INNI TANINKI', '22A81A0514@sves.org.in', '$2y$10$rCyt/jDxto.WlZDeSmBWpeJUwLsb.WgPk/Se6CrWUsgiBADk8qC6y', 'student', 'CSE', '22A81A0514', '9573653146', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.22, 9.31, 8.92, 9.06, 9.51, 9.21, 9.37, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAMMILA SAI', '22A81A0516@sves.org.in', '$2y$10$uL6QFSIrjewZtdWN9WctKOXOqjNKk1y2rmHo.WMNPnJkiwNdNOX0S', 'student', 'CSE', '22A81A0516', '8179077852', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.63, 8.0, 7.54, 7.71, 7.28, 7.84, 7.81, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANAK AGARWAL', '22A81A0517@sves.org.in', '$2y$10$DJGwNb32MiijngD6SFfCgeXXGm7AIq0vrsJsNM.e0tR3OMljRVyvq', 'student', 'CSE', '22A81A0517', '9346857997', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.95, 9.46, 9.23, 9.06, 8.74, 8.88, 8.81, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KILARU KIRAN SRI SAI', '22A81A0520@sves.org.in', '$2y$10$zr5wrE4qGGCWuRKix2nCfu9ZBwcL2rrCfVpZ8OuYiLKDBHU2Ei4se', 'student', 'CSE', '22A81A0520', '9392642327', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 9.0, 7.92, 8.29, 7.98, 7.47, 8.02, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KURAM SUPREEYA', '22A81A0525@sves.org.in', '$2y$10$J1eWllVzAdIzidd4/eMFj.sWYtQ2HTkIduF/tjPuSFxIb2yjEJcQy', 'student', 'CSE', '22A81A0525', '8886097298', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.75, 8.31, 6.46, 7.94, 7.56, 8.26, 7.49, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANEPALLI MUKESH CHANDRA RAMA GANESH', '22A81A0529@sves.org.in', '$2y$10$f24gUK0fBD4fyBSR7e2HxuSNwQ1ZyR54YxXFtWO7U32tXv0UkHTre', 'student', 'CSE', '22A81A0529', '8074034884', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 8.62, 8.54, 8.65, 8.12, 8.6, 8.26, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEDAPATI VENKATA SAI ABHIRAM REDDY', '22A81A0530@sves.org.in', '$2y$10$ORsbbUXrzlPof89tMkjYyeAAJQNr6Dqr1FQkPT86fjB0qjPswfIs2', 'student', 'CSE', '22A81A0530', '7702980878', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 8.38, 7.46, 8.24, 7.49, 8.47, 7.81, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADEM JAYASRI', '22A81A0532@sves.org.in', '$2y$10$M5iVLYF5jnwwjJEAdgfxauhAgDZ0KnGedg1pfOHm3KTgSh9zyPTB6', 'student', 'CSE', '22A81A0532', '8019680503', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.54, 8.62, 8.62, 8.53, 8.4, 8.6, 8.3, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANDAPAKA BALAMADHURI', '22A81A0533@sves.org.in', '$2y$10$1dwv3dQjurDUC/Z8SUa0ZOmXJ7b57dHdKGPODJURllzErg0Q96iCK', 'student', 'CSE', '22A81A0533', '8074975372', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.95, 7.85, 8.08, 8.59, 7.56, 8.07, 7.53, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEDAPATI UMESH ANJAN', '22A81A0534@sves.org.in', '$2y$10$aKU1g6G04VqNGaQ3zqJLOuRAKvLdjqsV6jPpy.U971SPwapKBbu4O', 'student', 'CSE', '22A81A0534', '9346307371', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.62, 7.38, 6.77, 8.12, 7.35, 7.86, 7.81, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOHAMMAD AAKHIL', '22A81A0535@sves.org.in', '$2y$10$ppLRsw1HicLntRGIoXWulOTy3osALZw3FSwwJL0KeFF3KSr134ILW', 'student', 'CSE', '22A81A0535', '8919928452', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.04, 8.15, 7.15, 8.18, 8.05, 8.49, 8.19, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOLLI LOVARAJU', '22A81A0537@sves.org.in', '$2y$10$0/EkzHYevwU97dNfYM.kluYEMtlVVb2KWP0wEW4FMrOWgb8v/tIle', 'student', 'CSE', '22A81A0537', '7993265890', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.66, 9.0, 7.77, 8.65, 8.67, 8.72, 8.93, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MUCHERLA UMA DEVI', '22A81A0538@sves.org.in', '$2y$10$Fr6YRahl4IQ7.4GEzZeiZ.TF1qbfOcQcUhsobDS8C0J6/8J.P0vUG', 'student', 'CSE', '22A81A0538', '9346696952', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.92, 7.54, 6.69, 8.35, 7.84, 8.51, 7.88, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAIDU KIRAN MAHESH', '22A81A0539@sves.org.in', '$2y$10$ApmBQUcwZeXT7mtXWfmeO.fD/TWsI7kwworttOHq11pTEEyqtsznO', 'student', 'CSE', '22A81A0539', '9392774033', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.62, 7.85, 7.31, 7.71, 7.7, 8.21, 7.35, 7.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAKKA SHARMILA', '22A81A0540@sves.org.in', '$2y$10$xjnJ9yLIREiR1cU/irN9XeUNLogTGDyEbt5/ZhZzuOM2tBW.Qoh76', 'student', 'CSE', '22A81A0540', '9912016003', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.07, 9.15, 8.92, 9.06, 8.74, 9.44, 9.35, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALAMATI LAHARI', '22A81A0541@sves.org.in', '$2y$10$MRjOWfEq9S0IYBIyORLplO/wNZVAU6ooe7JhVkJerGRxPF2TyDijm', 'student', 'CSE', '22A81A0541', '9989334599', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 9.23, 9.08, 9.06, 8.81, 8.88, 9.3, 8.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALLA THRISHITHA', '22A81A0542@sves.org.in', '$2y$10$hxMPycQKWB.UaJiIva7jHOZuMCSzfb6YNKb.xa1uzb/nBVSywm/jC', 'student', 'CSE', '22A81A0542', '9676717115', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.86, 9.0, 8.54, 8.94, 8.74, 9.3, 8.95, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALLA VARSHITHA BANU', '22A81A0543@sves.org.in', '$2y$10$EoVti96bq/9eKa.6nF4aS.HnuUxhYpUQAk8IIoPM9pBWSnEIkWSlK', 'student', 'CSE', '22A81A0543', '8985547973', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.22, 9.54, 9.38, 9.18, 9.02, 9.44, 9.16, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NARNI VASANTHI LAKSHMI PRIYA', '22A81A0544@sves.org.in', '$2y$10$3DcIipit6oqicOu7Sj.RbujM7ZH.fZ2f.yaXBNEeIFODnAzya3U2S', 'student', 'CSE', '22A81A0544', '7093544020', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.14, 9.85, 9.38, 8.94, 9.02, 9.3, 9.16, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NERUTURI SRAVANI', '22A81A0545@sves.org.in', '$2y$10$s4sRTVl3RoB5p9dRFf/4redWbMtANe7JfNsoIP8xbCMcGmHQubieu', 'student', 'CSE', '22A81A0545', '9493442866', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.66, 7.85, 6.31, 7.88, 7.14, 7.95, 8.19, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PADALA SAI KANAKA DURGA', '22A81A0546@sves.org.in', '$2y$10$VYlNVMk5VWlTwjSFluulWeu6IbON55Vy9nhhBOoeKgQJnaX0fGC26', 'student', 'CSE', '22A81A0546', '9701749629', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 9.15, 7.77, 8.24, 8.33, 8.65, 8.81, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PATSA JNANA VENKATA SATYA SRI', '22A81A0547@sves.org.in', '$2y$10$v2uUGf0vZsnLcX0foGZV7e23mpRY4FRqBqSLbVXCJtPKkvtFIqPrC', 'student', 'CSE', '22A81A0547', '9494418933', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.29, 9.85, 9.15, 9.65, 9.16, 9.44, 9.3, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PENMETSA SAI PHANEENDRA VARMA', '22A81A0548@sves.org.in', '$2y$10$092YdtqcOXNX7ljRIISjiuuFPTWrDQyNxHNqqbvv2juikZYQc/gmG', 'student', 'CSE', '22A81A0548', '9182838219', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.95, 9.38, 9.46, 9.24, 9.16, 8.37, 8.95, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PEREPU PUJITHA', '22A81A0549@sves.org.in', '$2y$10$zLIRh8VemvEC0vArboalx.eMGXUjYXnbHYQsT63.cbFJGgNWmlfwy', 'student', 'CSE', '22A81A0549', '8688079531', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.29, 9.62, 9.69, 9.29, 9.3, 9.35, 9.21, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PINDI MOUNIKA', '22A81A0550@sves.org.in', '$2y$10$6mgKPlTkyM4zjx7i5VnaoOOOJs7bUGeRQ2dJuhLxKRRJ0Z1vz8CRa', 'student', 'CSE', '22A81A0550', '9989646255', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.54, 9.08, 8.15, 8.82, 8.26, 8.37, 8.53, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POTHULA LALITHASRIPANI', '22A81A0551@sves.org.in', '$2y$10$oOr.evDU9ar8kuKqY./BReuhI4CpcLOb6nIHXA7Q9nr3rBY2.k0ge', 'student', 'CSE', '22A81A0551', '9515071459', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.09, 9.54, 9.23, 9.29, 8.95, 8.81, 9.3, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('REDDY KEERTHI YUGASRI', '22A81A0554@sves.org.in', '$2y$10$PX.0lC83xbDNXeTp/MiV1.Q5fiIBg4MDnYvYGKLkE0s8uDLBuhOxW', 'student', 'CSE', '22A81A0554', '7799551149', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 8.85, 8.54, 8.59, 8.4, 8.74, 7.79, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SUMA SREE MANDRU', '22A81A0560@sves.org.in', '$2y$10$K2jE/7HtT5Wwiienoa.mSu5cnqk7GoM.QtV/d.mZL5vgHLm7Ve0Eq', 'student', 'CSE', '22A81A0560', '9063285803', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.82, 9.15, 8.15, 9.29, 8.95, 8.88, 8.58, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('THANGUDU SHANMUKHA RAO', '22A81A0561@sves.org.in', '$2y$10$DWMjf0luA.rDSgBy4Ve75uAJQAxgtiw0XdxoZ0ePNsTsOS7jtQrki', 'student', 'CSE', '22A81A0561', '8712248783', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.51, 8.69, 8.0, 8.94, 8.6, 8.74, 8.33, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UNGATA YAMINI SAI SRI SUSEELA', '22A81A0563@sves.org.in', '$2y$10$Qgi3AyhAAUnjezolLR56JuOD1BiXRl61wtcYKc0gHFRJOKDy81iwW', 'student', 'CSE', '22A81A0563', '7993692188', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.3, 9.62, 9.54, 9.06, 9.44, 9.56, 9.3, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VALLURI GOWTHAMI RUSHITHA', '22A81A0564@sves.org.in', '$2y$10$Ummk71q89Y9Uk1Ik8kZSQeKhBTCs1qtDgfdLtJoio9acqWx6BDx.K', 'student', 'CSE', '22A81A0564', '9392582344', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.93, 9.15, 8.69, 9.18, 8.74, 8.88, 9.16, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VANGALA MRUDULA', '22A81A0565@sves.org.in', '$2y$10$/Kh2Deub9Ke8hRVFS2q8dOpUlVoKUWXMqgdEeJA9eaTBZGSkaeaAy', 'student', 'CSE', '22A81A0565', '6281201159', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.46, 8.31, 8.0, 8.35, 8.74, 8.67, 8.74, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEERAMALLA VENKATA DURGA PARVATHI', '22A81A0566@sves.org.in', '$2y$10$s.fyOQ31oBdEmngvfSA45OizTpuw4SKvICT89t61lQMxqvX3bDx2S', 'student', 'CSE', '22A81A0566', '8121837543', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.66, 8.77, 8.85, 8.71, 8.81, 8.6, 8.6, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADDALA GOPIKA ANJALI', '22A81A0567@sves.org.in', '$2y$10$dMQr/f/TfPPy/J1gMChihecOAQXzeBACJqY/hZJbuiT6tqPMh3qCi', 'student', 'CSE', '22A81A0567', '9347514335', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.71, 8.62, 8.31, 8.43, 9.07, 8.88, 8.67, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ANNAPAREDDY PRAVEEN KUMAR', '22A81A0568@sves.org.in', '$2y$10$sD4TjCRUl4JePijX6Shybu8Zh7w/7uIDajkox1LMuAPSygwwuPmqu', 'student', 'CSE', '22A81A0568', '9866678399', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.65, 7.31, 7.38, 8.0, 7.63, 7.88, 7.63, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ANYAM VENKATA NAGA BHAVANI PAVAN KUMAR', '22A81A0569@sves.org.in', '$2y$10$0ChcEJHAJ8JmRX3NNLfR7OA/QJ.4YvSHu40oJbyQfeeNRTx81OpAy', 'student', 'CSE', '22A81A0569', '9398585389', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 8.77, 7.54, 7.73, 7.98, 8.09, 8.53, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BODDETI KUSUMA', '22A81A0572@sves.org.in', '$2y$10$sg7/vMXXHSFxgB9jRriWfejulS9RMCmnEs5kjh35VXdGuUGqZLC5i', 'student', 'CSE', '22A81A0572', '9963870893', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.8, 9.23, 8.31, 8.78, 8.95, 8.74, 8.88, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHEBOLU NAGA PRASANNA', '22A81A0574@sves.org.in', '$2y$10$u7oHiEX4/oTQ/ZTwjST/Dew/mWPvgviENVUqZc14Qlf2Wq.rhblAa', 'student', 'CSE', '22A81A0574', '9490549112', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.84, 8.77, 9.38, 8.86, 8.88, 8.47, 9.16, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHIDARALA DURGAPRASAD', '22A81A0575@sves.org.in', '$2y$10$w0HdB8ZSHMjZ3t9f//ADl.3CTvJfdlKNDtdcfA1HN.wTBIWgfs0u.', 'student', 'CSE', '22A81A0575', '9618808831', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.59, 8.69, 9.0, 8.94, 8.51, 8.37, 8.53, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DASARI KEERTHI RAJU', '22A81A0577@sves.org.in', '$2y$10$9zN8NwQzk8IGYCY6EwriJ.rKPQXgqa0IZYrkGiZGQm6gAMF9nuqL.', 'student', 'CSE', '22A81A0577', '7207466128', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.32, 7.08, 7.31, 7.47, 7.0, 7.6, 6.98, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('EDUPALLI SUJITHA', '22A81A0578@sves.org.in', '$2y$10$m4m5NAgx9WwrqFuvr9CHJ.dM03pM/uaKTFk7.d9wy8u5/dYbPOLdi', 'student', 'CSE', '22A81A0578', '8121736577', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.38, 8.69, 8.46, 8.78, 8.23, 8.74, 7.49, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('EEDARA TEJASWINI', '22A81A0579@sves.org.in', '$2y$10$mv9WOuM2bIVTVFdAQUehzuyiYG5SDUiKqyXaF2u2HOBfjAV2PPCGm', 'student', 'CSE', '22A81A0579', '9392418489', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.21, 9.69, 9.15, 9.41, 9.02, 8.81, 9.3, 9.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANDHAM HEMANTH SATYAVENKATA KRISHNAPRASAD', '22A81A0580@sves.org.in', '$2y$10$g/4xEqycavFTkYiSU8V4nu5M.JWhxyfb4itNK8LaFBq8anhVYEF0G', 'student', 'CSE', '22A81A0580', '9652306468', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.81, 8.54, 7.77, 8.2, 7.33, 7.4, 7.47, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GADAMSETTI RAMALAKSHMI', '22A81A0581@sves.org.in', '$2y$10$.sovs9Uve/5w97gCkA4.Be9u7lyoeeoU5imwPJPL1XaCJsvTC2HyG', 'student', 'CSE', '22A81A0581', '9059318626', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.51, 8.69, 8.23, 8.82, 8.26, 8.33, 8.65, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUBBALA LOKESH', '22A81A0582@sves.org.in', '$2y$10$ctIByxnNp4vV9RgY04LNPufrn6vZFcjPVEq7wFY/wfK8JyywgUvIq', 'student', 'CSE', '22A81A0582', '7995743710', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.01, 9.31, 9.08, 9.1, 9.16, 8.74, 8.81, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUDAPATI SAI SATYA GANAPATHI', '22A81A0583@sves.org.in', '$2y$10$O6BIUompT0vlt9FvugC84e/iGWmJHEAoAsGUVC122rSO7nwNcr1h6', 'student', 'CSE', '22A81A0583', '9014889933', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 8.31, 8.0, 8.08, 8.19, 7.67, 7.91, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUTTULA SOMA DURGA ARJUN', '22A81A0584@sves.org.in', '$2y$10$Kh0.G2MyoGdyau0PS0i8Vu.P/PBPdA404JR.Yl6QLlFz04ebxr1bS', 'student', 'CSE', '22A81A0584', '7780733677', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.54, 8.38, 8.46, 8.9, 8.6, 8.72, 8.37, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KADIYAM DIVYA BHAVANI', '22A81A0588@sves.org.in', '$2y$10$aFw6aeFEYb/tdZoDE9FNJOwuFEDsXyJCK7HB4y0dpgt8.6uHLgfy2', 'student', 'CSE', '22A81A0588', '9515767259', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.89, 9.08, 8.92, 9.02, 8.93, 8.95, 8.53, 8.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAKANI SRIPADHA', '22A81A0589@sves.org.in', '$2y$10$HzOkdzHgPpLMfHvCAkOHoO3/5DWJ6CSI/.C3s/7Ccb/LZRQt00RkK', 'student', 'CSE', '22A81A0589', '6300889541', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 8.15, 8.62, 8.71, 7.91, 7.74, 7.88, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARRI JAYA NAGA SRI', '22A81A0591@sves.org.in', '$2y$10$oN47uOpnWlR.Qt1PisPwVeNrSEEeM7L0JMBWL5v0ZatTJIIAys9ci', 'student', 'CSE', '22A81A0591', '8019231338', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.49, 8.08, 8.31, 8.71, 8.74, 8.72, 8.02, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KESAVARAPU VENKATA SESHA PRASANNA VASAVI', '22A81A0594@sves.org.in', '$2y$10$pbuH6h/Xwj9zDXARCu0L/O46cwLy7O48WWYTe2LEq6yn1Xg6DwiOK', 'student', 'CSE', '22A81A0594', '7981879511', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.87, 9.0, 8.62, 9.1, 9.16, 9.02, 8.74, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOHAMMAD JAHEERUNNISA', '22A81A05A0@sves.org.in', '$2y$10$P10/hdZR6u9eDYMocPjpZOs5JeGDSMbFyKEDMbUvThqsubz1qdBwW', 'student', 'CSE', '22A81A05A0', '7569826345', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.13, 9.38, 8.77, 9.18, 9.02, 9.02, 9.16, 9.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POSIMSETTY LEELA SESHA BALAJI', '22A81A05A7@sves.org.in', '$2y$10$3I5mnK.fJm/basrkelilXOLpC/e0mfbiPF94zO8NdYlzuWQT1L4KO', 'student', 'CSE', '22A81A05A7', '8332955678', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.27, 9.46, 9.38, 8.96, 9.35, 9.16, 9.16, 9.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PESARAGANTI HARSHAVARDHAN', '22A81A05A9@sves.org.in', '$2y$10$7mWSXhXUh7WSI8pEBu20/OXVoqdCp23yi0S2UPAVbbYBpI2NGCh1S', 'student', 'CSE', '22A81A05A9', '9515978355', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.5, 8.46, 8.54, 8.22, 8.6, 8.58, 8.6, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAMOJU SAI KUMAR', '22A81A05B3@sves.org.in', '$2y$10$vr.hSF4rSlNSw7I5yryGNel8o0270teIQRlmOKq8HdQuscsIU7t1u', 'student', 'CSE', '22A81A05B3', '9177605366', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.49, 9.15, 8.15, 8.25, 8.93, 8.51, 8.4, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SADANALA RAJASRI SIVA PRIYA', '22A81A05B4@sves.org.in', '$2y$10$3v2IxmiJOqpu1IPJ/mSQQuVSzBlfASAF2bWZ.ZXat1r7skM/jX.8C', 'student', 'CSE', '22A81A05B4', '7680011211', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.03, 9.62, 9.08, 9.41, 9.3, 8.74, 8.53, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SANABOINA VAMSI NAGA SAI', '22A81A05B5@sves.org.in', '$2y$10$vcNIGW7iahnZLdWFsyzfo.8M5s2lcMghMgsjJV.xAVUdSpnRqqazS', 'student', 'CSE', '22A81A05B5', '8555954068', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.38, 7.38, 7.15, 7.53, 6.93, 7.33, 7.53, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SANAMANDRA VIJAYKUMAR', '22A81A05B6@sves.org.in', '$2y$10$UR6PLaI4dPMoF.u7xN/H2uN7lauQFS9SM45ZG/zfVoYLt3ie0NcvK', 'student', 'CSE', '22A81A05B6', '8008787061', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.93, 8.46, 7.69, 8.45, 8.16, 7.4, 7.77, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SHAIK AASHIMA FATHIMA', '22A81A05B7@sves.org.in', '$2y$10$tazwwGMjFCPgceH7xp5flO1DzmG3xGFcKS7eBShmeXz4dmPsZkbqe', 'student', 'CSE', '22A81A05B7', '9704924239', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.85, 7.85, 8.9, 9.16, 8.3, 7.84, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TALLA SRINU', '22A81A05B8@sves.org.in', '$2y$10$RU9oXUrbSTbZbSb6NKaQde.UOMNcfobkAXVdFqmHzJA9xicuPl2r2', 'student', 'CSE', '22A81A05B8', '7794969377', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 8.85, 7.31, 8.9, 8.44, 8.3, 8.26, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TARAGALLA LAKSHMI AKHILA SWATHI', '22A81A05C0@sves.org.in', '$2y$10$a7UGgovIlygVBZ/Bz4.oHunwkdB.kN8EK9Cf5a2Ot/7UrpEhABSpq', 'student', 'CSE', '22A81A05C0', '7989790712', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.45, 9.69, 9.54, 9.65, 9.72, 9.3, 9.02, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TATAVARTHI RISHI VARUN', '22A81A05C1@sves.org.in', '$2y$10$15WYKP4AAJg.Rfmebpur9uDq6nTVHCBAbYs0szglu7zXViKnb/mT.', 'student', 'CSE', '22A81A05C1', '9347740140', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.16, 9.46, 8.54, 9.65, 9.02, 9.3, 8.88, 9.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VANKAYALA GANESH SIVA SAI KRISHNA', '22A81A05C5@sves.org.in', '$2y$10$0Ag3frwXBhO6yXex3HyaJu6ErKavVkweMlPxXMWYKOrYMEVRNS78e', 'student', 'CSE', '22A81A05C5', '6300260522', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.28, 8.85, 7.15, 8.47, 7.95, 8.65, 8.33, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VALLURI REETHI', '22A81A05C6@sves.org.in', '$2y$10$m0bf5lWxCo3v6LS2NMvx3e0AvjYbmz6snIyYC1hInXb7wMnO4gNGW', 'student', 'CSE', '22A81A05C6', '7995435659', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.32, 8.85, 7.46, 8.47, 8.19, 8.37, 8.4, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VELAGALA VARSHA SRI', '22A81A05C8@sves.org.in', '$2y$10$mRVTJ8D0U9.s1ymzo0.slunIMs.ywWjaXF99OGWWKHgPyFP2QDen.', 'student', 'CSE', '22A81A05C8', '9154972789', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.6, 8.46, 7.69, 9.0, 8.42, 8.88, 8.67, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VELUGULA HEMANTH', '22A81A05C9@sves.org.in', '$2y$10$UnWDB0m3lMT93v/thjJIoeZ6u.AeRgbU1dKGjJ0Pwr6RjJK2yYB3m', 'student', 'CSE', '22A81A05C9', '9542849956', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.25, 8.46, 7.08, 8.67, 8.67, 7.88, 8.53, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEMULURI JAYA KANTH', '22A81A05D0@sves.org.in', '$2y$10$PVT8xcGMGhvTMwuDN5vs..xQw9cX1frCmc9/zecGu0Cuje6.YcFp.', 'student', 'CSE', '22A81A05D0', '9573951246', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.59, 8.15, 7.0, 7.92, 7.49, 7.33, 7.77, 7.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YADAVALLI LAKSHMI VYSHNAVI', '22A81A05D1@sves.org.in', '$2y$10$2d668UXvLm.2Hn34pNenrumXPHsqBze9nxeJbGvyfYSAYWHjG4Fs6', 'student', 'CSE', '22A81A05D1', '6301693123', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.15, 9.23, 8.92, 9.1, 9.16, 9.3, 9.3, 9.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YALAMARTHI LAHARI', '22A81A05D2@sves.org.in', '$2y$10$XXePNygyNzMst9s8CIdNEeB9YagD6QD3F1tY8mazZqlTp8jJTpfD2', 'student', 'CSE', '22A81A05D2', '6301833679', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 8.38, 7.15, 8.43, 8.74, 8.6, 8.4, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADABALA UMA SAHITHI', '22A81A05D4@sves.org.in', '$2y$10$o5GKiCjxaP9zF3nbRcn8f.KE9aA2Ml3qZ8MF2Xi3kmEHqV96jBvbG', 'student', 'CSE', '22A81A05D4', '9346344262', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.03, 9.38, 8.77, 9.06, 8.88, 9.02, 9.07, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AKULA MADHURI', '22A81A05D5@sves.org.in', '$2y$10$CILkbBodlHw5qDDlsskIbeMt2nOdTLapsSncq9jIZ1UbNmQtV2qj2', 'student', 'CSE', '22A81A05D5', '8341192827', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.3, 8.15, 7.0, 8.18, 8.53, 9.16, 8.23, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ARIGELA RAMAKRISHNA VINAYAK', '22A81A05D6@sves.org.in', '$2y$10$7IM4C5HVxyc7DOI2xMMdhuqqSZ.OuM/4f2yNgVkDUYqkIDD0ddGYK', 'student', 'CSE', '22A81A05D6', '9550461464', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.14, 8.23, 7.38, 8.59, 7.91, 8.47, 8.4, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BODDU JAYANTH PATHRUDU', '22A81A05D9@sves.org.in', '$2y$10$h.MTqCx95fT16sTqrrL8U.P3cxiG/uC6RpJ1eoqPum30NXmTZDPJC', 'student', 'CSE', '22A81A05D9', '9493422727', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.1, 7.54, 7.62, 8.1, 8.33, 8.47, 8.05, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHALLA VISHNU VARDHAN', '22A81A05E0@sves.org.in', '$2y$10$1cX6eUF8MTMn3pVBpHd/9eVGub0PL.cKA5NKk/YPrHpSjrEJ6Xycu', 'student', 'CSE', '22A81A05E0', '8919758517', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.99, 9.38, 8.92, 8.94, 9.02, 9.16, 8.88, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHIKKALA VYSHNAVI', '22A81A05E1@sves.org.in', '$2y$10$OtxLRjw8GyOGUoXiX4vnSeUq/g2RPsnBYGbYRLzEzFJto.2r6AkrC', 'student', 'CSE', '22A81A05E1', '9390558534', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.41, 8.38, 7.92, 8.82, 8.4, 8.53, 8.47, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DINDUKURTHI CHATURVED', '22A81A05E4@sves.org.in', '$2y$10$kWYtkvbhyjhdRIFB.Wf72.BZfbxKGeFiTa5ojaP2EiKuL1lQIzP0m', 'student', 'CSE', '22A81A05E4', '9059632955', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.18, 8.08, 7.92, 8.33, 8.05, 8.67, 8.4, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ELIPE MOUNIKA', '22A81A05E5@sves.org.in', '$2y$10$fHryW15hni.ProPrDQl.AeVMA36OXQaYn5lSGMj1aeO9lKvT9B6G6', 'student', 'CSE', '22A81A05E5', '9963129370', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.11, 9.08, 9.08, 9.22, 9.02, 9.3, 9.3, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANNI MAHITHA LAKSHMI', '22A81A05E6@sves.org.in', '$2y$10$GOwrATqK1/K9XZ5KCHzpku9PqUAV8sIeAkJfMBrdCOK8T.5fRwKlK', 'student', 'CSE', '22A81A05E6', '8179542429', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.12, 9.15, 9.08, 9.29, 9.02, 9.44, 9.3, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GARAKA SNEHA LATHA', '22A81A05E7@sves.org.in', '$2y$10$RSJXA7v4J/aalVFf3RVR9.1306dO3d0D4HSxESYw8HaJWmd8CqRnC', 'student', 'CSE', '22A81A05E7', '9502048286', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.12, 9.54, 8.77, 9.06, 8.88, 9.44, 9.3, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOLUGURI AYYAPPA SRI SAI REDDY', '22A81A05E8@sves.org.in', '$2y$10$IG.5DkT0c69pEfEznexXr./ghS8fvYcRK5HIOD0LvORiAABoyJxya', 'student', 'CSE', '22A81A05E8', '9701539868', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.78, 8.31, 7.31, 8.04, 7.0, 8.05, 8.02, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUBBALA VENKATA VARSHINI', '22A81A05E9@sves.org.in', '$2y$10$u314MvRsDDUbGu0DQ6AtxOkDDLqhQIURxLcSJFwSRrxM/j4K2N1WW', 'student', 'CSE', '22A81A05E9', '9912778655', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 9.54, 8.92, 8.98, 8.88, 9.02, 8.79, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUNJI MADHU BABU', '22A81A05F1@sves.org.in', '$2y$10$oIGy2iyCsZ0tFpXyfNxeT.dm/3i70ojt98A.SPrxbJnkJg7WnATdG', 'student', 'CSE', '22A81A05F1', '8074440534', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.55, 8.0, 6.31, 8.16, 7.63, 7.77, 7.56, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('INDUKURI MEGHASINDHU', '22A81A05F3@sves.org.in', '$2y$10$.tYZalXkLU6uQ81t07Rgk.99NNLlwozj.RK73RVZeiKvh1dVL1.2i', 'student', 'CSE', '22A81A05F3', '6302032121', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.03, 9.54, 9.23, 8.86, 9.02, 9.02, 9.35, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOPPULA PAAVANI VENKATA SAI', '22A81A05F4@sves.org.in', '$2y$10$Ku.lja.mxlfwzz4V6jck9.PMMx6H6DWtDU2IvNIFijcj2urQ4nqqW', 'student', 'CSE', '22A81A05F4', '8331872336', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.96, 9.23, 9.23, 8.71, 8.74, 8.95, 9.3, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANDIKATLA DHARANI', '22A81A05F5@sves.org.in', '$2y$10$aB9aagL8euldaDb1LN.EKetmghi1y1k7bB/PVIBejVHhpaWNpUNRy', 'student', 'CSE', '22A81A05F5', '8143914511', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.57, 8.08, 7.38, 8.51, 8.67, 9.09, 9.44, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARRI ANJANI NAGA KOTESWARI', '22A81A05F6@sves.org.in', '$2y$10$Dm30lzjmp1hwxhsEI4bYpOrUm47rVtlCWLcIYu89gUxhGRDpaf00O', 'student', 'CSE', '22A81A05F6', '6301837306', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.66, 9.23, 8.31, 8.59, 8.33, 8.88, 9.02, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARRI SAI GOWRY VIKAS REDDY', '22A81A05F7@sves.org.in', '$2y$10$UJA3KNrO3wfcVOeD8mPt0.9c8f9.9Ckw/0JTIzlrEXHKqhK6Mk5sO', 'student', 'CSE', '22A81A05F7', '9908059846', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.01, 9.0, 8.38, 9.1, 9.16, 9.44, 9.21, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KASINIKOTA VENKAT', '22A81A05F8@sves.org.in', '$2y$10$SJUPLCIBQxsjqoKIQlPFQetxWe7Odxjg4.knFSOqy.kSPtKo6k6YK', 'student', 'CSE', '22A81A05F8', '8374788644', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.42, 7.77, 6.77, 7.88, 7.07, 7.56, 7.53, 7.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KATTA JAYA DURGA PEDDI LAKSHMI', '22A81A05F9@sves.org.in', '$2y$10$/W3t0q2Mdv9ELtC/rY5pd.bEYlmF5vdZA7UmMZiNFWo4tqAuujXZ6', 'student', 'CSE', '22A81A05F9', '9177076673', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.71, 8.46, 7.85, 8.59, 8.53, 9.44, 9.44, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KATTA PALLAVI DURGA YADAV', '22A81A05G0@sves.org.in', '$2y$10$vDrv6HtwD9nM81HPoAR5aeNwlF9KI0fkcttxPiLguvD7mQDZF3/Ou', 'student', 'CSE', '22A81A05G0', '9493043266', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.28, 9.54, 9.08, 9.41, 9.3, 9.21, 9.72, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOTA NAGA MANJUSHA', '22A81A05G2@sves.org.in', '$2y$10$zjYwo4Yxp/qMMKV5HCllCedl7B6t2AJLdO3jxg1zilyH8IMHxw0Qq', 'student', 'CSE', '22A81A05G2', '7993327777', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.86, 9.0, 8.38, 8.82, 8.74, 9.16, 9.44, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MATTA PRATHYUSHA DHANA LAKSHMI', '22A81A05G3@sves.org.in', '$2y$10$jmky2zo9Tl2LsXq39oz4ZenJS0kxUhiibnssBjz.kSLtXm5L0iPHe', 'student', 'CSE', '22A81A05G3', '9121802399', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.94, 9.0, 8.54, 9.1, 9.02, 9.16, 9.02, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANDAPATI VIJAYA LAKSHMI', '22A81A05G5@sves.org.in', '$2y$10$gyyTR.sECTWbolz/O58kTOFCYqpVQFh2FtDPIQyyquXPjstUzovQW', 'student', 'CSE', '22A81A05G5', '6305442259', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.58, 8.54, 7.31, 8.94, 8.53, 9.16, 9.02, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MAREEDU SAIRAM', '22A81A05G6@sves.org.in', '$2y$10$KWZc7unKxYUosnNVvAyVD.74sduGMCwvn.oEhRb16nXBGYRMHk7cO', 'student', 'CSE', '22A81A05G6', '8501890522', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.58, 9.0, 8.38, 8.59, 8.47, 8.88, 8.67, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOHAMMAD AZMATULLA', '22A81A05G8@sves.org.in', '$2y$10$mzEduOwIFn0RvXHMouvQAOddzmfCcHx5rtiErLMLKSiZ8jRzskexm', 'student', 'CSE', '22A81A05G8', '7569512424', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.63, 9.0, 8.08, 8.71, 8.19, 9.09, 8.88, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOHAMMAD RAHIMUNNISA', '22A81A05G9@sves.org.in', '$2y$10$xRts4gBgLD2QliRA8L4T8e0ta866zAdaTIV7ljculL7Epg6YXzKRW', 'student', 'CSE', '22A81A05G9', '9014022798', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.14, 9.38, 8.15, 8.59, 7.91, 8.02, 7.84, 7.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MUKKU MOHITH', '22A81A05H1@sves.org.in', '$2y$10$sWGATF4/anez7kc5EuK6BugzdMIhUiNCHrYmOfcToVx1BzdBjHCpO', 'student', 'CSE', '22A81A05H1', '9346370710', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.47, 8.85, 8.54, 8.71, 8.19, 8.81, 8.26, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NANDAMURI LOKESH SRI ABHIRAM', '22A81A05H2@sves.org.in', '$2y$10$aV5BvIV1vQI7pkjZwaDQK.pgxErtlL1snlRSCrQ1.XL7/Adv/Jpd2', 'student', 'CSE', '22A81A05H2', '9014953519', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.49, 8.38, 8.23, 8.86, 8.74, 8.95, 8.19, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NERELLA N S VENKATA SIVA SAI RIHITHA', '22A81A05H4@sves.org.in', '$2y$10$clcseIXxs4WzIJ/uV83cNevNnRq0.ur9l9VFoAuW5rzwCvYB4/UW2', 'student', 'CSE', '22A81A05H4', '8790150978', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.31, 9.38, 9.23, 9.41, 9.44, 9.58, 9.44, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALLAPOLU SAI MEGHANA', '22A81A05H5@sves.org.in', '$2y$10$FIivUA6JomgltEAleqx.YugKwUIJhK0gDtzebTtT2GVJc7vmDLBb.', 'student', 'CSE', '22A81A05H5', '9618692300', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.19, 9.15, 8.69, 9.76, 9.16, 9.3, 9.44, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PANTHAGANI SWEETY', '22A81A05H6@sves.org.in', '$2y$10$usTSo8uz.zI7xb5bi36jverZxD.8BoSPS86v1PPg2RRCvgFFVHJYi', 'student', 'CSE', '22A81A05H6', '9063672646', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 8.08, 7.15, 8.24, 8.4, 8.33, 8.09, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PARIMI JNANA SAI', '22A81A05H7@sves.org.in', '$2y$10$/6JqS.hUhop7vxyoZWfxzu9IIhWn/NLh1FoP7GuZFiSu8oJRNZp0C', 'student', 'CSE', '22A81A05H7', '6281815552', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.58, 8.46, 8.31, 9.12, 8.47, 8.6, 8.47, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PAVANI PUNYAMANTHULA', '22A81A05H8@sves.org.in', '$2y$10$j9lkervUY1AW313XGTot4.P7sJNxh5lpNEFxtByYkIMWTRh.S/Qna', 'student', 'CSE', '22A81A05H8', '7569505926', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.3, 9.31, 8.08, 8.94, 7.63, 8.4, 7.98, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PEDAMURTHI KIRANKUMAR', '22A81A05H9@sves.org.in', '$2y$10$Oc0yHVYjt9yy0aij1rLbVuQGe4xcVELBQ12zmB4WpJWXOkP15Vzxe', 'student', 'CSE', '22A81A05H9', '9014268313', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.73, 7.15, 7.31, 7.8, 8.33, 7.67, 7.67, 8.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PRATTI GAYATRI', '22A81A05I2@sves.org.in', '$2y$10$tDK4KMiCxUYUu3cHIc3d0.s5X8rGoBNrGV2BVGneIu7w1ebrrAGwS', 'student', 'CSE', '22A81A05I2', '9390561761', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.58, 8.92, 8.77, 9.06, 8.74, 8.67, 8.09, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAMBHA RASMITHA LEKHA', '22A81A05I6@sves.org.in', '$2y$10$ckC..2IZyB4EfAFQdEZQB.m4EyrF8DDzQ58yYlEPqOFaNDz1V56RS', 'student', 'CSE', '22A81A05I6', '9121487799', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.99, 8.92, 9.23, 8.94, 9.44, 8.74, 8.95, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAPARLA PRASANNA KUMAR', '22A81A05I7@sves.org.in', '$2y$10$IBHBLGWvXzDniLrrAlkE8e6Er9ifvsOAe8BMX94mCHpQ1yg5HG7yK', 'student', 'CSE', '22A81A05I7', '9392693465', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.37, 9.08, 9.23, 9.18, 10.0, 9.58, 9.3, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SAMUDRALA S S N V RANGA DURGA MAHATHI', '22A81A05I9@sves.org.in', '$2y$10$OqvcK4txT/PJ3hrqSnspUOKbJrgVREVllBeB4LrDc1SSmN5rEdoz6', 'student', 'CSE', '22A81A05I9', '8500012222', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.05, 9.08, 8.77, 8.94, 9.3, 9.58, 8.88, 8.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TEKI VIJAYARATNAM', '22A81A05J2@sves.org.in', '$2y$10$HP9awzaGoHC2eqKlXFt3Teai1zNweIXEcJqincaLY5aUV.YLIn2Lm', 'student', 'CSE', '22A81A05J2', '8688132605', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.16, 8.46, 8.0, 8.16, 8.33, 8.19, 7.56, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TUMMALAPALLI MANIKANTA VINAY', '22A81A05J3@sves.org.in', '$2y$10$tMolWAOHbxNLNxo/fFQm3O5M7nuiFp7UAQUunVMJCifsPvHh6ounK', 'student', 'CSE', '22A81A05J3', '9550085889', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.76, 7.31, 7.31, 8.04, 7.91, 7.84, 7.74, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UMMIDI CHAITANYA SURYA SAI DEEPTHI', '22A81A05J4@sves.org.in', '$2y$10$YRcTJwOSfht/ViSkwvC8Y./aWk4AegEbd91P0MKQaGl/RcT6I4b7i', 'student', 'CSE', '22A81A05J4', '8143163882', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.76, 8.77, 8.31, 8.94, 9.02, 9.16, 8.6, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UKKUSURI VENKATA KRISHNA PRASAD', '22A81A05J5@sves.org.in', '$2y$10$Wcgzm/YPEz3k7tsMn9Vt2.vxhzcdu3oJUJ0yBEziGtLqY6NRJtqJ.', 'student', 'CSE', '22A81A05J5', '9705849347', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.47, 7.46, 7.38, 7.27, 7.21, 7.7, 7.49, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YARAMOLU LAKSHMI SADWIKA', '22A81A05J7@sves.org.in', '$2y$10$mfwtpSTd5qTGHXDQO5uWNO3uX8a0plCv1U.GVjz1/ndrgANiySKPC', 'student', 'CSE', '22A81A05J7', '7989968788', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.46, 8.69, 7.85, 8.35, 8.47, 8.6, 8.88, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YERRAGOLLA BHARGAVI', '22A81A05J8@sves.org.in', '$2y$10$ZGEflN7PCTU.YHbFwtGWCeMB8oj6vjfyYW6BxiijX3QzShAxLG552', 'student', 'CSE', '22A81A05J8', '9550223469', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.64, 8.62, 8.31, 8.53, 8.88, 8.74, 9.16, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ALLU ROHINI JNANA PRASOONA', '22A81A05J9@sves.org.in', '$2y$10$UymKmIdT1YQiu2S7Lf1TzuuuneI1A5nH4Dn4W34JGjEgPSDdMANWO', 'student', 'CSE', '22A81A05J9', '9505268966', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.38, 8.15, 7.23, 8.35, 8.23, 8.95, 9.02, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ANDRA TULASI LAKSHMI TANYA', '22A81A05K0@sves.org.in', '$2y$10$3tOM7/yEzLzpvgHnGth0Xu0oX6.h/JaoqZ17.RuP38O6w7BqRSGN2', 'student', 'CSE', '22A81A05K0', '6302601497', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.24, 9.54, 9.62, 8.94, 9.3, 9.02, 9.44, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ACHANTA MADHUR', '22A81A05K1@sves.org.in', '$2y$10$h3co2HdiydiCQmHLnr3iGeK.k2xqZ5FRWxyCZyru9P0Jv7eAXSX.O', 'student', 'CSE', '22A81A05K1', '8712279935', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.37, 9.54, 9.54, 9.29, 9.44, 9.3, 9.16, 9.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ACHYUTHA DURGA YASASWINI', '22A81A05K2@sves.org.in', '$2y$10$2QIjGrgYpydoUOknTckO4uecsxn4G.9rqVvNIEwlZ.FrdcOYc0/C2', 'student', 'CSE', '22A81A05K2', '6301189990', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.3, 9.54, 9.54, 9.18, 9.51, 9.02, 9.3, 9.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ANKADI UDAYA SRI', '22A81A05K3@sves.org.in', '$2y$10$YawqAWYFGwFEQSvn95jaX.67ised4n2NkEnp5yi0EVjgmVUMVqhC2', 'student', 'CSE', '22A81A05K3', '8519817259', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 8.62, 8.08, 7.88, 8.6, 8.47, 9.02, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('APPASANI JYOTHI PRANEETHA', '22A81A05K4@sves.org.in', '$2y$10$g08ehT5x1kpKpRD9I4ewQuTAsQ44o.qRvCsg1HU9h73x2cI.3Imb6', 'student', 'CSE', '22A81A05K4', '7993863539', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 9.38, 8.69, 8.65, 8.74, 9.16, 8.74, 9.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BADAMPUDI SRIYA', '22A81A05K5@sves.org.in', '$2y$10$Y5mDAhAix0DPNFXjx/353uy/fCn4q8xtTaMCWw6zvhfIMyyFexWqa', 'student', 'CSE', '22A81A05K5', '9502182533', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.8, 9.08, 9.08, 8.59, 8.67, 8.65, 9.02, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BANDARU UMA DEVI', '22A81A05K6@sves.org.in', '$2y$10$SMVF01CPzrWM6EGWx6/48u6xlW9ZEGrxQdVL3WduoOfDRdCWHN.ry', 'student', 'CSE', '22A81A05K6', '7075664542', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.54, 8.62, 8.31, 8.18, 8.47, 8.6, 9.16, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BHUSHI BINNU ANURAGH', '22A81A05K9@sves.org.in', '$2y$10$rSpqCmd0.EKq3g1sUZWVXOlMNcSdsGgF0BVaBEPnVp.0Ba6KsLKiG', 'student', 'CSE', '22A81A05K9', '9393397621', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.76, 7.23, 7.0, 7.86, 7.7, 7.98, 8.19, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOKKA KUSUMA SRI', '22A81A05L0@sves.org.in', '$2y$10$efb8KLiLLAdqkMqYWxYJZO07LfLkKe4Sm1u0vhHhld7nHR.7./kyO', 'student', 'CSE', '22A81A05L0', '7207431798', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.14, 9.38, 8.77, 9.18, 9.07, 9.44, 9.16, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BURILA RAMYA', '22A81A05L1@sves.org.in', '$2y$10$IWjnyAH/SwSWNyFEQHv6ZuRoj.ktZI5IEA.kT2Y4Y3M2S02FaM6TO', 'student', 'CSE', '22A81A05L1', '9121553665', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.76, 8.46, 8.0, 9.06, 8.65, 9.02, 9.37, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHINTAPALLI LOKESH', '22A81A05L2@sves.org.in', '$2y$10$7xzRAqXSyrbvaQ6XFkx/AeDVZKXrG8gz69MjpN/McWkNAPt7ZmiQe', 'student', 'CSE', '22A81A05L2', '9908872977', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.19, 9.38, 9.23, 9.53, 9.16, 9.3, 9.16, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DARLA JYOTHSNA', '22A81A05L3@sves.org.in', '$2y$10$uf8pXkUEhVj1b9RZHJ/nberVgJ02gY4cNdB41c4H0CYnwXDYSdl.W', 'student', 'CSE', '22A81A05L3', '9391681988', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 8.08, 8.77, 8.53, 8.42, 8.88, 8.53, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DASU RAJA GOPAL', '22A81A05L5@sves.org.in', '$2y$10$KX8IXlnXeHMIT4PadvQd/.pRmsI3DMZlZLB.uw/Udhe2xkk1n.Gf.', 'student', 'CSE', '22A81A05L5', '7036619772', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.58, 8.0, 6.92, 7.51, 7.56, 7.63, 7.49, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DOPPASANI VENKATESH', '22A81A05L7@sves.org.in', '$2y$10$cvj86Mex4M80mNFPag5dPegHC93kAZOKprK1FL12gmxmOY3.MC4yi', 'student', 'CSE', '22A81A05L7', '9110561475', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.73, 8.0, 7.38, 7.88, 7.56, 7.42, 7.77, 8.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('EERLA PREM CHANDU', '22A81A05L9@sves.org.in', '$2y$10$iAtTbD0SOTLc0ms3Bvnr.eDM6bh41qWGtNkNHY5eUsoFXWePPytOS', 'student', 'CSE', '22A81A05L9', '7093790711', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.77, 7.62, 7.62, 8.45, 7.4, 7.91, 7.84, 7.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GAMINI PAPA RATNA SRI PRAVEENA', '22A81A05M0@sves.org.in', '$2y$10$DTYkDyfcbnE3uJ/99NFXZORzl9J5BcALu9qFIqOaijO6vE83HgKja', 'student', 'CSE', '22A81A05M0', '9963477168', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.93, 9.54, 8.77, 8.59, 8.88, 9.02, 9.02, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUBBALA ANUDEEPIKA', '22A81A05M1@sves.org.in', '$2y$10$cZ5adJT1KW7R28KT2jtex.dwIHK0b8JHSMbrPeWE6bM8fsE33I/Ra', 'student', 'CSE', '22A81A05M1', '9182114749', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.94, 9.77, 8.69, 9.06, 8.65, 8.74, 9.02, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUBBALA SATISH', '22A81A05M2@sves.org.in', '$2y$10$GZHF.VMBYQvxqGs2oeds3OaCmHujh5zvlfRVkv6RNjj6kb0GaExQS', 'student', 'CSE', '22A81A05M2', '7075753498', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.15, 7.85, 8.08, 8.12, 7.95, 8.02, 8.33, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAKARLA SUBHASH', '22A81A05M4@sves.org.in', '$2y$10$dNVTQoGJAJ/KQuEqU1vPq.nk3nHmeOeCYxSxQqj0G570ulEklc3Gi', 'student', 'CSE', '22A81A05M4', '9550583815', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.49, 7.62, 6.92, 7.51, 7.33, 7.56, 7.28, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAVALA DHANUSH GOPI', '22A81A05M6@sves.org.in', '$2y$10$P91y8sU6FIiMXCyh.xAruOUxj8ud.yr4M/fSMY///K49xDckiE0fW', 'student', 'CSE', '22A81A05M6', '6281716735', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.04, 9.31, 9.0, 8.94, 9.16, 9.16, 8.74, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEDEPALLI TRIVENI', '22A81A05N0@sves.org.in', '$2y$10$oGRa262sYyz7pu73QS6CrOkHh5CGgcGjLP5AthRI27EcXf6M0hBg2', 'student', 'CSE', '22A81A05N0', '6305456772', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.78, 9.46, 8.54, 8.82, 8.88, 8.6, 8.74, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MULLAPUDI APARNA', '22A81A05N2@sves.org.in', '$2y$10$iFJhnicpc0yAOAwtcP4VgO13FPOTriPx9LkeSjb0SMIWjTLg92Kp6', 'student', 'CSE', '22A81A05N2', '9885849927', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.92, 9.38, 9.0, 8.82, 8.53, 9.09, 8.6, 9.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAYUDU RATNA SITARA', '22A81A05N4@sves.org.in', '$2y$10$.2Hy1z4t0wHkQoL0vZvxJu.ECdqolg5sweg2XrCo7gRxoXkzdfJpW', 'student', 'CSE', '22A81A05N4', '6303915133', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.75, 8.77, 8.23, 8.71, 8.81, 9.16, 8.6, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('OBHILISETTI DHANUSH', '22A81A05N7@sves.org.in', '$2y$10$kE.A3yMxr.f0bnGULRMwwuYxuM144qfumkyi4lePHWH/K5VvmFMBu', 'student', 'CSE', '22A81A05N7', '9346475931', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 7.38, 6.62, 8.47, 7.98, 8.33, 8.6, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PACHIGOLLA VENKATA SANDEEP', '22A81A05N8@sves.org.in', '$2y$10$6nYvNHyhwo5SqXXUqsB5K.Qkjv9ED9BeqBekgwdM21zVw2yOVAIaG', 'student', 'CSE', '22A81A05N8', '8688213171', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.22, 7.92, 7.54, 8.65, 7.65, 8.47, 8.74, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PADAMATA PURNASAI', '22A81A05N9@sves.org.in', '$2y$10$c2Hn1Z5.OsKS0wOZPayEN.Hc9nS.REwYKwqbY7o4rRwuCsgdj3sFK', 'student', 'CSE', '22A81A05N9', '8919233703', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.31, 8.77, 8.69, 8.07, 8.53, 8.88, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALLI PALLAVI SATYA', '22A81A05O0@sves.org.in', '$2y$10$D51HPEuzVtXqsFDemFrxFOzDoEIgfIFSZkO9ct54FhoqXBmhWRLaK', 'student', 'CSE', '22A81A05O0', '8008101249', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.27, 9.38, 8.92, 9.18, 9.44, 9.44, 9.44, 9.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PEKETI YAJNICA SAI', '22A81A05O1@sves.org.in', '$2y$10$Om4MSGupncOkuE/nq.HPG.oQns3ZAaJOs/KO7wEl21GULMm3IOc06', 'student', 'CSE', '22A81A05O1', '6303050173', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 8.62, 7.85, 8.12, 8.33, 8.6, 8.74, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PILLA MADHAV GANESH', '22A81A05O2@sves.org.in', '$2y$10$ig1LWPRjm2vWtG7THj2lteWgCWOu0lV0xt4.8sUF9j2EAfTj6bNE6', 'student', 'CSE', '22A81A05O2', '8919420562', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.79, 7.85, 6.62, 7.59, 7.47, 8.12, 8.23, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POTNURI CHAITANYA', '22A81A05O4@sves.org.in', '$2y$10$u9ebk1VoawU3jN8HyaLnIOAcNlANcVe4Drvv4L8nHkdyHRd/G160S', 'student', 'CSE', '22A81A05O4', '6305484994', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.59, 8.85, 8.92, 8.71, 8.35, 8.3, 8.47, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PULUGU SAKULJI', '22A81A05O5@sves.org.in', '$2y$10$RReRjZfAZqpvi1oy6kTjH.NCmkpMX3XB3nAGRKg5XQXJ2fhQZrzOy', 'student', 'CSE', '22A81A05O5', '7013567728', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.18, 8.15, 7.77, 8.59, 7.98, 8.19, 8.12, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RACHURI HARISH', '22A81A05O7@sves.org.in', '$2y$10$GPFjllAMVI25nSLYLs3dPuLlVLCRnHbmUEDaaumCew0VFuuhDIhJa', 'student', 'CSE', '22A81A05O7', '9908545726', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.16, 8.54, 7.85, 8.35, 8.16, 7.6, 8.44, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SADA RAMYA', '22A81A05O8@sves.org.in', '$2y$10$VbfS6VeslNF8HhC5VfOJyuiPqqziWC02Y/x9rD3c6lQjmk6IgXqrW', 'student', 'CSE', '22A81A05O8', '9502391167', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.99, 9.08, 8.85, 9.29, 9.02, 9.16, 8.93, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SODIMELLA LAVANYA', '22A81A05P2@sves.org.in', '$2y$10$83.VCBdI/uNNsUuu3IojbuyNfi7YaZyfCofX9gIR.ZYXRgAOAhTUy', 'student', 'CSE', '22A81A05P2', '7013666565', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.55, 8.92, 7.85, 8.53, 8.72, 8.74, 8.6, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TAMARADA RUPA SARASWATHI', '22A81A05P3@sves.org.in', '$2y$10$c0NHhj/kJoJEVCp1XB/cFeEq9dqpLg7o4aDfjdiLfJMdGzoEZmeaa', 'student', 'CSE', '22A81A05P3', '7702678743', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.88, 9.23, 8.46, 8.82, 8.72, 9.37, 8.88, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TANETI RAKESH', '22A81A05P4@sves.org.in', '$2y$10$yljg4hRpzTdHwJSRxoSoUefvHC5NiKcTrY10BG4qRXXCiE5KgNJRi', 'student', 'CSE', '22A81A05P4', '8466858878', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.51, 8.46, 8.46, 8.47, 8.37, 8.74, 8.6, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UKKUSURI SIVA KRISHNA', '22A81A05P6@sves.org.in', '$2y$10$ZNwTpfdzj7YLbECNlIfHx.Opuyz/CNDODe2R7PUsSM1dQNdSHQoLO', 'student', 'CSE', '22A81A05P6', '8374527123', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.16, 8.38, 8.0, 7.92, 7.91, 8.6, 8.23, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UNGARALA LEELA KRISHNA MANIKANTA', '22A81A05P7@sves.org.in', '$2y$10$cTwOZbNeDozkw6WI5D/KJeFSfTWMvGgRyi5c7IGycNc3rH.lDxuSG', 'student', 'CSE', '22A81A05P7', '8074322939', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.2, 8.38, 7.62, 8.59, 8.49, 8.47, 8.12, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VAJHULA JAHNAVI SRIVALLI', '22A81A05P8@sves.org.in', '$2y$10$MucOszagZp1TESTP4PgAEOkRQ.fK1ocbB3TIJQmG.T.KJVlQMniu2', 'student', 'CSE', '22A81A05P8', '6303431118', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.92, 8.54, 7.92, 7.08, 7.74, 8.47, 7.81, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VASA BABY PRANEETHA', '22A81A05P9@sves.org.in', '$2y$10$YW722SaOYhQbGyuyu1m7N./W8JBNeCJJG4S2d1n.HYV2axmgvulhO', 'student', 'CSE', '22A81A05P9', '9032636196', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 8.46, 7.54, 8.06, 7.88, 8.26, 8.3, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VATHUMILLI LAKSHMI SRI SAI GANESH', '22A81A05Q0@sves.org.in', '$2y$10$toAUGmuRtwbNMw6NrfvR/uodJTHSfxeFPaBVknugo85Ncp1vyUfyC', 'student', 'CSE', '22A81A05Q0', '8008149866', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.26, 9.0, 8.23, 8.24, 7.84, 8.47, 8.51, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEERAMALLU HARIKA SRI', '22A81A05Q1@sves.org.in', '$2y$10$7tsFttW5Q.uG7vp9g5xodOT4ZuguS2aGzgFB7WzOr1KD4J0qr2vBO', 'student', 'CSE', '22A81A05Q1', '8125627996', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.83, 8.38, 7.38, 7.94, 7.4, 8.02, 7.98, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEGIREDDY GAGAN VAISHNAV TEJ', '22A81A05Q2@sves.org.in', '$2y$10$4TA6hYUF3d1NvGkoFxdhVOXtcnGNb7oDA66uD8dCu53Y5c6HP3K7y', 'student', 'CSE', '22A81A05Q2', '9347974737', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.64, 9.0, 8.69, 8.78, 8.67, 8.88, 8.47, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YANDAMURI LIKHITA SAI', '22A81A05Q4@sves.org.in', '$2y$10$vDCyxcDLHPVLneyL2FDR4eHlUUKQ0jAVlZqjElYj9wSQKOV3WMUcW', 'student', 'CSE', '22A81A05Q4', '8074607919', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.88, 9.54, 8.54, 8.71, 9.07, 9.23, 9.02, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BURADA DAAKSHINYA', '23A85A0501@sves.org.in', '$2y$10$PQAkes05vKAFKuzhlZaYvOymLwOqacgonWsVdYn.e7Ofj1aUw/E/e', 'student', 'CSE', '23A85A0501', '8639436070', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.48, 0.0, 0.0, 8.47, 8.6, 8.51, 8.6, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANDI GEETHA SRILAKSHMI', '23A85A0502@sves.org.in', '$2y$10$ivuczATv2QAYWL7c/oCbZOM7W2yo6SFaUtvzWEos2j0eDEHieFoEO', 'student', 'CSE', '23A85A0502', '9000278936', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.01, 0.0, 0.0, 9.18, 8.88, 8.86, 9.58, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAICHARLA VANI ISWARYA', '23A85A0503@sves.org.in', '$2y$10$.0Jqj19x.9iblFSKG5sbKOZx8GbxWW8RM3msLONuLAwv/QoNNXnzy', 'student', 'CSE', '23A85A0503', '9391232049', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.01, 0.0, 0.0, 8.82, 8.95, 9.16, 9.3, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAMMILI MANOJ VAMSI', '23A85A0504@sves.org.in', '$2y$10$1UT.wobrcaHxAbN0ohb9z.oVy0dzc0vK5G4ftI/mPWYO6KfmmS/ui', 'student', 'CSE', '23A85A0504', '9398049662', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.39, 0.0, 0.0, 8.59, 8.26, 8.72, 8.3, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAMIREDDY NAVANEETH', '23A85A0508@sves.org.in', '$2y$10$QFBM6DTNk9OaJ9fYCubMsezQZ1/NNJ83100vkDOH3DRlJJ4PhzKea', 'student', 'CSE', '23A85A0508', '8074489477', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.02, 0.0, 0.0, 7.88, 7.98, 8.09, 8.4, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANCHARLA SRI NAGA SURYA SATYA SAI HEMANTH', '23A85A0509@sves.org.in', '$2y$10$Goj2ZBlB1Cmy8pX6opXApOpgupyAqStqOD4kW13JlgFcp5MjWloVS', 'student', 'CSE', '23A85A0509', '9618293059', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.52, 0.0, 0.0, 7.35, 7.35, 7.74, 7.56, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YERRA LALITHA', '23A85A0513@sves.org.in', '$2y$10$lXlHVB9N04mImSXWvimHnOCtTKNPV6jcb2VCWngHO9AxHU2xUy5ga', 'student', 'CSE', '23A85A0513', '9392996091', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.78, 0.0, 0.0, 7.71, 7.49, 7.47, 7.91, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AGARTHI VENKATA RAMANA', '23A85A0514@sves.org.in', '$2y$10$17x05y3n4alkY/0IUZ4exOKlCTrZqvJMz4vTpvoyopK3DjRKC2tg2', 'student', 'CSE', '23A85A0514', '8686645005', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 0.0, 0.0, 7.98, 7.63, 8.12, 8.37, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHERUKU VEERA VENKATA DURGA LAKSHMI', '23A85A0515@sves.org.in', '$2y$10$oGELogRjQ/w9Q85RBguQh.4hzMWJA2t89plUhuaJOyeEfm8yJaPAW', 'student', 'CSE', '23A85A0515', '6300209727', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 0.0, 0.0, 7.47, 7.35, 8.26, 8.19, 8.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DWARAMPUDI SAI PAVAN MANIKANTAN REDDY', '23A85A0516@sves.org.in', '$2y$10$dhLMOiAkhgdLN7hzBCDiDO04/2hz5lSGBN4qX6sTmOdfgvdgn/A.a', 'student', 'CSE', '23A85A0516', '9014786685', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.42, 0.0, 0.0, 7.27, 7.42, 7.12, 6.91, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SOMA AMRUTHA VARSHINI', '23A85A0518@sves.org.in', '$2y$10$WBAaWFCG8ifreViMIq9v4.2DEcuc01zaEeNqnWTxFuttLe7MKbxZ6', 'student', 'CSE', '23A85A0518', '9390697594', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.41, 0.0, 0.0, 8.18, 8.26, 8.47, 8.53, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ABBABATHULA SIRISHA', '23A85A0520@sves.org.in', '$2y$10$SLhfA4pOj2iEYAnMcjU80O28S1P66mWF.dIYE63Ee4Q8AroCzO4Iq', 'student', 'CSE', '23A85A0520', '9391955329', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.04, 0.0, 0.0, 7.59, 7.77, 8.19, 8.23, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DODDA BHAVANA VAISHNAVI', '23A85A0522@sves.org.in', '$2y$10$affGxIb06LyDR87L1X9F0u8E7/xgcW3B8I6UOfJ8BMumIh0kVW7aS', 'student', 'CSE', '23A85A0522', '9908002569', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.44, 0.0, 0.0, 8.24, 8.14, 8.53, 8.51, 8.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ELIGANTI BALA KRISHNA', '23A85A0523@sves.org.in', '$2y$10$1giN6GHR/2TQNRWWOV8x.u9sUgD0vXw0OlHIXHecH.TzN9UjKsvPC', 'student', 'CSE', '23A85A0523', '8978819688', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.82, 0.0, 0.0, 8.04, 7.3, 8.05, 7.74, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NEELAM UMA VENKATA NAGA RAJU', '23A85A0525@sves.org.in', '$2y$10$98GZw85vdVbKAT7otUikIuyhbiETTquYTSc5mNABJoFBHUk.Og9aW', 'student', 'CSE', '23A85A0525', '9392511479', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.68, 0.0, 0.0, 7.88, 7.12, 7.0, 7.81, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AJAY VARDHAN BALINA', '22A81A0401@sves.org.in', '$2y$10$2uCNHlosnHRhxd/w4e8MheKal2ay4Wht.aiFPt5fPXFs4e2270YGu', 'student', 'ECE', '22A81A0401', '9849966697', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.39, 8.54, 8.38, 8.33, 8.12, 8.65, 8.4, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AMJURI SOWMYA SRI', '22A81A0403@sves.org.in', '$2y$10$QDSvd7pswTtL7/l9N93eTeBDHnPTjoM9JX8ybY24ILbfdZ7nH2.OK', 'student', 'ECE', '22A81A0403', '9492920461', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.16, 8.46, 8.54, 7.94, 7.56, 8.65, 8.09, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BANDUCHODE SHANVITH SAI', '22A81A0404@sves.org.in', '$2y$10$bHpmowLCVwEbDWFc3Gl9ZeUFz2G4ujD/cDH/W4wpjlDLQrnWyHsW2', 'student', 'ECE', '22A81A0404', '7013227750', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.59, 8.15, 7.77, 8.1, 7.35, 8.09, 7.49, 6.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOMMA LEELA SRI SINDHU', '22A81A0406@sves.org.in', '$2y$10$tOwh3AZEyFkhv7A9PkfBgec5e4Vc0TDInIHySKjttLtS3jKR0WMuO', 'student', 'ECE', '22A81A0406', '7995889161', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.84, 8.54, 8.08, 7.63, 7.42, 7.88, 7.81, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BORRA RAMANJALI', '22A81A0407@sves.org.in', '$2y$10$jTaXnJoApxK0P1RqEorX2ur9FxvpuAxpWXUPUXAaHxE1X.whLRGTi', 'student', 'ECE', '22A81A0407', '8179474231', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.94, 9.46, 8.85, 8.43, 8.88, 9.44, 9.02, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BURUGUPALLI SINDHU', '22A81A0408@sves.org.in', '$2y$10$dUy15ZckzKu.nIiSeNpuKeWMuhiwoNXtQEnlA6gadX7BpoybUUqO.', 'student', 'ECE', '22A81A0408', '9346418624', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.03, 8.62, 7.69, 7.82, 8.05, 8.23, 8.09, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHITROJU YASASWINI KEERTHI', '22A81A0411@sves.org.in', '$2y$10$lTtHt9ww77ONrtADVBjbw.KBOmQLbNiwBGY8RrqtIriq2PcfGTCFG', 'student', 'ECE', '22A81A0411', '9885465529', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.38, 7.46, 7.62, 7.27, 7.42, 7.74, 7.28, 6.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('EPI THANISHKA', '22A81A0417@sves.org.in', '$2y$10$3xDNWTvzhSMqhTuKBn/.7.we1sQXT/.KMyYVb0jKquPTQ.37Zbmbi', 'student', 'ECE', '22A81A0417', '9133922748', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.02, 8.31, 8.15, 7.63, 7.42, 8.74, 8.47, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANDROTHU BHAVANI', '22A81A0418@sves.org.in', '$2y$10$.oJhep1TZQu0yTeM1GNw/.8RgT7LEzrfOEXLSViqIZ0Pg5Lf9yC6q', 'student', 'ECE', '22A81A0418', '9121475339', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.64, 7.38, 8.31, 7.18, 7.35, 8.12, 7.63, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KATAM DINESH ROY', '22A81A0426@sves.org.in', '$2y$10$Iqc5DUFSqHg.5Z/PEVaOWO2zSCz/IrpPipQduaO1F135KByee3862', 'student', 'ECE', '22A81A0426', '7331136079', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.96, 8.23, 7.77, 7.47, 8.26, 8.16, 7.77, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KESANAKURTHI SANTHI', '22A81A0427@sves.org.in', '$2y$10$5JwYNL0L3.tkFMATIsVYKesTj0EAv3vIVWFVB4xqaHdjq5Z/5yLe2', 'student', 'ECE', '22A81A0427', '8790986182', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 8.92, 8.92, 8.49, 7.98, 8.81, 8.67, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANIKIREDDY SATISH', '22A81A0436@sves.org.in', '$2y$10$0r969SL7MamyL04wKSNZbewmmWCn0iSx2YcRN7Y5tBEWvZ2lQ./AW', 'student', 'ECE', '22A81A0436', '6301007676', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 7.69, 8.46, 8.06, 7.88, 8.81, 7.91, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALAM SATHVIKA', '22A81A0441@sves.org.in', '$2y$10$Jhx1ZFIpIqR3JHxG1QfNM.zwnPX9c7Jr8U2rxrEpyjfpsN5yKcuhe', 'student', 'ECE', '22A81A0441', '6304062936', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.64, 8.08, 7.85, 7.27, 7.77, 7.77, 7.77, 7.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NUNNA V N P L MEGHAMALA', '22A81A0442@sves.org.in', '$2y$10$6Fd8YfxRNBjrOMsCpudEGehKcQj0ofJsc3.MltfMw8t3Y/vldpFGe', 'student', 'ECE', '22A81A0442', '9866141504', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.8, 8.92, 9.23, 8.71, 8.47, 9.44, 8.88, 8.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PAKALAPATI MOUNIKA LAKSHMI', '22A81A0443@sves.org.in', '$2y$10$HtcioHGwcjsmrNX.KfYh1uN.2zxvdBfX9tA/TLrgmJGzlUybyrKOi', 'student', 'ECE', '22A81A0443', '9346422248', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.47, 8.23, 7.92, 7.06, 7.28, 7.67, 7.77, 6.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POLISETTY MOUNICA SURYA DURGA NAGA SREE', '22A81A0447@sves.org.in', '$2y$10$pDnKPJ2mVLEjQqlTH0ryp.XpOziolrxXVgY.fYCSid9Zxjcl4fA5y', 'student', 'ECE', '22A81A0447', '8247523131', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.4, 8.54, 8.69, 8.33, 8.53, 8.74, 8.65, 7.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RATNALA PAPA', '22A81A0449@sves.org.in', '$2y$10$zDJnpsoDyvX5t29FOHO39uCPckvtwW.krTfFVv5p1r1GZ7ihkYJHK', 'student', 'ECE', '22A81A0449', '7569509557', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.06, 9.38, 9.54, 9.12, 8.95, 8.95, 9.09, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ROHITHA YERRA', '22A81A0451@sves.org.in', '$2y$10$5I8J937frPKHzZXWvs5sMe4Ego4/vYUMTZdUQvKsLiH2CcDhdEMj2', 'student', 'ECE', '22A81A0451', '7286970144', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.7, 9.15, 9.15, 8.61, 8.74, 8.74, 8.53, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SHAIK RAJIYA', '22A81A0453@sves.org.in', '$2y$10$po2JdrUebPqyj4eRamPfjeYjKLZRFcaXcpT51gMeqitPXC21jTXX6', 'student', 'ECE', '22A81A0453', '8374324633', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.69, 9.0, 9.38, 9.06, 8.05, 8.6, 8.86, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TULA DEEPIKA', '22A81A0457@sves.org.in', '$2y$10$bkv.7Y5w0G7X.rpA2aUbz.7ETQj5OSpGfgwQechRnksnavsdt9936', 'student', 'ECE', '22A81A0457', '8074277119', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.33, 7.31, 7.38, 7.04, 6.98, 8.19, 7.95, 6.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VAMISETTI DHANESH', '22A81A0461@sves.org.in', '$2y$10$Pa7Or5iqSqf3NuADGkqxTObfeWoBZu90wfmD4abO3zUQWbDb8m82y', 'student', 'ECE', '22A81A0461', '7794058703', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.74, 7.54, 8.0, 7.53, 7.26, 8.33, 7.98, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YADADA VARSHINI', '22A81A0464@sves.org.in', '$2y$10$NuKYtU24cbOTHWkuG9YeI.aqDviO5NUTvWiuv1.Oc2kt9OvuBEtl.', 'student', 'ECE', '22A81A0464', '9391939425', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.61, 8.77, 8.62, 8.35, 8.47, 9.23, 8.67, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AKASAPU KALYANI', '22A81A0467@sves.org.in', '$2y$10$3zea6VSzoCGk4f0Rgl1kEunzVYKNSTBqgmRWLqMQmHR63Go5oOb3.', 'student', 'ECE', '22A81A0467', '7287851677', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.78, 9.08, 8.85, 8.94, 8.51, 9.02, 9.3, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BELLANI BALA GOWTHAMI', '22A81A0471@sves.org.in', '$2y$10$Bxsn4mH7mtiQImGXoNlzye5xsf7XyOPZb7PzmpgUL3CC2BhVrDgj2', 'student', 'ECE', '22A81A0471', '9542328541', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 8.38, 9.0, 7.8, 7.81, 8.72, 8.16, 6.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHEKURI JAGADEESH VARMA', '22A81A0474@sves.org.in', '$2y$10$.s0KGiSkv/niLBj8DErlEuKatZ2Ezieakny.CDtU5Kv/k4QuZPMna', 'student', 'ECE', '22A81A0474', '8688775567', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.59, 8.46, 8.0, 7.55, 6.86, 8.05, 7.67, 6.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DIDDE AJAY KUMAR', '22A81A0477@sves.org.in', '$2y$10$uXx5LYKR9oONgRzGaeOf9eiNK197A7JxvnjAwfaq/AVyPp3Zmcv1q', 'student', 'ECE', '22A81A0477', '8688753586', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.45, 9.15, 9.0, 8.45, 7.91, 8.74, 8.33, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ELIPE JYOTHIRMAYEE SNEHALATHA', '22A81A0478@sves.org.in', '$2y$10$PvAbQKr.H6hqN/g04OV91.aiyh5ebP1RApDtOjQNy0Aei7D0g89ye', 'student', 'ECE', '22A81A0478', '9441994077', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.26, 8.92, 8.08, 8.47, 8.33, 8.4, 8.3, 7.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GAJJANA GEETANJALI', '22A81A0479@sves.org.in', '$2y$10$O.1KWIqz2SemS1OnGvzXw.GuDMWhqi0EJ8OE.xDfvRv7lWlZ6VtIi', 'student', 'ECE', '22A81A0479', '6305064354', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.83, 9.23, 8.77, 8.88, 8.37, 9.44, 9.09, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANAPAVARAPU ANUSHA', '22A81A0480@sves.org.in', '$2y$10$bHkNt3cOsIJK7Nr/m7sFyepohz/k8.RO8Q8iN.ToL9647M9JJCic6', 'student', 'ECE', '22A81A0480', '6281271123', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.47, 7.77, 7.38, 7.18, 7.47, 8.19, 7.33, 7.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GAYATHRI UNNAMATLA', '22A81A0482@sves.org.in', '$2y$10$mmkVHnz6btcUbHz5brmjheCSpcRqbeDzUfMnfWK.0iEYdIUdA3QnW', 'student', 'ECE', '22A81A0482', '8008853136', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 8.69, 8.92, 8.98, 8.88, 9.28, 9.3, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GIDDA LAHARI', '22A81A0483@sves.org.in', '$2y$10$6Jts69WB1lT5I1ANg.VhaOmDxZZC7DR2rHVwKe/qWAfrFeYLsRSQu', 'student', 'ECE', '22A81A0483', '6304188234', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.99, 7.69, 8.92, 7.76, 7.42, 8.12, 8.51, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GORLI SRIKANTH', '22A81A0484@sves.org.in', '$2y$10$0DaTcsBLBoRaPtkJDT0pk.dbYwX3tTdX603hLFKCA6VujgvR6SYAO', 'student', 'ECE', '22A81A0484', '8247455874', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.3, 8.92, 8.46, 8.8, 7.67, 8.79, 8.02, 7.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('INDALA SRINIVAS', '22A81A0486@sves.org.in', '$2y$10$U3foPD9XaIOd024MQCBVx.GNyKaX95NM1m0EY9o2PfxihhZGOMefm', 'student', 'ECE', '22A81A0486', '9346525595', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.96, 9.08, 8.38, 8.06, 7.49, 7.88, 7.95, 7.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JADDU YAMUNA NAGA DEEPTHI', '22A81A0487@sves.org.in', '$2y$10$NIRXLZKrA/hgVA69j42TQONu1YQPRtANmuIfm9wQlOqMgrc9GM//G', 'student', 'ECE', '22A81A0487', '7396317003', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.71, 8.69, 9.23, 8.9, 8.51, 9.09, 8.53, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KALAGARA ESWARI VENKATA DEEPIKA', '22A81A0488@sves.org.in', '$2y$10$ms4/ZQmUYe/GAFG8HsR3c.H6ibtoIf5hphKPTpL1W2Zbp3P4hB4fG', 'student', 'ECE', '22A81A0488', '6304834930', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 7.85, 7.38, 7.67, 8.6, 8.4, 8.3, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KADALI UDAY KIRAN', '22A81A0489@sves.org.in', '$2y$10$4fIpcWsH3CVFhu2nOBA.X.jzGwyCjuN9iZP0E2KU53PdjCW7QLEtW', 'student', 'ECE', '22A81A0489', '8074553625', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.21, 9.23, 8.85, 7.96, 7.84, 8.4, 8.12, 7.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KATTUNGA PAVAN SAI', '22A81A0492@sves.org.in', '$2y$10$fEq.tx79hMVc.VlE1IrylOVKQErO7Vve4HrnKUDC7KvNI7QrTW9eG', 'student', 'ECE', '22A81A0492', '9346860273', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.17, 8.38, 7.77, 7.98, 7.95, 8.51, 8.09, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOKKIRIPATI SAILAJA', '22A81A0493@sves.org.in', '$2y$10$76K78K32ECx0Ya2bPkbDDOvw.RTyGe2dWuJcWQoaiEDpct7673gxS', 'student', 'ECE', '22A81A0493', '9059736089', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 9.15, 8.46, 8.33, 8.4, 8.67, 8.44, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOTTADA SANDEEP', '22A81A0496@sves.org.in', '$2y$10$9fdHWN/CiXDi4VIMvWpMjuAVU1ZzwFDWv.ZhH/Fo1lKW5ZQhuD8vm', 'student', 'ECE', '22A81A0496', '9908060957', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.89, 8.23, 7.69, 7.76, 7.74, 8.33, 7.67, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOVVURI SIRI', '22A81A0498@sves.org.in', '$2y$10$683sOvKXwFOELIUsOj4H3exIm1VJPeBFAUPguABDIRlEwgdpTyNzW', 'student', 'ECE', '22A81A0498', '9493756499', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.18, 8.62, 7.92, 8.18, 8.19, 8.53, 8.3, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANCHINA PURUSHOTTAM SAI SANKAR', '22A81A0499@sves.org.in', '$2y$10$yl9G0qj3iJMv814MNNBnJuChnnXdFKsVGjtdVIHVeBcGpqEOsOhjG', 'student', 'ECE', '22A81A0499', '9121479234', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.28, 8.15, 6.85, 7.43, 7.19, 7.6, 7.26, 6.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MALLIPUDI SIVA KRISHNAMA RAJU', '22A81A04A2@sves.org.in', '$2y$10$usEnNQOlVcgLwawPeuHCVOzcWyuKgCcgbCv/6RtOvDhNvI7AFOFtO', 'student', 'ECE', '22A81A04A2', '9391357807', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 6.91, 7.92, 7.23, 6.76, 6.7, 7.12, 6.77, 6.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANDELA VYSHNAVI DEVI', '22A81A04A3@sves.org.in', '$2y$10$tbcyXS2/6SU34vK2awx8cuDv1xYREmKzbp3dPOOjTPh4OWaRsLorq', 'student', 'ECE', '22A81A04A3', '9502453119', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.63, 8.92, 8.23, 8.57, 8.53, 8.86, 8.88, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALLAMILLI LEHYA SRI VENKATA HARSHITHA', '22A81A04A6@sves.org.in', '$2y$10$NpDA7joa6SV3AH53k8HYO.dTxJKNBPO2AstixuZhN3kcS8Crc3Ucy', 'student', 'ECE', '22A81A04A6', '8688225119', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.03, 8.77, 7.92, 8.1, 7.56, 8.44, 8.44, 7.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NANDYALA BHASKARA SATYA SAI VARMA', '22A81A04A7@sves.org.in', '$2y$10$12sQMbYgwLhleItqOVWoHOLB4XODW4eR/R7eRIGsRe.hBG2dEny9a', 'student', 'ECE', '22A81A04A7', '9493268458', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.24, 8.69, 8.85, 8.35, 7.81, 8.6, 7.67, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PASUPULETI KUSUMA NAGA SAI SAHITI', '22A81A04A8@sves.org.in', '$2y$10$0bdWDq4RwqZs5GFPX7qpJ.Bp1tKQtUHcgs6y/qZNs6Bh4Qkbpwkwi', 'student', 'ECE', '22A81A04A8', '9392538374', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.54, 8.85, 8.69, 8.94, 8.37, 9.02, 8.33, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALLI ESWAR SUBHASH', '22A81A04B1@sves.org.in', '$2y$10$zt/BTe1aH5Q1p/2cpJCyWOrswKudZvQi5rPZJ8ApxX8e.9ld9uGxy', 'student', 'ECE', '22A81A04B1', '9502622477', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.25, 7.77, 7.46, 6.88, 7.12, 7.63, 6.98, 7.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PASUPULETI KUSUMA SATYA SAI JYOTHI', '22A81A04B3@sves.org.in', '$2y$10$j0x6ga0h4J5IywBD3awGYuHHP4KeQ0.Rgdsb.ZVeLovJuED2yNLVm', 'student', 'ECE', '22A81A04B3', '9000746151', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.91, 8.15, 8.0, 8.22, 8.16, 7.74, 7.47, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PATTAPU YASASWI', '22A81A04B4@sves.org.in', '$2y$10$4UwKBQXrHcr.iRerS27QuuDkNWi5pDmjO0pHQ31Hj6jwLtytAeHoW', 'student', 'ECE', '22A81A04B4', '8019672368', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.29, 8.31, 8.62, 8.06, 8.33, 8.95, 8.16, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PENNADA SINDHU', '22A81A04B5@sves.org.in', '$2y$10$oze4tglz.SUscM/n0/08ou3jhaUhXiIhbZXVbEaD3wBhjH1uBIF0S', 'student', 'ECE', '22A81A04B5', '9014621288', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.47, 8.54, 8.46, 8.51, 8.6, 8.81, 8.44, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POLUMATI SHANTHI PRIYA', '22A81A04B7@sves.org.in', '$2y$10$lqkaz8D2FXP/9wOG9zsobe7weiGgpV2sVVRZj31LJfK642OeLkZDS', 'student', 'ECE', '22A81A04B7', '7032609863', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.78, 8.54, 7.38, 7.59, 7.33, 7.95, 8.23, 7.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PONNADA LEELA VENKATESH', '22A81A04B8@sves.org.in', '$2y$10$MZH60Q8aW/mOwTuBev8CeunlP4LfCBv2Qh08in5YSXBN8/aTmIuPq', 'student', 'ECE', '22A81A04B8', '9392746816', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.31, 7.77, 6.92, 7.27, 7.12, 7.7, 7.33, 7.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POTHUREDDYPALLI LAVANYA', '22A81A04C0@sves.org.in', '$2y$10$6UASCRxhCqqOQP/DM4WiAuPKGkSuryFv2Q0/Ceo8btH7U3UTBdr/W', 'student', 'ECE', '22A81A04C0', '9392745610', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 8.77, 8.69, 7.94, 7.7, 8.26, 7.74, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAYI MAHESH SURYA', '22A81A04C2@sves.org.in', '$2y$10$gK5XVYVDlYKx.Mui0CUNUuehgjkRcb6uqIvT1crisgwVz8yTk1pt.', 'student', 'ECE', '22A81A04C2', '8374111134', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.79, 8.15, 8.08, 7.65, 7.56, 7.88, 7.67, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SATTI MADHU SUDHANA REDDY', '22A81A04C4@sves.org.in', '$2y$10$pOjzUWlrzNF5S58H7xGOWOlfK0S70Iqb2GpRM5LEF/3ec2uHepDd2', 'student', 'ECE', '22A81A04C4', '7382287989', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.78, 9.38, 9.23, 8.9, 8.37, 8.88, 8.6, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SUNKAVALLI SUSMITHA', '22A81A04C7@sves.org.in', '$2y$10$2flUEwxD9zpa7GuZeG0azOdWhE4KLPZvp2lxAdwccyxmGA4SgjdEW', 'student', 'ECE', '22A81A04C7', '9390630155', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.69, 8.77, 8.86, 8.19, 8.65, 8.53, 8.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UNDAVALLI LAVANYA', '22A81A04C9@sves.org.in', '$2y$10$drgWlZwZwtU7iA9tIo9SYOZ02MQ7nbfw7z3WbqXL/ZQVSHDuUjNBq', 'student', 'ECE', '22A81A04C9', '6301860398', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.26, 8.54, 8.62, 7.94, 8.05, 8.65, 8.4, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UPPALA MANASA LAKSHMI', '22A81A04D0@sves.org.in', '$2y$10$nVESMWOYFVDsCsF9.imZMOa6DAh.u8dvP2bDgsRBpKgC63WmKTy2i', 'student', 'ECE', '22A81A04D0', '9346385909', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.36, 8.85, 8.92, 8.14, 8.26, 8.4, 8.33, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BATCHA HEMANTH', '22A81A04D7@sves.org.in', '$2y$10$2JW.VbnQOU7qCq1yCSEleegOIS300vQwX5vIxtvTknXbyp39QOYqq', 'student', 'ECE', '22A81A04D7', '9392033204', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.97, 7.92, 8.23, 8.1, 7.98, 8.53, 7.74, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOKKA SAI MOULIKA', '22A81A04D9@sves.org.in', '$2y$10$rprTnJlGFfNqYBNGsjX8tO2OPOJhsVbWFPS.AQh/R5G4F13ExrWQ.', 'student', 'ECE', '22A81A04D9', '8328201279', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.28, 7.54, 6.92, 7.57, 7.19, 7.74, 7.26, 6.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOLLIPO AMMULU', '22A81A04E0@sves.org.in', '$2y$10$njyrb3ApkcnIMxI19E9lm.ri2R1oFzPUhZ5MFcwLnIdP0bUL5I3C2', 'student', 'ECE', '22A81A04E0', '8977434605', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.85, 8.85, 8.38, 9.06, 8.88, 9.3, 9.02, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BORA ASHOK', '22A81A04E1@sves.org.in', '$2y$10$fXQKoEBkOnt4VF8rHby10egvGW.1dUGS49p6NztnT88Ixa5VkBbpS', 'student', 'ECE', '22A81A04E1', '8247640537', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.42, 7.38, 7.38, 7.75, 7.14, 7.95, 6.91, 7.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHILAKA TIRUMALA BHASKAR', '22A81A04E4@sves.org.in', '$2y$10$9UZ/ZxTbSHQRAttnKCG7keixKS5MGbfeg6rAdt.N/SzDVUXtI.H56', 'student', 'ECE', '22A81A04E4', '6281683818', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.39, 7.08, 7.38, 7.49, 6.91, 8.02, 7.74, 7.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DARABOENA UMA SATYA KUMARI', '22A81A04E5@sves.org.in', '$2y$10$we1RN1pU7E9fKBaQb.66Lu6nHmIe.s6/3oWRy.Yr03bj037gKNStW', 'student', 'ECE', '22A81A04E5', '8688175988', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.62, 9.23, 8.62, 8.78, 8.12, 8.81, 9.02, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('EDUPALLI HEMA', '22A81A04E7@sves.org.in', '$2y$10$es2yr3OnVdN34BdqXBwh8OfF93Ivuxiv2YeMjv1JQ1tSLsfFjC3IS', 'student', 'ECE', '22A81A04E7', '7815859148', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.89, 9.23, 9.62, 9.18, 8.33, 9.02, 8.88, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GADI SUSHMA', '22A81A04E8@sves.org.in', '$2y$10$6ZghkHHVxb9/WLtb.lAGJ.3R5p/ZfJjZyL2/gpOgLUEIQNPTEzYUW', 'student', 'ECE', '22A81A04E8', '7032942353', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.33, 8.62, 7.69, 8.57, 7.6, 9.09, 8.74, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANTA MANIKANTA VENKATA SATYA GANESH', '22A81A04E9@sves.org.in', '$2y$10$DnUbKBEoFPE3HJa3Q4bmn.X8ybW7nl9ksXYlT60xs2OzjXBCjkO6q', 'student', 'ECE', '22A81A04E9', '7893791378', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.84, 7.92, 8.0, 7.86, 7.19, 8.02, 8.16, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOLLAPALLI AISHWARYA', '22A81A04F0@sves.org.in', '$2y$10$AtGxPuO.G.qruKlPX957VunnyqYis7gQWU2/yKr2NGtYs93oOoGkq', 'student', 'ECE', '22A81A04F0', '9346762049', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.92, 8.23, 7.54, 7.55, 7.53, 8.44, 8.19, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUBBALA YAMINI', '22A81A04F1@sves.org.in', '$2y$10$Fz7QCisg.kJHuBfN3Zu8mOErshnriBsyVyyESZyga3fBOPgy/u5cG', 'student', 'ECE', '22A81A04F1', '9502624264', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 7.77, 7.69, 7.94, 7.47, 8.72, 8.67, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUDALA GANESH', '22A81A04F2@sves.org.in', '$2y$10$JdcIXE7LVx5njBWt7g/wz.BhE3cWKu6fAJlS7O0oYicgX.RDIjtfi', 'student', 'ECE', '22A81A04F2', '9951699635', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 9.0, 8.77, 8.59, 8.19, 9.16, 8.53, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUNDAY SUKUMAR', '22A81A04F4@sves.org.in', '$2y$10$OCaddbCT5KE8rIVlyDM/1.lN.DmCQzPef69b.c8ytKNXUgnaoDaoi', 'student', 'ECE', '22A81A04F4', '8688780887', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 9.23, 8.54, 8.35, 8.05, 8.47, 7.91, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARANAM SANTHA KUMARI', '22A81A04F6@sves.org.in', '$2y$10$oc8PqcP96Dg0jcCakmfyeOJ/xVGz4gC85wcImWsDxxRBErAP1uW.a', 'student', 'ECE', '22A81A04F6', '7093776366', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.28, 9.23, 8.77, 7.9, 7.33, 8.47, 8.6, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KATAM LILLY GRACE', '22A81A04F8@sves.org.in', '$2y$10$qpN/a0OIokgyn0FARxJPOuea9lmacJNMPmvDq4iyGTBBzTJg4YvLq', 'student', 'ECE', '22A81A04F8', '8247751755', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.2, 8.31, 8.46, 8.39, 7.49, 8.67, 8.12, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KATTUNGA LASYA SREE', '22A81A04F9@sves.org.in', '$2y$10$sQ8MALNsIlUqySMGw49BQe0fc2LBnpbjY2daxzHbopo05mbtDMsW2', 'student', 'ECE', '22A81A04F9', '9014517749', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.79, 9.46, 8.54, 8.71, 8.23, 9.16, 8.74, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOMMURI UMA DEVI', '22A81A04G1@sves.org.in', '$2y$10$J3fOmo.a8t0rI7FpJ4sVV.QPDcS3Jbnfp7qH2DE9A2a89DPXJ9krG', 'student', 'ECE', '22A81A04G1', '7093156913', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.38, 8.77, 8.46, 8.02, 7.81, 8.81, 8.58, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KONDROTHU CHANDRASHEKHAR', '22A81A04G3@sves.org.in', '$2y$10$iF0WFW8AlLDNWn1XI8ezMu3gmzhv8DMTFOB84Ru2mrEst.1C0RthC', 'student', 'ECE', '22A81A04G3', '9391040510', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.55, 8.69, 8.92, 8.49, 8.6, 9.3, 8.19, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOTIPALLI IKYATA', '22A81A04G5@sves.org.in', '$2y$10$Mjaqhw8.k9CwKzkiF7jk4.Is786JHxWcWiBjx05xLZyh3eBsZnVhS', 'student', 'ECE', '22A81A04G5', '8121226375', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 9.23, 8.85, 8.33, 7.49, 8.53, 8.47, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MATURI R S S BHASKARA GUPTA', '22A81A04G6@sves.org.in', '$2y$10$tcW7WvvYr.9Xyb/NHJzMo.Mxqnfjb1IGP/IXNOVyqBq.SzIQEkvL6', 'student', 'ECE', '22A81A04G6', '9398193636', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.13, 8.38, 8.69, 7.8, 7.42, 8.26, 8.33, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADDIPATI DEVI PRASANNA', '22A81A04G7@sves.org.in', '$2y$10$lqkQl3RpjV.gqqOt60KRQewMj8WqZt5JtpFh4nNTCTjRGdLzzYRbq', 'student', 'ECE', '22A81A04G7', '6303036303', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.36, 8.92, 8.08, 8.29, 7.19, 9.14, 8.88, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MAMIDI KIRANMAYI', '22A81A04G8@sves.org.in', '$2y$10$B5cuQcCRgC1qeMkjfi8KneF481cZuhmI4gAuW1dildqxKwaRAf5yq', 'student', 'ECE', '22A81A04G8', '9492579433', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 8.69, 8.46, 8.31, 7.98, 8.67, 8.81, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANNEM SAI GOPI', '22A81A04G9@sves.org.in', '$2y$10$OOnFJ.kasW8Zdlamu2XrkucTyodPMJAbRDPEAF4vyiZ65KS7HH2UC', 'student', 'ECE', '22A81A04G9', '6304104836', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 8.31, 8.08, 7.8, 7.98, 8.16, 8.33, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALLAMILLI SRI MAHALAKSHMI', '22A81A04H4@sves.org.in', '$2y$10$xlC/DATXHifhBJwPkmQ0uO07lMLN0iCDD7b0UeMO9zEtyc5Dt2R8C', 'student', 'ECE', '22A81A04H4', '8500456827', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.32, 8.85, 8.08, 7.92, 8.19, 8.95, 8.67, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PYDIKONDALA SUSHMA', '22A81A04H9@sves.org.in', '$2y$10$rRQi2rf5co0/YFUpJh0an.ozzqjEl2zar7ltgnAp.JqWEiQyTEqd6', 'student', 'ECE', '22A81A04H9', '7780296635', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.01, 8.62, 8.54, 7.86, 7.56, 8.67, 7.98, 7.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RANGISETTI KARTHIK', '22A81A04I0@sves.org.in', '$2y$10$Ea3sTPZzkKx.zUTbSkDu/.PfnlBIsHqAuuAMCCtx9tVkP..wA53mq', 'student', 'ECE', '22A81A04I0', '7799228593', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.75, 8.15, 7.92, 7.57, 6.91, 7.77, 7.98, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SANKU SWATHI', '22A81A04I2@sves.org.in', '$2y$10$z9ap0tOBsJcQSqzZRZcxf.A3/TZUziN95mtswPGt9tAJZ0NJ0qSy.', 'student', 'ECE', '22A81A04I2', '9182866711', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.07, 9.08, 8.38, 8.25, 7.47, 8.19, 7.98, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UNDRAJAVARAPU VALLIKA', '22A81A04I4@sves.org.in', '$2y$10$zGCDySxgLCXDZLdXWwA61e7swJxuzuXOuLRoFXZ2rH7/GDPkzETCO', 'student', 'ECE', '22A81A04I4', '7780427917', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.72, 8.0, 6.85, 7.53, 7.47, 8.53, 7.91, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VADAPALLI JOHNDAVID', '22A81A04I5@sves.org.in', '$2y$10$YlhpRq1x/CEaQL/.yWcU1eTWsZBGToDW.UrcDVY8XhcZSQLvRaHMq', 'student', 'ECE', '22A81A04I5', '9392225365', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.74, 9.69, 8.85, 8.98, 8.4, 9.16, 8.23, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VATTIKUTI SATYA PUJASRI', '22A81A04I7@sves.org.in', '$2y$10$NDyOc3OI0SvfA1ToTgO0..9BsDIe9DCmkE1Y89hmS.TH9ILojx2T.', 'student', 'ECE', '22A81A04I7', '7386740744', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.38, 8.85, 8.54, 8.43, 7.98, 8.81, 8.12, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VELAGANA VARA SINGA LAKSHMI', '22A81A04I8@sves.org.in', '$2y$10$/ej2AoHYaq5XqlRRIzLQTOJrhAhnxfflj6vGbYTzhaOyH51XSO2Qa', 'student', 'ECE', '22A81A04I8', '9989152327', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 9.23, 8.23, 8.02, 7.98, 8.81, 8.53, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YANDAMURI HIMA ESWAR', '22A81A04I9@sves.org.in', '$2y$10$IczKUwkuXNVjUIIUGNHq6urdqjztgQ/oRL4jAqEkmENds464go.pS', 'student', 'ECE', '22A81A04I9', '9705365085', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.66, 9.15, 8.46, 9.14, 7.7, 9.3, 8.51, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHAVAKULA DUMBESH', '23A85A0403@sves.org.in', '$2y$10$QdSnbl1gUP2J.Qbguee.4e9ECxCCKDer.pFxtq9FnKKkpje81stPi', 'student', 'ECE', '23A85A0403', '9502606788', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 0.0, 0.0, 8.2, 8.12, 8.6, 8.19, 7.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GRANDHI MOHAN KUMAR', '23A85A0406@sves.org.in', '$2y$10$H6vPumini9EFY7cEZuE1xeCCPwLGHnnDp9MNOYAKVMVwC3.Kn1qZG', 'student', 'ECE', '23A85A0406', '7207276683', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.78, 0.0, 0.0, 8.65, 9.02, 9.44, 8.74, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PITANI SAPTAGIRI', '23A85A0407@sves.org.in', '$2y$10$j8hbQztCBh67t4YLu6KNOOfaM0HNsemG1XFGQF8Rk4padfHUhqvN6', 'student', 'ECE', '23A85A0407', '7893055149', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 0.0, 0.0, 8.02, 7.7, 9.16, 8.4, 7.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SATTI HEMANTH SRI ADHINARAYANA REDDY', '23A85A0408@sves.org.in', '$2y$10$8ALR1vtfuViOseZo/IE1KuHM6MTfzObDUtIJfHlRA0kHjFJos4G5u', 'student', 'ECE', '23A85A0408', '9347299578', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.82, 0.0, 0.0, 7.47, 7.63, 8.3, 8.12, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SEEPANI PAVAN KARTHIK', '23A85A0409@sves.org.in', '$2y$10$E3KRuziNc5FYUTkMweHvjesYYk6OQB8pCM61oHJwaICAIUhqNfbPi', 'student', 'ECE', '23A85A0409', '9247442925', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 0.0, 0.0, 8.29, 8.47, 9.02, 8.33, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('IRAPU NAVYA SREE', '23A85A0411@sves.org.in', '$2y$10$38IenKZIUReDyk//VvWfgu6rR0YvsFyue024QvsZQu1ahkxZXzBei', 'student', 'ECE', '23A85A0411', '9490424676', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.65, 0.0, 0.0, 7.53, 7.4, 8.44, 7.67, 7.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAIDU HARIKA SRI', '23A85A0412@sves.org.in', '$2y$10$Jb209j467cBEt7o2pdn/LuoIh7b1WYiaAOo.vc38XYTgCKDZBU2i.', 'student', 'ECE', '23A85A0412', '9392519363', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.89, 0.0, 0.0, 7.86, 7.95, 8.81, 7.74, 7.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PASUPULETI UMA DURGA NAVYA SRI', '23A85A0413@sves.org.in', '$2y$10$bW76f/A67EAvm8Z17JKLvOXdGdDYnTUf0dB7W1n1j7B0KodBHnfcu', 'student', 'ECE', '23A85A0413', '9346880519', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.32, 0.0, 0.0, 8.33, 8.09, 9.02, 8.58, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PATHURI ANJALI', '23A85A0414@sves.org.in', '$2y$10$J3dsYiE6GOgsUiK2lWXwO.ehDqJZ6QfOFdcfDRohA563hQ2RkG/hm', 'student', 'ECE', '23A85A0414', '9391742802', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.81, 0.0, 0.0, 8.06, 7.42, 8.33, 7.95, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VARI HEMA SRI DURGA', '23A85A0415@sves.org.in', '$2y$10$rEUW98gkPD9SgsvlNbtt9u3/iuOIb5kpaOc5MXPVFd.BT6FvrRBky', 'student', 'ECE', '23A85A0415', '8688369521', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 0.0, 0.0, 8.0, 7.81, 9.02, 8.3, 6.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOKKA RAJESH', '23A85A0416@sves.org.in', '$2y$10$bepl92f7w7V6KM295xq5qew9XbiDA2MWWkEsfGj8X/GwbkuXoDROS', 'student', 'ECE', '23A85A0416', '7989425043', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.27, 0.0, 0.0, 8.47, 8.12, 8.81, 8.47, 7.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GADI PAVAN MANIKANTA KUMAR', '23A85A0418@sves.org.in', '$2y$10$cYBqLMcEhhpJArfNHwiHWuR7FQ0/dSMQx/yYQXW/lE0459QP7WYnC', 'student', 'ECE', '23A85A0418', '7995113027', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.3, 0.0, 0.0, 8.37, 8.33, 8.67, 8.26, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUTTA JYOTHIKA', '23A85A0419@sves.org.in', '$2y$10$BQqGiHY6/L8xmozH1gpNc.aQzq/7q.8lW73K0iqgsbu89t3O9seZS', 'student', 'ECE', '23A85A0419', '9381852551', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.86, 0.0, 0.0, 7.47, 7.53, 8.51, 8.12, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('LOKAVARAPU VISHNU VARDHAN', '23A85A0420@sves.org.in', '$2y$10$wdPKFhycODObHVD3nl7vR.pjez02ug.0UJftPu/jU/R8.uMWZN33S', 'student', 'ECE', '23A85A0420', '9381093539', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.57, 0.0, 0.0, 8.75, 8.47, 8.88, 8.53, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MAGANTI ANITHA', '23A85A0421@sves.org.in', '$2y$10$C07m1qLM4EzU9axl8Swa5.nCXksxXvrJ95mfJQLBtqfm5msPnSyia', 'student', 'ECE', '23A85A0421', '7416956352', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.86, 0.0, 0.0, 7.39, 7.07, 8.74, 8.19, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MAMILLAPALLI LOKESH', '23A85A0422@sves.org.in', '$2y$10$glsMauKc7mti5QMY0yh5JeoywlW8E3c8/iUWTzS0h9TuASxyMaGZu', 'student', 'ECE', '23A85A0422', '7674044571', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.48, 0.0, 0.0, 8.33, 8.65, 8.95, 8.6, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MARADANI LOKESH', '23A85A0423@sves.org.in', '$2y$10$jJC7REs002kjutqNbbGJ2efogwFDkPcuVCDuOlXZ6gqhwAnX/gFLy', 'student', 'ECE', '23A85A0423', '7569939852', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.68, 0.0, 0.0, 7.57, 7.28, 8.3, 8.12, 7.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEESALA LOKESH PAVAN SEETHAYYA NAIDU', '23A85A0424@sves.org.in', '$2y$10$yQPwlRL1vNq8cMlKn5JJaOyd7Nc.s6cb1ZQeVsuLHC0IKTTHAYLvW', 'student', 'ECE', '23A85A0424', '8686965700', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 0.0, 0.0, 8.18, 8.47, 8.74, 8.33, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOTUPALLI SANTHOSH KUMAR', '23A85A0425@sves.org.in', '$2y$10$D8wsZooVEQS9zhSkp8pBb.jTiogprzfbTHA7qMrHILkUZKc/Igj8O', 'student', 'ECE', '23A85A0425', '9866397585', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.81, 0.0, 0.0, 8.08, 7.4, 8.09, 8.4, 7.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ROUTHU VENKATA SAI DURGA', '23A85A0428@sves.org.in', '$2y$10$kWP5X4FQPaCzOptsOrRu1uTbFrOl5I4baAoB9e.wtAq1Osdc0I3Xu', 'student', 'ECE', '23A85A0428', '6301302278', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.89, 0.0, 0.0, 7.57, 7.77, 8.51, 8.26, 7.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SHAIK SAYYAD BAJI', '23A85A0429@sves.org.in', '$2y$10$k/iDqf7coAcJGq3T4RDKJO7eRuXEQ.ydMZFlGwW7C92/csdWf8F26', 'student', 'ECE', '23A85A0429', '9491475673', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.16, 0.0, 0.0, 8.45, 8.05, 8.81, 8.16, 7.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOMMAGANI KRISHNA PAVANI', '22A81A0205@sves.org.in', '$2y$10$uY1sfRcb6s5FY3oI1h92C.tUbUqCpTnnQHOtPxFQIaHFlIIlJIK/y', 'student', 'EEE', '22A81A0205', '7569631892', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.44, 7.62, 6.69, 7.49, 7.07, 7.95, 7.63, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DASARI TRIVYANJALI', '22A81A0208@sves.org.in', '$2y$10$A1OnvA8mC4SeNOmgj/MAwu0O1vFLL78AsWuUvdYt5BN3OOJ1qpcFG', 'student', 'EEE', '22A81A0208', '7842523239', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.25, 8.62, 8.62, 8.29, 7.63, 8.33, 8.33, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DONDAPATI MAHIDHAR', '22A81A0210@sves.org.in', '$2y$10$uwNuW8XmtjYP7UjINvH5veMa5rMzvISRngfZruaF8uQXC2lkbpHPe', 'student', 'EEE', '22A81A0210', '9491898776', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.46, 7.77, 7.62, 7.88, 7.0, 7.47, 7.14, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GADUGOYILA GEETHA SANTHOSHINI', '22A81A0212@sves.org.in', '$2y$10$xXfT0VPV0RzOSG9mMTwpW.WtOP46RUalOzLJw4Hl5arJvmJmPZNQq', 'student', 'EEE', '22A81A0212', '7675059094', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 9.15, 8.46, 7.94, 7.98, 8.79, 8.6, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOLA ANJALI DEVI', '22A81A0219@sves.org.in', '$2y$10$DsxHdpUApM/3Tfe6pQi0tuoPi8FpbhCI9HB4KlV3Bia.T5OiUlY56', 'student', 'EEE', '22A81A0219', '9848804574', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.53, 8.31, 6.77, 7.22, 7.07, 7.86, 7.81, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KURAM MOUNIKA', '22A81A0223@sves.org.in', '$2y$10$1bd7Ct421JG8dT.XxWVMt.2X/.tHrNueTqvymqzCO1PB0s3HV0wLe', 'student', 'EEE', '22A81A0223', '7989589925', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.17, 8.54, 7.69, 8.35, 7.56, 8.16, 8.67, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MACHAGANTI ANUSHA', '22A81A0225@sves.org.in', '$2y$10$kBaKEibANJVylqRjqOh.wuckNeuMeFhgdmPaOD7zqMfdrENdSaC3S', 'student', 'EEE', '22A81A0225', '8977087257', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.61, 8.85, 8.38, 8.53, 8.05, 8.42, 8.93, 9.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PUROHIT KUSHUBU', '22A81A0238@sves.org.in', '$2y$10$ia5bNITjdmbngd6FRSBii.FVuQhE4vIEZteP05igmxD7lYfS.9iRu', 'student', 'EEE', '22A81A0238', '8317619479', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.53, 7.92, 7.08, 7.24, 7.35, 7.51, 7.84, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ROWTHU KUMARI NAGA SAI DHANA LAKSHMI', '22A81A0240@sves.org.in', '$2y$10$Wrp.a4C1NfP3eknE0hCTvOCULkGC0FE3aKysXOnvbDrpfFK0xRt8u', 'student', 'EEE', '22A81A0240', '7794905377', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.64, 7.38, 7.62, 7.39, 6.93, 7.7, 8.4, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AMBATI SHARON KUMAR', '22A81A0246@sves.org.in', '$2y$10$kTej93MsLhaYYvVjstb5ouJyzY.SH3viz8VGZlSDwnW7IWuaxNRuS', 'student', 'EEE', '22A81A0246', '8328168181', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.04, 7.0, 6.62, 6.73, 6.63, 7.63, 7.05, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AVISETTI SAI SATYA SRI', '22A81A0248@sves.org.in', '$2y$10$eWW6UKoAVEUCJb3tFbJzZ.xggvbONpY0s5nVUL2iT/Fm9xUY2lZli', 'student', 'EEE', '22A81A0248', '8008904712', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 8.23, 7.77, 8.47, 7.91, 8.33, 8.88, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BODDU ASRITHA RANGA VAISHNAVI', '22A81A0249@sves.org.in', '$2y$10$CLXyAIeprnD4rJqZiRsL6ODyE6NDptpQDkYZ/Vo3EQyjnKlqbT7Ty', 'student', 'EEE', '22A81A0249', '6305777495', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.41, 8.69, 8.31, 8.16, 7.77, 8.47, 8.74, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOLLA HARISHMA PADMAJA', '22A81A0250@sves.org.in', '$2y$10$lCwwN1FY7kRrCPWonXq04.1Fb0Jr04kXGmSZArEEMey9a1L.BaLu2', 'student', 'EEE', '22A81A0250', '9550696158', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.29, 7.46, 6.92, 7.33, 6.93, 7.35, 7.7, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANCHARLA DINESH', '22A81A0259@sves.org.in', '$2y$10$nZQld7yFILbiS6g4pkdIuecDAdw.j.On7mvxwP03CQnuUDlYUWGkO', 'student', 'EEE', '22A81A0259', '8688926896', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.49, 9.38, 8.62, 7.31, 6.49, 7.14, 6.86, 7.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KODURI HARSHITHA', '22A81A0264@sves.org.in', '$2y$10$Yr6tNei50Z00LP2E.H4BB.Cn7CcAi8DdeZUj8nFWUvyzIPB.EpcxC', 'student', 'EEE', '22A81A0264', '6305312585', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.78, 8.08, 7.38, 7.43, 7.49, 7.77, 8.12, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOLLEPARA VASAVI RATNA SRILEKHA', '22A81A0265@sves.org.in', '$2y$10$U96U2OFw2QJaTm.sXofrr.C.VBdRlsJ4KyZZ4SA7DaAghNaC9BmJO', 'student', 'EEE', '22A81A0265', '9949973741', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.56, 8.69, 8.31, 8.35, 8.12, 8.6, 9.02, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOTTALA PAVAN KUMAR', '22A81A0267@sves.org.in', '$2y$10$rP9gTTeqsXmajJO8A9K8c.B8Kglbocz9.HL03kc1IaQtTFvRKYbJy', 'student', 'EEE', '22A81A0267', '9100878904', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.64, 8.69, 7.92, 7.47, 7.21, 7.07, 7.49, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MALLABATHULA PAVANI', '22A81A0271@sves.org.in', '$2y$10$i8E3/X7FpKZx2fJ5fmrk.e56lUO9DYhjae/oKjm80YryLs01Jj0em', 'student', 'EEE', '22A81A0271', '9121645169', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.85, 7.77, 7.31, 7.76, 7.7, 7.91, 7.98, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('METLA UDAYKIRAN', '22A81A0273@sves.org.in', '$2y$10$LfUJSUe7j37v0xKNH95dp.w4VbVrO.c8D1/LvamIPtKT31Zo2zTyq', 'student', 'EEE', '22A81A0273', '8639620930', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.95, 9.31, 8.62, 8.22, 7.49, 7.42, 7.07, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MIRIYALA BOBBY', '22A81A0274@sves.org.in', '$2y$10$3YlGTAPOJuPNc5DLx6nzIOn1Nd/M4axcjAiMTX7QXluNl2VpGJFyC', 'student', 'EEE', '22A81A0274', '9676010869', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.8, 8.62, 7.62, 7.45, 6.86, 7.56, 8.4, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NULI VASAVI NAGA SRI VARSHINI', '22A81A0276@sves.org.in', '$2y$10$l8BtwcCQjAz2FPOlxfRNAem27Yus1IifCJiGcqei1mJ0I3Q00/W8K', 'student', 'EEE', '22A81A0276', '7396671393', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.61, 8.62, 8.38, 8.69, 8.19, 8.6, 8.88, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POLINATI BINDU SRI', '22A81A0278@sves.org.in', '$2y$10$wRio.dClF4kWRV32kDllJ.ILNeA1l6P2rAO8srpVGvkGZTPLNc6RG', 'student', 'EEE', '22A81A0278', '7013553595', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.58, 8.77, 8.0, 8.49, 8.33, 8.47, 9.02, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RATALA VIRAJALA MEENA KUMARI', '22A81A0283@sves.org.in', '$2y$10$wcfUuo2fhAOoqNxWcZoF0OrCsXkMIJp/ILMhtQ6j5zeXtB9BO47sq', 'student', 'EEE', '22A81A0283', '9392372260', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.29, 8.15, 8.62, 8.35, 7.77, 7.77, 8.65, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAGU PUJITHA', '22A81A0284@sves.org.in', '$2y$10$yjf3r.suxkv7y0WaPiySQe1Z11tEBGgc4fFUoSz8maeYFBPvBDzji', 'student', 'EEE', '22A81A0284', '9392857046', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.86, 8.0, 7.23, 7.76, 7.35, 8.05, 8.12, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VALLEPALLI PAVAN KUMAR', '22A81A0287@sves.org.in', '$2y$10$DddJ/MUJggkYEn0LQBhkQOfwTukMgK4znfLnsThSX4P121YUm09Ju', 'student', 'EEE', '22A81A0287', '9392623327', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.59, 7.69, 7.08, 7.84, 7.0, 7.84, 7.72, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BANDILA LEELA VINODINI', '23A85A0201@sves.org.in', '$2y$10$YLYtjIMWyrTi0o2wxzSZ5.w6a8dcm5mVeRq0dcHmZyalMzJmg/kVC', 'student', 'EEE', '23A85A0201', '8121696433', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.18, 0.0, 0.0, 8.0, 8.05, 8.37, 8.67, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANDULA GOVARDHAN', '23A85A0204@sves.org.in', '$2y$10$v8jAm6BoyW4r2IuY6g5Z0O8FO2SwpuGo7SBAiuqImIgx3YxzuGEsa', 'student', 'EEE', '23A85A0204', '9063378454', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 0.0, 0.0, 7.84, 7.56, 8.3, 8.6, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOLUPURI SANTHOSHA KUMARI', '23A85A0213@sves.org.in', '$2y$10$uulvC7Y8RrrRl7bPEP/AiuJQ7lv.uKgj98hggby0On7WlqNee8GYC', 'student', 'EEE', '23A85A0213', '7095482993', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.16, 0.0, 0.0, 8.1, 7.91, 8.19, 8.23, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MARISETTI MOHAN SATYA MANIDEEP', '23A85A0215@sves.org.in', '$2y$10$YgcllIqzh5h2x8uhN1uCCuMTS142b3X8.5ab26ym5criHvr7uIKyO', 'student', 'EEE', '23A85A0215', '6304348087', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.14, 0.0, 0.0, 8.0, 8.05, 7.84, 8.67, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TELU KRISHNA PAVAN', '23A85A0216@sves.org.in', '$2y$10$PkIC8CYhUZV4Rz3Y7ZjHt.SBmhgj4Esc3A7p7u6tKgXLZzyZzkzzq', 'student', 'EEE', '23A85A0216', '8309966933', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.86, 0.0, 0.0, 7.76, 7.35, 7.91, 8.95, 7.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TIRUMALAREDDY NAVYA SRI', '23A85A0217@sves.org.in', '$2y$10$m/FjxSrCx4TGXQ36/hH1Q.KIwpMOQ8HBj3x9sPf32gfd9Gu1azoVy', 'student', 'EEE', '23A85A0217', '6301448855', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.51, 0.0, 0.0, 8.22, 8.05, 8.6, 9.02, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VAMISETTI DHARMENDRA SIVA SAI', '23A85A0218@sves.org.in', '$2y$10$4MCwPgHGWjyA3Rd/8ffl4upKZaGiMWrmh2Veuv.xV94AAdNyv.ID.', 'student', 'EEE', '23A85A0218', '9490670706', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 0.0, 0.0, 7.82, 7.77, 7.98, 8.16, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADAPA KIRAN KUMAR', '22A81A0301@sves.org.in', '$2y$10$Lk8lZpz/scd6DfdLyXI2A.ZWjFRXp6mjmMHATqXXc9lxi5ETudM96', 'student', 'ME', '22A81A0301', '6303126759', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 6.91, 7.0, 6.62, 6.65, 6.56, 7.09, 7.56, 6.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADDAGARLA VENKATESH', '22A81A0302@sves.org.in', '$2y$10$OUhbgko8bjvzBAuVcxYzsuAElOSCQsVQuO2zUKbaOZrVY9qzls5yS', 'student', 'ME', '22A81A0302', '7995358981', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 8.92, 8.08, 8.29, 8.26, 8.56, 8.88, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BANDULA DEVENDRA', '22A81A0306@sves.org.in', '$2y$10$7URuCPtUcEnAdwJdTuyxF.zsz9p0zv4CS2pSDUgzfQSY7WJEbkQBe', 'student', 'ME', '22A81A0306', '9666606135', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.37, 7.85, 7.38, 7.06, 7.23, 7.91, 7.07, 7.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHELLAMSETTI T V V N SAI PAVAN GANESH', '22A81A0309@sves.org.in', '$2y$10$UyJxRPSuElLPwggxh8s4M.UXIObHbdaldT.YTp84rnqbh7NQo1pWK', 'student', 'ME', '22A81A0309', '9907983333', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.62, 8.85, 7.38, 7.47, 7.4, 7.65, 7.6, 7.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANTEDA PRAVEEN KUMAR', '22A81A0316@sves.org.in', '$2y$10$OUECjTANB5GNaK14zXfJuuiv/HlMm.uYSV4diNaoP6fWYdfvXd7fK', 'student', 'ME', '22A81A0316', '7780416830', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.45, 9.08, 8.69, 8.41, 8.42, 8.47, 8.74, 7.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GATTIM SRI NAGA AYYAPPA', '22A81A0318@sves.org.in', '$2y$10$tc78cpLADVQXS04tGVokUOxCfBsM9AihTo/6uGyzyACuRUGxSh06W', 'student', 'ME', '22A81A0318', '9959382191', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.51, 7.23, 7.62, 7.18, 7.56, 7.84, 7.84, 7.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOPISETTI ANANTH LAKSHMI KUMAR', '22A81A0320@sves.org.in', '$2y$10$39ajvOD.Nnw6vdv7v6I9guAyNA5hTDwYhfE8kJXZJt2omp0UsLJQe', 'student', 'ME', '22A81A0320', '7013470235', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.09, 9.38, 9.69, 8.82, 9.23, 9.3, 8.88, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARRI ROHITH REDDY', '22A81A0326@sves.org.in', '$2y$10$S0s2JDELFFkA6E8ueP4Hne2QuU7qtMxA/H1ohbRyO0tC3c9cOXCCm', 'student', 'ME', '22A81A0326', '9959157018', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.54, 7.92, 7.38, 7.12, 7.47, 7.19, 8.3, 7.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KODURI PHANI VENKATA KUMAR', '22A81A0329@sves.org.in', '$2y$10$vTXCDM3X1Zlri18e8t676eHE.UHOaqb.s0O18kJJ3R/YGq7o.CA3K', 'student', 'ME', '22A81A0329', '9014387928', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.33, 9.0, 8.08, 7.88, 8.26, 8.53, 8.44, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALAKALURI TARUN KUMAR', '22A81A0347@sves.org.in', '$2y$10$3hBCMO/rBMIXjDppjSBeMutFqYKNXtjgIVo51dITn0qVcqLP6ppnS', 'student', 'ME', '22A81A0347', '9705865237', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.12, 6.92, 6.85, 6.96, 7.19, 7.35, 7.33, 7.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PYDIMUKKULA PULLA RAO', '22A81A0353@sves.org.in', '$2y$10$D4B2i09BSzbzsnCJvbK9v.ayGuHny6RKn.dLdUDZ93oRbva7KssL2', 'student', 'ME', '22A81A0353', '9618720497', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.33, 7.08, 7.0, 7.65, 7.19, 7.35, 7.74, 7.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SARIDE VIGNESWARA RAO', '22A81A0355@sves.org.in', '$2y$10$eaxrJPq4YRLvq3lkCjjw5ete9eVxzRf60CUYZNgRN0DMxNMdcETaS', 'student', 'ME', '22A81A0355', '9182268681', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.71, 9.08, 8.46, 8.59, 8.6, 9.14, 8.88, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('THORAM RAMA LAKSHMAN', '22A81A0360@sves.org.in', '$2y$10$blO7ME8BVJqSn2iEG7FcqOYQ4.hFXEx5.pDOfQtYmegw061FC5yxa', 'student', 'ME', '22A81A0360', '9676808216', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.95, 7.54, 7.15, 7.73, 8.09, 8.4, 8.67, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YADLAPALLI SRI SAI VENKATA DURGA ESWAR', '23A85A0303@sves.org.in', '$2y$10$QNy0N9c8ApZIM3R7WH9JZ.I/SkRdRwIQvRsneUbyGhOi0At7fNiNK', 'student', 'ME', '23A85A0303', '6305769980', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.45, 0.0, 0.0, 7.25, 7.6, 7.26, 7.91, 7.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHIKKA SOHAN SATYA VARDHAN', '23A85A0304@sves.org.in', '$2y$10$dGaCC6ASxk/RZZXXJzv03uWRLmNjJRl1f0fTPX5.6bSRywRXbqEOO', 'student', 'ME', '23A85A0304', '9701565312', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 0.0, 0.0, 8.18, 8.23, 8.44, 8.12, 7.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHIKKALA VIJAYA KUMAR', '23A85A0305@sves.org.in', '$2y$10$vyP3Zlupa3V4IjkIvKByduFQf66vDOloecUb1/AAC0R85bRiC2M4u', 'student', 'ME', '23A85A0305', '7893744131', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.15, 0.0, 0.0, 8.88, 8.79, 9.7, 9.3, 9.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GARIKIPATI CHANDU', '23A85A0307@sves.org.in', '$2y$10$abtvOdd.aLXZ4vKZGZhc0uWkU84SOhGIUUPA4SR8Ozx7OEacrQxKS', 'student', 'ME', '23A85A0307', '8185092634', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.83, 0.0, 0.0, 8.61, 8.86, 8.58, 9.07, 9.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOLLAMANDALA KRUPAKAR', '23A85A0308@sves.org.in', '$2y$10$f06ilP/DO91o5q3zBk1XO.RQlN9lXOMPKeoWV/tLsjASE3cGx8tBu', 'student', 'ME', '23A85A0308', '9121532016', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.31, 0.0, 0.0, 7.49, 7.33, 7.49, 7.4, 6.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEERAMALLA MANIKANTA SAI DURGA NARAYANA', '23A85A0310@sves.org.in', '$2y$10$tI7gE8M3/1AjgzG.ZKeUbOTxPk6M5SQfC0.eb3jUl2/bOD2eHSB8q', 'student', 'ME', '23A85A0310', '9392101094', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.16, 0.0, 0.0, 6.73, 6.77, 7.67, 7.49, 7.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUNDA SATYANARAYANA', '23A85A0311@sves.org.in', '$2y$10$ETV971e61dzLDHW23uzJhON9VIQhSdYfHVFGF9ozTgynlY9HW5oNO', 'student', 'ME', '23A85A0311', '6301751110', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.8, 0.0, 0.0, 7.43, 7.74, 7.98, 8.4, 7.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JAGALINKI HEMA SURYA VARDHAN', '23A85A0312@sves.org.in', '$2y$10$m/SUTpPwlhTfc5nLLVB5Uugy2.5aVX.vC9wzevgRokK4G8xfwA3Zq', 'student', 'ME', '23A85A0312', '9390886869', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.44, 0.0, 0.0, 8.41, 8.47, 9.07, 8.74, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JALADHANI SRAVYA DURGA', '23A85A0313@sves.org.in', '$2y$10$XMSORp0y6IM4lbB8CLru7OI/qMbHffTX2jpt5m76d/Na4fhCxi72m', 'student', 'ME', '23A85A0313', '9573578309', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.51, 0.0, 0.0, 8.35, 8.81, 8.79, 8.79, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KATTA DURGA PRASAD', '23A85A0314@sves.org.in', '$2y$10$KZO5aTFdlDzcNpGhrZtAGuShHs1YBZ3WDyWjn3bVlJN9w4AknP0dK', 'student', 'ME', '23A85A0314', '7286947147', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.17, 0.0, 0.0, 7.24, 7.14, 7.74, 6.7, 7.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADDIRALA ABHIRAM', '23A85A0315@sves.org.in', '$2y$10$URvgecXMqysUYI5/p4DMaOPeJ9.FYcxy1L/ZcGynJgVET2jdChlPu', 'student', 'ME', '23A85A0315', '9391672823', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 6.83, 0.0, 0.0, 6.84, 7.12, 6.84, 6.7, 6.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MUNTA L V V S SUBRAHMANYAM', '23A85A0316@sves.org.in', '$2y$10$hKEbfv.IBrU.54b0dCFBC.iy6D.E0Rf6u0U8j0WVGRxmMccy.1pmi', 'student', 'ME', '23A85A0316', '9390417117', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.06, 0.0, 0.0, 8.18, 7.77, 9.28, 8.51, 6.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NUTANGI SANTHOSH', '23A85A0317@sves.org.in', '$2y$10$HsWOgfKvk9s3LnEnpVQUIORaekE0rGCkI1AFdDON9bapAvIPCEkk.', 'student', 'ME', '23A85A0317', '6281906246', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.51, 0.0, 0.0, 7.08, 7.23, 7.74, 7.98, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NUTANGI SYAM BABU', '23A85A0318@sves.org.in', '$2y$10$Btb8RIMvW0nDwE620vR56.vHDsZif0KjFkBd87.0bnwkNA1XJQkiW', 'student', 'ME', '23A85A0318', '8519829419', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.25, 0.0, 0.0, 7.25, 6.95, 6.77, 7.63, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UBA RAVINDRA BABU', '23A85A0320@sves.org.in', '$2y$10$t6r1KKBGSG0gakBgYPjPhe25VsX3IJtX/WcEu20X0vNZM9Z1ue4NS', 'student', 'ME', '23A85A0320', '9676939873', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.28, 0.0, 0.0, 7.35, 7.3, 7.65, 6.7, 7.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADAPA JNANA CHANDRIKA', '22A81A0601@sves.org.in', '$2y$10$TdVF8u2IgYOrMFfbNvBitOlroNYBFxWTRBzN8ZmBWHbyqJaMexi4u', 'student', 'CST', '22A81A0601', '8639602234', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.94, 9.0, 7.92, 8.94, 9.16, 9.3, 9.44, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AKULA HARI SREE', '22A81A0602@sves.org.in', '$2y$10$IBbDwGm4y9xhwuynboPoIuCKuMPiL7rLeUciId1DVgh8P9Y4N0XT2', 'student', 'CST', '22A81A0602', '9440132111', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.08, 9.38, 8.54, 9.06, 9.16, 9.72, 9.16, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BANDARU BHARGAVI', '22A81A0604@sves.org.in', '$2y$10$1A5wFQ.9pIM4w6ayn0T6t.G4UCiDweqL6A8PfDCf0riEgr8uAlTxS', 'student', 'CST', '22A81A0604', '9381599420', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.51, 8.62, 8.08, 8.59, 8.88, 8.67, 8.6, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BANGARU MOHAN RAO', '22A81A0605@sves.org.in', '$2y$10$vpqJkQlv4u6V77Tj04W/Q.aS1h2Ln3BqnkJeQ5g31diGPTHce0OC6', 'student', 'CST', '22A81A0605', '7075591109', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 8.31, 7.62, 8.04, 8.16, 8.12, 8.4, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BITRA PRAVALLIKA', '22A81A0606@sves.org.in', '$2y$10$5t4B5R54pScMEdRrd.od/.6pV35qyKBBYgkZUwd2xxHTyN8urcJWS', 'student', 'CST', '22A81A0606', '8688118719', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 8.31, 7.92, 8.24, 8.53, 8.37, 8.88, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHALLA YASASWI', '22A81A0609@sves.org.in', '$2y$10$xY1p3IvLQPRmAFUQuAkxKOrOt96Kr7Gw7q8PsX8nPZSY07FP8MYV6', 'student', 'CST', '22A81A0609', '7702782648', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 9.62, 8.23, 9.06, 8.37, 9.16, 9.3, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DARISI VENKATA LAHARI', '22A81A0611@sves.org.in', '$2y$10$Y66cwe1c4UTbzT8ewf516.OErUMKQjGfQxrrabt.I6mWNecDxBzdK', 'student', 'CST', '22A81A0611', '9390980889', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.09, 9.38, 9.08, 9.1, 9.3, 9.16, 8.47, 9.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DOMMETI L S VASANTHI', '22A81A0613@sves.org.in', '$2y$10$L1oh0U21oZkzltp6IBse9OGQRMYYBRXtg7dRE1xBWvbZ8NRhc2Zdq', 'student', 'CST', '22A81A0613', '9701594369', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.98, 9.31, 8.62, 9.06, 8.88, 9.02, 8.81, 9.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('EDUPALLI LIKHITHA SAI', '22A81A0614@sves.org.in', '$2y$10$GSsXlVD.v7ZUT92Ja0LWc.EDoAnXy0NoPTMbxuuP2CLRrXi3.d3Eq', 'student', 'CST', '22A81A0614', '9346553146', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.74, 9.0, 8.38, 8.71, 8.93, 8.74, 8.74, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANDHARAPU MOUNIKA', '22A81A0615@sves.org.in', '$2y$10$ZZWQ9f/svm8RCddggJ1i1eH9zpURw3.UJDJtJexveHRKMONFEhy0G', 'student', 'CST', '22A81A0615', '9014670724', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.14, 8.46, 7.08, 8.29, 8.23, 8.05, 8.26, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOTHAM SRI NAGA SIRISHA', '22A81A0616@sves.org.in', '$2y$10$Q/rhXsYQ0IYZF3eiWN4G2O7mpclPPbofIrrPNQXwh37EYg8rekeZ6', 'student', 'CST', '22A81A0616', '9642973891', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 8.77, 7.31, 8.51, 7.88, 7.81, 7.77, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JANGA SRINIVASA REDDY', '22A81A0619@sves.org.in', '$2y$10$HMl/9Q9qIoPEJMCP8AnJCubhJLkEJX6oj.vjTamdaryaUGwFR4m46', 'student', 'CST', '22A81A0619', '6300041199', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.52, 9.31, 8.92, 8.35, 8.09, 8.53, 8.19, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KADIMI HARIKA', '22A81A0622@sves.org.in', '$2y$10$EkEpGh.y5jBsmtfbXt8PNu.xJN354SU9vLYluX0zNZRPerQWvwBKq', 'student', 'CST', '22A81A0622', '7207033984', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.04, 9.46, 9.08, 9.22, 8.74, 9.02, 9.16, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAMISETTY TANUJA', '22A81A0623@sves.org.in', '$2y$10$ijoDccI9fxSIw3jFBQ4bMewEKHooD9VVjli87JDRPTJh5x0obC22O', 'student', 'CST', '22A81A0623', '9440443459', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.28, 9.31, 9.23, 9.45, 9.21, 9.44, 9.44, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARELLA PAVANI VINAY KUMAR', '22A81A0624@sves.org.in', '$2y$10$CYdenfU2oy1O958GK8HpKuGL5qHDGkZFcIVjC0NzS8nTI5xBhf1ne', 'student', 'CST', '22A81A0624', '6304397055', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 8.69, 8.69, 8.86, 8.93, 9.02, 9.23, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARPURAM CHARANI', '22A81A0625@sves.org.in', '$2y$10$sZnQaN/gQw2xlCU39aFkd.cHK55p7xYVqGg/0nwosCa/dzPshG/0q', 'student', 'CST', '22A81A0625', '7670995314', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.47, 9.0, 7.69, 8.59, 8.3, 8.74, 8.6, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADICHERLA SHANMUKHA SAI PRAKASH', '22A81A0629@sves.org.in', '$2y$10$ycTSFsPcx2aX0J0e38zIO..P2lu1Mv83stQqV.NdcaDR5GIC7Ya8C', 'student', 'CST', '22A81A0629', '9550985975', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.75, 8.77, 8.54, 8.39, 8.81, 8.74, 9.02, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADIPALLI V VENKATA NAGA SRI MANICHANDANA', '22A81A0630@sves.org.in', '$2y$10$6Yvi/GJxVCIXiqW6jg3hz.byssOJUTP9xmcCqJaoNAkrJ.td3fSGy', 'student', 'CST', '22A81A0630', '9491577669', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.78, 9.08, 8.31, 8.86, 8.88, 8.12, 9.44, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEDIDI PRAVALLIKA', '22A81A0631@sves.org.in', '$2y$10$Tp.GJVI36MjX683Ituv89etlRKTKHDpZOnfDLICusD9ypyZpYsA4K', 'student', 'CST', '22A81A0631', '9063771180', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.71, 9.15, 8.46, 8.94, 8.47, 8.47, 9.02, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEKA MAHESH KIRAN', '22A81A0632@sves.org.in', '$2y$10$pQOfa40879.YLtLctJQC/uSQ8FltDw/KvwdWkAe.ZRbpCx8fznvoO', 'student', 'CST', '22A81A0632', '8919557642', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.02, 8.31, 7.23, 8.24, 7.67, 7.98, 8.12, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOHAMMED HAFEEZA KHAN', '22A81A0633@sves.org.in', '$2y$10$ni0DM1qLHx4YVQ5X.FM68u.ZXJ7pxOWiKhc2FkXHzRNK0lkDsDVXq', 'student', 'CST', '22A81A0633', '6305899256', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.35, 8.08, 6.92, 8.35, 8.51, 8.47, 9.09, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MUTYALU CHAITANYA NAGAVALLI', '22A81A0634@sves.org.in', '$2y$10$r.ZWIEqPjYhesjxDi7BIw.8AXur7ikrUyzKd1tDH6RRax370rIF4a', 'student', 'CST', '22A81A0634', '9100853997', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.99, 9.38, 8.69, 9.18, 9.16, 8.6, 9.23, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAGASURI TULASI SWETHA', '22A81A0635@sves.org.in', '$2y$10$RPgw7VXbWa8EOEiht4M2nO2LKaYGfC2vKcLvxHIMnwMe/M5E30fWq', 'student', 'CST', '22A81A0635', '8247805516', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.83, 9.23, 8.77, 8.71, 8.88, 8.67, 9.02, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALLANICHAKRAVARTHULA SRI HARSHITA', '22A81A0636@sves.org.in', '$2y$10$7hWGifAmfuFbUvANmdVr8eIuGAl0QB89iqPnbQKrLdwOlO44iTjB.', 'student', 'CST', '22A81A0636', '8500712540', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.49, 8.85, 7.69, 8.59, 8.16, 8.74, 8.88, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PADALA MOHAN REDDY', '22A81A0637@sves.org.in', '$2y$10$koXFXNe1EmqYTCzf5h6t2uVaGvaHjsJv0MAvB6n027/McLDEK2PIW', 'student', 'CST', '22A81A0637', '8074274880', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.68, 8.77, 8.69, 8.59, 8.47, 9.02, 9.16, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALLELA RAJA', '22A81A0638@sves.org.in', '$2y$10$MZR/5xB/fX9SUfruqxNZIe9x000aqEUvNFOuYN2qhbcplaUuFrZ2a', 'student', 'CST', '22A81A0638', '9392848155', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.03, 9.0, 8.69, 8.86, 9.35, 9.16, 9.23, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PANJA MADHAN', '22A81A0639@sves.org.in', '$2y$10$PIf3EsSUyGEfqrJxc8l2T.JFjY/29y1czlSdR8zkUCB.10QaIxDra', 'student', 'CST', '22A81A0639', '7729959225', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.86, 8.23, 7.31, 7.88, 7.56, 8.33, 7.7, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PATSA YEGNAVALLAKA SUBRAHMANYA SAI', '22A81A0640@sves.org.in', '$2y$10$gwneusIXmS6UIzFOTtrh0OSJXiebf7qiiau7DRy/JsIhwEL0gaLPK', 'student', 'CST', '22A81A0640', '9989379211', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.55, 8.62, 8.23, 8.47, 8.26, 8.74, 9.16, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PENUMATSA V V V VARMA', '22A81A0641@sves.org.in', '$2y$10$i4gtkwEisybLyffG27.QJODVs6ejdv573EjtSAuGcm79s/UrgBKqG', 'student', 'CST', '22A81A0641', '9059565817', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.01, 7.92, 6.69, 8.18, 8.02, 8.33, 8.4, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POLAVARAPU GANAPATI VARA PRASAD', '22A81A0642@sves.org.in', '$2y$10$pVcjupbJkHoMPXa.VrtVkuVtUbWxDHDmk04y.hGVyD5Nwpx6XRtNS', 'student', 'CST', '22A81A0642', '6304852672', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.96, 9.08, 9.08, 8.86, 8.88, 9.3, 9.02, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PONNA VIJAYA DURGA SAI MALLESWARA RAO', '22A81A0643@sves.org.in', '$2y$10$9/JA7WeOLAR7VPgXlo7BhOmkUDO6fiMQAfaA7q36daLYtC3OZDCOO', 'student', 'CST', '22A81A0643', '8374742540', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.69, 8.54, 8.59, 8.37, 8.47, 8.6, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PYDI GEETHA RANI SRI', '22A81A0644@sves.org.in', '$2y$10$Gc0af43rMP8LHo7Z0LEcxuBCD2WrVFki1Vm7sNiNnyIwfO6b3S5v6', 'student', 'CST', '22A81A0644', '9866095276', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.59, 8.85, 7.38, 8.29, 9.02, 9.16, 8.67, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PYDIPALA SAI AKASH', '22A81A0645@sves.org.in', '$2y$10$I89H.ttIB1JDNyVohSHCWO7FZWgDXsJ5Lh.JTK.cv.nnTHUetQqwu', 'student', 'CST', '22A81A0645', '6281856728', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.72, 8.69, 8.54, 8.45, 9.16, 8.6, 9.02, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAJAHMUNDRY SWATHI', '22A81A0647@sves.org.in', '$2y$10$uaI6S4NzGX77zsN0jyzQW.C/sfJtTlzxIdCZsiNa7Ip7vBsRMThLm', 'student', 'CST', '22A81A0647', '9573113968', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.01, 9.23, 9.08, 8.71, 9.35, 8.74, 9.3, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAMISETTI JYOTHIRMAYI', '22A81A0648@sves.org.in', '$2y$10$bEHLl2Q4/5IfkWeQMi2R2.K/dwBDWPdsSw/8SIDmtYzTmW2PndF96', 'student', 'CST', '22A81A0648', '9381569121', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.06, 9.23, 8.62, 9.06, 8.93, 9.44, 9.3, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RELANGI SRI LAKSHMI MOHANA SASI SARAYU', '22A81A0649@sves.org.in', '$2y$10$.KiV4JYYS1Tv90xmeaLupe7gWKvzgw2dOAvhA/ooW83O.m2yTPLVK', 'student', 'CST', '22A81A0649', '9491017359', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.74, 9.38, 9.23, 8.94, 8.37, 8.47, 8.53, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SHAIK CHAN BASHA', '22A81A0651@sves.org.in', '$2y$10$IajrzCIybCFOrx0DGuCc9.9uYZBxr2dCG.ajjCd6rUH20z8h4UnPi', 'student', 'CST', '22A81A0651', '9550360289', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.01, 7.62, 7.08, 8.29, 8.3, 8.16, 8.23, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TAMANAMPUDI YASASWINI SRI', '22A81A0654@sves.org.in', '$2y$10$035E6duLSNLw14aOqhtHMuparimX5XYCzfOP/N83nGKBT4eoaPUgO', 'student', 'CST', '22A81A0654', '8639507184', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.63, 9.15, 8.85, 8.63, 8.81, 8.19, 8.53, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UCHINTHALA SUPRIYA', '22A81A0657@sves.org.in', '$2y$10$.g8Z9c0T9SgVRB73jiwG6uydCuXd1DWWQ.w8a1BxK/smEd9UxA/6u', 'student', 'CST', '22A81A0657', '9398553910', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.41, 9.31, 9.85, 9.41, 9.58, 9.3, 9.44, 9.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('URLA HASINI', '22A81A0658@sves.org.in', '$2y$10$W4GvH3F1ctqzOsFdtIzHUOjaIEPp.SErNXq0jdzETtCBpofkAtFo6', 'student', 'CST', '22A81A0658', '6304576772', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.91, 8.08, 7.38, 7.76, 7.4, 8.09, 7.91, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VARA JEESON BABU', '22A81A0660@sves.org.in', '$2y$10$oEsc1L8XYQmoenCIpdb9E.Ypt4Zuvc/6LBG527X/TUyedNNU6koTK', 'student', 'CST', '22A81A0660', '6302050750', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.93, 8.85, 7.46, 8.1, 7.81, 7.81, 7.95, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEJJU YAJNA SRIDEVI', '22A81A0661@sves.org.in', '$2y$10$JiulP.oeC.rUEI93IkU67.pUP9jnr4uOLhfDM17PtNfYmpULfvgCa', 'student', 'CST', '22A81A0661', '7013603135', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.7, 8.85, 8.38, 8.71, 8.74, 8.81, 8.81, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VELAGALA LOWKYA BHAVANA', '22A81A0662@sves.org.in', '$2y$10$wgf6QXa90OAV71TUWIUNTOq6omr0n/Y/kHSOfFBtQ2O5ZEDrYQoay', 'student', 'CST', '22A81A0662', '9440403126', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.95, 9.38, 8.92, 8.82, 9.21, 9.09, 8.6, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YALAMARTHI SABDHA', '22A81A0666@sves.org.in', '$2y$10$KpyrIqMhLTc6VC7iK4hlr.7r9ERQhkqd2l0I1c1ZxcHyzLggkHgCO', 'student', 'CST', '22A81A0666', '8317569500', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.57, 8.31, 8.77, 8.47, 8.37, 8.88, 8.95, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AMARTHALURI SRIDHAR', '23A85A0601@sves.org.in', '$2y$10$u.uYsw5ds5MDCipRDnhUwuo5FcPhMwSLXmZnNOWvwByIVjclfou0a', 'student', 'CST', '23A85A0601', '9014343213', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.23, 0.0, 0.0, 8.06, 8.23, 8.4, 8.44, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BEELLA OM ABHIRAM', '23A85A0603@sves.org.in', '$2y$10$dQK1U2fKBIDAjnFBKsS5Q.N3/GbAxzUKj926VPsKvrP2/uCJsCi3q', 'student', 'CST', '23A85A0603', '7815858575', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.59, 0.0, 0.0, 8.51, 8.26, 8.81, 8.37, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOLANUVADA CHANDRA SHEKAR', '23A85A0604@sves.org.in', '$2y$10$QYwQzhs90UVId1Hv67UAOeBgzFqHDH6bfh3z2w/IUnpY6p4sZ1ora', 'student', 'CST', '23A85A0604', '7995709015', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.95, 0.0, 0.0, 8.33, 7.4, 7.84, 8.02, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RUDRARAJU JOGI SUBRAHMANYAM RAJU', '23A85A0605@sves.org.in', '$2y$10$I5pIo4VrWVrbnj2.cDSGLOyCaPzKSCjrc2yU9yDJdnQRD/c0Djh76', 'student', 'CST', '23A85A0605', '6304958379', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.74, 0.0, 0.0, 8.41, 7.63, 7.21, 7.33, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SEEPANI VEENASREE', '23A85A0606@sves.org.in', '$2y$10$5S6CSr7VaxoNELOCvnRdY.otLIg9jkwiG4wTqJzzq4WG/IrnrXVDO', 'student', 'CST', '23A85A0606', '7382490099', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.93, 0.0, 0.0, 8.18, 7.91, 7.91, 7.81, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHILLA YASASWINI', '22A81A1410@sves.org.in', '$2y$10$.jHgoBmABj8BWlOOdpuRb.mHLtbUgeaQaJWrIv2InjItUOS8dXHS2', 'student', 'ECT', '22A81A1410', '7075084586', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.02, 8.54, 7.85, 7.96, 7.81, 8.47, 8.44, 7.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DUNDI CHARMI', '22A81A1413@sves.org.in', '$2y$10$q9TZkBpOhSqjlnro.WQlGOccD3RPdq8NlkdMjDyXK78uX9yMWDIka', 'student', 'ECT', '22A81A1413', '9704226347', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.66, 9.23, 8.92, 8.65, 8.6, 9.3, 8.33, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DUNDI DINESH VARDHAN', '22A81A1414@sves.org.in', '$2y$10$0TDH/vyNfBoBZKnphXksseYShKLyBwS50x6lWTIVEs/79Zx72gGoy', 'student', 'ECT', '22A81A1414', '9014310778', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 8.15, 8.31, 7.94, 7.67, 8.88, 8.05, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOUTHU BANDHAVI', '22A81A1416@sves.org.in', '$2y$10$/SnyQzR2ZnfCGLff5nIPJuDBHIarWIeU9kdxNe0UNfQ2BrpH.rrfi', 'student', 'ECT', '22A81A1416', '6304653334', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.91, 8.77, 8.08, 8.06, 7.77, 7.88, 8.09, 6.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUNA DEEPIKA', '22A81A1417@sves.org.in', '$2y$10$FtvRbLzC2.WPMduPo0a8I.UtOMUOs11tJVTDbfAYr49bM1wQcAcEa', 'student', 'ECT', '22A81A1417', '8522885943', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.78, 8.69, 8.23, 7.25, 8.09, 8.19, 7.81, 6.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUNA NAGA RAGHURAM', '22A81A1419@sves.org.in', '$2y$10$r.NYlUZNYt8KdcxSYEG6geRhHrdXQWKgSOTUMU3hACGItpqABq8uy', 'student', 'ECT', '22A81A1419', '6304169886', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 6.93, 7.15, 6.46, 6.96, 6.56, 7.88, 6.7, 6.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUTALA SATYA VENKATA MURALI', '22A81A1420@sves.org.in', '$2y$10$Rz4Qyp6sRD0VB7OxwGsKVOgPH/qM9MjAOeByPky.FXm0SprI2xdk.', 'student', 'ECT', '22A81A1420', '7093433273', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.26, 6.77, 7.46, 7.02, 6.84, 7.63, 7.47, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KONAKALLA NAGA KEERTHI SREE', '22A81A1424@sves.org.in', '$2y$10$KZ2Y9.IVUFqAoO5DK68XGehdO.uzzHIWIVmMSivTZdrqkZs3y/VwG', 'student', 'ECT', '22A81A1424', '9014664846', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.93, 8.38, 8.31, 8.18, 7.91, 8.33, 7.56, 7.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOKKIRALA HEMA DURGA', '22A81A1427@sves.org.in', '$2y$10$WQrq1IXmetfd4qhuTbyEP.tR1pIUQP2rfl2iuBrvY8RTPLYEVNF4i', 'student', 'ECT', '22A81A1427', '9393144492', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.92, 9.15, 9.06, 8.74, 8.88, 7.56, 7.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOMMURI YAMINI', '22A81A1428@sves.org.in', '$2y$10$cGrIXAyTg3K15PAnAwNZS.g8PDLjjlivAgh5N3SWPHcH5zlhHYPom', 'student', 'ECT', '22A81A1428', '9502214116', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.32, 8.92, 8.23, 7.94, 8.19, 8.74, 8.47, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KURELLA LAKSHMI SRI SATYA', '22A81A1430@sves.org.in', '$2y$10$b7w6giu9F.trLZ97BMsUHOCwfHpjelGRZs5SCy92CnbegVNR4ibHy', 'student', 'ECT', '22A81A1430', '9985902617', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.93, 8.31, 8.23, 7.9, 7.77, 8.4, 7.74, 7.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADDALA BHARGAVI', '22A81A1433@sves.org.in', '$2y$10$Iz6VH/hfKkOaPSalFn.Dlepqp5O6Oh7OmVhfR/zMcUvTDNCuYKh16', 'student', 'ECT', '22A81A1433', '6304927113', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.46, 8.62, 8.37, 8.88, 9.02, 8.74, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADDALA DURGA VENKATA SATYASAI', '22A81A1434@sves.org.in', '$2y$10$5fa7dyauVkT1UI1YZwU6BudmOwBN9SZj47HvW6WbLE4yO74T5ejcq', 'student', 'ECT', '22A81A1434', '8919996452', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.38, 7.0, 7.69, 7.02, 7.81, 7.4, 7.81, 7.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADDIPATLA SUMA', '22A81A1435@sves.org.in', '$2y$10$BgvtN/dLwTOpJax2y6fJc.peE9i7L0OHjexA275y0g1fhkjNXnLnS', 'student', 'ECT', '22A81A1435', '9515082239', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.29, 8.46, 8.23, 8.25, 8.26, 8.53, 8.33, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANEPALLI AKSHAYA', '22A81A1436@sves.org.in', '$2y$10$hf9TBhxG.ImXt5eqLojyCeROaTMNCCnrEPet9Q11EPUhF98ZScvc6', 'student', 'ECT', '22A81A1436', '8919327193', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.01, 9.0, 9.38, 9.47, 8.74, 9.16, 8.88, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOTEPALLI SAMEERA', '22A81A1440@sves.org.in', '$2y$10$CZwoo99H9uAuYfxOgKs3luIoVWiumFBzLGQFBEtEHNJl7md6g8cVO', 'student', 'ECT', '22A81A1440', '7793957469', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.14, 7.92, 7.31, 8.31, 7.95, 8.95, 8.23, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NILABOINA LAKSHMI NAGA DURGA VINEETHA', '22A81A1441@sves.org.in', '$2y$10$SAl3j1uvTU6rvJDN2h4DF.aRxKRLiRc00WtDfleEEHJzo5Uryofgq', 'student', 'ECT', '22A81A1441', '9014912129', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.76, 7.38, 8.15, 7.61, 7.12, 8.37, 8.51, 7.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POSINA CHANDRIKA', '22A81A1447@sves.org.in', '$2y$10$cz4LyxwVN0sv7kA1NbgLvOpI0Y1vnnDU9xKJb5jyv6pFeK6bg58xq', 'student', 'ECT', '22A81A1447', '9182125066', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.83, 8.0, 8.0, 7.67, 7.6, 8.09, 8.26, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PUTTA YAGNA SRI HARSHITHA', '22A81A1450@sves.org.in', '$2y$10$mqZYZxUevXriIK3PcqBvhu2WVHQuZBxVIWILiDAGWv9GZQR78g7ia', 'student', 'ECT', '22A81A1450', '9494127969', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.23, 9.08, 8.54, 8.06, 7.91, 8.33, 8.47, 7.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SUNKARA SRAVANI', '22A81A1455@sves.org.in', '$2y$10$13fXkxYc9DEwC/WmGCcljOmOWKKnnhGV/e2EDToPUy/OCWFrSempG', 'student', 'ECT', '22A81A1455', '9441566833', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.38, 9.08, 9.0, 8.24, 8.3, 8.6, 8.05, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TALAMSETTI GOPIKA SRITHA', '22A81A1456@sves.org.in', '$2y$10$DdksYizwpgwanWpB8bM7gOEdUHSJBOTzQr51FvtAWt92tt6KJWNZW', 'student', 'ECT', '22A81A1456', '6305127334', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.82, 8.92, 9.0, 8.88, 8.6, 9.3, 8.74, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TORATI JAYASURYA TEJASWINI', '22A81A1459@sves.org.in', '$2y$10$EGKJ5BC5DlJgbQJYMZjgGuwYYJjgGulC.JHPVakVy12bCPuDia6u.', 'student', 'ECT', '22A81A1459', '9121741618', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.24, 8.54, 8.23, 8.25, 7.81, 8.67, 8.74, 7.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VALLABHANENI NANDHINI', '22A81A1460@sves.org.in', '$2y$10$Izdo2nJOMFkftSdtbm9HVe1SPvAJNjQRshshGD/tU4jfdTICGedKS', 'student', 'ECT', '22A81A1460', '9346267633', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.65, 8.46, 7.77, 7.78, 7.47, 7.98, 7.63, 6.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VUDDAGIRI HEMA SIVA HARIKA', '22A81A1462@sves.org.in', '$2y$10$IQDkVigf0zXcSdjxnJdYd.B06ziUxPbIaVZtHoGJ906aMX6Cex5GK', 'student', 'ECT', '22A81A1462', '8341249257', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.39, 9.15, 8.69, 8.82, 7.95, 8.47, 8.19, 7.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YADLAPALLI LAKSHMI PRASUNA', '22A81A1463@sves.org.in', '$2y$10$WOeHqXA9tFCgeaYMinnxz.yq5qswju6utTJpilP5lH3akrUgg.1nW', 'student', 'ECT', '22A81A1463', '8712251369', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.07, 8.31, 7.77, 7.82, 7.81, 8.67, 8.33, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YARRA SYAMALA', '22A81A1465@sves.org.in', '$2y$10$qX1slWFnS5iCiY1FbPlFeeqG15CTyCK/LQ3NTylp8EP24izZzWq8O', 'student', 'ECT', '22A81A1465', '9676899766', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.32, 9.08, 8.46, 8.41, 7.88, 8.95, 7.91, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AKASAPU VARUN MANIKANTA', '23A85A1401@sves.org.in', '$2y$10$YcbPCX6GuJyc.zzpnut/oOJWbOgZGQG/Mv9fjwD3cAkheHKM8GtAS', 'student', 'ECT', '23A85A1401', '9640448199', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.68, 0.0, 0.0, 7.14, 7.4, 7.98, 8.33, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ABDUL SAMEER', '22A81A6101@sves.org.in', '$2y$10$fb37n8IM8hcdA6.62Za8/.YTKpIl0h0Wt55O9RGbXUR7EZbZ34xDS', 'student', 'AIM', '22A81A6101', '8179055865', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.32, 8.15, 8.31, 8.45, 8.47, 8.37, 8.02, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADDAGARLA ADITHYA SATYA TRINADHA SHANMUKH', '22A81A6102@sves.org.in', '$2y$10$OZtJG.e.huDHdC5uCyEOvuHnmVw4P0R4TteHhB45n3XvwE2.NLT6K', 'student', 'AIM', '22A81A6102', '9381625956', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.88, 8.23, 7.46, 7.63, 7.49, 8.44, 7.84, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADIMELLI SRIKANYA', '22A81A6103@sves.org.in', '$2y$10$tb0Efi/lrCBuV1yTGBabCOxQ9SZlUNPq6BmV1XPd7Zyrtdnhg//r.', 'student', 'AIM', '22A81A6103', '7569236353', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.3, 8.69, 7.85, 8.14, 8.26, 8.3, 8.33, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('B LAXMI VENKATA RAMA DURGA SOWJANYA', '22A81A6105@sves.org.in', '$2y$10$TaDY3cZGAEQ/O62vLWjl/e07okI81EnIOyalSYuDH2KBDn9gckdh6', 'student', 'AIM', '22A81A6105', '9542519285', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.68, 8.77, 7.38, 7.78, 7.14, 7.4, 7.91, 7.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BADAM SAI BHAVANI', '22A81A6106@sves.org.in', '$2y$10$nqyAJ7z0WX9/gVgfQNz0sOB8LQ/BFH2mWyO.M1ShmGdZn4I98t/hy', 'student', 'AIM', '22A81A6106', '7032565991', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.75, 7.46, 7.92, 7.24, 7.35, 7.74, 8.26, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BORRA VIJAY VINAYAK', '22A81A6107@sves.org.in', '$2y$10$gw/yZYSjRmPxsuIK4KOkzu0EQgZUQ44Q5Ee.zA6rgTMpR/Gd.Aare', 'student', 'AIM', '22A81A6107', '6304153598', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.93, 8.62, 8.08, 7.24, 7.63, 8.09, 7.67, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BULUSU VENKATA DURGA SRI HARSHINI', '22A81A6109@sves.org.in', '$2y$10$H1l3OZ5O0UUfoh07xnx.O.Bo4GUcdrrM.JPXNmebHm337BpvEdmO2', 'student', 'AIM', '22A81A6109', '6304938149', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.18, 8.54, 7.62, 7.24, 8.33, 8.51, 8.74, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BUSI PALLAVI', '22A81A6110@sves.org.in', '$2y$10$4OAYioFUZu2VRKBn/xiWUe1hS4ys5ZzjuHIOnMDlyXVFs2J8jvqSC', 'student', 'AIM', '22A81A6110', '6302975519', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.65, 7.62, 6.62, 7.18, 7.21, 8.02, 8.6, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHELLABOINA YESURAJU', '22A81A6112@sves.org.in', '$2y$10$KtSanhpFa7tBDxLmMtFuduWuNSia.6wP/ew6RChysk7.ddOdoFit2', 'student', 'AIM', '22A81A6112', '9392234389', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 9.23, 9.0, 9.02, 8.47, 9.02, 9.02, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DAGULURI RAJU', '22A81A6115@sves.org.in', '$2y$10$BWj/gY25Q63/wkTfaEKdieFkG64lFLC4n2yY51NlvQJIjP373OObS', 'student', 'AIM', '22A81A6115', '9866942197', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 8.08, 7.85, 7.88, 7.91, 8.47, 8.19, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GORREMUTCHU SOLOMON MATTHEWS', '22A81A6121@sves.org.in', '$2y$10$fMkiDgk9cQ9vsFzOIamOousJkirnm4.fL/GU.3n5uPG3z30oVuEnG', 'student', 'AIM', '22A81A6121', '6305718769', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 8.77, 8.46, 8.39, 7.84, 7.7, 7.84, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JAKKANI SREE TARAKA VAMSI KRISHNA', '22A81A6122@sves.org.in', '$2y$10$5aGYZAoaAXzCgJjBVtKtNOWG2AfN2aSOc4JDMuSatU3beMbzrZ4F6', 'student', 'AIM', '22A81A6122', '8919159595', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.64, 8.77, 8.15, 9.06, 8.33, 8.6, 9.02, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('K PURNA SATYA SAI SAHITHI', '22A81A6124@sves.org.in', '$2y$10$BQK1RjZ0ha1gL.VyRTaEhuCAWkbmRBg6XFGxW1ARVPJSL1E.F4LbK', 'student', 'AIM', '22A81A6124', '8106124961', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.52, 9.15, 8.15, 8.69, 8.53, 8.37, 8.44, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARRI ROHIT SAI LAKSHMAN REDDY', '22A81A6125@sves.org.in', '$2y$10$n6PuGi2zrKUMjrMY7eo.geq91IuDqkEDSiJVgPsgIQ8YtCJ6i2KMu', 'student', 'AIM', '22A81A6125', '9493957945', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.51, 9.38, 8.08, 8.39, 7.28, 8.6, 9.21, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANTHETI VIVEKRAM', '22A81A6128@sves.org.in', '$2y$10$dQyY7JYeOUziCqyvsQ8pW.7L6JeZTD3uYy4og4/2.VROB2czNjNFm', 'student', 'AIM', '22A81A6128', '8522020692', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.66, 9.08, 8.31, 8.65, 8.05, 8.74, 8.93, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAVALA JITHENDRA', '22A81A6130@sves.org.in', '$2y$10$HhCdnQRyjtQWQVxdnRf3ee4QRxUo8VcCWhXb8VExxVx401fSraI9i', 'student', 'AIM', '22A81A6130', '8309042235', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.77, 8.08, 8.98, 7.91, 8.88, 8.72, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOMBATHULA AKHIL BABU', '22A81A6131@sves.org.in', '$2y$10$GNteJleel7g2C3iOSbPL1u2HJWpzs3bsMQ637jkJx2AzyMC2Uikmm', 'student', 'AIM', '22A81A6131', '9346658378', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.62, 7.69, 7.46, 7.82, 7.21, 7.95, 7.47, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOMMU LAKSHMI LAVANYA', '22A81A6132@sves.org.in', '$2y$10$7MZb52LY8lbqDyFkBiOgRuP98FxUUipfDw/f2daGkA9REsaiBwDNa', 'student', 'AIM', '22A81A6132', '6302303231', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.39, 9.08, 8.62, 8.27, 8.05, 8.37, 8.33, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KONDAVEETI MONICA', '22A81A6134@sves.org.in', '$2y$10$oIP3zfu1g2UDExhnKXlxKuMKOiwKpBZrscbVjzTdSGI.xBuVQrU9e', 'student', 'AIM', '22A81A6134', '9121344797', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.45, 8.92, 7.54, 8.71, 8.33, 8.65, 8.33, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOHAMMAD ISHAQ', '22A81A6137@sves.org.in', '$2y$10$T6kbf58g15sQbUDq2VUrteaPmpT/AUJHqivqwD3/BSW/yDXVY8z4K', 'student', 'AIM', '22A81A6137', '9393265888', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 8.15, 7.08, 7.94, 7.91, 8.47, 8.6, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MUNISETTI VENKATA LAVANYA', '22A81A6141@sves.org.in', '$2y$10$AvYaKS8CVQZJJ6KsG.TyIuGCWW9XsII7ZDHl1.FaQ1J1Rv5oj1Mv.', 'student', 'AIM', '22A81A6141', '7075291677', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.79, 9.38, 8.46, 8.92, 8.4, 9.21, 8.74, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALLAMELLI BABY SARANYA', '22A81A6142@sves.org.in', '$2y$10$CKpAWcjgkmyfES5brTESHu3YAeOnM4npwSjLaEBY6gF7VhROGP4IS', 'student', 'AIM', '22A81A6142', '9133391118', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 8.62, 7.46, 7.92, 7.63, 7.95, 8.53, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAVABATTULA MANOHAR NAGA SRI SAI', '22A81A6143@sves.org.in', '$2y$10$zhSV.CP.0NTtZIu.6QaL4uetUTmQdKpJWo2TVlFRDjTlb8.0LS1Gu', 'student', 'AIM', '22A81A6143', '6305083757', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 8.08, 8.46, 7.92, 7.98, 8.58, 8.6, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NELLI RAJA', '22A81A6145@sves.org.in', '$2y$10$94lSfTgj.VXMvmcw9k21cuQjpQKxDWcuA7FCOXAnWjsc.yDBGJwaO', 'student', 'AIM', '22A81A6145', '7601057948', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.96, 8.46, 7.0, 7.59, 7.84, 8.33, 8.09, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PABBA HARSHINI', '22A81A6146@sves.org.in', '$2y$10$gSpabAos6q39Hbs8cKI3b.EiYKW0a3GhA0G2876c8cmKoehimLcI6', 'student', 'AIM', '22A81A6146', '9121930594', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 9.23, 8.08, 8.06, 8.12, 8.47, 8.6, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALURI MOUNIKA', '22A81A6147@sves.org.in', '$2y$10$m5xjap/DCxPk0cJuhVeVOODwc/QXzcmGZsS09ZHE2ZZpUmZNFwEES', 'student', 'AIM', '22A81A6147', '8374611254', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.64, 8.85, 7.77, 8.39, 8.53, 8.88, 9.44, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PATHURI BHUVANESWARI', '22A81A6149@sves.org.in', '$2y$10$9cAakp/YL7A9eaIjVJn23e3BSF721BLYzAFJ4ALn4btX3/lRb7ngu', 'student', 'AIM', '22A81A6149', '7569046467', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.11, 9.69, 8.92, 9.27, 8.88, 9.16, 9.23, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PULAPA INDIRA', '22A81A6151@sves.org.in', '$2y$10$/FK0ek37k.omLu/cPFlE4uqDEZl9EsPXTmk2SbaNTfsQcbhWX1g0e', 'student', 'AIM', '22A81A6151', '7780462957', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.79, 9.62, 8.31, 8.82, 8.12, 8.88, 9.02, 8.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SARIKA ANJANEYA KARTHIK', '22A81A6154@sves.org.in', '$2y$10$TAxHQ4gQabBtgwTf0i2UbeeKME1kCpY3TKdduFAomnY9nTdEWCGMW', 'student', 'AIM', '22A81A6154', '7396351571', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.25, 8.46, 7.85, 8.71, 7.7, 8.19, 8.88, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SIMHADRI TARUNI', '22A81A6155@sves.org.in', '$2y$10$joZRcDKYWOjKY7yO5b1w5.mae99Ro426fd0yZoJejJYaRuduCCD82', 'student', 'AIM', '22A81A6155', '8184945533', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.11, 9.62, 9.08, 8.98, 8.88, 9.16, 9.16, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TAMMINEEDI REKHA PRABHU', '22A81A6157@sves.org.in', '$2y$10$JoFI5PxtNsQvqXPxSVlvguwa5tEmwjaa9hOKGUsbjrmbGdKxrv1Ri', 'student', 'AIM', '22A81A6157', '9392947775', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.94, 9.46, 8.69, 8.86, 8.74, 8.88, 9.16, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TIRUPATHI SHANMUKHA PRIYA', '22A81A6159@sves.org.in', '$2y$10$vOyJc1WJBwyIh.4vJWCDFuDs0B8kW/QWdI4nfmxLrDdv7ucC/UTke', 'student', 'AIM', '22A81A6159', '6300372367', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.88, 9.31, 9.0, 9.06, 8.74, 8.47, 9.02, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TIRUVEEDULA L.N.V.S.M.L.DHEERAJ', '22A81A6160@sves.org.in', '$2y$10$DW4wNRol503ztUMO.vuxV.MU/gVsu/tImUuUjoNvuWbNE2NygpT7G', 'student', 'AIM', '22A81A6160', '7842420613', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.24, 8.77, 8.23, 8.29, 8.19, 8.02, 8.26, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEDANTAM VENKATA MODA SRI VAISHNAVI', '22A81A6162@sves.org.in', '$2y$10$o5BfV4q4GDpKspnrFkH9P.ny6mmC3iP2dlVo7hJmCsG4tbnmogpeK', 'student', 'AIM', '22A81A6162', '8106962366', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.75, 8.92, 8.08, 8.86, 8.67, 9.02, 9.02, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VANTIPALLI PURNA SRI', '22A81A6163@sves.org.in', '$2y$10$wF5Q8WdN/iHNq2gPgfgiEOjxfQu/SdlA72hYhtQFwgWzhj9uvHc8a', 'student', 'AIM', '22A81A6163', '9459893333', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.93, 9.62, 8.69, 9.24, 8.67, 8.86, 8.81, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADABALA JAYA MOUNIKA', '22A81A6167@sves.org.in', '$2y$10$qFDvqpXZFWB0PHqrLFCQ5.XhSCQy8yqfi454E05oyIqKmFUEBK9H2', 'student', 'AIM', '22A81A6167', '8019736844', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.83, 9.31, 8.62, 8.94, 8.33, 8.6, 9.02, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ANEM PADMA RAMA SOWJANYA GANESWARI', '22A81A6169@sves.org.in', '$2y$10$cgJCSgr/7YbeWwIfxvOlh.mQPhbaDqHK6/2nYhN0sRZsfu1nS8kPa', 'student', 'AIM', '22A81A6169', '7013975155', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.82, 8.54, 8.23, 9.29, 8.88, 8.88, 9.44, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BONDADA VAHINI SATYA KALA', '22A81A6172@sves.org.in', '$2y$10$/SaAWlWkkZ3ipDqJpjokFOzCt1r6304Jsv.WIhWYJvkiDyVLqcwnm', 'student', 'AIM', '22A81A6172', '6301100912', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.41, 8.77, 7.92, 8.71, 7.91, 8.12, 8.65, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BORRA VIKASH', '22A81A6173@sves.org.in', '$2y$10$JK0faYwYwg3.W66uvCTPAuiubE8M6PvJGUVwPRNRDobbzS/hKjta6', 'student', 'AIM', '22A81A6173', '9441133755', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.95, 8.0, 7.54, 7.98, 7.77, 7.81, 7.74, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BURRA AVINASH', '22A81A6174@sves.org.in', '$2y$10$Oo5w3Ts5xv7pk1tjKFVvjO6GfGmbMk0.R5soSceCck5WMMyJk4yq2', 'student', 'AIM', '22A81A6174', '9704935980', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.76, 7.69, 7.23, 7.75, 7.35, 7.53, 7.81, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHENNURI VASANTHI', '22A81A6176@sves.org.in', '$2y$10$6LpfUDsPDG.8PfvMaiR/cusEPrWEmUzggqdLu8aiPzpQijrgg6csK', 'student', 'AIM', '22A81A6176', '7997292889', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.8, 7.77, 7.15, 7.71, 7.63, 7.88, 7.98, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DANDUBOINA JYOTHI SWAROOP', '22A81A6179@sves.org.in', '$2y$10$i9himSiOP1unwwJMUjv8FuEd.muYULu2yZfKDzIAaRvOAJxhIY8xq', 'student', 'AIM', '22A81A6179', '6301007254', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.88, 7.85, 7.69, 7.86, 7.63, 8.23, 7.53, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DUGGIRALA SAI KOUSHYA', '22A81A6180@sves.org.in', '$2y$10$8EU2FQJe0lKJHL0JbFOj4edRzNhWpWQXsJRSy5CRj5P0d6jOzx4ZK', 'student', 'AIM', '22A81A6180', '8374099466', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.39, 8.31, 7.69, 8.59, 8.4, 8.6, 8.37, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GHANTA VENU MADHURI', '22A81A6182@sves.org.in', '$2y$10$bUeng/sIxQ9wi0w781h3FegMH3u.scP37UoyswperQb9.YKmaDdZO', 'student', 'AIM', '22A81A6182', '6304726531', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.79, 8.92, 8.46, 9.06, 8.53, 9.16, 8.6, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('INDANA RAGHAVENKATA SATYANARAYANA', '22A81A6186@sves.org.in', '$2y$10$g.k/NiYfgu1kFMdMUWuyhOx4Jua7XxhI86xVkqVx5HPINVNnJAk5a', 'student', 'AIM', '22A81A6186', '6300073279', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.07, 9.69, 9.08, 9.18, 9.3, 9.02, 8.74, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KALLA RAMA SRI SAI SANDEEP', '22A81A6188@sves.org.in', '$2y$10$dDRPdP1XVebZCP0/jITukuGsPrIq0Sjyw.Fu1rBhl5piRGw/aWLgC', 'student', 'AIM', '22A81A6188', '9951334833', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.31, 8.38, 8.31, 8.41, 7.98, 8.67, 7.95, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARUTURI KOUSHIKA', '22A81A6189@sves.org.in', '$2y$10$VYU8ecimgiJpgJYL5dpcbO7ze3mKSmjvDHQDWCEjcYgqIGZoKBogu', 'student', 'AIM', '22A81A6189', '9848602023', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.83, 8.31, 7.38, 8.29, 7.7, 7.67, 7.74, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOCHERLA HINDU', '22A81A6190@sves.org.in', '$2y$10$zzJI1NXv.X4RmmLDXOJBxuAh4..sfMg59Em0J/wR/lcJsNvJOJjNy', 'student', 'AIM', '22A81A6190', '8247267574', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.29, 8.38, 7.62, 8.71, 7.98, 8.09, 8.51, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOTTU SATYANARAYANA', '22A81A6194@sves.org.in', '$2y$10$3oYo3Nl1xzCXSlleqEYYcOtcjAVA49.I1Wjgf3brKoqgHKiK.5UHu', 'student', 'AIM', '22A81A6194', '8074645996', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.62, 8.0, 6.85, 7.69, 8.05, 7.53, 7.26, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOVVURI NIMEELA', '22A81A6195@sves.org.in', '$2y$10$b/1dMKfGdNe./H0J7NCjB.gXd0AHwMXBc10Vbl.Dw0z0QrrvhYMXK', 'student', 'AIM', '22A81A6195', '9000158272', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.47, 7.0, 6.46, 7.53, 7.63, 7.67, 7.53, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANE B S S BHASKAR SHANMUKHA VAMSI', '22A81A6196@sves.org.in', '$2y$10$6vzGo72rikCJN1Y7DpYgeOYp/7XIygRBh5/9isv5pPu/rA28jLzNS', 'student', 'AIM', '22A81A6196', '6305611826', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 8.85, 7.23, 8.18, 7.98, 7.81, 7.81, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANIKALA VIJAY KRISHNA', '22A81A6198@sves.org.in', '$2y$10$I/AIMFyzR3.pvsorsOSYr.UDPYVW6GAQRMbVOGSEY/ZX9JvVjraLK', 'student', 'AIM', '22A81A6198', '9391843437', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.34, 7.54, 7.0, 7.82, 7.12, 7.09, 7.19, 7.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MATTA KIRAN KUMAR', '22A81A6199@sves.org.in', '$2y$10$aKEPmTNIec9P4phGXAZh2.x5FNOIi11PvzQ79K5Vm/YY68Kgi3VhK', 'student', 'AIM', '22A81A6199', '8866899666', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.01, 8.23, 7.23, 8.47, 8.05, 7.81, 8.09, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MENNI MADHAVI LATHA', '22A81A61A0@sves.org.in', '$2y$10$XologvyZ0/0xJBGYLxCK3.Bk.bid4hp7rxXG2lUSa7pKBIKTXCnWq', 'student', 'AIM', '22A81A61A0', '9177243781', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.8, 9.0, 7.92, 8.82, 8.67, 8.88, 9.3, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAINARAPU KRISHNA CHAITANYA', '22A81A61A2@sves.org.in', '$2y$10$rzn7EZdUnWrn3AT4sHeHjuU2hz6Ju6g.HZpp3mBZKOLFYQ.bQJzCG', 'student', 'AIM', '22A81A61A2', '9133544634', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.06, 8.08, 7.08, 8.39, 8.67, 8.16, 7.33, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAMBULA ESWAR AKASH', '22A81A61A4@sves.org.in', '$2y$10$oBzYc3YGuVcqtH/9AHl7euCVdkWCBhZxLSvDssJ1LAcmrsh1MrZOS', 'student', 'AIM', '22A81A61A4', '8341462856', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.06, 8.23, 7.69, 8.39, 7.63, 7.95, 7.47, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALLAPOTHU NAGA KRISHNA MADHURIMA', '22A81A61A8@sves.org.in', '$2y$10$Vqcbr2RWDtpb3Dek1pi64Or1MqGg.ogoLMxhWoK9vjnKdjOZ7TPuO', 'student', 'AIM', '22A81A61A8', '7989846096', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.9, 9.31, 8.69, 8.98, 8.74, 8.95, 8.81, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PAMIDI RESHMITHA SREE', '22A81A61A9@sves.org.in', '$2y$10$a4iJ9o/fmdrb7cjRh762S.KFTXF2y9auwHfbt1orDYR8kA4OSMRVG', 'student', 'AIM', '22A81A61A9', '9347318653', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.92, 8.92, 7.85, 7.92, 7.77, 7.88, 7.67, 7.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PATTAN FARJANA', '22A81A61B2@sves.org.in', '$2y$10$CsRMQ5Biv099DxyH/YLSruny.sLrI8q25lzc4ZlQVUbO3jUaWvGX6', 'student', 'AIM', '22A81A61B2', '9704019178', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.32, 8.62, 7.0, 8.71, 8.53, 8.23, 8.67, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAMISETTI VISWAJA', '22A81A61B7@sves.org.in', '$2y$10$mKkqS.9FOzwVBW7AX1exe.C.jdQWLq83xj2JW7KYVUAOr8smJg5dm', 'student', 'AIM', '22A81A61B7', '8639179966', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.93, 9.46, 8.54, 9.06, 8.74, 9.02, 8.88, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SABBARAPU MOHAN GANESH', '22A81A61B8@sves.org.in', '$2y$10$QuYOhYYhqDvTLWy6gXbGXOrV/EmG2ReO/y28QbOzqt.9ZFFkexoRK', 'student', 'AIM', '22A81A61B8', '9052811658', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.86, 8.77, 7.46, 8.22, 7.35, 7.37, 7.67, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SHEIK RIHANA', '22A81A61C0@sves.org.in', '$2y$10$U8mHtraN93.Op6Uvl8C6UeANHkNr5wFlJ28kSb6CTfr3sEoD8pV/W', 'student', 'AIM', '22A81A61C0', '8688004493', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.23, 8.15, 7.46, 8.47, 7.98, 8.3, 8.53, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SOMA GOWTHAMI', '22A81A61C2@sves.org.in', '$2y$10$fue7sh0gSF2Rc.PWafHmbO9PT1YpKIArO.xxX.Y0j.voxBJCGelc6', 'student', 'AIM', '22A81A61C2', '9391318590', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.59, 9.08, 7.85, 8.76, 8.4, 8.95, 8.58, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UNDURTHI KARTHIK SANJAY', '22A81A61C5@sves.org.in', '$2y$10$W3ZUP61IN3aJ09YicL7bm.Ll7v4L36idIcIQYco9M2qf0p3Z68P3e', 'student', 'AIM', '22A81A61C5', '7396496696', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.47, 7.54, 7.0, 7.57, 7.28, 7.6, 7.4, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VARRI BINDU SURYA SRI', '22A81A61C6@sves.org.in', '$2y$10$Y5/3lYq4g.mDqwh.uWvVB.YAz1aw8vPA1tjTj2a0/qwFVjzPFLoM2', 'student', 'AIM', '22A81A61C6', '9100927227', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.12, 8.31, 7.54, 8.1, 8.47, 8.16, 8.05, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEERANKI SAI SRIVALLI', '22A81A61C8@sves.org.in', '$2y$10$dnVbWrgdT2j/eRpG22q75ehVTtcwu4Tb85rz9AQwpRQI1HYC5qPxq', 'student', 'AIM', '22A81A61C8', '9573821549', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.61, 8.77, 8.46, 8.41, 8.26, 8.88, 8.88, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VERNENI SANKEERTHANA', '22A81A61C9@sves.org.in', '$2y$10$y2ih/KBoexuSdSnpryzEOORE5bAtWmNSA0DcjoTG6ZwtsvSAKoXTW', 'student', 'AIM', '22A81A61C9', '9959322022', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.97, 9.69, 9.23, 9.29, 8.47, 9.16, 8.88, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TALAPATI RAVINDRA', '23A85A6106@sves.org.in', '$2y$10$Vr07cF34GothwvB6AsVdtuUMUqaekOrCCRcQpLWIeWX1TLNZ3Fp3W', 'student', 'AIM', '23A85A6106', '7207022630', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 0.0, 0.0, 8.33, 8.19, 7.88, 8.4, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEMPADAPU RAMA KRISHNA', '23A85A6108@sves.org.in', '$2y$10$B7Zr26Y53KX3SuKcJee3EeGt2lqxj8mGY56o2tez.b3mfsjZjhTL6', 'student', 'AIM', '23A85A6108', '9390492076', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.12, 0.0, 0.0, 8.29, 7.98, 8.74, 8.02, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANDEPU JAGAN MOHAN SAI', '23A85A6110@sves.org.in', '$2y$10$209gFcX220NhHSXrW5ThZuCA2DqdTvZJBBxUV6bv7JffNuihv3AvC', 'student', 'AIM', '23A85A6110', '7671001426', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.35, 0.0, 0.0, 7.71, 6.72, 6.88, 7.6, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KUDUPUDI NARSIMHA SAI SANDEEP', '23A85A6111@sves.org.in', '$2y$10$FtoPLbd1nABJ/VIg9n7pYuhoH8ctNKm95sNCauv5RCEkw4Rbu6AQa', 'student', 'AIM', '23A85A6111', '9014532005', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.86, 0.0, 0.0, 8.24, 7.91, 7.67, 7.88, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BUDDANA DURGA VARA PRASAD', '22A81A4302@sves.org.in', '$2y$10$25kHyRDfOwOyIGPoiK6DF.OIx27m/6vaOx0Zggl6g2td1zNB3VNZW', 'student', 'CAI', '22A81A4302', '8919766303', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.73, 8.46, 7.15, 7.84, 6.98, 7.74, 7.53, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('D B ABHISHEK ANANTAPALLI', '22A81A4305@sves.org.in', '$2y$10$rsj8wmanC8U9P./bAivnyenutw9nBWACG/eTYd1wl9.l/sJaM0Luy', 'student', 'CAI', '22A81A4305', '8317618694', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.17, 9.38, 8.77, 9.53, 8.81, 9.16, 9.58, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GARIMELLA VASANTHA SURYA PRASAD', '22A81A4306@sves.org.in', '$2y$10$bdnqOtxjsyA428MGiy5gQe1L/JM7rQaJm8Nuijm8A7xYF0LE2xMR.', 'student', 'CAI', '22A81A4306', '7893156396', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.26, 8.0, 8.23, 9.06, 7.67, 7.88, 8.05, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GETCHA BHEESHMIKA', '22A81A4307@sves.org.in', '$2y$10$8eJ4pt2zHy9A0cD3pggoQe7/1j7UeiTxSRHhSs52nLlTnx6xnEUk6', 'student', 'CAI', '22A81A4307', '7013333902', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.12, 8.38, 7.46, 7.75, 7.84, 8.19, 8.67, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOLTHI SONI HARIKA', '22A81A4309@sves.org.in', '$2y$10$J0TXHPoe4sThAVqfJlNPNudIupHD35FQ8nzbPwVYTKTTggQGFMeZK', 'student', 'CAI', '22A81A4309', '7989682765', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.91, 8.77, 7.92, 8.0, 7.12, 7.7, 7.81, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUDIMETLA ANU KARISHMA', '22A81A4310@sves.org.in', '$2y$10$onIQoEcam7dNWspIHlvjUejmOnPxLZD/yp5Hnh3Q.XJ8k2k.muebW', 'student', 'CAI', '22A81A4310', '8328533689', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.24, 9.85, 9.08, 9.29, 9.21, 9.02, 9.44, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GULLA HARI SANKARA BHAVANI PRASAD', '22A81A4311@sves.org.in', '$2y$10$f6tZBK2w4rX3NO.brC.hPOr8l4yjPgFsY2rs0.OuLXancS4tMfbDe', 'student', 'CAI', '22A81A4311', '8978615307', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.21, 8.38, 7.38, 7.63, 8.02, 8.09, 8.74, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JALLA PADMA SRI', '22A81A4312@sves.org.in', '$2y$10$iEDx11Rq76X848wOyCoZf.30LiPjW/cTAPO5nSWbb8l27Eq0.04ze', 'student', 'CAI', '22A81A4312', '8520847664', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.18, 8.54, 7.23, 7.86, 7.05, 8.74, 9.14, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KUNCHANAPALLI HEMA LALITHA DURGA', '22A81A4316@sves.org.in', '$2y$10$QxXH6oou7xzQjYXBCzb1G.UC7oxA4X96bSo2WfCXLhpOP9x.6MwSq', 'student', 'CAI', '22A81A4316', '9392996754', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.89, 8.0, 7.38, 7.51, 7.26, 7.98, 8.51, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAKUMANU VENKATA SAI SRI DEEPIKA', '22A81A4317@sves.org.in', '$2y$10$kYOe/8f2xPM4x1PErIqBIeLUO2R5NnaKup4RsCmDrMG0OhZHRyLnO', 'student', 'CAI', '22A81A4317', '8712152004', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.89, 9.46, 8.69, 8.75, 8.26, 8.95, 9.21, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARUTURI POOJITHA', '22A81A4318@sves.org.in', '$2y$10$tEIJjWKCz7vHKE0Ds.rw0uGnzM7NjSTMS3HAAAJhRQBXtI1Ai.paO', 'student', 'CAI', '22A81A4318', '7671968916', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.63, 8.54, 8.46, 8.71, 8.05, 8.88, 8.6, 9.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KESANI NAVYA SREE', '22A81A4321@sves.org.in', '$2y$10$LF0zJet8jjsm.0o9Fpr29ehXYZmKYZvM7cdI3ARFb2OqYAhTrM5FO', 'student', 'CAI', '22A81A4321', '9392485248', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.71, 8.46, 8.23, 8.94, 8.4, 9.16, 8.67, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOKKIRIMETTI PAVAN NAGA VENKATA KUMAR', '22A81A4322@sves.org.in', '$2y$10$E/FBIMKUMDFsqBxgH1diIO6Ybogp6bf/KYBI.RVJ8tYu1Voz8pGVe', 'student', 'CAI', '22A81A4322', '9010635259', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 9.0, 7.62, 8.37, 7.33, 8.47, 8.33, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOLLEPARA SATHVIKA', '22A81A4323@sves.org.in', '$2y$10$hMZ9cdbHM4XiWF9vk6mh.OIqXvU1.8J5Sr4QhbASUd0Ei7lcUi8A2', 'student', 'CAI', '22A81A4323', '8096513001', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.3, 9.0, 7.69, 8.94, 7.47, 7.77, 8.33, 8.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KONA KARTHIK', '22A81A4324@sves.org.in', '$2y$10$6BV2p9ujBK/4kf7eQsKKBeHRvGXUfMv0bywmdcRG4aoz8aHp7fiEm', 'student', 'CAI', '22A81A4324', '9640715598', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.99, 8.0, 6.85, 7.86, 7.81, 8.6, 8.05, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KONGARA MEGHANA', '22A81A4325@sves.org.in', '$2y$10$./rQbn1SijQE0/X2l4u5FOCxUKPSAqngzoJ8010FvdtPJRjdORwBC', 'student', 'CAI', '22A81A4325', '9381687830', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.22, 9.23, 9.31, 9.41, 9.3, 9.44, 9.02, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOTHA DREAM SRI VENKATA THANMAI', '22A81A4327@sves.org.in', '$2y$10$ABaSAf6gxpeFmU9FOnd8reht8UoeVJHJoqzH1GKPdPLaU.acEKG1m', 'student', 'CAI', '22A81A4327', '8297877555', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.2, 9.69, 8.62, 9.08, 8.88, 9.44, 9.58, 9.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('LINGAM GOWTHAM KUMAR', '22A81A4329@sves.org.in', '$2y$10$EOPD6Wr0d65OCNitV7rVC.spbhHJVr5qtciMFuNBna1r8ykNcvwTK', 'student', 'CAI', '22A81A4329', '9014305640', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.8, 8.08, 7.0, 8.0, 7.35, 8.19, 8.05, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MALLIDI SURYANARAYANA REDDY', '22A81A4330@sves.org.in', '$2y$10$F8DYMln9LE24jueqaZUCQ.N03XvKLlN08UkCPxsm2YshPKHRTc3e.', 'student', 'CAI', '22A81A4330', '9347445773', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.2, 9.08, 7.77, 8.2, 8.23, 8.19, 8.02, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MAGANTI BAVANA', '22A81A4331@sves.org.in', '$2y$10$zPoZ/oH9HNQDrRDA710WseK6.1OmjoX0v9pIoO/3wfl.MrkaPcj9a', 'student', 'CAI', '22A81A4331', '9030207566', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.0, 9.46, 9.0, 9.29, 8.95, 8.6, 9.3, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MAKA JAHNAVI NAGA SAI', '22A81A4333@sves.org.in', '$2y$10$OOIN20qO9/8osCluTc1IV.8SyslBZhXxLANfWDkXb7REjx8K7enEG', 'student', 'CAI', '22A81A4333', '8519807791', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 8.0, 7.69, 7.94, 7.42, 8.26, 8.81, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEDA GOVARDHANA SUBHASH', '22A81A4335@sves.org.in', '$2y$10$2HO4wHFUb7rpkrmbVnan8udB.JK02RzlS8lx7jg7c6.H/zfrw3Vci', 'student', 'CAI', '22A81A4335', '9392676529', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.77, 9.08, 8.69, 8.82, 8.6, 8.67, 8.88, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAARLA DURGA PRASAD', '22A81A4338@sves.org.in', '$2y$10$mttIay502R2EXiHxaXJyvejiHefNFdQF86If/AL0Us9FgXLF6A.U2', 'student', 'CAI', '22A81A4338', '7013379791', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 9.46, 9.15, 9.02, 8.6, 9.16, 8.58, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAGIREDDY TULASI SATYAVATHI', '22A81A4339@sves.org.in', '$2y$10$CY.wXFoXRkDyPPDEUO7IwOnchP8PngBJ3TZcruPR1VxlogUhqrO4m', 'student', 'CAI', '22A81A4339', '9652562592', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 8.69, 7.85, 8.49, 8.33, 8.6, 8.65, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NARKIDIMILLI SAKETH', '22A81A4340@sves.org.in', '$2y$10$1.zOyh7cGjwgi71RE7k9feRhtXrWeaDCOuxWzCKINyRo6QOwnmGcW', 'student', 'CAI', '22A81A4340', '8555883949', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.09, 9.69, 9.08, 9.0, 8.88, 9.16, 9.16, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ODURI SRINIVAS', '22A81A4342@sves.org.in', '$2y$10$6AijWajrl/prHJJmbfP2iu9Q4caH5QwqipcDPJHK7OVr/ft90WCmm', 'student', 'CAI', '22A81A4342', '9959325457', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.38, 9.62, 9.38, 9.41, 9.16, 9.3, 9.58, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PADILAM KALYAN KUMAR', '22A81A4344@sves.org.in', '$2y$10$f/seoC45AMVqMpK.q3fSC.FioUQWUVf6NGFUsPJHQ5qpwE7Vp5iYe', 'student', 'CAI', '22A81A4344', '6300808054', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.25, 9.85, 9.38, 9.41, 8.6, 9.16, 9.16, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PAIDY DEEPAK', '22A81A4345@sves.org.in', '$2y$10$iofs6Wb4coANbPxxClVoauzkEFGBq0J7PNBRbdLun53U3LYhYBzVi', 'student', 'CAI', '22A81A4345', '9618045505', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.04, 8.08, 7.54, 7.96, 7.7, 8.23, 8.44, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALLI KALYAN BABU', '22A81A4346@sves.org.in', '$2y$10$YQguob7iGQl34WkH9D403ugnmkyFzUc3W02w2f7nJmyatmGbq/nkO', 'student', 'CAI', '22A81A4346', '8121606415', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.24, 8.69, 8.54, 7.9, 7.91, 7.77, 8.16, 8.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PEDAPUDI SRINIVASA SAIRAMA DATTATREYA', '22A81A4347@sves.org.in', '$2y$10$T/BhOb9U4v.Ds.f9jOSQkukzPs7gtiMLYAQKtahaLomGAb4FlmbZe', 'student', 'CAI', '22A81A4347', '9390447466', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 9.46, 7.92, 7.9, 7.21, 7.67, 8.33, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PERURI SANDEEP', '22A81A4349@sves.org.in', '$2y$10$rZsoShaq5.X.Hzo/eFUm8uZ3Mwo7axEb7n26Rhb8Rp/hP5l3FBHwq', 'student', 'CAI', '22A81A4349', '9063507445', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.1, 8.31, 7.54, 8.1, 7.91, 8.33, 8.12, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PINNINTI DEEPIKA', '22A81A4350@sves.org.in', '$2y$10$ezGJQSSSnKsQKhKX.DnAWuu.2pWSxt0n.UREMnzFKfGW0gaMYZj6i', 'student', 'CAI', '22A81A4350', '9490043898', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.99, 9.38, 8.46, 8.8, 8.74, 9.3, 9.02, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAPAKA DIVYA', '22A81A4351@sves.org.in', '$2y$10$qbpzhD/7Q2qRhcsEfAId5eDZb5Xe8816.TJqbOJ.wsSGTvb7Aru46', 'student', 'CAI', '22A81A4351', '9963099088', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.99, 9.23, 8.92, 9.14, 8.88, 8.74, 9.16, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ROWTHULA VARSHINI', '22A81A4352@sves.org.in', '$2y$10$ULDoj67P73I4w4fYNQT3S.28f6WLJCw21lNywvBBmWcuaJVhqPb9G', 'student', 'CAI', '22A81A4352', '8247336585', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 8.15, 7.77, 8.53, 8.58, 8.47, 9.02, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SINGAMSETTI SYAMANTH UMA SAI KIRAN', '22A81A4353@sves.org.in', '$2y$10$Spox8hrmoLn1HlJIYYYcPeURJLVAnp0.GnZrN4ISi3Zbro0GqOlMu', 'student', 'CAI', '22A81A4353', '7671888674', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.61, 9.0, 7.69, 8.69, 8.6, 8.88, 8.47, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SAKILE BALU MAHENDRA', '22A81A4355@sves.org.in', '$2y$10$5Ip7TJHJc5xCgSYD6CgYbunEunCc0exkkdfKyJAP86VvcBXe5k1Xm', 'student', 'CAI', '22A81A4355', '9491919575', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.28, 8.77, 8.15, 8.2, 7.91, 8.33, 8.6, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SALADI DEEPIKA', '22A81A4356@sves.org.in', '$2y$10$t4z/pcrTJyfu.dkIW19htOf/qP3AbagA30HGPDdESmynAqCVQH9nu', 'student', 'CAI', '22A81A4356', '9392499985', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.28, 9.62, 8.92, 9.29, 8.65, 9.72, 9.72, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SARIKA CHANDU SRI VENKATA PAVAN KUMAR', '22A81A4357@sves.org.in', '$2y$10$icf.Eyx0nkxsppYWFw6ECuB4WEsKAY4uPjnhuqocQIi5AFG36dy2C', 'student', 'CAI', '22A81A4357', '9014664141', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.18, 8.15, 7.62, 8.04, 7.7, 8.86, 8.21, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SIDDHA VINAY KUMAR', '22A81A4359@sves.org.in', '$2y$10$pqQ7doY.EjHa/1AQsbkERuAxoEQQJev7n80ojSoZGmt5W/PXN4WCK', 'student', 'CAI', '22A81A4359', '9849372827', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.02, 9.38, 9.08, 8.71, 8.74, 9.3, 9.16, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TATINI PRUDHVI SARANYA', '22A81A4361@sves.org.in', '$2y$10$uWPRLctL4lceYdPezggvbeJ/D0YatHYIjzgwxS9UPoStp50aHks8W', 'student', 'CAI', '22A81A4361', '6301669596', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.79, 9.08, 8.46, 9.0, 8.33, 8.88, 8.88, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('THOTA AMRUTHA SINDHU', '22A81A4362@sves.org.in', '$2y$10$b4lV52JcHFDw4cP6SqTaFOiZ2niUVLeWE9vu6tMVzBqB6KcHkUc1W', 'student', 'CAI', '22A81A4362', '8919239911', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.0, 9.69, 9.0, 9.18, 8.74, 9.02, 8.88, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEERABATTHULA SAI CHANDANA', '22A81A4364@sves.org.in', '$2y$10$QcTU4XITVCvcecAo/NPfL.TQ/xeaFVu2mtsCcK4.L2Jq51Qmmvq8i', 'student', 'CAI', '22A81A4364', '9581356416', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.01, 9.31, 8.69, 8.9, 8.74, 9.3, 9.16, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VUDATHA PAVANI SRI LAKSHMI SAVITHRI', '22A81A4365@sves.org.in', '$2y$10$he1bsvP6Pdu2KCE7jpq5AOkxoztqmxkcGr2bI.ffKr6fAbAIIAJRW', 'student', 'CAI', '22A81A4365', '9951251096', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.96, 9.38, 8.92, 9.35, 8.3, 9.3, 9.16, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADDAGALLA REKHA SREE LAKSHMI HARI PRIYA', '22A81A4367@sves.org.in', '$2y$10$Wc1ih8sJZgj0dsmCsqpn0ezT58FX5hy5RexxKo39SjpquKURzLijC', 'student', 'CAI', '22A81A4367', '9441912666', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.58, 8.77, 8.0, 8.98, 8.26, 8.53, 8.81, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AINAPURAPU L M DATHA BHASKARA GOPAL', '22A81A4368@sves.org.in', '$2y$10$Ms/YFwr1V4oU2/OI0EMD6eMdVIqIPumc1TooDomGXbKWDUwa7wuGS', 'student', 'CAI', '22A81A4368', '7569882778', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.19, 8.54, 7.77, 8.1, 7.91, 8.6, 8.53, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ALLADI PRIYA VARSHINI BHANU SREE', '22A81A4370@sves.org.in', '$2y$10$zeLdxDeeX/MKoLOjj5FUOetVlMc8rkLm.9mG/gDDL66Q0n6aqQVDa', 'student', 'CAI', '22A81A4370', '9959299885', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.54, 9.0, 7.23, 8.45, 8.19, 8.95, 9.3, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ALLI VENKATA SAI SURYA DIWAKAR', '22A81A4371@sves.org.in', '$2y$10$KoVa5Z8G7iu0P2Vm9HFmVeKecOjwwYDC7FgiCkXaRaS6ysnC1zqdu', 'student', 'CAI', '22A81A4371', '6302722352', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.11, 9.31, 8.92, 9.41, 9.02, 9.07, 9.3, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AMBADIPUDI ABRAHAM KRUPA KIRAN SARMA', '22A81A4372@sves.org.in', '$2y$10$d2dUgBVRlh5c5pU2A6jazuk6vr96zJH3b3C/DOVwkhEypJB35KqmK', 'student', 'CAI', '22A81A4372', '9391115911', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.21, 8.46, 7.23, 8.04, 7.77, 8.81, 8.47, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AVULA KRISHNA VENKATA KOUSHIK', '22A81A4374@sves.org.in', '$2y$10$3zBylAZz0GF8vgsUL49s6u9YNWvDIzX03tGAY6dFhfijuHUdYNvdm', 'student', 'CAI', '22A81A4374', '7382484830', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.25, 8.62, 7.77, 8.69, 7.56, 8.23, 8.53, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BATHULA SAI CHARAN', '22A81A4375@sves.org.in', '$2y$10$MtCMzNPJ8ZE71P9SztN.X.TOb3e06B9bSODS.LSDH9K0bJSfVevE.', 'student', 'CAI', '22A81A4375', '6309444011', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.99, 9.38, 8.69, 9.06, 8.74, 9.0, 9.09, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BATTELANKA PARASURAM SAI KUMAR', '22A81A4376@sves.org.in', '$2y$10$Huvw9qhIohFE3qoEuiFj8eiKQZ97Jx4nqXuVdbKj9qLzNT1McVno.', 'student', 'CAI', '22A81A4376', '6303598606', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.99, 8.62, 7.0, 7.92, 7.28, 7.81, 8.53, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BUDDIGA SRIRAM', '22A81A4377@sves.org.in', '$2y$10$CEtpugPZQwooRVbJV3DvMeU3cewvlY74dsPOgg0QkOFU1NvbY/PEa', 'student', 'CAI', '22A81A4377', '9032881413', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.28, 8.62, 7.69, 8.71, 8.05, 8.19, 8.67, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHINIMILLI GNANA DEVI PRASANNA', '22A81A4378@sves.org.in', '$2y$10$3owQ7Tc2NvfWEDchS.H17.H99Bk4CbU66caUJ3NLfZHMCxzYUBleW', 'student', 'CAI', '22A81A4378', '6281659967', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.01, 8.08, 7.77, 8.22, 7.77, 7.67, 8.19, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DANDAMUDI VARUN', '22A81A4379@sves.org.in', '$2y$10$OpsPszvTlCw5zLM844the.YGScbfKtjAEkfdPEiZ.yrSwHyDVNXkq', 'student', 'CAI', '22A81A4379', '8309352741', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.49, 9.08, 8.0, 8.47, 7.98, 8.88, 8.33, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DWARAMPUDI LOKESH ADHIREDDY', '22A81A4381@sves.org.in', '$2y$10$77rXRK9cSXzex1E1xIccGu2O3rDRD2D4/trLBjp2EA7XGURsiAKoa', 'student', 'CAI', '22A81A4381', '9391598334', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.31, 9.0, 7.85, 8.57, 8.33, 8.02, 7.98, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GODITI SRI DEEPTI', '22A81A4384@sves.org.in', '$2y$10$DReOercZwIiRn3xwMKMvkO7heAXLvwaSBgi4dko6615xHmRpvT./O', 'student', 'CAI', '22A81A4384', '8260936009', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.79, 9.23, 7.92, 9.06, 8.81, 8.74, 9.02, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GRANDHI DILEEP KUMAR', '22A81A4385@sves.org.in', '$2y$10$bAOpRQxCoxxSqLOY2ntqR.25kJRwotoS/zAzVy57uF4W/I7mv2rKi', 'student', 'CAI', '22A81A4385', '9848576525', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.92, 8.15, 8.71, 8.05, 9.02, 8.47, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUDIMELLA PAVANI VAISHNAVI', '22A81A4386@sves.org.in', '$2y$10$wuI8EhDhEffAhUkO/To8Tex/tc0/kpUoSrtGNdjTZMlzEzkxLHOfO', 'student', 'CAI', '22A81A4386', '9014756327', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.41, 9.38, 7.77, 8.69, 8.19, 8.19, 8.6, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JAVVADI HARSHITHA', '22A81A4389@sves.org.in', '$2y$10$3xcY/9tmXqDHpJDw2ImlB.bYMNn3mb.8lD97EGUaNPVNdii2DJitm', 'student', 'CAI', '22A81A4389', '6281732203', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.8, 9.38, 8.77, 8.94, 8.26, 9.16, 8.88, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JAYAVARAPU RAHITYA', '22A81A4390@sves.org.in', '$2y$10$Z9MTr2EjZUOdKulOCKuzROygKX4JTnw2SS2Pm2myCW2z1ALu8Yzoe', 'student', 'CAI', '22A81A4390', '6304919558', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.83, 9.23, 8.69, 8.86, 9.02, 9.02, 8.53, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANTAMSETTI PUJITHA JYOTHI', '22A81A4393@sves.org.in', '$2y$10$TH69MzssQrgwUU1gM93YZ.e/e6U/dQvFrQsIUe7uoxudS8ENhVbOG', 'student', 'CAI', '22A81A4393', '7989474795', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.22, 9.54, 9.0, 9.41, 9.09, 9.35, 9.16, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KONDETI GAYATHRI VARAPRASADHINI', '22A81A4395@sves.org.in', '$2y$10$VD8iR.SPh85I5YFRgmovvOpMkPE.mqUYVsVlk57rNemgyY9hyn9V2', 'student', 'CAI', '22A81A4395', '9912553797', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.62, 9.23, 8.54, 8.59, 8.26, 9.07, 8.47, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KUNCHE MOUNIKA', '22A81A4397@sves.org.in', '$2y$10$WT6Eg6cM7qOZ0O0gPn139eyHY5Qzbws/ZSRj4/VLPYocCYHiVwrqa', 'student', 'CAI', '22A81A4397', '9912941833', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.45, 9.15, 7.38, 8.63, 8.26, 9.02, 8.53, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('LINGAMPALLI BHARGAV SAI', '22A81A4398@sves.org.in', '$2y$10$0T05J.SWzCih8TLTyeH8.uzmQIrzJtUwErPniv5ebq51NzblzNWte', 'student', 'CAI', '22A81A4398', '9390192684', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.46, 9.15, 8.23, 8.94, 7.42, 8.93, 8.12, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MAIPALA CHIRANJEEVI', '22A81A4399@sves.org.in', '$2y$10$/hGSe0hd3Yymw2kOKBpmAeLIywmYRnGph9P/Gk3h3et3sq.BsAtrS', 'student', 'CAI', '22A81A4399', '9121859628', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 9.38, 8.54, 9.18, 8.67, 9.07, 8.95, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANGINA PAVAN KUMAR PURNAYYA', '22A81A43A1@sves.org.in', '$2y$10$JisVg8uyKsL/xiJbexI43upGpb.RlQsUK/fcVL/AZw..ANTo0vP7C', 'student', 'CAI', '22A81A43A1', '6281406054', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.68, 9.0, 8.23, 8.71, 8.33, 9.28, 8.47, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEDANKULA TEJASWIN', '22A81A43A2@sves.org.in', '$2y$10$lZ56sbitJkaJJQi6VqJjj.ZMvcsLKkf8ZrcAyrStNGvH2R1SseLaW', 'student', 'CAI', '22A81A43A2', '8639432353', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.37, 9.08, 8.0, 8.47, 8.26, 8.02, 8.53, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NETHI SRI CHARAN MANI MALLESH', '22A81A43A5@sves.org.in', '$2y$10$xDjFBK2GzxyjdbbLns.uDOx1IyXAx.12xRkQPc2iB9Ktdr30X0txG', 'student', 'CAI', '22A81A43A5', '6301908108', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.89, 9.54, 8.85, 9.18, 8.4, 9.23, 8.4, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NILLA NANDINI VEERA NAGA LAKSHMI', '22A81A43A8@sves.org.in', '$2y$10$JfkG2GS0p3lOtCrZn74StObSnvswuLKAHEk33rAZyZH51dSFrlWD2', 'student', 'CAI', '22A81A43A8', '7032459373', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.07, 9.54, 9.0, 8.94, 8.6, 9.42, 9.16, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PASAM HEMA PAVANI SAI DURGA', '22A81A43A9@sves.org.in', '$2y$10$58se1V8ArKoZikxez8r20eBtleftrADa9sO/VTIt0xqzTnCUDONnu', 'student', 'CAI', '22A81A43A9', '9885155678', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.8, 9.08, 9.0, 8.75, 8.67, 8.72, 8.74, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PADILAM SAI RAM', '22A81A43B0@sves.org.in', '$2y$10$qGKMnbPkAdRSxnxD5N3t2uM3tJ9ij9qmKGRU6m0t6MM/b0lWl67ZW', 'student', 'CAI', '22A81A43B0', '7207385947', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.65, 9.08, 7.85, 8.71, 8.47, 8.4, 9.09, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PASUMARTHI HIMANTH NAGA CHARAN', '22A81A43B1@sves.org.in', '$2y$10$ABt56qFO40gFJN6h30r1k.D6tJkJXeBYqgMO0cT64RbTMnQzZLtni', 'student', 'CAI', '22A81A43B1', '6300114947', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.09, 9.69, 8.92, 9.04, 9.02, 9.21, 8.95, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PATURI JAYASREE', '22A81A43B2@sves.org.in', '$2y$10$fNsATVJNn40aE7wpB6RMl./O9l4/rCuuOUxN974upO64gg/40LvhW', 'student', 'CAI', '22A81A43B2', '9030798879', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.49, 9.38, 8.08, 8.71, 7.77, 8.81, 8.81, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PERUMALLA NITHIN', '22A81A43B4@sves.org.in', '$2y$10$sfCD4dXPt8XoAmY/XtkdUu3/L9NTm33/WEfl7p.Klj78U2o/CqJWa', 'student', 'CAI', '22A81A43B4', '6304550067', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.16, 9.0, 7.69, 8.33, 7.98, 8.51, 7.98, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PINNINTI DEEPTHI MAI', '22A81A43B5@sves.org.in', '$2y$10$PqOtLG2eGI5JEbDaGsO.9.kk/6AN3GZ3gaqSUpAROfgMaJCMvt2Ra', 'student', 'CAI', '22A81A43B5', '9390987468', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.22, 9.69, 9.0, 9.18, 9.02, 9.77, 9.16, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POKALA SAI KARTHIK', '22A81A43B6@sves.org.in', '$2y$10$MSz0Qf/XJFTe7qmvxxi/zeG5Q3f1oWjjKbyGEk.3HfiFpPVHGpqqu', 'student', 'CAI', '22A81A43B6', '7093592711', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.88, 9.62, 8.62, 8.76, 8.47, 8.79, 9.02, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SAMAYAMANTHULA SWARNA SRI', '22A81A43B8@sves.org.in', '$2y$10$zvSB5f3LxftdR.DE39kYLuEmhz0vCtNNi.83BOYUZlkfIRGvrDmmS', 'student', 'CAI', '22A81A43B8', '9110352849', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.54, 9.38, 8.31, 8.57, 8.33, 8.72, 8.33, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SANNAYILA DEEPTHI', '22A81A43B9@sves.org.in', '$2y$10$w65Z2N.4I/whU0IJNpN1W.cmHUtc36i3Fnt.ph4aqzHA8e8M/1C6.', 'student', 'CAI', '22A81A43B9', '9381698422', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.81, 9.15, 8.38, 9.06, 8.33, 9.35, 8.88, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SURAVARAPU MANASA VALLI', '22A81A43C1@sves.org.in', '$2y$10$xLekfVVFkm15Qj/fuOIzzuuUOgpKu9b7OSBqVgI.MaQXVQUkdk38S', 'student', 'CAI', '22A81A43C1', '8328252833', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.96, 9.23, 9.15, 9.29, 8.67, 9.21, 8.88, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SUTHAPALLI YASWANTH SRINIVAS GUPTHA', '22A81A43C2@sves.org.in', '$2y$10$EVCYhS2qvLnXh1doCD5q8.Ew.35TyGSnfak/5GnJPw6Bf6.aN7daG', 'student', 'CAI', '22A81A43C2', '8919645848', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.69, 9.15, 8.46, 9.06, 8.26, 8.74, 9.16, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UDISI RINA SAI LAKSHMI PRASANNA', '22A81A43C3@sves.org.in', '$2y$10$jQ4hj6NZvv60ocX.znRNzuVVXrzZR1nUasir0ABNnLwl6wiDfWGa6', 'student', 'CAI', '22A81A43C3', '9154556856', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.0, 9.46, 8.62, 9.18, 8.81, 9.21, 9.23, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ULASA KIRAN ADITYA', '22A81A43C4@sves.org.in', '$2y$10$2WyO3p69sNf90xvQz2YsT.GCUmxjCNnnncTxXVic68qb0Zru8oD5i', 'student', 'CAI', '22A81A43C4', '7330950541', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.63, 9.0, 7.62, 8.65, 8.6, 9.0, 9.09, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VADDI AMRUTHA', '22A81A43C5@sves.org.in', '$2y$10$HpQWEzrHIuXnISTs99Wyquz0fYCY2RWFv6HgzuHW8mUQE8.gnFTgy', 'student', 'CAI', '22A81A43C5', '9502973428', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.03, 8.92, 7.77, 8.57, 7.49, 7.81, 8.05, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VALLURI TEJASWI', '22A81A43C7@sves.org.in', '$2y$10$OjB/b5JGnblNPb5e5TdWtewH1me7FnrfZXiFaj9mjyqOLiZS1Yewq', 'student', 'CAI', '22A81A43C7', '6301342247', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.88, 7.46, 6.85, 8.04, 7.98, 8.51, 8.33, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEEDHI SONY', '22A81A43C8@sves.org.in', '$2y$10$7oz81Evc8uWUHtd.l6VAiuzhxzJ/IQy2Y9yjPqosVxyL6avdGYCLK', 'student', 'CAI', '22A81A43C8', '8639033911', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 7.15, 7.08, 8.22, 8.19, 8.65, 8.26, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEERAVALLI SATISH', '22A81A43C9@sves.org.in', '$2y$10$drPE1.f7ZISwhy44IoFtxOChU6lGJBQ7YAUzvtyJ.XU917ungTjvi', 'student', 'CAI', '22A81A43C9', '6303811212', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.87, 8.15, 7.0, 8.1, 7.7, 8.09, 7.98, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('Y GOPI PRADEEP KUMAR', '22A81A43D0@sves.org.in', '$2y$10$N2yZPhAXgOtMq3L6NPr1YOR4EpYYnjxLhbMhkueYRg.0gwrkJ6aJO', 'student', 'CAI', '22A81A43D0', '7093776351', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.22, 9.69, 9.0, 9.24, 8.6, 9.58, 9.44, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BANDI SEERSHIKA', '23A85A4301@sves.org.in', '$2y$10$yk53HNmBS7nqbmgzVuHTd.Dt9j2oI8jdTEVfCJIsfnd7ferbhTqHy', 'student', 'CAI', '23A85A4301', '7670846135', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.58, 0.0, 0.0, 8.65, 7.91, 8.88, 8.74, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DAKSHANADI KOWSALYA', '23A85A4302@sves.org.in', '$2y$10$4f9QTesiQuvpPDcxE2tZD.lP.GBWfNTytjCTwfmthbD6Vk0fhr6Ie', 'student', 'CAI', '23A85A4302', '8121056974', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.03, 0.0, 0.0, 9.0, 8.74, 9.02, 9.16, 9.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('IMANDI HEMANTH MEHER SRI RAM KUMAR', '23A85A4303@sves.org.in', '$2y$10$QiL7qvRXN5y/2VY8UDGdoefH0sZ36B7e7dp.Pm7s50cePQN5HstTy', 'student', 'CAI', '23A85A4303', '7981836768', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.27, 0.0, 0.0, 8.41, 7.35, 8.44, 8.58, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MURALA SASIDHAR', '23A85A4305@sves.org.in', '$2y$10$hfvp0GHsgfns2001boVLHOlLRMz.7RXokOY0Vu1/oaXJRt16qj20e', 'student', 'CAI', '23A85A4305', '9492593121', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.17, 0.0, 0.0, 7.41, 6.37, 7.07, 7.51, 7.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADDALA AAKASH', '23A85A4307@sves.org.in', '$2y$10$jdal4SAf5k3NiUT01kFJs.u/6iWCcrfe2jHSXYoRYFaaFHjezjS.u', 'student', 'CAI', '23A85A4307', '9603446337', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.39, 0.0, 0.0, 8.71, 8.26, 8.26, 8.67, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NANDAM MOHANA ADITYA', '23A85A4309@sves.org.in', '$2y$10$YZY7VIFQvdcEkaD/ndt7QeaeuQt3I7oGNBWiCWE5lScBjfK4GVGAq', 'student', 'CAI', '23A85A4309', '6303661939', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.89, 0.0, 0.0, 8.1, 7.7, 7.67, 7.98, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PONDURU TRIVENI', '23A85A4311@sves.org.in', '$2y$10$Rp2Vm3YwVjrNED2.AcCFZ.qKM7dcAekvHFQ7XQFCS0E.2PpJ3Kwzy', 'student', 'CAI', '23A85A4311', '9346109647', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.73, 0.0, 0.0, 9.06, 8.12, 8.74, 9.02, 8.61, 0.0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
UPDATE users SET is_submitted = 0 WHERE role = 'student';
