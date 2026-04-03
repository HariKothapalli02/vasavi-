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
VALUES ('ARAPUREDDY RAMA RANJITHA', '22A81A0103@sves.org.in', '9398576433', 'student', 'CE', '22A81A0103', '9398576433', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.7, 6.77, 7.69, 7.88, 7.42, 8.12, 7.74, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOLLA RAVI TEJA', '22A81A0106@sves.org.in', '7095337142', 'student', 'CE', '22A81A0106', '7095337142', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.6, 8.38, 8.92, 9.29, 8.33, 9.02, 8.26, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOMMIDI HARSHA PRIYA', '22A81A0107@sves.org.in', '7396110435', 'student', 'CE', '22A81A0107', '7396110435', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 7.77, 8.38, 8.25, 8.14, 8.47, 7.56, 8.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DANGETI KAVYASRI', '22A81A0110@sves.org.in', '7981556235', 'student', 'CE', '22A81A0110', '7981556235', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.47, 6.85, 6.69, 7.59, 7.65, 8.05, 7.74, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DARAPUREDDI RAJESWARI', '22A81A0111@sves.org.in', '9550334625', 'student', 'CE', '22A81A0111', '9550334625', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.37, 7.15, 8.69, 8.29, 8.28, 8.6, 8.74, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANDHAM BALA ANUHARIKA', '22A81A0115@sves.org.in', '8919613022', 'student', 'CE', '22A81A0115', '8919613022', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.23, 6.62, 7.38, 7.33, 7.21, 7.35, 7.49, 7.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANDIREDDY HEMANTH', '22A81A0117@sves.org.in', '6300229412', 'student', 'CE', '22A81A0117', '6300229412', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.76, 8.23, 8.92, 8.88, 8.67, 9.16, 8.47, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOLUGURI TANUJA', '22A81A0118@sves.org.in', '7569225179', 'student', 'CE', '22A81A0118', '7569225179', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.24, 5.92, 6.31, 7.59, 7.33, 7.67, 7.42, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KALAVAKUNTLA PAVANI DURGA', '22A81A0120@sves.org.in', '8125765299', 'student', 'CE', '22A81A0120', '8125765299', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.36, 8.08, 7.69, 8.53, 8.12, 8.95, 8.4, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOMMIREDDY JAYASRI', '22A81A0122@sves.org.in', '9515585575', 'student', 'CE', '22A81A0122', '9515585575', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 8.54, 8.77, 8.35, 8.09, 8.88, 8.05, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANNE PUJITA', '22A81A0128@sves.org.in', '9912515727', 'student', 'CE', '22A81A0128', '9912515727', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.3, 6.46, 7.08, 7.35, 7.53, 7.63, 7.21, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MIDATANI SINDHUSHA NAGA SRI', '22A81A0129@sves.org.in', '7337586784', 'student', 'CE', '22A81A0129', '7337586784', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.93, 8.92, 8.92, 9.41, 8.6, 9.58, 8.19, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TARAGALLA YASASRI VENKATA LAKSHMI', '22A81A0141@sves.org.in', '8500058067', 'student', 'CE', '22A81A0141', '8500058067', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.39, 6.46, 7.38, 7.51, 6.79, 7.91, 7.63, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AMBATI SURYA CHARAN', '23A85A0102@sves.org.in', '8121643757', 'student', 'CE', '23A85A0102', '8121643757', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 0.0, 0.0, 8.35, 8.58, 8.74, 8.12, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AMMIREDDI ESWARI DEVI', '23A85A0103@sves.org.in', '9182639275', 'student', 'CE', '23A85A0103', '9182639275', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.39, 0.0, 0.0, 8.84, 8.33, 8.51, 8.19, 8.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADHAVARAPU SAI SIVA SANTHOSH BABU', '23A85A0105@sves.org.in', '7386592365', 'student', 'CE', '23A85A0105', '7386592365', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.74, 0.0, 0.0, 9.18, 8.88, 8.6, 8.4, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NANDURI BHARATH UMA LAKSHMAN', '23A85A0107@sves.org.in', '7013749946', 'student', 'CE', '23A85A0107', '7013749946', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.07, 0.0, 0.0, 8.43, 7.79, 7.98, 7.63, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NETHALA TEJASWI', '23A85A0108@sves.org.in', '8317676245', 'student', 'CE', '23A85A0108', '8317676245', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.39, 0.0, 0.0, 9.65, 9.44, 9.58, 9.02, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SARIDE PRASANTH', '23A85A0110@sves.org.in', '8885019667', 'student', 'CE', '23A85A0110', '8885019667', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.88, 0.0, 0.0, 9.25, 8.6, 9.02, 8.88, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VINUKONDA RAMA SATYANARAYANA', '23A85A0111@sves.org.in', '7815866367', 'student', 'CE', '23A85A0111', '7815866367', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.46, 0.0, 0.0, 9.14, 8.05, 8.6, 8.12, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ANEGONDI TARUN KUMAR', '22A81A0501@sves.org.in', '8309196931', 'student', 'CSE', '22A81A0501', '8309196931', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.47, 8.85, 8.0, 8.94, 8.67, 8.16, 8.09, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BEELLA RUPADEVI', '22A81A0502@sves.org.in', '7672009595', 'student', 'CSE', '22A81A0502', '7672009595', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.84, 9.54, 8.54, 9.06, 8.95, 8.37, 8.72, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BHIMASINGI VENKATESWARA RAO', '22A81A0503@sves.org.in', '9491019773', 'student', 'CSE', '22A81A0503', '9491019773', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.56, 8.92, 9.08, 8.59, 8.33, 8.47, 8.47, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DONGA SANKAR', '22A81A0506@sves.org.in', '7569505631', 'student', 'CSE', '22A81A0506', '7569505631', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.27, 9.31, 8.08, 8.35, 8.6, 7.88, 7.47, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('EDUPALLI JESHITHA VENKAT', '22A81A0507@sves.org.in', '9182960108', 'student', 'CSE', '22A81A0507', '9182960108', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.82, 8.62, 6.85, 8.06, 7.49, 7.47, 8.02, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GARAKA TEJASWINI', '22A81A0509@sves.org.in', '6304787664', 'student', 'CSE', '22A81A0509', '6304787664', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.67, 9.23, 9.08, 8.71, 8.47, 8.74, 8.3, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GAVARA SREEJA', '22A81A0510@sves.org.in', '8688363045', 'student', 'CSE', '22A81A0510', '8688363045', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.72, 9.31, 9.38, 8.59, 8.88, 8.4, 8.23, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUBBALA MEGHANA', '22A81A0512@sves.org.in', '9398934454', 'student', 'CSE', '22A81A0512', '9398934454', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.92, 8.46, 6.85, 7.94, 7.84, 7.98, 7.98, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('IMMIDISETTI SAI GANESH', '22A81A0513@sves.org.in', '9346797159', 'student', 'CSE', '22A81A0513', '9346797159', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.2, 8.54, 7.54, 8.35, 8.33, 8.4, 7.98, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('INNI TANINKI', '22A81A0514@sves.org.in', '9573653146', 'student', 'CSE', '22A81A0514', '9573653146', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.22, 9.31, 8.92, 9.06, 9.51, 9.21, 9.37, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAMMILA SAI', '22A81A0516@sves.org.in', '8179077852', 'student', 'CSE', '22A81A0516', '8179077852', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.63, 8.0, 7.54, 7.71, 7.28, 7.84, 7.81, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANAK AGARWAL', '22A81A0517@sves.org.in', '9346857997', 'student', 'CSE', '22A81A0517', '9346857997', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.95, 9.46, 9.23, 9.06, 8.74, 8.88, 8.81, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KILARU KIRAN SRI SAI', '22A81A0520@sves.org.in', '9392642327', 'student', 'CSE', '22A81A0520', '9392642327', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 9.0, 7.92, 8.29, 7.98, 7.47, 8.02, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KURAM SUPREEYA', '22A81A0525@sves.org.in', '8886097298', 'student', 'CSE', '22A81A0525', '8886097298', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.75, 8.31, 6.46, 7.94, 7.56, 8.26, 7.49, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANEPALLI MUKESH CHANDRA RAMA GANESH', '22A81A0529@sves.org.in', '8074034884', 'student', 'CSE', '22A81A0529', '8074034884', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 8.62, 8.54, 8.65, 8.12, 8.6, 8.26, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEDAPATI VENKATA SAI ABHIRAM REDDY', '22A81A0530@sves.org.in', '7702980878', 'student', 'CSE', '22A81A0530', '7702980878', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 8.38, 7.46, 8.24, 7.49, 8.47, 7.81, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADEM JAYASRI', '22A81A0532@sves.org.in', '8019680503', 'student', 'CSE', '22A81A0532', '8019680503', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.54, 8.62, 8.62, 8.53, 8.4, 8.6, 8.3, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANDAPAKA BALAMADHURI', '22A81A0533@sves.org.in', '8074975372', 'student', 'CSE', '22A81A0533', '8074975372', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.95, 7.85, 8.08, 8.59, 7.56, 8.07, 7.53, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEDAPATI UMESH ANJAN', '22A81A0534@sves.org.in', '9346307371', 'student', 'CSE', '22A81A0534', '9346307371', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.62, 7.38, 6.77, 8.12, 7.35, 7.86, 7.81, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOHAMMAD AAKHIL', '22A81A0535@sves.org.in', '8919928452', 'student', 'CSE', '22A81A0535', '8919928452', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.04, 8.15, 7.15, 8.18, 8.05, 8.49, 8.19, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOLLI LOVARAJU', '22A81A0537@sves.org.in', '7993265890', 'student', 'CSE', '22A81A0537', '7993265890', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.66, 9.0, 7.77, 8.65, 8.67, 8.72, 8.93, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MUCHERLA UMA DEVI', '22A81A0538@sves.org.in', '9346696952', 'student', 'CSE', '22A81A0538', '9346696952', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.92, 7.54, 6.69, 8.35, 7.84, 8.51, 7.88, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAIDU KIRAN MAHESH', '22A81A0539@sves.org.in', '9392774033', 'student', 'CSE', '22A81A0539', '9392774033', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.62, 7.85, 7.31, 7.71, 7.7, 8.21, 7.35, 7.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAKKA SHARMILA', '22A81A0540@sves.org.in', '9912016003', 'student', 'CSE', '22A81A0540', '9912016003', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.07, 9.15, 8.92, 9.06, 8.74, 9.44, 9.35, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALAMATI LAHARI', '22A81A0541@sves.org.in', '9989334599', 'student', 'CSE', '22A81A0541', '9989334599', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 9.23, 9.08, 9.06, 8.81, 8.88, 9.3, 8.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALLA THRISHITHA', '22A81A0542@sves.org.in', '9676717115', 'student', 'CSE', '22A81A0542', '9676717115', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.86, 9.0, 8.54, 8.94, 8.74, 9.3, 8.95, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALLA VARSHITHA BANU', '22A81A0543@sves.org.in', '8985547973', 'student', 'CSE', '22A81A0543', '8985547973', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.22, 9.54, 9.38, 9.18, 9.02, 9.44, 9.16, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NARNI VASANTHI LAKSHMI PRIYA', '22A81A0544@sves.org.in', '7093544020', 'student', 'CSE', '22A81A0544', '7093544020', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.14, 9.85, 9.38, 8.94, 9.02, 9.3, 9.16, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NERUTURI SRAVANI', '22A81A0545@sves.org.in', '9493442866', 'student', 'CSE', '22A81A0545', '9493442866', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.66, 7.85, 6.31, 7.88, 7.14, 7.95, 8.19, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PADALA SAI KANAKA DURGA', '22A81A0546@sves.org.in', '9701749629', 'student', 'CSE', '22A81A0546', '9701749629', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 9.15, 7.77, 8.24, 8.33, 8.65, 8.81, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PATSA JNANA VENKATA SATYA SRI', '22A81A0547@sves.org.in', '9494418933', 'student', 'CSE', '22A81A0547', '9494418933', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.29, 9.85, 9.15, 9.65, 9.16, 9.44, 9.3, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PENMETSA SAI PHANEENDRA VARMA', '22A81A0548@sves.org.in', '9182838219', 'student', 'CSE', '22A81A0548', '9182838219', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.95, 9.38, 9.46, 9.24, 9.16, 8.37, 8.95, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PEREPU PUJITHA', '22A81A0549@sves.org.in', '8688079531', 'student', 'CSE', '22A81A0549', '8688079531', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.29, 9.62, 9.69, 9.29, 9.3, 9.35, 9.21, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PINDI MOUNIKA', '22A81A0550@sves.org.in', '9989646255', 'student', 'CSE', '22A81A0550', '9989646255', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.54, 9.08, 8.15, 8.82, 8.26, 8.37, 8.53, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POTHULA LALITHASRIPANI', '22A81A0551@sves.org.in', '9515071459', 'student', 'CSE', '22A81A0551', '9515071459', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.09, 9.54, 9.23, 9.29, 8.95, 8.81, 9.3, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('REDDY KEERTHI YUGASRI', '22A81A0554@sves.org.in', '7799551149', 'student', 'CSE', '22A81A0554', '7799551149', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 8.85, 8.54, 8.59, 8.4, 8.74, 7.79, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SUMA SREE MANDRU', '22A81A0560@sves.org.in', '9063285803', 'student', 'CSE', '22A81A0560', '9063285803', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.82, 9.15, 8.15, 9.29, 8.95, 8.88, 8.58, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('THANGUDU SHANMUKHA RAO', '22A81A0561@sves.org.in', '8712248783', 'student', 'CSE', '22A81A0561', '8712248783', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.51, 8.69, 8.0, 8.94, 8.6, 8.74, 8.33, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UNGATA YAMINI SAI SRI SUSEELA', '22A81A0563@sves.org.in', '7993692188', 'student', 'CSE', '22A81A0563', '7993692188', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.3, 9.62, 9.54, 9.06, 9.44, 9.56, 9.3, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VALLURI GOWTHAMI RUSHITHA', '22A81A0564@sves.org.in', '9392582344', 'student', 'CSE', '22A81A0564', '9392582344', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.93, 9.15, 8.69, 9.18, 8.74, 8.88, 9.16, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VANGALA MRUDULA', '22A81A0565@sves.org.in', '6281201159', 'student', 'CSE', '22A81A0565', '6281201159', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.46, 8.31, 8.0, 8.35, 8.74, 8.67, 8.74, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEERAMALLA VENKATA DURGA PARVATHI', '22A81A0566@sves.org.in', '8121837543', 'student', 'CSE', '22A81A0566', '8121837543', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.66, 8.77, 8.85, 8.71, 8.81, 8.6, 8.6, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADDALA GOPIKA ANJALI', '22A81A0567@sves.org.in', '9347514335', 'student', 'CSE', '22A81A0567', '9347514335', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.71, 8.62, 8.31, 8.43, 9.07, 8.88, 8.67, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ANNAPAREDDY PRAVEEN KUMAR', '22A81A0568@sves.org.in', '9866678399', 'student', 'CSE', '22A81A0568', '9866678399', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.65, 7.31, 7.38, 8.0, 7.63, 7.88, 7.63, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ANYAM VENKATA NAGA BHAVANI PAVAN KUMAR', '22A81A0569@sves.org.in', '9398585389', 'student', 'CSE', '22A81A0569', '9398585389', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 8.77, 7.54, 7.73, 7.98, 8.09, 8.53, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BODDETI KUSUMA', '22A81A0572@sves.org.in', '9963870893', 'student', 'CSE', '22A81A0572', '9963870893', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.8, 9.23, 8.31, 8.78, 8.95, 8.74, 8.88, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHEBOLU NAGA PRASANNA', '22A81A0574@sves.org.in', '9490549112', 'student', 'CSE', '22A81A0574', '9490549112', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.84, 8.77, 9.38, 8.86, 8.88, 8.47, 9.16, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHIDARALA DURGAPRASAD', '22A81A0575@sves.org.in', '9618808831', 'student', 'CSE', '22A81A0575', '9618808831', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.59, 8.69, 9.0, 8.94, 8.51, 8.37, 8.53, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DASARI KEERTHI RAJU', '22A81A0577@sves.org.in', '7207466128', 'student', 'CSE', '22A81A0577', '7207466128', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.32, 7.08, 7.31, 7.47, 7.0, 7.6, 6.98, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('EDUPALLI SUJITHA', '22A81A0578@sves.org.in', '8121736577', 'student', 'CSE', '22A81A0578', '8121736577', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.38, 8.69, 8.46, 8.78, 8.23, 8.74, 7.49, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('EEDARA TEJASWINI', '22A81A0579@sves.org.in', '9392418489', 'student', 'CSE', '22A81A0579', '9392418489', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.21, 9.69, 9.15, 9.41, 9.02, 8.81, 9.3, 9.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANDHAM HEMANTH SATYAVENKATA KRISHNAPRASAD', '22A81A0580@sves.org.in', '9652306468', 'student', 'CSE', '22A81A0580', '9652306468', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.81, 8.54, 7.77, 8.2, 7.33, 7.4, 7.47, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GADAMSETTI RAMALAKSHMI', '22A81A0581@sves.org.in', '9059318626', 'student', 'CSE', '22A81A0581', '9059318626', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.51, 8.69, 8.23, 8.82, 8.26, 8.33, 8.65, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUBBALA LOKESH', '22A81A0582@sves.org.in', '7995743710', 'student', 'CSE', '22A81A0582', '7995743710', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.01, 9.31, 9.08, 9.1, 9.16, 8.74, 8.81, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUDAPATI SAI SATYA GANAPATHI', '22A81A0583@sves.org.in', '9014889933', 'student', 'CSE', '22A81A0583', '9014889933', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 8.31, 8.0, 8.08, 8.19, 7.67, 7.91, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUTTULA SOMA DURGA ARJUN', '22A81A0584@sves.org.in', '7780733677', 'student', 'CSE', '22A81A0584', '7780733677', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.54, 8.38, 8.46, 8.9, 8.6, 8.72, 8.37, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KADIYAM DIVYA BHAVANI', '22A81A0588@sves.org.in', '9515767259', 'student', 'CSE', '22A81A0588', '9515767259', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.89, 9.08, 8.92, 9.02, 8.93, 8.95, 8.53, 8.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAKANI SRIPADHA', '22A81A0589@sves.org.in', '6300889541', 'student', 'CSE', '22A81A0589', '6300889541', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 8.15, 8.62, 8.71, 7.91, 7.74, 7.88, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARRI JAYA NAGA SRI', '22A81A0591@sves.org.in', '8019231338', 'student', 'CSE', '22A81A0591', '8019231338', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.49, 8.08, 8.31, 8.71, 8.74, 8.72, 8.02, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KESAVARAPU VENKATA SESHA PRASANNA VASAVI', '22A81A0594@sves.org.in', '7981879511', 'student', 'CSE', '22A81A0594', '7981879511', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.87, 9.0, 8.62, 9.1, 9.16, 9.02, 8.74, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOHAMMAD JAHEERUNNISA', '22A81A05A0@sves.org.in', '7569826345', 'student', 'CSE', '22A81A05A0', '7569826345', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.13, 9.38, 8.77, 9.18, 9.02, 9.02, 9.16, 9.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POSIMSETTY LEELA SESHA BALAJI', '22A81A05A7@sves.org.in', '8332955678', 'student', 'CSE', '22A81A05A7', '8332955678', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.27, 9.46, 9.38, 8.96, 9.35, 9.16, 9.16, 9.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PESARAGANTI HARSHAVARDHAN', '22A81A05A9@sves.org.in', '9515978355', 'student', 'CSE', '22A81A05A9', '9515978355', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.5, 8.46, 8.54, 8.22, 8.6, 8.58, 8.6, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAMOJU SAI KUMAR', '22A81A05B3@sves.org.in', '9177605366', 'student', 'CSE', '22A81A05B3', '9177605366', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.49, 9.15, 8.15, 8.25, 8.93, 8.51, 8.4, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SADANALA RAJASRI SIVA PRIYA', '22A81A05B4@sves.org.in', '7680011211', 'student', 'CSE', '22A81A05B4', '7680011211', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.03, 9.62, 9.08, 9.41, 9.3, 8.74, 8.53, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SANABOINA VAMSI NAGA SAI', '22A81A05B5@sves.org.in', '8555954068', 'student', 'CSE', '22A81A05B5', '8555954068', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.38, 7.38, 7.15, 7.53, 6.93, 7.33, 7.53, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SANAMANDRA VIJAYKUMAR', '22A81A05B6@sves.org.in', '8008787061', 'student', 'CSE', '22A81A05B6', '8008787061', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.93, 8.46, 7.69, 8.45, 8.16, 7.4, 7.77, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SHAIK AASHIMA FATHIMA', '22A81A05B7@sves.org.in', '9704924239', 'student', 'CSE', '22A81A05B7', '9704924239', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.85, 7.85, 8.9, 9.16, 8.3, 7.84, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TALLA SRINU', '22A81A05B8@sves.org.in', '7794969377', 'student', 'CSE', '22A81A05B8', '7794969377', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 8.85, 7.31, 8.9, 8.44, 8.3, 8.26, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TARAGALLA LAKSHMI AKHILA SWATHI', '22A81A05C0@sves.org.in', '7989790712', 'student', 'CSE', '22A81A05C0', '7989790712', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.45, 9.69, 9.54, 9.65, 9.72, 9.3, 9.02, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TATAVARTHI RISHI VARUN', '22A81A05C1@sves.org.in', '9347740140', 'student', 'CSE', '22A81A05C1', '9347740140', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.16, 9.46, 8.54, 9.65, 9.02, 9.3, 8.88, 9.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VANKAYALA GANESH SIVA SAI KRISHNA', '22A81A05C5@sves.org.in', '6300260522', 'student', 'CSE', '22A81A05C5', '6300260522', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.28, 8.85, 7.15, 8.47, 7.95, 8.65, 8.33, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VALLURI REETHI', '22A81A05C6@sves.org.in', '7995435659', 'student', 'CSE', '22A81A05C6', '7995435659', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.32, 8.85, 7.46, 8.47, 8.19, 8.37, 8.4, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VELAGALA VARSHA SRI', '22A81A05C8@sves.org.in', '9154972789', 'student', 'CSE', '22A81A05C8', '9154972789', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.6, 8.46, 7.69, 9.0, 8.42, 8.88, 8.67, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VELUGULA HEMANTH', '22A81A05C9@sves.org.in', '9542849956', 'student', 'CSE', '22A81A05C9', '9542849956', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.25, 8.46, 7.08, 8.67, 8.67, 7.88, 8.53, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEMULURI JAYA KANTH', '22A81A05D0@sves.org.in', '9573951246', 'student', 'CSE', '22A81A05D0', '9573951246', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.59, 8.15, 7.0, 7.92, 7.49, 7.33, 7.77, 7.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YADAVALLI LAKSHMI VYSHNAVI', '22A81A05D1@sves.org.in', '6301693123', 'student', 'CSE', '22A81A05D1', '6301693123', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.15, 9.23, 8.92, 9.1, 9.16, 9.3, 9.3, 9.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YALAMARTHI LAHARI', '22A81A05D2@sves.org.in', '6301833679', 'student', 'CSE', '22A81A05D2', '6301833679', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 8.38, 7.15, 8.43, 8.74, 8.6, 8.4, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADABALA UMA SAHITHI', '22A81A05D4@sves.org.in', '9346344262', 'student', 'CSE', '22A81A05D4', '9346344262', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.03, 9.38, 8.77, 9.06, 8.88, 9.02, 9.07, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AKULA MADHURI', '22A81A05D5@sves.org.in', '8341192827', 'student', 'CSE', '22A81A05D5', '8341192827', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.3, 8.15, 7.0, 8.18, 8.53, 9.16, 8.23, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ARIGELA RAMAKRISHNA VINAYAK', '22A81A05D6@sves.org.in', '9550461464', 'student', 'CSE', '22A81A05D6', '9550461464', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.14, 8.23, 7.38, 8.59, 7.91, 8.47, 8.4, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BODDU JAYANTH PATHRUDU', '22A81A05D9@sves.org.in', '9493422727', 'student', 'CSE', '22A81A05D9', '9493422727', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.1, 7.54, 7.62, 8.1, 8.33, 8.47, 8.05, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHALLA VISHNU VARDHAN', '22A81A05E0@sves.org.in', '8919758517', 'student', 'CSE', '22A81A05E0', '8919758517', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.99, 9.38, 8.92, 8.94, 9.02, 9.16, 8.88, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHIKKALA VYSHNAVI', '22A81A05E1@sves.org.in', '9390558534', 'student', 'CSE', '22A81A05E1', '9390558534', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.41, 8.38, 7.92, 8.82, 8.4, 8.53, 8.47, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DINDUKURTHI CHATURVED', '22A81A05E4@sves.org.in', '9059632955', 'student', 'CSE', '22A81A05E4', '9059632955', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.18, 8.08, 7.92, 8.33, 8.05, 8.67, 8.4, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ELIPE MOUNIKA', '22A81A05E5@sves.org.in', '9963129370', 'student', 'CSE', '22A81A05E5', '9963129370', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.11, 9.08, 9.08, 9.22, 9.02, 9.3, 9.3, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANNI MAHITHA LAKSHMI', '22A81A05E6@sves.org.in', '8179542429', 'student', 'CSE', '22A81A05E6', '8179542429', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.12, 9.15, 9.08, 9.29, 9.02, 9.44, 9.3, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GARAKA SNEHA LATHA', '22A81A05E7@sves.org.in', '9502048286', 'student', 'CSE', '22A81A05E7', '9502048286', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.12, 9.54, 8.77, 9.06, 8.88, 9.44, 9.3, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOLUGURI AYYAPPA SRI SAI REDDY', '22A81A05E8@sves.org.in', '9701539868', 'student', 'CSE', '22A81A05E8', '9701539868', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.78, 8.31, 7.31, 8.04, 7.0, 8.05, 8.02, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUBBALA VENKATA VARSHINI', '22A81A05E9@sves.org.in', '9912778655', 'student', 'CSE', '22A81A05E9', '9912778655', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 9.54, 8.92, 8.98, 8.88, 9.02, 8.79, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUNJI MADHU BABU', '22A81A05F1@sves.org.in', '8074440534', 'student', 'CSE', '22A81A05F1', '8074440534', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.55, 8.0, 6.31, 8.16, 7.63, 7.77, 7.56, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('INDUKURI MEGHASINDHU', '22A81A05F3@sves.org.in', '6302032121', 'student', 'CSE', '22A81A05F3', '6302032121', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.03, 9.54, 9.23, 8.86, 9.02, 9.02, 9.35, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOPPULA PAAVANI VENKATA SAI', '22A81A05F4@sves.org.in', '8331872336', 'student', 'CSE', '22A81A05F4', '8331872336', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.96, 9.23, 9.23, 8.71, 8.74, 8.95, 9.3, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANDIKATLA DHARANI', '22A81A05F5@sves.org.in', '8143914511', 'student', 'CSE', '22A81A05F5', '8143914511', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.57, 8.08, 7.38, 8.51, 8.67, 9.09, 9.44, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARRI ANJANI NAGA KOTESWARI', '22A81A05F6@sves.org.in', '6301837306', 'student', 'CSE', '22A81A05F6', '6301837306', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.66, 9.23, 8.31, 8.59, 8.33, 8.88, 9.02, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARRI SAI GOWRY VIKAS REDDY', '22A81A05F7@sves.org.in', '9908059846', 'student', 'CSE', '22A81A05F7', '9908059846', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.01, 9.0, 8.38, 9.1, 9.16, 9.44, 9.21, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KASINIKOTA VENKAT', '22A81A05F8@sves.org.in', '8374788644', 'student', 'CSE', '22A81A05F8', '8374788644', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.42, 7.77, 6.77, 7.88, 7.07, 7.56, 7.53, 7.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KATTA JAYA DURGA PEDDI LAKSHMI', '22A81A05F9@sves.org.in', '9177076673', 'student', 'CSE', '22A81A05F9', '9177076673', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.71, 8.46, 7.85, 8.59, 8.53, 9.44, 9.44, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KATTA PALLAVI DURGA YADAV', '22A81A05G0@sves.org.in', '9493043266', 'student', 'CSE', '22A81A05G0', '9493043266', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.28, 9.54, 9.08, 9.41, 9.3, 9.21, 9.72, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOTA NAGA MANJUSHA', '22A81A05G2@sves.org.in', '7993327777', 'student', 'CSE', '22A81A05G2', '7993327777', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.86, 9.0, 8.38, 8.82, 8.74, 9.16, 9.44, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MATTA PRATHYUSHA DHANA LAKSHMI', '22A81A05G3@sves.org.in', '9121802399', 'student', 'CSE', '22A81A05G3', '9121802399', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.94, 9.0, 8.54, 9.1, 9.02, 9.16, 9.02, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANDAPATI VIJAYA LAKSHMI', '22A81A05G5@sves.org.in', '6305442259', 'student', 'CSE', '22A81A05G5', '6305442259', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.58, 8.54, 7.31, 8.94, 8.53, 9.16, 9.02, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MAREEDU SAIRAM', '22A81A05G6@sves.org.in', '8501890522', 'student', 'CSE', '22A81A05G6', '8501890522', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.58, 9.0, 8.38, 8.59, 8.47, 8.88, 8.67, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOHAMMAD AZMATULLA', '22A81A05G8@sves.org.in', '7569512424', 'student', 'CSE', '22A81A05G8', '7569512424', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.63, 9.0, 8.08, 8.71, 8.19, 9.09, 8.88, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOHAMMAD RAHIMUNNISA', '22A81A05G9@sves.org.in', '9014022798', 'student', 'CSE', '22A81A05G9', '9014022798', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.14, 9.38, 8.15, 8.59, 7.91, 8.02, 7.84, 7.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MUKKU MOHITH', '22A81A05H1@sves.org.in', '9346370710', 'student', 'CSE', '22A81A05H1', '9346370710', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.47, 8.85, 8.54, 8.71, 8.19, 8.81, 8.26, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NANDAMURI LOKESH SRI ABHIRAM', '22A81A05H2@sves.org.in', '9014953519', 'student', 'CSE', '22A81A05H2', '9014953519', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.49, 8.38, 8.23, 8.86, 8.74, 8.95, 8.19, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NERELLA N S VENKATA SIVA SAI RIHITHA', '22A81A05H4@sves.org.in', '8790150978', 'student', 'CSE', '22A81A05H4', '8790150978', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.31, 9.38, 9.23, 9.41, 9.44, 9.58, 9.44, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALLAPOLU SAI MEGHANA', '22A81A05H5@sves.org.in', '9618692300', 'student', 'CSE', '22A81A05H5', '9618692300', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.19, 9.15, 8.69, 9.76, 9.16, 9.3, 9.44, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PANTHAGANI SWEETY', '22A81A05H6@sves.org.in', '9063672646', 'student', 'CSE', '22A81A05H6', '9063672646', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 8.08, 7.15, 8.24, 8.4, 8.33, 8.09, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PARIMI JNANA SAI', '22A81A05H7@sves.org.in', '6281815552', 'student', 'CSE', '22A81A05H7', '6281815552', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.58, 8.46, 8.31, 9.12, 8.47, 8.6, 8.47, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PAVANI PUNYAMANTHULA', '22A81A05H8@sves.org.in', '7569505926', 'student', 'CSE', '22A81A05H8', '7569505926', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.3, 9.31, 8.08, 8.94, 7.63, 8.4, 7.98, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PEDAMURTHI KIRANKUMAR', '22A81A05H9@sves.org.in', '9014268313', 'student', 'CSE', '22A81A05H9', '9014268313', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.73, 7.15, 7.31, 7.8, 8.33, 7.67, 7.67, 8.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PRATTI GAYATRI', '22A81A05I2@sves.org.in', '9390561761', 'student', 'CSE', '22A81A05I2', '9390561761', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.58, 8.92, 8.77, 9.06, 8.74, 8.67, 8.09, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAMBHA RASMITHA LEKHA', '22A81A05I6@sves.org.in', '9121487799', 'student', 'CSE', '22A81A05I6', '9121487799', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.99, 8.92, 9.23, 8.94, 9.44, 8.74, 8.95, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAPARLA PRASANNA KUMAR', '22A81A05I7@sves.org.in', '9392693465', 'student', 'CSE', '22A81A05I7', '9392693465', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.37, 9.08, 9.23, 9.18, 10.0, 9.58, 9.3, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SAMUDRALA S S N V RANGA DURGA MAHATHI', '22A81A05I9@sves.org.in', '8500012222', 'student', 'CSE', '22A81A05I9', '8500012222', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.05, 9.08, 8.77, 8.94, 9.3, 9.58, 8.88, 8.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TEKI VIJAYARATNAM', '22A81A05J2@sves.org.in', '8688132605', 'student', 'CSE', '22A81A05J2', '8688132605', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.16, 8.46, 8.0, 8.16, 8.33, 8.19, 7.56, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TUMMALAPALLI MANIKANTA VINAY', '22A81A05J3@sves.org.in', '9550085889', 'student', 'CSE', '22A81A05J3', '9550085889', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.76, 7.31, 7.31, 8.04, 7.91, 7.84, 7.74, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UMMIDI CHAITANYA SURYA SAI DEEPTHI', '22A81A05J4@sves.org.in', '8143163882', 'student', 'CSE', '22A81A05J4', '8143163882', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.76, 8.77, 8.31, 8.94, 9.02, 9.16, 8.6, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UKKUSURI VENKATA KRISHNA PRASAD', '22A81A05J5@sves.org.in', '9705849347', 'student', 'CSE', '22A81A05J5', '9705849347', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.47, 7.46, 7.38, 7.27, 7.21, 7.7, 7.49, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YARAMOLU LAKSHMI SADWIKA', '22A81A05J7@sves.org.in', '7989968788', 'student', 'CSE', '22A81A05J7', '7989968788', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.46, 8.69, 7.85, 8.35, 8.47, 8.6, 8.88, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YERRAGOLLA BHARGAVI', '22A81A05J8@sves.org.in', '9550223469', 'student', 'CSE', '22A81A05J8', '9550223469', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.64, 8.62, 8.31, 8.53, 8.88, 8.74, 9.16, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ALLU ROHINI JNANA PRASOONA', '22A81A05J9@sves.org.in', '9505268966', 'student', 'CSE', '22A81A05J9', '9505268966', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.38, 8.15, 7.23, 8.35, 8.23, 8.95, 9.02, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ANDRA TULASI LAKSHMI TANYA', '22A81A05K0@sves.org.in', '6302601497', 'student', 'CSE', '22A81A05K0', '6302601497', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.24, 9.54, 9.62, 8.94, 9.3, 9.02, 9.44, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ACHANTA MADHUR', '22A81A05K1@sves.org.in', '8712279935', 'student', 'CSE', '22A81A05K1', '8712279935', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.37, 9.54, 9.54, 9.29, 9.44, 9.3, 9.16, 9.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ACHYUTHA DURGA YASASWINI', '22A81A05K2@sves.org.in', '6301189990', 'student', 'CSE', '22A81A05K2', '6301189990', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.3, 9.54, 9.54, 9.18, 9.51, 9.02, 9.3, 9.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ANKADI UDAYA SRI', '22A81A05K3@sves.org.in', '8519817259', 'student', 'CSE', '22A81A05K3', '8519817259', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 8.62, 8.08, 7.88, 8.6, 8.47, 9.02, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('APPASANI JYOTHI PRANEETHA', '22A81A05K4@sves.org.in', '7993863539', 'student', 'CSE', '22A81A05K4', '7993863539', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 9.38, 8.69, 8.65, 8.74, 9.16, 8.74, 9.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BADAMPUDI SRIYA', '22A81A05K5@sves.org.in', '9502182533', 'student', 'CSE', '22A81A05K5', '9502182533', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.8, 9.08, 9.08, 8.59, 8.67, 8.65, 9.02, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BANDARU UMA DEVI', '22A81A05K6@sves.org.in', '7075664542', 'student', 'CSE', '22A81A05K6', '7075664542', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.54, 8.62, 8.31, 8.18, 8.47, 8.6, 9.16, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BHUSHI BINNU ANURAGH', '22A81A05K9@sves.org.in', '9393397621', 'student', 'CSE', '22A81A05K9', '9393397621', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.76, 7.23, 7.0, 7.86, 7.7, 7.98, 8.19, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOKKA KUSUMA SRI', '22A81A05L0@sves.org.in', '7207431798', 'student', 'CSE', '22A81A05L0', '7207431798', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.14, 9.38, 8.77, 9.18, 9.07, 9.44, 9.16, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BURILA RAMYA', '22A81A05L1@sves.org.in', '9121553665', 'student', 'CSE', '22A81A05L1', '9121553665', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.76, 8.46, 8.0, 9.06, 8.65, 9.02, 9.37, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHINTAPALLI LOKESH', '22A81A05L2@sves.org.in', '9908872977', 'student', 'CSE', '22A81A05L2', '9908872977', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.19, 9.38, 9.23, 9.53, 9.16, 9.3, 9.16, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DARLA JYOTHSNA', '22A81A05L3@sves.org.in', '9391681988', 'student', 'CSE', '22A81A05L3', '9391681988', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 8.08, 8.77, 8.53, 8.42, 8.88, 8.53, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DASU RAJA GOPAL', '22A81A05L5@sves.org.in', '7036619772', 'student', 'CSE', '22A81A05L5', '7036619772', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.58, 8.0, 6.92, 7.51, 7.56, 7.63, 7.49, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DOPPASANI VENKATESH', '22A81A05L7@sves.org.in', '9110561475', 'student', 'CSE', '22A81A05L7', '9110561475', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.73, 8.0, 7.38, 7.88, 7.56, 7.42, 7.77, 8.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('EERLA PREM CHANDU', '22A81A05L9@sves.org.in', '7093790711', 'student', 'CSE', '22A81A05L9', '7093790711', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.77, 7.62, 7.62, 8.45, 7.4, 7.91, 7.84, 7.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GAMINI PAPA RATNA SRI PRAVEENA', '22A81A05M0@sves.org.in', '9963477168', 'student', 'CSE', '22A81A05M0', '9963477168', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.93, 9.54, 8.77, 8.59, 8.88, 9.02, 9.02, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUBBALA ANUDEEPIKA', '22A81A05M1@sves.org.in', '9182114749', 'student', 'CSE', '22A81A05M1', '9182114749', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.94, 9.77, 8.69, 9.06, 8.65, 8.74, 9.02, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUBBALA SATISH', '22A81A05M2@sves.org.in', '7075753498', 'student', 'CSE', '22A81A05M2', '7075753498', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.15, 7.85, 8.08, 8.12, 7.95, 8.02, 8.33, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAKARLA SUBHASH', '22A81A05M4@sves.org.in', '9550583815', 'student', 'CSE', '22A81A05M4', '9550583815', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.49, 7.62, 6.92, 7.51, 7.33, 7.56, 7.28, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAVALA DHANUSH GOPI', '22A81A05M6@sves.org.in', '6281716735', 'student', 'CSE', '22A81A05M6', '6281716735', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.04, 9.31, 9.0, 8.94, 9.16, 9.16, 8.74, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEDEPALLI TRIVENI', '22A81A05N0@sves.org.in', '6305456772', 'student', 'CSE', '22A81A05N0', '6305456772', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.78, 9.46, 8.54, 8.82, 8.88, 8.6, 8.74, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MULLAPUDI APARNA', '22A81A05N2@sves.org.in', '9885849927', 'student', 'CSE', '22A81A05N2', '9885849927', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.92, 9.38, 9.0, 8.82, 8.53, 9.09, 8.6, 9.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAYUDU RATNA SITARA', '22A81A05N4@sves.org.in', '6303915133', 'student', 'CSE', '22A81A05N4', '6303915133', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.75, 8.77, 8.23, 8.71, 8.81, 9.16, 8.6, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('OBHILISETTI DHANUSH', '22A81A05N7@sves.org.in', '9346475931', 'student', 'CSE', '22A81A05N7', '9346475931', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 7.38, 6.62, 8.47, 7.98, 8.33, 8.6, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PACHIGOLLA VENKATA SANDEEP', '22A81A05N8@sves.org.in', '8688213171', 'student', 'CSE', '22A81A05N8', '8688213171', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.22, 7.92, 7.54, 8.65, 7.65, 8.47, 8.74, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PADAMATA PURNASAI', '22A81A05N9@sves.org.in', '8919233703', 'student', 'CSE', '22A81A05N9', '8919233703', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.31, 8.77, 8.69, 8.07, 8.53, 8.88, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALLI PALLAVI SATYA', '22A81A05O0@sves.org.in', '8008101249', 'student', 'CSE', '22A81A05O0', '8008101249', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.27, 9.38, 8.92, 9.18, 9.44, 9.44, 9.44, 9.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PEKETI YAJNICA SAI', '22A81A05O1@sves.org.in', '6303050173', 'student', 'CSE', '22A81A05O1', '6303050173', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 8.62, 7.85, 8.12, 8.33, 8.6, 8.74, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PILLA MADHAV GANESH', '22A81A05O2@sves.org.in', '8919420562', 'student', 'CSE', '22A81A05O2', '8919420562', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.79, 7.85, 6.62, 7.59, 7.47, 8.12, 8.23, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POTNURI CHAITANYA', '22A81A05O4@sves.org.in', '6305484994', 'student', 'CSE', '22A81A05O4', '6305484994', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.59, 8.85, 8.92, 8.71, 8.35, 8.3, 8.47, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PULUGU SAKULJI', '22A81A05O5@sves.org.in', '7013567728', 'student', 'CSE', '22A81A05O5', '7013567728', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.18, 8.15, 7.77, 8.59, 7.98, 8.19, 8.12, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RACHURI HARISH', '22A81A05O7@sves.org.in', '9908545726', 'student', 'CSE', '22A81A05O7', '9908545726', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.16, 8.54, 7.85, 8.35, 8.16, 7.6, 8.44, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SADA RAMYA', '22A81A05O8@sves.org.in', '9502391167', 'student', 'CSE', '22A81A05O8', '9502391167', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.99, 9.08, 8.85, 9.29, 9.02, 9.16, 8.93, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SODIMELLA LAVANYA', '22A81A05P2@sves.org.in', '7013666565', 'student', 'CSE', '22A81A05P2', '7013666565', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.55, 8.92, 7.85, 8.53, 8.72, 8.74, 8.6, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TAMARADA RUPA SARASWATHI', '22A81A05P3@sves.org.in', '7702678743', 'student', 'CSE', '22A81A05P3', '7702678743', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.88, 9.23, 8.46, 8.82, 8.72, 9.37, 8.88, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TANETI RAKESH', '22A81A05P4@sves.org.in', '8466858878', 'student', 'CSE', '22A81A05P4', '8466858878', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.51, 8.46, 8.46, 8.47, 8.37, 8.74, 8.6, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UKKUSURI SIVA KRISHNA', '22A81A05P6@sves.org.in', '8374527123', 'student', 'CSE', '22A81A05P6', '8374527123', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.16, 8.38, 8.0, 7.92, 7.91, 8.6, 8.23, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UNGARALA LEELA KRISHNA MANIKANTA', '22A81A05P7@sves.org.in', '8074322939', 'student', 'CSE', '22A81A05P7', '8074322939', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.2, 8.38, 7.62, 8.59, 8.49, 8.47, 8.12, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VAJHULA JAHNAVI SRIVALLI', '22A81A05P8@sves.org.in', '6303431118', 'student', 'CSE', '22A81A05P8', '6303431118', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.92, 8.54, 7.92, 7.08, 7.74, 8.47, 7.81, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VASA BABY PRANEETHA', '22A81A05P9@sves.org.in', '9032636196', 'student', 'CSE', '22A81A05P9', '9032636196', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 8.46, 7.54, 8.06, 7.88, 8.26, 8.3, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VATHUMILLI LAKSHMI SRI SAI GANESH', '22A81A05Q0@sves.org.in', '8008149866', 'student', 'CSE', '22A81A05Q0', '8008149866', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.26, 9.0, 8.23, 8.24, 7.84, 8.47, 8.51, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEERAMALLU HARIKA SRI', '22A81A05Q1@sves.org.in', '8125627996', 'student', 'CSE', '22A81A05Q1', '8125627996', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.83, 8.38, 7.38, 7.94, 7.4, 8.02, 7.98, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEGIREDDY GAGAN VAISHNAV TEJ', '22A81A05Q2@sves.org.in', '9347974737', 'student', 'CSE', '22A81A05Q2', '9347974737', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.64, 9.0, 8.69, 8.78, 8.67, 8.88, 8.47, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YANDAMURI LIKHITA SAI', '22A81A05Q4@sves.org.in', '8074607919', 'student', 'CSE', '22A81A05Q4', '8074607919', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.88, 9.54, 8.54, 8.71, 9.07, 9.23, 9.02, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BURADA DAAKSHINYA', '23A85A0501@sves.org.in', '8639436070', 'student', 'CSE', '23A85A0501', '8639436070', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.48, 0.0, 0.0, 8.47, 8.6, 8.51, 8.6, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANDI GEETHA SRILAKSHMI', '23A85A0502@sves.org.in', '9000278936', 'student', 'CSE', '23A85A0502', '9000278936', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.01, 0.0, 0.0, 9.18, 8.88, 8.86, 9.58, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAICHARLA VANI ISWARYA', '23A85A0503@sves.org.in', '9391232049', 'student', 'CSE', '23A85A0503', '9391232049', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.01, 0.0, 0.0, 8.82, 8.95, 9.16, 9.3, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAMMILI MANOJ VAMSI', '23A85A0504@sves.org.in', '9398049662', 'student', 'CSE', '23A85A0504', '9398049662', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.39, 0.0, 0.0, 8.59, 8.26, 8.72, 8.3, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAMIREDDY NAVANEETH', '23A85A0508@sves.org.in', '8074489477', 'student', 'CSE', '23A85A0508', '8074489477', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.02, 0.0, 0.0, 7.88, 7.98, 8.09, 8.4, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANCHARLA SRI NAGA SURYA SATYA SAI HEMANTH', '23A85A0509@sves.org.in', '9618293059', 'student', 'CSE', '23A85A0509', '9618293059', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.52, 0.0, 0.0, 7.35, 7.35, 7.74, 7.56, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YERRA LALITHA', '23A85A0513@sves.org.in', '9392996091', 'student', 'CSE', '23A85A0513', '9392996091', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.78, 0.0, 0.0, 7.71, 7.49, 7.47, 7.91, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AGARTHI VENKATA RAMANA', '23A85A0514@sves.org.in', '8686645005', 'student', 'CSE', '23A85A0514', '8686645005', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 0.0, 0.0, 7.98, 7.63, 8.12, 8.37, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHERUKU VEERA VENKATA DURGA LAKSHMI', '23A85A0515@sves.org.in', '6300209727', 'student', 'CSE', '23A85A0515', '6300209727', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 0.0, 0.0, 7.47, 7.35, 8.26, 8.19, 8.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DWARAMPUDI SAI PAVAN MANIKANTAN REDDY', '23A85A0516@sves.org.in', '9014786685', 'student', 'CSE', '23A85A0516', '9014786685', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.42, 0.0, 0.0, 7.27, 7.42, 7.12, 6.91, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SOMA AMRUTHA VARSHINI', '23A85A0518@sves.org.in', '9390697594', 'student', 'CSE', '23A85A0518', '9390697594', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.41, 0.0, 0.0, 8.18, 8.26, 8.47, 8.53, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ABBABATHULA SIRISHA', '23A85A0520@sves.org.in', '9391955329', 'student', 'CSE', '23A85A0520', '9391955329', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.04, 0.0, 0.0, 7.59, 7.77, 8.19, 8.23, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DODDA BHAVANA VAISHNAVI', '23A85A0522@sves.org.in', '9908002569', 'student', 'CSE', '23A85A0522', '9908002569', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.44, 0.0, 0.0, 8.24, 8.14, 8.53, 8.51, 8.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ELIGANTI BALA KRISHNA', '23A85A0523@sves.org.in', '8978819688', 'student', 'CSE', '23A85A0523', '8978819688', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.82, 0.0, 0.0, 8.04, 7.3, 8.05, 7.74, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NEELAM UMA VENKATA NAGA RAJU', '23A85A0525@sves.org.in', '9392511479', 'student', 'CSE', '23A85A0525', '9392511479', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.68, 0.0, 0.0, 7.88, 7.12, 7.0, 7.81, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AJAY VARDHAN BALINA', '22A81A0401@sves.org.in', '9849966697', 'student', 'ECE', '22A81A0401', '9849966697', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.39, 8.54, 8.38, 8.33, 8.12, 8.65, 8.4, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AMJURI SOWMYA SRI', '22A81A0403@sves.org.in', '9492920461', 'student', 'ECE', '22A81A0403', '9492920461', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.16, 8.46, 8.54, 7.94, 7.56, 8.65, 8.09, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BANDUCHODE SHANVITH SAI', '22A81A0404@sves.org.in', '7013227750', 'student', 'ECE', '22A81A0404', '7013227750', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.59, 8.15, 7.77, 8.1, 7.35, 8.09, 7.49, 6.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOMMA LEELA SRI SINDHU', '22A81A0406@sves.org.in', '7995889161', 'student', 'ECE', '22A81A0406', '7995889161', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.84, 8.54, 8.08, 7.63, 7.42, 7.88, 7.81, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BORRA RAMANJALI', '22A81A0407@sves.org.in', '8179474231', 'student', 'ECE', '22A81A0407', '8179474231', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.94, 9.46, 8.85, 8.43, 8.88, 9.44, 9.02, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BURUGUPALLI SINDHU', '22A81A0408@sves.org.in', '9346418624', 'student', 'ECE', '22A81A0408', '9346418624', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.03, 8.62, 7.69, 7.82, 8.05, 8.23, 8.09, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHITROJU YASASWINI KEERTHI', '22A81A0411@sves.org.in', '9885465529', 'student', 'ECE', '22A81A0411', '9885465529', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.38, 7.46, 7.62, 7.27, 7.42, 7.74, 7.28, 6.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('EPI THANISHKA', '22A81A0417@sves.org.in', '9133922748', 'student', 'ECE', '22A81A0417', '9133922748', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.02, 8.31, 8.15, 7.63, 7.42, 8.74, 8.47, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANDROTHU BHAVANI', '22A81A0418@sves.org.in', '9121475339', 'student', 'ECE', '22A81A0418', '9121475339', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.64, 7.38, 8.31, 7.18, 7.35, 8.12, 7.63, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KATAM DINESH ROY', '22A81A0426@sves.org.in', '7331136079', 'student', 'ECE', '22A81A0426', '7331136079', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.96, 8.23, 7.77, 7.47, 8.26, 8.16, 7.77, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KESANAKURTHI SANTHI', '22A81A0427@sves.org.in', '8790986182', 'student', 'ECE', '22A81A0427', '8790986182', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 8.92, 8.92, 8.49, 7.98, 8.81, 8.67, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANIKIREDDY SATISH', '22A81A0436@sves.org.in', '6301007676', 'student', 'ECE', '22A81A0436', '6301007676', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 7.69, 8.46, 8.06, 7.88, 8.81, 7.91, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALAM SATHVIKA', '22A81A0441@sves.org.in', '6304062936', 'student', 'ECE', '22A81A0441', '6304062936', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.64, 8.08, 7.85, 7.27, 7.77, 7.77, 7.77, 7.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NUNNA V N P L MEGHAMALA', '22A81A0442@sves.org.in', '9866141504', 'student', 'ECE', '22A81A0442', '9866141504', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.8, 8.92, 9.23, 8.71, 8.47, 9.44, 8.88, 8.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PAKALAPATI MOUNIKA LAKSHMI', '22A81A0443@sves.org.in', '9346422248', 'student', 'ECE', '22A81A0443', '9346422248', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.47, 8.23, 7.92, 7.06, 7.28, 7.67, 7.77, 6.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POLISETTY MOUNICA SURYA DURGA NAGA SREE', '22A81A0447@sves.org.in', '8247523131', 'student', 'ECE', '22A81A0447', '8247523131', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.4, 8.54, 8.69, 8.33, 8.53, 8.74, 8.65, 7.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RATNALA PAPA', '22A81A0449@sves.org.in', '7569509557', 'student', 'ECE', '22A81A0449', '7569509557', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.06, 9.38, 9.54, 9.12, 8.95, 8.95, 9.09, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ROHITHA YERRA', '22A81A0451@sves.org.in', '7286970144', 'student', 'ECE', '22A81A0451', '7286970144', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.7, 9.15, 9.15, 8.61, 8.74, 8.74, 8.53, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SHAIK RAJIYA', '22A81A0453@sves.org.in', '8374324633', 'student', 'ECE', '22A81A0453', '8374324633', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.69, 9.0, 9.38, 9.06, 8.05, 8.6, 8.86, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TULA DEEPIKA', '22A81A0457@sves.org.in', '8074277119', 'student', 'ECE', '22A81A0457', '8074277119', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.33, 7.31, 7.38, 7.04, 6.98, 8.19, 7.95, 6.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VAMISETTI DHANESH', '22A81A0461@sves.org.in', '7794058703', 'student', 'ECE', '22A81A0461', '7794058703', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.74, 7.54, 8.0, 7.53, 7.26, 8.33, 7.98, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YADADA VARSHINI', '22A81A0464@sves.org.in', '9391939425', 'student', 'ECE', '22A81A0464', '9391939425', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.61, 8.77, 8.62, 8.35, 8.47, 9.23, 8.67, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AKASAPU KALYANI', '22A81A0467@sves.org.in', '7287851677', 'student', 'ECE', '22A81A0467', '7287851677', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.78, 9.08, 8.85, 8.94, 8.51, 9.02, 9.3, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BELLANI BALA GOWTHAMI', '22A81A0471@sves.org.in', '9542328541', 'student', 'ECE', '22A81A0471', '9542328541', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 8.38, 9.0, 7.8, 7.81, 8.72, 8.16, 6.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHEKURI JAGADEESH VARMA', '22A81A0474@sves.org.in', '8688775567', 'student', 'ECE', '22A81A0474', '8688775567', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.59, 8.46, 8.0, 7.55, 6.86, 8.05, 7.67, 6.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DIDDE AJAY KUMAR', '22A81A0477@sves.org.in', '8688753586', 'student', 'ECE', '22A81A0477', '8688753586', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.45, 9.15, 9.0, 8.45, 7.91, 8.74, 8.33, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ELIPE JYOTHIRMAYEE SNEHALATHA', '22A81A0478@sves.org.in', '9441994077', 'student', 'ECE', '22A81A0478', '9441994077', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.26, 8.92, 8.08, 8.47, 8.33, 8.4, 8.3, 7.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GAJJANA GEETANJALI', '22A81A0479@sves.org.in', '6305064354', 'student', 'ECE', '22A81A0479', '6305064354', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.83, 9.23, 8.77, 8.88, 8.37, 9.44, 9.09, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANAPAVARAPU ANUSHA', '22A81A0480@sves.org.in', '6281271123', 'student', 'ECE', '22A81A0480', '6281271123', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.47, 7.77, 7.38, 7.18, 7.47, 8.19, 7.33, 7.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GAYATHRI UNNAMATLA', '22A81A0482@sves.org.in', '8008853136', 'student', 'ECE', '22A81A0482', '8008853136', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 8.69, 8.92, 8.98, 8.88, 9.28, 9.3, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GIDDA LAHARI', '22A81A0483@sves.org.in', '6304188234', 'student', 'ECE', '22A81A0483', '6304188234', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.99, 7.69, 8.92, 7.76, 7.42, 8.12, 8.51, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GORLI SRIKANTH', '22A81A0484@sves.org.in', '8247455874', 'student', 'ECE', '22A81A0484', '8247455874', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.3, 8.92, 8.46, 8.8, 7.67, 8.79, 8.02, 7.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('INDALA SRINIVAS', '22A81A0486@sves.org.in', '9346525595', 'student', 'ECE', '22A81A0486', '9346525595', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.96, 9.08, 8.38, 8.06, 7.49, 7.88, 7.95, 7.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JADDU YAMUNA NAGA DEEPTHI', '22A81A0487@sves.org.in', '7396317003', 'student', 'ECE', '22A81A0487', '7396317003', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.71, 8.69, 9.23, 8.9, 8.51, 9.09, 8.53, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KALAGARA ESWARI VENKATA DEEPIKA', '22A81A0488@sves.org.in', '6304834930', 'student', 'ECE', '22A81A0488', '6304834930', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 7.85, 7.38, 7.67, 8.6, 8.4, 8.3, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KADALI UDAY KIRAN', '22A81A0489@sves.org.in', '8074553625', 'student', 'ECE', '22A81A0489', '8074553625', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.21, 9.23, 8.85, 7.96, 7.84, 8.4, 8.12, 7.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KATTUNGA PAVAN SAI', '22A81A0492@sves.org.in', '9346860273', 'student', 'ECE', '22A81A0492', '9346860273', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.17, 8.38, 7.77, 7.98, 7.95, 8.51, 8.09, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOKKIRIPATI SAILAJA', '22A81A0493@sves.org.in', '9059736089', 'student', 'ECE', '22A81A0493', '9059736089', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 9.15, 8.46, 8.33, 8.4, 8.67, 8.44, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOTTADA SANDEEP', '22A81A0496@sves.org.in', '9908060957', 'student', 'ECE', '22A81A0496', '9908060957', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.89, 8.23, 7.69, 7.76, 7.74, 8.33, 7.67, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOVVURI SIRI', '22A81A0498@sves.org.in', '9493756499', 'student', 'ECE', '22A81A0498', '9493756499', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.18, 8.62, 7.92, 8.18, 8.19, 8.53, 8.3, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANCHINA PURUSHOTTAM SAI SANKAR', '22A81A0499@sves.org.in', '9121479234', 'student', 'ECE', '22A81A0499', '9121479234', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.28, 8.15, 6.85, 7.43, 7.19, 7.6, 7.26, 6.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MALLIPUDI SIVA KRISHNAMA RAJU', '22A81A04A2@sves.org.in', '9391357807', 'student', 'ECE', '22A81A04A2', '9391357807', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 6.91, 7.92, 7.23, 6.76, 6.7, 7.12, 6.77, 6.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANDELA VYSHNAVI DEVI', '22A81A04A3@sves.org.in', '9502453119', 'student', 'ECE', '22A81A04A3', '9502453119', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.63, 8.92, 8.23, 8.57, 8.53, 8.86, 8.88, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALLAMILLI LEHYA SRI VENKATA HARSHITHA', '22A81A04A6@sves.org.in', '8688225119', 'student', 'ECE', '22A81A04A6', '8688225119', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.03, 8.77, 7.92, 8.1, 7.56, 8.44, 8.44, 7.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NANDYALA BHASKARA SATYA SAI VARMA', '22A81A04A7@sves.org.in', '9493268458', 'student', 'ECE', '22A81A04A7', '9493268458', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.24, 8.69, 8.85, 8.35, 7.81, 8.6, 7.67, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PASUPULETI KUSUMA NAGA SAI SAHITI', '22A81A04A8@sves.org.in', '9392538374', 'student', 'ECE', '22A81A04A8', '9392538374', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.54, 8.85, 8.69, 8.94, 8.37, 9.02, 8.33, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALLI ESWAR SUBHASH', '22A81A04B1@sves.org.in', '9502622477', 'student', 'ECE', '22A81A04B1', '9502622477', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.25, 7.77, 7.46, 6.88, 7.12, 7.63, 6.98, 7.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PASUPULETI KUSUMA SATYA SAI JYOTHI', '22A81A04B3@sves.org.in', '9000746151', 'student', 'ECE', '22A81A04B3', '9000746151', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.91, 8.15, 8.0, 8.22, 8.16, 7.74, 7.47, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PATTAPU YASASWI', '22A81A04B4@sves.org.in', '8019672368', 'student', 'ECE', '22A81A04B4', '8019672368', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.29, 8.31, 8.62, 8.06, 8.33, 8.95, 8.16, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PENNADA SINDHU', '22A81A04B5@sves.org.in', '9014621288', 'student', 'ECE', '22A81A04B5', '9014621288', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.47, 8.54, 8.46, 8.51, 8.6, 8.81, 8.44, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POLUMATI SHANTHI PRIYA', '22A81A04B7@sves.org.in', '7032609863', 'student', 'ECE', '22A81A04B7', '7032609863', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.78, 8.54, 7.38, 7.59, 7.33, 7.95, 8.23, 7.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PONNADA LEELA VENKATESH', '22A81A04B8@sves.org.in', '9392746816', 'student', 'ECE', '22A81A04B8', '9392746816', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.31, 7.77, 6.92, 7.27, 7.12, 7.7, 7.33, 7.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POTHUREDDYPALLI LAVANYA', '22A81A04C0@sves.org.in', '9392745610', 'student', 'ECE', '22A81A04C0', '9392745610', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 8.77, 8.69, 7.94, 7.7, 8.26, 7.74, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAYI MAHESH SURYA', '22A81A04C2@sves.org.in', '8374111134', 'student', 'ECE', '22A81A04C2', '8374111134', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.79, 8.15, 8.08, 7.65, 7.56, 7.88, 7.67, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SATTI MADHU SUDHANA REDDY', '22A81A04C4@sves.org.in', '7382287989', 'student', 'ECE', '22A81A04C4', '7382287989', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.78, 9.38, 9.23, 8.9, 8.37, 8.88, 8.6, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SUNKAVALLI SUSMITHA', '22A81A04C7@sves.org.in', '9390630155', 'student', 'ECE', '22A81A04C7', '9390630155', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.69, 8.77, 8.86, 8.19, 8.65, 8.53, 8.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UNDAVALLI LAVANYA', '22A81A04C9@sves.org.in', '6301860398', 'student', 'ECE', '22A81A04C9', '6301860398', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.26, 8.54, 8.62, 7.94, 8.05, 8.65, 8.4, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UPPALA MANASA LAKSHMI', '22A81A04D0@sves.org.in', '9346385909', 'student', 'ECE', '22A81A04D0', '9346385909', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.36, 8.85, 8.92, 8.14, 8.26, 8.4, 8.33, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BATCHA HEMANTH', '22A81A04D7@sves.org.in', '9392033204', 'student', 'ECE', '22A81A04D7', '9392033204', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.97, 7.92, 8.23, 8.1, 7.98, 8.53, 7.74, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOKKA SAI MOULIKA', '22A81A04D9@sves.org.in', '8328201279', 'student', 'ECE', '22A81A04D9', '8328201279', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.28, 7.54, 6.92, 7.57, 7.19, 7.74, 7.26, 6.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOLLIPO AMMULU', '22A81A04E0@sves.org.in', '8977434605', 'student', 'ECE', '22A81A04E0', '8977434605', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.85, 8.85, 8.38, 9.06, 8.88, 9.3, 9.02, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BORA ASHOK', '22A81A04E1@sves.org.in', '8247640537', 'student', 'ECE', '22A81A04E1', '8247640537', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.42, 7.38, 7.38, 7.75, 7.14, 7.95, 6.91, 7.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHILAKA TIRUMALA BHASKAR', '22A81A04E4@sves.org.in', '6281683818', 'student', 'ECE', '22A81A04E4', '6281683818', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.39, 7.08, 7.38, 7.49, 6.91, 8.02, 7.74, 7.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DARABOENA UMA SATYA KUMARI', '22A81A04E5@sves.org.in', '8688175988', 'student', 'ECE', '22A81A04E5', '8688175988', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.62, 9.23, 8.62, 8.78, 8.12, 8.81, 9.02, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('EDUPALLI HEMA', '22A81A04E7@sves.org.in', '7815859148', 'student', 'ECE', '22A81A04E7', '7815859148', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.89, 9.23, 9.62, 9.18, 8.33, 9.02, 8.88, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GADI SUSHMA', '22A81A04E8@sves.org.in', '7032942353', 'student', 'ECE', '22A81A04E8', '7032942353', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.33, 8.62, 7.69, 8.57, 7.6, 9.09, 8.74, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANTA MANIKANTA VENKATA SATYA GANESH', '22A81A04E9@sves.org.in', '7893791378', 'student', 'ECE', '22A81A04E9', '7893791378', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.84, 7.92, 8.0, 7.86, 7.19, 8.02, 8.16, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOLLAPALLI AISHWARYA', '22A81A04F0@sves.org.in', '9346762049', 'student', 'ECE', '22A81A04F0', '9346762049', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.92, 8.23, 7.54, 7.55, 7.53, 8.44, 8.19, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUBBALA YAMINI', '22A81A04F1@sves.org.in', '9502624264', 'student', 'ECE', '22A81A04F1', '9502624264', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 7.77, 7.69, 7.94, 7.47, 8.72, 8.67, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUDALA GANESH', '22A81A04F2@sves.org.in', '9951699635', 'student', 'ECE', '22A81A04F2', '9951699635', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 9.0, 8.77, 8.59, 8.19, 9.16, 8.53, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUNDAY SUKUMAR', '22A81A04F4@sves.org.in', '8688780887', 'student', 'ECE', '22A81A04F4', '8688780887', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 9.23, 8.54, 8.35, 8.05, 8.47, 7.91, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARANAM SANTHA KUMARI', '22A81A04F6@sves.org.in', '7093776366', 'student', 'ECE', '22A81A04F6', '7093776366', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.28, 9.23, 8.77, 7.9, 7.33, 8.47, 8.6, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KATAM LILLY GRACE', '22A81A04F8@sves.org.in', '8247751755', 'student', 'ECE', '22A81A04F8', '8247751755', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.2, 8.31, 8.46, 8.39, 7.49, 8.67, 8.12, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KATTUNGA LASYA SREE', '22A81A04F9@sves.org.in', '9014517749', 'student', 'ECE', '22A81A04F9', '9014517749', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.79, 9.46, 8.54, 8.71, 8.23, 9.16, 8.74, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOMMURI UMA DEVI', '22A81A04G1@sves.org.in', '7093156913', 'student', 'ECE', '22A81A04G1', '7093156913', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.38, 8.77, 8.46, 8.02, 7.81, 8.81, 8.58, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KONDROTHU CHANDRASHEKHAR', '22A81A04G3@sves.org.in', '9391040510', 'student', 'ECE', '22A81A04G3', '9391040510', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.55, 8.69, 8.92, 8.49, 8.6, 9.3, 8.19, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOTIPALLI IKYATA', '22A81A04G5@sves.org.in', '8121226375', 'student', 'ECE', '22A81A04G5', '8121226375', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 9.23, 8.85, 8.33, 7.49, 8.53, 8.47, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MATURI R S S BHASKARA GUPTA', '22A81A04G6@sves.org.in', '9398193636', 'student', 'ECE', '22A81A04G6', '9398193636', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.13, 8.38, 8.69, 7.8, 7.42, 8.26, 8.33, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADDIPATI DEVI PRASANNA', '22A81A04G7@sves.org.in', '6303036303', 'student', 'ECE', '22A81A04G7', '6303036303', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.36, 8.92, 8.08, 8.29, 7.19, 9.14, 8.88, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MAMIDI KIRANMAYI', '22A81A04G8@sves.org.in', '9492579433', 'student', 'ECE', '22A81A04G8', '9492579433', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 8.69, 8.46, 8.31, 7.98, 8.67, 8.81, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANNEM SAI GOPI', '22A81A04G9@sves.org.in', '6304104836', 'student', 'ECE', '22A81A04G9', '6304104836', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 8.31, 8.08, 7.8, 7.98, 8.16, 8.33, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALLAMILLI SRI MAHALAKSHMI', '22A81A04H4@sves.org.in', '8500456827', 'student', 'ECE', '22A81A04H4', '8500456827', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.32, 8.85, 8.08, 7.92, 8.19, 8.95, 8.67, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PYDIKONDALA SUSHMA', '22A81A04H9@sves.org.in', '7780296635', 'student', 'ECE', '22A81A04H9', '7780296635', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.01, 8.62, 8.54, 7.86, 7.56, 8.67, 7.98, 7.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RANGISETTI KARTHIK', '22A81A04I0@sves.org.in', '7799228593', 'student', 'ECE', '22A81A04I0', '7799228593', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.75, 8.15, 7.92, 7.57, 6.91, 7.77, 7.98, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SANKU SWATHI', '22A81A04I2@sves.org.in', '9182866711', 'student', 'ECE', '22A81A04I2', '9182866711', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.07, 9.08, 8.38, 8.25, 7.47, 8.19, 7.98, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UNDRAJAVARAPU VALLIKA', '22A81A04I4@sves.org.in', '7780427917', 'student', 'ECE', '22A81A04I4', '7780427917', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.72, 8.0, 6.85, 7.53, 7.47, 8.53, 7.91, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VADAPALLI JOHNDAVID', '22A81A04I5@sves.org.in', '9392225365', 'student', 'ECE', '22A81A04I5', '9392225365', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.74, 9.69, 8.85, 8.98, 8.4, 9.16, 8.23, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VATTIKUTI SATYA PUJASRI', '22A81A04I7@sves.org.in', '7386740744', 'student', 'ECE', '22A81A04I7', '7386740744', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.38, 8.85, 8.54, 8.43, 7.98, 8.81, 8.12, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VELAGANA VARA SINGA LAKSHMI', '22A81A04I8@sves.org.in', '9989152327', 'student', 'ECE', '22A81A04I8', '9989152327', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 9.23, 8.23, 8.02, 7.98, 8.81, 8.53, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YANDAMURI HIMA ESWAR', '22A81A04I9@sves.org.in', '9705365085', 'student', 'ECE', '22A81A04I9', '9705365085', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.66, 9.15, 8.46, 9.14, 7.7, 9.3, 8.51, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHAVAKULA DUMBESH', '23A85A0403@sves.org.in', '9502606788', 'student', 'ECE', '23A85A0403', '9502606788', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 0.0, 0.0, 8.2, 8.12, 8.6, 8.19, 7.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GRANDHI MOHAN KUMAR', '23A85A0406@sves.org.in', '7207276683', 'student', 'ECE', '23A85A0406', '7207276683', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.78, 0.0, 0.0, 8.65, 9.02, 9.44, 8.74, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PITANI SAPTAGIRI', '23A85A0407@sves.org.in', '7893055149', 'student', 'ECE', '23A85A0407', '7893055149', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 0.0, 0.0, 8.02, 7.7, 9.16, 8.4, 7.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SATTI HEMANTH SRI ADHINARAYANA REDDY', '23A85A0408@sves.org.in', '9347299578', 'student', 'ECE', '23A85A0408', '9347299578', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.82, 0.0, 0.0, 7.47, 7.63, 8.3, 8.12, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SEEPANI PAVAN KARTHIK', '23A85A0409@sves.org.in', '9247442925', 'student', 'ECE', '23A85A0409', '9247442925', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 0.0, 0.0, 8.29, 8.47, 9.02, 8.33, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('IRAPU NAVYA SREE', '23A85A0411@sves.org.in', '9490424676', 'student', 'ECE', '23A85A0411', '9490424676', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.65, 0.0, 0.0, 7.53, 7.4, 8.44, 7.67, 7.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAIDU HARIKA SRI', '23A85A0412@sves.org.in', '9392519363', 'student', 'ECE', '23A85A0412', '9392519363', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.89, 0.0, 0.0, 7.86, 7.95, 8.81, 7.74, 7.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PASUPULETI UMA DURGA NAVYA SRI', '23A85A0413@sves.org.in', '9346880519', 'student', 'ECE', '23A85A0413', '9346880519', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.32, 0.0, 0.0, 8.33, 8.09, 9.02, 8.58, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PATHURI ANJALI', '23A85A0414@sves.org.in', '9391742802', 'student', 'ECE', '23A85A0414', '9391742802', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.81, 0.0, 0.0, 8.06, 7.42, 8.33, 7.95, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VARI HEMA SRI DURGA', '23A85A0415@sves.org.in', '8688369521', 'student', 'ECE', '23A85A0415', '8688369521', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 0.0, 0.0, 8.0, 7.81, 9.02, 8.3, 6.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOKKA RAJESH', '23A85A0416@sves.org.in', '7989425043', 'student', 'ECE', '23A85A0416', '7989425043', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.27, 0.0, 0.0, 8.47, 8.12, 8.81, 8.47, 7.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GADI PAVAN MANIKANTA KUMAR', '23A85A0418@sves.org.in', '7995113027', 'student', 'ECE', '23A85A0418', '7995113027', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.3, 0.0, 0.0, 8.37, 8.33, 8.67, 8.26, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUTTA JYOTHIKA', '23A85A0419@sves.org.in', '9381852551', 'student', 'ECE', '23A85A0419', '9381852551', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.86, 0.0, 0.0, 7.47, 7.53, 8.51, 8.12, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('LOKAVARAPU VISHNU VARDHAN', '23A85A0420@sves.org.in', '9381093539', 'student', 'ECE', '23A85A0420', '9381093539', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.57, 0.0, 0.0, 8.75, 8.47, 8.88, 8.53, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MAGANTI ANITHA', '23A85A0421@sves.org.in', '7416956352', 'student', 'ECE', '23A85A0421', '7416956352', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.86, 0.0, 0.0, 7.39, 7.07, 8.74, 8.19, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MAMILLAPALLI LOKESH', '23A85A0422@sves.org.in', '7674044571', 'student', 'ECE', '23A85A0422', '7674044571', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.48, 0.0, 0.0, 8.33, 8.65, 8.95, 8.6, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MARADANI LOKESH', '23A85A0423@sves.org.in', '7569939852', 'student', 'ECE', '23A85A0423', '7569939852', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.68, 0.0, 0.0, 7.57, 7.28, 8.3, 8.12, 7.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEESALA LOKESH PAVAN SEETHAYYA NAIDU', '23A85A0424@sves.org.in', '8686965700', 'student', 'ECE', '23A85A0424', '8686965700', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 0.0, 0.0, 8.18, 8.47, 8.74, 8.33, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOTUPALLI SANTHOSH KUMAR', '23A85A0425@sves.org.in', '9866397585', 'student', 'ECE', '23A85A0425', '9866397585', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.81, 0.0, 0.0, 8.08, 7.4, 8.09, 8.4, 7.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ROUTHU VENKATA SAI DURGA', '23A85A0428@sves.org.in', '6301302278', 'student', 'ECE', '23A85A0428', '6301302278', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.89, 0.0, 0.0, 7.57, 7.77, 8.51, 8.26, 7.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SHAIK SAYYAD BAJI', '23A85A0429@sves.org.in', '9491475673', 'student', 'ECE', '23A85A0429', '9491475673', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.16, 0.0, 0.0, 8.45, 8.05, 8.81, 8.16, 7.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOMMAGANI KRISHNA PAVANI', '22A81A0205@sves.org.in', '7569631892', 'student', 'EEE', '22A81A0205', '7569631892', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.44, 7.62, 6.69, 7.49, 7.07, 7.95, 7.63, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DASARI TRIVYANJALI', '22A81A0208@sves.org.in', '7842523239', 'student', 'EEE', '22A81A0208', '7842523239', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.25, 8.62, 8.62, 8.29, 7.63, 8.33, 8.33, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DONDAPATI MAHIDHAR', '22A81A0210@sves.org.in', '9491898776', 'student', 'EEE', '22A81A0210', '9491898776', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.46, 7.77, 7.62, 7.88, 7.0, 7.47, 7.14, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GADUGOYILA GEETHA SANTHOSHINI', '22A81A0212@sves.org.in', '7675059094', 'student', 'EEE', '22A81A0212', '7675059094', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 9.15, 8.46, 7.94, 7.98, 8.79, 8.6, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOLA ANJALI DEVI', '22A81A0219@sves.org.in', '9848804574', 'student', 'EEE', '22A81A0219', '9848804574', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.53, 8.31, 6.77, 7.22, 7.07, 7.86, 7.81, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KURAM MOUNIKA', '22A81A0223@sves.org.in', '7989589925', 'student', 'EEE', '22A81A0223', '7989589925', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.17, 8.54, 7.69, 8.35, 7.56, 8.16, 8.67, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MACHAGANTI ANUSHA', '22A81A0225@sves.org.in', '8977087257', 'student', 'EEE', '22A81A0225', '8977087257', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.61, 8.85, 8.38, 8.53, 8.05, 8.42, 8.93, 9.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PUROHIT KUSHUBU', '22A81A0238@sves.org.in', '8317619479', 'student', 'EEE', '22A81A0238', '8317619479', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.53, 7.92, 7.08, 7.24, 7.35, 7.51, 7.84, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ROWTHU KUMARI NAGA SAI DHANA LAKSHMI', '22A81A0240@sves.org.in', '7794905377', 'student', 'EEE', '22A81A0240', '7794905377', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.64, 7.38, 7.62, 7.39, 6.93, 7.7, 8.4, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AMBATI SHARON KUMAR', '22A81A0246@sves.org.in', '8328168181', 'student', 'EEE', '22A81A0246', '8328168181', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.04, 7.0, 6.62, 6.73, 6.63, 7.63, 7.05, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AVISETTI SAI SATYA SRI', '22A81A0248@sves.org.in', '8008904712', 'student', 'EEE', '22A81A0248', '8008904712', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 8.23, 7.77, 8.47, 7.91, 8.33, 8.88, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BODDU ASRITHA RANGA VAISHNAVI', '22A81A0249@sves.org.in', '6305777495', 'student', 'EEE', '22A81A0249', '6305777495', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.41, 8.69, 8.31, 8.16, 7.77, 8.47, 8.74, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BOLLA HARISHMA PADMAJA', '22A81A0250@sves.org.in', '9550696158', 'student', 'EEE', '22A81A0250', '9550696158', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.29, 7.46, 6.92, 7.33, 6.93, 7.35, 7.7, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANCHARLA DINESH', '22A81A0259@sves.org.in', '8688926896', 'student', 'EEE', '22A81A0259', '8688926896', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.49, 9.38, 8.62, 7.31, 6.49, 7.14, 6.86, 7.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KODURI HARSHITHA', '22A81A0264@sves.org.in', '6305312585', 'student', 'EEE', '22A81A0264', '6305312585', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.78, 8.08, 7.38, 7.43, 7.49, 7.77, 8.12, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOLLEPARA VASAVI RATNA SRILEKHA', '22A81A0265@sves.org.in', '9949973741', 'student', 'EEE', '22A81A0265', '9949973741', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.56, 8.69, 8.31, 8.35, 8.12, 8.6, 9.02, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOTTALA PAVAN KUMAR', '22A81A0267@sves.org.in', '9100878904', 'student', 'EEE', '22A81A0267', '9100878904', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.64, 8.69, 7.92, 7.47, 7.21, 7.07, 7.49, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MALLABATHULA PAVANI', '22A81A0271@sves.org.in', '9121645169', 'student', 'EEE', '22A81A0271', '9121645169', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.85, 7.77, 7.31, 7.76, 7.7, 7.91, 7.98, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('METLA UDAYKIRAN', '22A81A0273@sves.org.in', '8639620930', 'student', 'EEE', '22A81A0273', '8639620930', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.95, 9.31, 8.62, 8.22, 7.49, 7.42, 7.07, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MIRIYALA BOBBY', '22A81A0274@sves.org.in', '9676010869', 'student', 'EEE', '22A81A0274', '9676010869', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.8, 8.62, 7.62, 7.45, 6.86, 7.56, 8.4, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NULI VASAVI NAGA SRI VARSHINI', '22A81A0276@sves.org.in', '7396671393', 'student', 'EEE', '22A81A0276', '7396671393', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.61, 8.62, 8.38, 8.69, 8.19, 8.6, 8.88, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POLINATI BINDU SRI', '22A81A0278@sves.org.in', '7013553595', 'student', 'EEE', '22A81A0278', '7013553595', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.58, 8.77, 8.0, 8.49, 8.33, 8.47, 9.02, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RATALA VIRAJALA MEENA KUMARI', '22A81A0283@sves.org.in', '9392372260', 'student', 'EEE', '22A81A0283', '9392372260', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.29, 8.15, 8.62, 8.35, 7.77, 7.77, 8.65, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAGU PUJITHA', '22A81A0284@sves.org.in', '9392857046', 'student', 'EEE', '22A81A0284', '9392857046', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.86, 8.0, 7.23, 7.76, 7.35, 8.05, 8.12, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VALLEPALLI PAVAN KUMAR', '22A81A0287@sves.org.in', '9392623327', 'student', 'EEE', '22A81A0287', '9392623327', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.59, 7.69, 7.08, 7.84, 7.0, 7.84, 7.72, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BANDILA LEELA VINODINI', '23A85A0201@sves.org.in', '8121696433', 'student', 'EEE', '23A85A0201', '8121696433', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.18, 0.0, 0.0, 8.0, 8.05, 8.37, 8.67, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANDULA GOVARDHAN', '23A85A0204@sves.org.in', '9063378454', 'student', 'EEE', '23A85A0204', '9063378454', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 0.0, 0.0, 7.84, 7.56, 8.3, 8.6, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOLUPURI SANTHOSHA KUMARI', '23A85A0213@sves.org.in', '7095482993', 'student', 'EEE', '23A85A0213', '7095482993', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.16, 0.0, 0.0, 8.1, 7.91, 8.19, 8.23, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MARISETTI MOHAN SATYA MANIDEEP', '23A85A0215@sves.org.in', '6304348087', 'student', 'EEE', '23A85A0215', '6304348087', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.14, 0.0, 0.0, 8.0, 8.05, 7.84, 8.67, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TELU KRISHNA PAVAN', '23A85A0216@sves.org.in', '8309966933', 'student', 'EEE', '23A85A0216', '8309966933', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.86, 0.0, 0.0, 7.76, 7.35, 7.91, 8.95, 7.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TIRUMALAREDDY NAVYA SRI', '23A85A0217@sves.org.in', '6301448855', 'student', 'EEE', '23A85A0217', '6301448855', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.51, 0.0, 0.0, 8.22, 8.05, 8.6, 9.02, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VAMISETTI DHARMENDRA SIVA SAI', '23A85A0218@sves.org.in', '9490670706', 'student', 'EEE', '23A85A0218', '9490670706', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 0.0, 0.0, 7.82, 7.77, 7.98, 8.16, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADAPA KIRAN KUMAR', '22A81A0301@sves.org.in', '6303126759', 'student', 'ME', '22A81A0301', '6303126759', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 6.91, 7.0, 6.62, 6.65, 6.56, 7.09, 7.56, 6.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADDAGARLA VENKATESH', '22A81A0302@sves.org.in', '7995358981', 'student', 'ME', '22A81A0302', '7995358981', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 8.92, 8.08, 8.29, 8.26, 8.56, 8.88, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BANDULA DEVENDRA', '22A81A0306@sves.org.in', '9666606135', 'student', 'ME', '22A81A0306', '9666606135', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.37, 7.85, 7.38, 7.06, 7.23, 7.91, 7.07, 7.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHELLAMSETTI T V V N SAI PAVAN GANESH', '22A81A0309@sves.org.in', '9907983333', 'student', 'ME', '22A81A0309', '9907983333', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.62, 8.85, 7.38, 7.47, 7.4, 7.65, 7.6, 7.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANTEDA PRAVEEN KUMAR', '22A81A0316@sves.org.in', '7780416830', 'student', 'ME', '22A81A0316', '7780416830', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.45, 9.08, 8.69, 8.41, 8.42, 8.47, 8.74, 7.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GATTIM SRI NAGA AYYAPPA', '22A81A0318@sves.org.in', '9959382191', 'student', 'ME', '22A81A0318', '9959382191', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.51, 7.23, 7.62, 7.18, 7.56, 7.84, 7.84, 7.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOPISETTI ANANTH LAKSHMI KUMAR', '22A81A0320@sves.org.in', '7013470235', 'student', 'ME', '22A81A0320', '7013470235', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.09, 9.38, 9.69, 8.82, 9.23, 9.3, 8.88, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARRI ROHITH REDDY', '22A81A0326@sves.org.in', '9959157018', 'student', 'ME', '22A81A0326', '9959157018', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.54, 7.92, 7.38, 7.12, 7.47, 7.19, 8.3, 7.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KODURI PHANI VENKATA KUMAR', '22A81A0329@sves.org.in', '9014387928', 'student', 'ME', '22A81A0329', '9014387928', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.33, 9.0, 8.08, 7.88, 8.26, 8.53, 8.44, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALAKALURI TARUN KUMAR', '22A81A0347@sves.org.in', '9705865237', 'student', 'ME', '22A81A0347', '9705865237', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.12, 6.92, 6.85, 6.96, 7.19, 7.35, 7.33, 7.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PYDIMUKKULA PULLA RAO', '22A81A0353@sves.org.in', '9618720497', 'student', 'ME', '22A81A0353', '9618720497', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.33, 7.08, 7.0, 7.65, 7.19, 7.35, 7.74, 7.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SARIDE VIGNESWARA RAO', '22A81A0355@sves.org.in', '9182268681', 'student', 'ME', '22A81A0355', '9182268681', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.71, 9.08, 8.46, 8.59, 8.6, 9.14, 8.88, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('THORAM RAMA LAKSHMAN', '22A81A0360@sves.org.in', '9676808216', 'student', 'ME', '22A81A0360', '9676808216', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.95, 7.54, 7.15, 7.73, 8.09, 8.4, 8.67, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YADLAPALLI SRI SAI VENKATA DURGA ESWAR', '23A85A0303@sves.org.in', '6305769980', 'student', 'ME', '23A85A0303', '6305769980', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.45, 0.0, 0.0, 7.25, 7.6, 7.26, 7.91, 7.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHIKKA SOHAN SATYA VARDHAN', '23A85A0304@sves.org.in', '9701565312', 'student', 'ME', '23A85A0304', '9701565312', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 0.0, 0.0, 8.18, 8.23, 8.44, 8.12, 7.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHIKKALA VIJAYA KUMAR', '23A85A0305@sves.org.in', '7893744131', 'student', 'ME', '23A85A0305', '7893744131', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.15, 0.0, 0.0, 8.88, 8.79, 9.7, 9.3, 9.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GARIKIPATI CHANDU', '23A85A0307@sves.org.in', '8185092634', 'student', 'ME', '23A85A0307', '8185092634', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.83, 0.0, 0.0, 8.61, 8.86, 8.58, 9.07, 9.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOLLAMANDALA KRUPAKAR', '23A85A0308@sves.org.in', '9121532016', 'student', 'ME', '23A85A0308', '9121532016', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.31, 0.0, 0.0, 7.49, 7.33, 7.49, 7.4, 6.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEERAMALLA MANIKANTA SAI DURGA NARAYANA', '23A85A0310@sves.org.in', '9392101094', 'student', 'ME', '23A85A0310', '9392101094', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.16, 0.0, 0.0, 6.73, 6.77, 7.67, 7.49, 7.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUNDA SATYANARAYANA', '23A85A0311@sves.org.in', '6301751110', 'student', 'ME', '23A85A0311', '6301751110', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.8, 0.0, 0.0, 7.43, 7.74, 7.98, 8.4, 7.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JAGALINKI HEMA SURYA VARDHAN', '23A85A0312@sves.org.in', '9390886869', 'student', 'ME', '23A85A0312', '9390886869', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.44, 0.0, 0.0, 8.41, 8.47, 9.07, 8.74, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JALADHANI SRAVYA DURGA', '23A85A0313@sves.org.in', '9573578309', 'student', 'ME', '23A85A0313', '9573578309', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.51, 0.0, 0.0, 8.35, 8.81, 8.79, 8.79, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KATTA DURGA PRASAD', '23A85A0314@sves.org.in', '7286947147', 'student', 'ME', '23A85A0314', '7286947147', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.17, 0.0, 0.0, 7.24, 7.14, 7.74, 6.7, 7.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADDIRALA ABHIRAM', '23A85A0315@sves.org.in', '9391672823', 'student', 'ME', '23A85A0315', '9391672823', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 6.83, 0.0, 0.0, 6.84, 7.12, 6.84, 6.7, 6.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MUNTA L V V S SUBRAHMANYAM', '23A85A0316@sves.org.in', '9390417117', 'student', 'ME', '23A85A0316', '9390417117', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.06, 0.0, 0.0, 8.18, 7.77, 9.28, 8.51, 6.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NUTANGI SANTHOSH', '23A85A0317@sves.org.in', '6281906246', 'student', 'ME', '23A85A0317', '6281906246', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.51, 0.0, 0.0, 7.08, 7.23, 7.74, 7.98, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NUTANGI SYAM BABU', '23A85A0318@sves.org.in', '8519829419', 'student', 'ME', '23A85A0318', '8519829419', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.25, 0.0, 0.0, 7.25, 6.95, 6.77, 7.63, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UBA RAVINDRA BABU', '23A85A0320@sves.org.in', '9676939873', 'student', 'ME', '23A85A0320', '9676939873', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.28, 0.0, 0.0, 7.35, 7.3, 7.65, 6.7, 7.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADAPA JNANA CHANDRIKA', '22A81A0601@sves.org.in', '8639602234', 'student', 'CST', '22A81A0601', '8639602234', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.94, 9.0, 7.92, 8.94, 9.16, 9.3, 9.44, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AKULA HARI SREE', '22A81A0602@sves.org.in', '9440132111', 'student', 'CST', '22A81A0602', '9440132111', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.08, 9.38, 8.54, 9.06, 9.16, 9.72, 9.16, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BANDARU BHARGAVI', '22A81A0604@sves.org.in', '9381599420', 'student', 'CST', '22A81A0604', '9381599420', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.51, 8.62, 8.08, 8.59, 8.88, 8.67, 8.6, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BANGARU MOHAN RAO', '22A81A0605@sves.org.in', '7075591109', 'student', 'CST', '22A81A0605', '7075591109', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 8.31, 7.62, 8.04, 8.16, 8.12, 8.4, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BITRA PRAVALLIKA', '22A81A0606@sves.org.in', '8688118719', 'student', 'CST', '22A81A0606', '8688118719', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 8.31, 7.92, 8.24, 8.53, 8.37, 8.88, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHALLA YASASWI', '22A81A0609@sves.org.in', '7702782648', 'student', 'CST', '22A81A0609', '7702782648', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 9.62, 8.23, 9.06, 8.37, 9.16, 9.3, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DARISI VENKATA LAHARI', '22A81A0611@sves.org.in', '9390980889', 'student', 'CST', '22A81A0611', '9390980889', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.09, 9.38, 9.08, 9.1, 9.3, 9.16, 8.47, 9.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DOMMETI L S VASANTHI', '22A81A0613@sves.org.in', '9701594369', 'student', 'CST', '22A81A0613', '9701594369', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.98, 9.31, 8.62, 9.06, 8.88, 9.02, 8.81, 9.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('EDUPALLI LIKHITHA SAI', '22A81A0614@sves.org.in', '9346553146', 'student', 'CST', '22A81A0614', '9346553146', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.74, 9.0, 8.38, 8.71, 8.93, 8.74, 8.74, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GANDHARAPU MOUNIKA', '22A81A0615@sves.org.in', '9014670724', 'student', 'CST', '22A81A0615', '9014670724', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.14, 8.46, 7.08, 8.29, 8.23, 8.05, 8.26, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOTHAM SRI NAGA SIRISHA', '22A81A0616@sves.org.in', '9642973891', 'student', 'CST', '22A81A0616', '9642973891', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 8.77, 7.31, 8.51, 7.88, 7.81, 7.77, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JANGA SRINIVASA REDDY', '22A81A0619@sves.org.in', '6300041199', 'student', 'CST', '22A81A0619', '6300041199', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.52, 9.31, 8.92, 8.35, 8.09, 8.53, 8.19, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KADIMI HARIKA', '22A81A0622@sves.org.in', '7207033984', 'student', 'CST', '22A81A0622', '7207033984', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.04, 9.46, 9.08, 9.22, 8.74, 9.02, 9.16, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAMISETTY TANUJA', '22A81A0623@sves.org.in', '9440443459', 'student', 'CST', '22A81A0623', '9440443459', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.28, 9.31, 9.23, 9.45, 9.21, 9.44, 9.44, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARELLA PAVANI VINAY KUMAR', '22A81A0624@sves.org.in', '6304397055', 'student', 'CST', '22A81A0624', '6304397055', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 8.69, 8.69, 8.86, 8.93, 9.02, 9.23, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARPURAM CHARANI', '22A81A0625@sves.org.in', '7670995314', 'student', 'CST', '22A81A0625', '7670995314', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.47, 9.0, 7.69, 8.59, 8.3, 8.74, 8.6, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADICHERLA SHANMUKHA SAI PRAKASH', '22A81A0629@sves.org.in', '9550985975', 'student', 'CST', '22A81A0629', '9550985975', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.75, 8.77, 8.54, 8.39, 8.81, 8.74, 9.02, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADIPALLI V VENKATA NAGA SRI MANICHANDANA', '22A81A0630@sves.org.in', '9491577669', 'student', 'CST', '22A81A0630', '9491577669', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.78, 9.08, 8.31, 8.86, 8.88, 8.12, 9.44, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEDIDI PRAVALLIKA', '22A81A0631@sves.org.in', '9063771180', 'student', 'CST', '22A81A0631', '9063771180', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.71, 9.15, 8.46, 8.94, 8.47, 8.47, 9.02, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEKA MAHESH KIRAN', '22A81A0632@sves.org.in', '8919557642', 'student', 'CST', '22A81A0632', '8919557642', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.02, 8.31, 7.23, 8.24, 7.67, 7.98, 8.12, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOHAMMED HAFEEZA KHAN', '22A81A0633@sves.org.in', '6305899256', 'student', 'CST', '22A81A0633', '6305899256', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.35, 8.08, 6.92, 8.35, 8.51, 8.47, 9.09, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MUTYALU CHAITANYA NAGAVALLI', '22A81A0634@sves.org.in', '9100853997', 'student', 'CST', '22A81A0634', '9100853997', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.99, 9.38, 8.69, 9.18, 9.16, 8.6, 9.23, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAGASURI TULASI SWETHA', '22A81A0635@sves.org.in', '8247805516', 'student', 'CST', '22A81A0635', '8247805516', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.83, 9.23, 8.77, 8.71, 8.88, 8.67, 9.02, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALLANICHAKRAVARTHULA SRI HARSHITA', '22A81A0636@sves.org.in', '8500712540', 'student', 'CST', '22A81A0636', '8500712540', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.49, 8.85, 7.69, 8.59, 8.16, 8.74, 8.88, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PADALA MOHAN REDDY', '22A81A0637@sves.org.in', '8074274880', 'student', 'CST', '22A81A0637', '8074274880', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.68, 8.77, 8.69, 8.59, 8.47, 9.02, 9.16, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALLELA RAJA', '22A81A0638@sves.org.in', '9392848155', 'student', 'CST', '22A81A0638', '9392848155', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.03, 9.0, 8.69, 8.86, 9.35, 9.16, 9.23, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PANJA MADHAN', '22A81A0639@sves.org.in', '7729959225', 'student', 'CST', '22A81A0639', '7729959225', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.86, 8.23, 7.31, 7.88, 7.56, 8.33, 7.7, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PATSA YEGNAVALLAKA SUBRAHMANYA SAI', '22A81A0640@sves.org.in', '9989379211', 'student', 'CST', '22A81A0640', '9989379211', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.55, 8.62, 8.23, 8.47, 8.26, 8.74, 9.16, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PENUMATSA V V V VARMA', '22A81A0641@sves.org.in', '9059565817', 'student', 'CST', '22A81A0641', '9059565817', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.01, 7.92, 6.69, 8.18, 8.02, 8.33, 8.4, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POLAVARAPU GANAPATI VARA PRASAD', '22A81A0642@sves.org.in', '6304852672', 'student', 'CST', '22A81A0642', '6304852672', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.96, 9.08, 9.08, 8.86, 8.88, 9.3, 9.02, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PONNA VIJAYA DURGA SAI MALLESWARA RAO', '22A81A0643@sves.org.in', '8374742540', 'student', 'CST', '22A81A0643', '8374742540', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.69, 8.54, 8.59, 8.37, 8.47, 8.6, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PYDI GEETHA RANI SRI', '22A81A0644@sves.org.in', '9866095276', 'student', 'CST', '22A81A0644', '9866095276', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.59, 8.85, 7.38, 8.29, 9.02, 9.16, 8.67, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PYDIPALA SAI AKASH', '22A81A0645@sves.org.in', '6281856728', 'student', 'CST', '22A81A0645', '6281856728', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.72, 8.69, 8.54, 8.45, 9.16, 8.6, 9.02, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAJAHMUNDRY SWATHI', '22A81A0647@sves.org.in', '9573113968', 'student', 'CST', '22A81A0647', '9573113968', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.01, 9.23, 9.08, 8.71, 9.35, 8.74, 9.3, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAMISETTI JYOTHIRMAYI', '22A81A0648@sves.org.in', '9381569121', 'student', 'CST', '22A81A0648', '9381569121', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.06, 9.23, 8.62, 9.06, 8.93, 9.44, 9.3, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RELANGI SRI LAKSHMI MOHANA SASI SARAYU', '22A81A0649@sves.org.in', '9491017359', 'student', 'CST', '22A81A0649', '9491017359', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.74, 9.38, 9.23, 8.94, 8.37, 8.47, 8.53, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SHAIK CHAN BASHA', '22A81A0651@sves.org.in', '9550360289', 'student', 'CST', '22A81A0651', '9550360289', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.01, 7.62, 7.08, 8.29, 8.3, 8.16, 8.23, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TAMANAMPUDI YASASWINI SRI', '22A81A0654@sves.org.in', '8639507184', 'student', 'CST', '22A81A0654', '8639507184', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.63, 9.15, 8.85, 8.63, 8.81, 8.19, 8.53, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UCHINTHALA SUPRIYA', '22A81A0657@sves.org.in', '9398553910', 'student', 'CST', '22A81A0657', '9398553910', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.41, 9.31, 9.85, 9.41, 9.58, 9.3, 9.44, 9.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('URLA HASINI', '22A81A0658@sves.org.in', '6304576772', 'student', 'CST', '22A81A0658', '6304576772', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.91, 8.08, 7.38, 7.76, 7.4, 8.09, 7.91, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VARA JEESON BABU', '22A81A0660@sves.org.in', '6302050750', 'student', 'CST', '22A81A0660', '6302050750', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.93, 8.85, 7.46, 8.1, 7.81, 7.81, 7.95, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEJJU YAJNA SRIDEVI', '22A81A0661@sves.org.in', '7013603135', 'student', 'CST', '22A81A0661', '7013603135', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.7, 8.85, 8.38, 8.71, 8.74, 8.81, 8.81, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VELAGALA LOWKYA BHAVANA', '22A81A0662@sves.org.in', '9440403126', 'student', 'CST', '22A81A0662', '9440403126', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.95, 9.38, 8.92, 8.82, 9.21, 9.09, 8.6, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YALAMARTHI SABDHA', '22A81A0666@sves.org.in', '8317569500', 'student', 'CST', '22A81A0666', '8317569500', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.57, 8.31, 8.77, 8.47, 8.37, 8.88, 8.95, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AMARTHALURI SRIDHAR', '23A85A0601@sves.org.in', '9014343213', 'student', 'CST', '23A85A0601', '9014343213', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.23, 0.0, 0.0, 8.06, 8.23, 8.4, 8.44, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BEELLA OM ABHIRAM', '23A85A0603@sves.org.in', '7815858575', 'student', 'CST', '23A85A0603', '7815858575', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.59, 0.0, 0.0, 8.51, 8.26, 8.81, 8.37, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOLANUVADA CHANDRA SHEKAR', '23A85A0604@sves.org.in', '7995709015', 'student', 'CST', '23A85A0604', '7995709015', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.95, 0.0, 0.0, 8.33, 7.4, 7.84, 8.02, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RUDRARAJU JOGI SUBRAHMANYAM RAJU', '23A85A0605@sves.org.in', '6304958379', 'student', 'CST', '23A85A0605', '6304958379', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.74, 0.0, 0.0, 8.41, 7.63, 7.21, 7.33, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SEEPANI VEENASREE', '23A85A0606@sves.org.in', '7382490099', 'student', 'CST', '23A85A0606', '7382490099', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.93, 0.0, 0.0, 8.18, 7.91, 7.91, 7.81, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHILLA YASASWINI', '22A81A1410@sves.org.in', '7075084586', 'student', 'ECT', '22A81A1410', '7075084586', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.02, 8.54, 7.85, 7.96, 7.81, 8.47, 8.44, 7.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DUNDI CHARMI', '22A81A1413@sves.org.in', '9704226347', 'student', 'ECT', '22A81A1413', '9704226347', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.66, 9.23, 8.92, 8.65, 8.6, 9.3, 8.33, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DUNDI DINESH VARDHAN', '22A81A1414@sves.org.in', '9014310778', 'student', 'ECT', '22A81A1414', '9014310778', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 8.15, 8.31, 7.94, 7.67, 8.88, 8.05, 7.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOUTHU BANDHAVI', '22A81A1416@sves.org.in', '6304653334', 'student', 'ECT', '22A81A1416', '6304653334', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.91, 8.77, 8.08, 8.06, 7.77, 7.88, 8.09, 6.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUNA DEEPIKA', '22A81A1417@sves.org.in', '8522885943', 'student', 'ECT', '22A81A1417', '8522885943', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.78, 8.69, 8.23, 7.25, 8.09, 8.19, 7.81, 6.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUNA NAGA RAGHURAM', '22A81A1419@sves.org.in', '6304169886', 'student', 'ECT', '22A81A1419', '6304169886', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 6.93, 7.15, 6.46, 6.96, 6.56, 7.88, 6.7, 6.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUTALA SATYA VENKATA MURALI', '22A81A1420@sves.org.in', '7093433273', 'student', 'ECT', '22A81A1420', '7093433273', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.26, 6.77, 7.46, 7.02, 6.84, 7.63, 7.47, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KONAKALLA NAGA KEERTHI SREE', '22A81A1424@sves.org.in', '9014664846', 'student', 'ECT', '22A81A1424', '9014664846', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.93, 8.38, 8.31, 8.18, 7.91, 8.33, 7.56, 7.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOKKIRALA HEMA DURGA', '22A81A1427@sves.org.in', '9393144492', 'student', 'ECT', '22A81A1427', '9393144492', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.92, 9.15, 9.06, 8.74, 8.88, 7.56, 7.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOMMURI YAMINI', '22A81A1428@sves.org.in', '9502214116', 'student', 'ECT', '22A81A1428', '9502214116', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.32, 8.92, 8.23, 7.94, 8.19, 8.74, 8.47, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KURELLA LAKSHMI SRI SATYA', '22A81A1430@sves.org.in', '9985902617', 'student', 'ECT', '22A81A1430', '9985902617', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.93, 8.31, 8.23, 7.9, 7.77, 8.4, 7.74, 7.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADDALA BHARGAVI', '22A81A1433@sves.org.in', '6304927113', 'student', 'ECT', '22A81A1433', '6304927113', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.46, 8.62, 8.37, 8.88, 9.02, 8.74, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADDALA DURGA VENKATA SATYASAI', '22A81A1434@sves.org.in', '8919996452', 'student', 'ECT', '22A81A1434', '8919996452', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.38, 7.0, 7.69, 7.02, 7.81, 7.4, 7.81, 7.04, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADDIPATLA SUMA', '22A81A1435@sves.org.in', '9515082239', 'student', 'ECT', '22A81A1435', '9515082239', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.29, 8.46, 8.23, 8.25, 8.26, 8.53, 8.33, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANEPALLI AKSHAYA', '22A81A1436@sves.org.in', '8919327193', 'student', 'ECT', '22A81A1436', '8919327193', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.01, 9.0, 9.38, 9.47, 8.74, 9.16, 8.88, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOTEPALLI SAMEERA', '22A81A1440@sves.org.in', '7793957469', 'student', 'ECT', '22A81A1440', '7793957469', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.14, 7.92, 7.31, 8.31, 7.95, 8.95, 8.23, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NILABOINA LAKSHMI NAGA DURGA VINEETHA', '22A81A1441@sves.org.in', '9014912129', 'student', 'ECT', '22A81A1441', '9014912129', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.76, 7.38, 8.15, 7.61, 7.12, 8.37, 8.51, 7.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POSINA CHANDRIKA', '22A81A1447@sves.org.in', '9182125066', 'student', 'ECT', '22A81A1447', '9182125066', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.83, 8.0, 8.0, 7.67, 7.6, 8.09, 8.26, 7.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PUTTA YAGNA SRI HARSHITHA', '22A81A1450@sves.org.in', '9494127969', 'student', 'ECT', '22A81A1450', '9494127969', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.23, 9.08, 8.54, 8.06, 7.91, 8.33, 8.47, 7.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SUNKARA SRAVANI', '22A81A1455@sves.org.in', '9441566833', 'student', 'ECT', '22A81A1455', '9441566833', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.38, 9.08, 9.0, 8.24, 8.3, 8.6, 8.05, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TALAMSETTI GOPIKA SRITHA', '22A81A1456@sves.org.in', '6305127334', 'student', 'ECT', '22A81A1456', '6305127334', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.82, 8.92, 9.0, 8.88, 8.6, 9.3, 8.74, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TORATI JAYASURYA TEJASWINI', '22A81A1459@sves.org.in', '9121741618', 'student', 'ECT', '22A81A1459', '9121741618', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.24, 8.54, 8.23, 8.25, 7.81, 8.67, 8.74, 7.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VALLABHANENI NANDHINI', '22A81A1460@sves.org.in', '9346267633', 'student', 'ECT', '22A81A1460', '9346267633', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.65, 8.46, 7.77, 7.78, 7.47, 7.98, 7.63, 6.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VUDDAGIRI HEMA SIVA HARIKA', '22A81A1462@sves.org.in', '8341249257', 'student', 'ECT', '22A81A1462', '8341249257', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.39, 9.15, 8.69, 8.82, 7.95, 8.47, 8.19, 7.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YADLAPALLI LAKSHMI PRASUNA', '22A81A1463@sves.org.in', '8712251369', 'student', 'ECT', '22A81A1463', '8712251369', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.07, 8.31, 7.77, 7.82, 7.81, 8.67, 8.33, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('YARRA SYAMALA', '22A81A1465@sves.org.in', '9676899766', 'student', 'ECT', '22A81A1465', '9676899766', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.32, 9.08, 8.46, 8.41, 7.88, 8.95, 7.91, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AKASAPU VARUN MANIKANTA', '23A85A1401@sves.org.in', '9640448199', 'student', 'ECT', '23A85A1401', '9640448199', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.68, 0.0, 0.0, 7.14, 7.4, 7.98, 8.33, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ABDUL SAMEER', '22A81A6101@sves.org.in', '8179055865', 'student', 'AIM', '22A81A6101', '8179055865', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.32, 8.15, 8.31, 8.45, 8.47, 8.37, 8.02, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADDAGARLA ADITHYA SATYA TRINADHA SHANMUKH', '22A81A6102@sves.org.in', '9381625956', 'student', 'AIM', '22A81A6102', '9381625956', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.88, 8.23, 7.46, 7.63, 7.49, 8.44, 7.84, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADIMELLI SRIKANYA', '22A81A6103@sves.org.in', '7569236353', 'student', 'AIM', '22A81A6103', '7569236353', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.3, 8.69, 7.85, 8.14, 8.26, 8.3, 8.33, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('B LAXMI VENKATA RAMA DURGA SOWJANYA', '22A81A6105@sves.org.in', '9542519285', 'student', 'AIM', '22A81A6105', '9542519285', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.68, 8.77, 7.38, 7.78, 7.14, 7.4, 7.91, 7.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BADAM SAI BHAVANI', '22A81A6106@sves.org.in', '7032565991', 'student', 'AIM', '22A81A6106', '7032565991', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.75, 7.46, 7.92, 7.24, 7.35, 7.74, 8.26, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BORRA VIJAY VINAYAK', '22A81A6107@sves.org.in', '6304153598', 'student', 'AIM', '22A81A6107', '6304153598', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.93, 8.62, 8.08, 7.24, 7.63, 8.09, 7.67, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BULUSU VENKATA DURGA SRI HARSHINI', '22A81A6109@sves.org.in', '6304938149', 'student', 'AIM', '22A81A6109', '6304938149', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.18, 8.54, 7.62, 7.24, 8.33, 8.51, 8.74, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BUSI PALLAVI', '22A81A6110@sves.org.in', '6302975519', 'student', 'AIM', '22A81A6110', '6302975519', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.65, 7.62, 6.62, 7.18, 7.21, 8.02, 8.6, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHELLABOINA YESURAJU', '22A81A6112@sves.org.in', '9392234389', 'student', 'AIM', '22A81A6112', '9392234389', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 9.23, 9.0, 9.02, 8.47, 9.02, 9.02, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DAGULURI RAJU', '22A81A6115@sves.org.in', '9866942197', 'student', 'AIM', '22A81A6115', '9866942197', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 8.08, 7.85, 7.88, 7.91, 8.47, 8.19, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GORREMUTCHU SOLOMON MATTHEWS', '22A81A6121@sves.org.in', '6305718769', 'student', 'AIM', '22A81A6121', '6305718769', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.09, 8.77, 8.46, 8.39, 7.84, 7.7, 7.84, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JAKKANI SREE TARAKA VAMSI KRISHNA', '22A81A6122@sves.org.in', '8919159595', 'student', 'AIM', '22A81A6122', '8919159595', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.64, 8.77, 8.15, 9.06, 8.33, 8.6, 9.02, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('K PURNA SATYA SAI SAHITHI', '22A81A6124@sves.org.in', '8106124961', 'student', 'AIM', '22A81A6124', '8106124961', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.52, 9.15, 8.15, 8.69, 8.53, 8.37, 8.44, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARRI ROHIT SAI LAKSHMAN REDDY', '22A81A6125@sves.org.in', '9493957945', 'student', 'AIM', '22A81A6125', '9493957945', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.51, 9.38, 8.08, 8.39, 7.28, 8.6, 9.21, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANTHETI VIVEKRAM', '22A81A6128@sves.org.in', '8522020692', 'student', 'AIM', '22A81A6128', '8522020692', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.66, 9.08, 8.31, 8.65, 8.05, 8.74, 8.93, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAVALA JITHENDRA', '22A81A6130@sves.org.in', '8309042235', 'student', 'AIM', '22A81A6130', '8309042235', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.77, 8.08, 8.98, 7.91, 8.88, 8.72, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOMBATHULA AKHIL BABU', '22A81A6131@sves.org.in', '9346658378', 'student', 'AIM', '22A81A6131', '9346658378', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.62, 7.69, 7.46, 7.82, 7.21, 7.95, 7.47, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOMMU LAKSHMI LAVANYA', '22A81A6132@sves.org.in', '6302303231', 'student', 'AIM', '22A81A6132', '6302303231', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.39, 9.08, 8.62, 8.27, 8.05, 8.37, 8.33, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KONDAVEETI MONICA', '22A81A6134@sves.org.in', '9121344797', 'student', 'AIM', '22A81A6134', '9121344797', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.45, 8.92, 7.54, 8.71, 8.33, 8.65, 8.33, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MOHAMMAD ISHAQ', '22A81A6137@sves.org.in', '9393265888', 'student', 'AIM', '22A81A6137', '9393265888', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 8.15, 7.08, 7.94, 7.91, 8.47, 8.6, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MUNISETTI VENKATA LAVANYA', '22A81A6141@sves.org.in', '7075291677', 'student', 'AIM', '22A81A6141', '7075291677', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.79, 9.38, 8.46, 8.92, 8.4, 9.21, 8.74, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NALLAMELLI BABY SARANYA', '22A81A6142@sves.org.in', '9133391118', 'student', 'AIM', '22A81A6142', '9133391118', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 8.62, 7.46, 7.92, 7.63, 7.95, 8.53, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAVABATTULA MANOHAR NAGA SRI SAI', '22A81A6143@sves.org.in', '6305083757', 'student', 'AIM', '22A81A6143', '6305083757', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 8.08, 8.46, 7.92, 7.98, 8.58, 8.6, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NELLI RAJA', '22A81A6145@sves.org.in', '7601057948', 'student', 'AIM', '22A81A6145', '7601057948', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.96, 8.46, 7.0, 7.59, 7.84, 8.33, 8.09, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PABBA HARSHINI', '22A81A6146@sves.org.in', '9121930594', 'student', 'AIM', '22A81A6146', '9121930594', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.34, 9.23, 8.08, 8.06, 8.12, 8.47, 8.6, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALURI MOUNIKA', '22A81A6147@sves.org.in', '8374611254', 'student', 'AIM', '22A81A6147', '8374611254', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.64, 8.85, 7.77, 8.39, 8.53, 8.88, 9.44, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PATHURI BHUVANESWARI', '22A81A6149@sves.org.in', '7569046467', 'student', 'AIM', '22A81A6149', '7569046467', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.11, 9.69, 8.92, 9.27, 8.88, 9.16, 9.23, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PULAPA INDIRA', '22A81A6151@sves.org.in', '7780462957', 'student', 'AIM', '22A81A6151', '7780462957', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.79, 9.62, 8.31, 8.82, 8.12, 8.88, 9.02, 8.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SARIKA ANJANEYA KARTHIK', '22A81A6154@sves.org.in', '7396351571', 'student', 'AIM', '22A81A6154', '7396351571', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.25, 8.46, 7.85, 8.71, 7.7, 8.19, 8.88, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SIMHADRI TARUNI', '22A81A6155@sves.org.in', '8184945533', 'student', 'AIM', '22A81A6155', '8184945533', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.11, 9.62, 9.08, 8.98, 8.88, 9.16, 9.16, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TAMMINEEDI REKHA PRABHU', '22A81A6157@sves.org.in', '9392947775', 'student', 'AIM', '22A81A6157', '9392947775', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.94, 9.46, 8.69, 8.86, 8.74, 8.88, 9.16, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TIRUPATHI SHANMUKHA PRIYA', '22A81A6159@sves.org.in', '6300372367', 'student', 'AIM', '22A81A6159', '6300372367', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.88, 9.31, 9.0, 9.06, 8.74, 8.47, 9.02, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TIRUVEEDULA L.N.V.S.M.L.DHEERAJ', '22A81A6160@sves.org.in', '7842420613', 'student', 'AIM', '22A81A6160', '7842420613', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.24, 8.77, 8.23, 8.29, 8.19, 8.02, 8.26, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEDANTAM VENKATA MODA SRI VAISHNAVI', '22A81A6162@sves.org.in', '8106962366', 'student', 'AIM', '22A81A6162', '8106962366', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.75, 8.92, 8.08, 8.86, 8.67, 9.02, 9.02, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VANTIPALLI PURNA SRI', '22A81A6163@sves.org.in', '9459893333', 'student', 'AIM', '22A81A6163', '9459893333', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.93, 9.62, 8.69, 9.24, 8.67, 8.86, 8.81, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADABALA JAYA MOUNIKA', '22A81A6167@sves.org.in', '8019736844', 'student', 'AIM', '22A81A6167', '8019736844', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.83, 9.31, 8.62, 8.94, 8.33, 8.6, 9.02, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ANEM PADMA RAMA SOWJANYA GANESWARI', '22A81A6169@sves.org.in', '7013975155', 'student', 'AIM', '22A81A6169', '7013975155', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.82, 8.54, 8.23, 9.29, 8.88, 8.88, 9.44, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BONDADA VAHINI SATYA KALA', '22A81A6172@sves.org.in', '6301100912', 'student', 'AIM', '22A81A6172', '6301100912', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.41, 8.77, 7.92, 8.71, 7.91, 8.12, 8.65, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BORRA VIKASH', '22A81A6173@sves.org.in', '9441133755', 'student', 'AIM', '22A81A6173', '9441133755', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.95, 8.0, 7.54, 7.98, 7.77, 7.81, 7.74, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BURRA AVINASH', '22A81A6174@sves.org.in', '9704935980', 'student', 'AIM', '22A81A6174', '9704935980', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.76, 7.69, 7.23, 7.75, 7.35, 7.53, 7.81, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHENNURI VASANTHI', '22A81A6176@sves.org.in', '7997292889', 'student', 'AIM', '22A81A6176', '7997292889', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.8, 7.77, 7.15, 7.71, 7.63, 7.88, 7.98, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DANDUBOINA JYOTHI SWAROOP', '22A81A6179@sves.org.in', '6301007254', 'student', 'AIM', '22A81A6179', '6301007254', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.88, 7.85, 7.69, 7.86, 7.63, 8.23, 7.53, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DUGGIRALA SAI KOUSHYA', '22A81A6180@sves.org.in', '8374099466', 'student', 'AIM', '22A81A6180', '8374099466', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.39, 8.31, 7.69, 8.59, 8.4, 8.6, 8.37, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GHANTA VENU MADHURI', '22A81A6182@sves.org.in', '6304726531', 'student', 'AIM', '22A81A6182', '6304726531', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.79, 8.92, 8.46, 9.06, 8.53, 9.16, 8.6, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('INDANA RAGHAVENKATA SATYANARAYANA', '22A81A6186@sves.org.in', '6300073279', 'student', 'AIM', '22A81A6186', '6300073279', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.07, 9.69, 9.08, 9.18, 9.3, 9.02, 8.74, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KALLA RAMA SRI SAI SANDEEP', '22A81A6188@sves.org.in', '9951334833', 'student', 'AIM', '22A81A6188', '9951334833', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.31, 8.38, 8.31, 8.41, 7.98, 8.67, 7.95, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARUTURI KOUSHIKA', '22A81A6189@sves.org.in', '9848602023', 'student', 'AIM', '22A81A6189', '9848602023', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.83, 8.31, 7.38, 8.29, 7.7, 7.67, 7.74, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOCHERLA HINDU', '22A81A6190@sves.org.in', '8247267574', 'student', 'AIM', '22A81A6190', '8247267574', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.29, 8.38, 7.62, 8.71, 7.98, 8.09, 8.51, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOTTU SATYANARAYANA', '22A81A6194@sves.org.in', '8074645996', 'student', 'AIM', '22A81A6194', '8074645996', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.62, 8.0, 6.85, 7.69, 8.05, 7.53, 7.26, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOVVURI NIMEELA', '22A81A6195@sves.org.in', '9000158272', 'student', 'AIM', '22A81A6195', '9000158272', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.47, 7.0, 6.46, 7.53, 7.63, 7.67, 7.53, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANE B S S BHASKAR SHANMUKHA VAMSI', '22A81A6196@sves.org.in', '6305611826', 'student', 'AIM', '22A81A6196', '6305611826', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 8.85, 7.23, 8.18, 7.98, 7.81, 7.81, 8.13, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANIKALA VIJAY KRISHNA', '22A81A6198@sves.org.in', '9391843437', 'student', 'AIM', '22A81A6198', '9391843437', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.34, 7.54, 7.0, 7.82, 7.12, 7.09, 7.19, 7.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MATTA KIRAN KUMAR', '22A81A6199@sves.org.in', '8866899666', 'student', 'AIM', '22A81A6199', '8866899666', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.01, 8.23, 7.23, 8.47, 8.05, 7.81, 8.09, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MENNI MADHAVI LATHA', '22A81A61A0@sves.org.in', '9177243781', 'student', 'AIM', '22A81A61A0', '9177243781', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.8, 9.0, 7.92, 8.82, 8.67, 8.88, 9.3, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAINARAPU KRISHNA CHAITANYA', '22A81A61A2@sves.org.in', '9133544634', 'student', 'AIM', '22A81A61A2', '9133544634', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.06, 8.08, 7.08, 8.39, 8.67, 8.16, 7.33, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAMBULA ESWAR AKASH', '22A81A61A4@sves.org.in', '8341462856', 'student', 'AIM', '22A81A61A4', '8341462856', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.06, 8.23, 7.69, 8.39, 7.63, 7.95, 7.47, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALLAPOTHU NAGA KRISHNA MADHURIMA', '22A81A61A8@sves.org.in', '7989846096', 'student', 'AIM', '22A81A61A8', '7989846096', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.9, 9.31, 8.69, 8.98, 8.74, 8.95, 8.81, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PAMIDI RESHMITHA SREE', '22A81A61A9@sves.org.in', '9347318653', 'student', 'AIM', '22A81A61A9', '9347318653', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.92, 8.92, 7.85, 7.92, 7.77, 7.88, 7.67, 7.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PATTAN FARJANA', '22A81A61B2@sves.org.in', '9704019178', 'student', 'AIM', '22A81A61B2', '9704019178', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.32, 8.62, 7.0, 8.71, 8.53, 8.23, 8.67, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAMISETTI VISWAJA', '22A81A61B7@sves.org.in', '8639179966', 'student', 'AIM', '22A81A61B7', '8639179966', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.93, 9.46, 8.54, 9.06, 8.74, 9.02, 8.88, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SABBARAPU MOHAN GANESH', '22A81A61B8@sves.org.in', '9052811658', 'student', 'AIM', '22A81A61B8', '9052811658', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.86, 8.77, 7.46, 8.22, 7.35, 7.37, 7.67, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SHEIK RIHANA', '22A81A61C0@sves.org.in', '8688004493', 'student', 'AIM', '22A81A61C0', '8688004493', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.23, 8.15, 7.46, 8.47, 7.98, 8.3, 8.53, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SOMA GOWTHAMI', '22A81A61C2@sves.org.in', '9391318590', 'student', 'AIM', '22A81A61C2', '9391318590', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.59, 9.08, 7.85, 8.76, 8.4, 8.95, 8.58, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UNDURTHI KARTHIK SANJAY', '22A81A61C5@sves.org.in', '7396496696', 'student', 'AIM', '22A81A61C5', '7396496696', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.47, 7.54, 7.0, 7.57, 7.28, 7.6, 7.4, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VARRI BINDU SURYA SRI', '22A81A61C6@sves.org.in', '9100927227', 'student', 'AIM', '22A81A61C6', '9100927227', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.12, 8.31, 7.54, 8.1, 8.47, 8.16, 8.05, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEERANKI SAI SRIVALLI', '22A81A61C8@sves.org.in', '9573821549', 'student', 'AIM', '22A81A61C8', '9573821549', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.61, 8.77, 8.46, 8.41, 8.26, 8.88, 8.88, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VERNENI SANKEERTHANA', '22A81A61C9@sves.org.in', '9959322022', 'student', 'AIM', '22A81A61C9', '9959322022', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.97, 9.69, 9.23, 9.29, 8.47, 9.16, 8.88, 8.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TALAPATI RAVINDRA', '23A85A6106@sves.org.in', '7207022630', 'student', 'AIM', '23A85A6106', '7207022630', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 0.0, 0.0, 8.33, 8.19, 7.88, 8.4, 7.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEMPADAPU RAMA KRISHNA', '23A85A6108@sves.org.in', '9390492076', 'student', 'AIM', '23A85A6108', '9390492076', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.12, 0.0, 0.0, 8.29, 7.98, 8.74, 8.02, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANDEPU JAGAN MOHAN SAI', '23A85A6110@sves.org.in', '7671001426', 'student', 'AIM', '23A85A6110', '7671001426', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.35, 0.0, 0.0, 7.71, 6.72, 6.88, 7.6, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KUDUPUDI NARSIMHA SAI SANDEEP', '23A85A6111@sves.org.in', '9014532005', 'student', 'AIM', '23A85A6111', '9014532005', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.86, 0.0, 0.0, 8.24, 7.91, 7.67, 7.88, 7.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BUDDANA DURGA VARA PRASAD', '22A81A4302@sves.org.in', '8919766303', 'student', 'CAI', '22A81A4302', '8919766303', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.73, 8.46, 7.15, 7.84, 6.98, 7.74, 7.53, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('D B ABHISHEK ANANTAPALLI', '22A81A4305@sves.org.in', '8317618694', 'student', 'CAI', '22A81A4305', '8317618694', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.17, 9.38, 8.77, 9.53, 8.81, 9.16, 9.58, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GARIMELLA VASANTHA SURYA PRASAD', '22A81A4306@sves.org.in', '7893156396', 'student', 'CAI', '22A81A4306', '7893156396', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.26, 8.0, 8.23, 9.06, 7.67, 7.88, 8.05, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GETCHA BHEESHMIKA', '22A81A4307@sves.org.in', '7013333902', 'student', 'CAI', '22A81A4307', '7013333902', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.12, 8.38, 7.46, 7.75, 7.84, 8.19, 8.67, 8.52, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GOLTHI SONI HARIKA', '22A81A4309@sves.org.in', '7989682765', 'student', 'CAI', '22A81A4309', '7989682765', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.91, 8.77, 7.92, 8.0, 7.12, 7.7, 7.81, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUDIMETLA ANU KARISHMA', '22A81A4310@sves.org.in', '8328533689', 'student', 'CAI', '22A81A4310', '8328533689', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.24, 9.85, 9.08, 9.29, 9.21, 9.02, 9.44, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GULLA HARI SANKARA BHAVANI PRASAD', '22A81A4311@sves.org.in', '8978615307', 'student', 'CAI', '22A81A4311', '8978615307', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.21, 8.38, 7.38, 7.63, 8.02, 8.09, 8.74, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JALLA PADMA SRI', '22A81A4312@sves.org.in', '8520847664', 'student', 'CAI', '22A81A4312', '8520847664', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.18, 8.54, 7.23, 7.86, 7.05, 8.74, 9.14, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KUNCHANAPALLI HEMA LALITHA DURGA', '22A81A4316@sves.org.in', '9392996754', 'student', 'CAI', '22A81A4316', '9392996754', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.89, 8.0, 7.38, 7.51, 7.26, 7.98, 8.51, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KAKUMANU VENKATA SAI SRI DEEPIKA', '22A81A4317@sves.org.in', '8712152004', 'student', 'CAI', '22A81A4317', '8712152004', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.89, 9.46, 8.69, 8.75, 8.26, 8.95, 9.21, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KARUTURI POOJITHA', '22A81A4318@sves.org.in', '7671968916', 'student', 'CAI', '22A81A4318', '7671968916', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.63, 8.54, 8.46, 8.71, 8.05, 8.88, 8.6, 9.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KESANI NAVYA SREE', '22A81A4321@sves.org.in', '9392485248', 'student', 'CAI', '22A81A4321', '9392485248', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.71, 8.46, 8.23, 8.94, 8.4, 9.16, 8.67, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOKKIRIMETTI PAVAN NAGA VENKATA KUMAR', '22A81A4322@sves.org.in', '9010635259', 'student', 'CAI', '22A81A4322', '9010635259', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 9.0, 7.62, 8.37, 7.33, 8.47, 8.33, 7.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOLLEPARA SATHVIKA', '22A81A4323@sves.org.in', '8096513001', 'student', 'CAI', '22A81A4323', '8096513001', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.3, 9.0, 7.69, 8.94, 7.47, 7.77, 8.33, 8.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KONA KARTHIK', '22A81A4324@sves.org.in', '9640715598', 'student', 'CAI', '22A81A4324', '9640715598', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.99, 8.0, 6.85, 7.86, 7.81, 8.6, 8.05, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KONGARA MEGHANA', '22A81A4325@sves.org.in', '9381687830', 'student', 'CAI', '22A81A4325', '9381687830', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.22, 9.23, 9.31, 9.41, 9.3, 9.44, 9.02, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KOTHA DREAM SRI VENKATA THANMAI', '22A81A4327@sves.org.in', '8297877555', 'student', 'CAI', '22A81A4327', '8297877555', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.2, 9.69, 8.62, 9.08, 8.88, 9.44, 9.58, 9.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('LINGAM GOWTHAM KUMAR', '22A81A4329@sves.org.in', '9014305640', 'student', 'CAI', '22A81A4329', '9014305640', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.8, 8.08, 7.0, 8.0, 7.35, 8.19, 8.05, 7.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MALLIDI SURYANARAYANA REDDY', '22A81A4330@sves.org.in', '9347445773', 'student', 'CAI', '22A81A4330', '9347445773', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.2, 9.08, 7.77, 8.2, 8.23, 8.19, 8.02, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MAGANTI BAVANA', '22A81A4331@sves.org.in', '9030207566', 'student', 'CAI', '22A81A4331', '9030207566', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.0, 9.46, 9.0, 9.29, 8.95, 8.6, 9.3, 8.43, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MAKA JAHNAVI NAGA SAI', '22A81A4333@sves.org.in', '8519807791', 'student', 'CAI', '22A81A4333', '8519807791', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.05, 8.0, 7.69, 7.94, 7.42, 8.26, 8.81, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEDA GOVARDHANA SUBHASH', '22A81A4335@sves.org.in', '9392676529', 'student', 'CAI', '22A81A4335', '9392676529', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.77, 9.08, 8.69, 8.82, 8.6, 8.67, 8.88, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAARLA DURGA PRASAD', '22A81A4338@sves.org.in', '7013379791', 'student', 'CAI', '22A81A4338', '7013379791', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 9.46, 9.15, 9.02, 8.6, 9.16, 8.58, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NAGIREDDY TULASI SATYAVATHI', '22A81A4339@sves.org.in', '9652562592', 'student', 'CAI', '22A81A4339', '9652562592', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.43, 8.69, 7.85, 8.49, 8.33, 8.6, 8.65, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NARKIDIMILLI SAKETH', '22A81A4340@sves.org.in', '8555883949', 'student', 'CAI', '22A81A4340', '8555883949', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.09, 9.69, 9.08, 9.0, 8.88, 9.16, 9.16, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ODURI SRINIVAS', '22A81A4342@sves.org.in', '9959325457', 'student', 'CAI', '22A81A4342', '9959325457', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.38, 9.62, 9.38, 9.41, 9.16, 9.3, 9.58, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PADILAM KALYAN KUMAR', '22A81A4344@sves.org.in', '6300808054', 'student', 'CAI', '22A81A4344', '6300808054', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.25, 9.85, 9.38, 9.41, 8.6, 9.16, 9.16, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PAIDY DEEPAK', '22A81A4345@sves.org.in', '9618045505', 'student', 'CAI', '22A81A4345', '9618045505', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.04, 8.08, 7.54, 7.96, 7.7, 8.23, 8.44, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PALLI KALYAN BABU', '22A81A4346@sves.org.in', '8121606415', 'student', 'CAI', '22A81A4346', '8121606415', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.24, 8.69, 8.54, 7.9, 7.91, 7.77, 8.16, 8.78, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PEDAPUDI SRINIVASA SAIRAMA DATTATREYA', '22A81A4347@sves.org.in', '9390447466', 'student', 'CAI', '22A81A4347', '9390447466', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.11, 9.46, 7.92, 7.9, 7.21, 7.67, 8.33, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PERURI SANDEEP', '22A81A4349@sves.org.in', '9063507445', 'student', 'CAI', '22A81A4349', '9063507445', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.1, 8.31, 7.54, 8.1, 7.91, 8.33, 8.12, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PINNINTI DEEPIKA', '22A81A4350@sves.org.in', '9490043898', 'student', 'CAI', '22A81A4350', '9490043898', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.99, 9.38, 8.46, 8.8, 8.74, 9.3, 9.02, 9.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('RAPAKA DIVYA', '22A81A4351@sves.org.in', '9963099088', 'student', 'CAI', '22A81A4351', '9963099088', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.99, 9.23, 8.92, 9.14, 8.88, 8.74, 9.16, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ROWTHULA VARSHINI', '22A81A4352@sves.org.in', '8247336585', 'student', 'CAI', '22A81A4352', '8247336585', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.42, 8.15, 7.77, 8.53, 8.58, 8.47, 9.02, 8.35, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SINGAMSETTI SYAMANTH UMA SAI KIRAN', '22A81A4353@sves.org.in', '7671888674', 'student', 'CAI', '22A81A4353', '7671888674', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.61, 9.0, 7.69, 8.69, 8.6, 8.88, 8.47, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SAKILE BALU MAHENDRA', '22A81A4355@sves.org.in', '9491919575', 'student', 'CAI', '22A81A4355', '9491919575', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.28, 8.77, 8.15, 8.2, 7.91, 8.33, 8.6, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SALADI DEEPIKA', '22A81A4356@sves.org.in', '9392499985', 'student', 'CAI', '22A81A4356', '9392499985', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.28, 9.62, 8.92, 9.29, 8.65, 9.72, 9.72, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SARIKA CHANDU SRI VENKATA PAVAN KUMAR', '22A81A4357@sves.org.in', '9014664141', 'student', 'CAI', '22A81A4357', '9014664141', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.18, 8.15, 7.62, 8.04, 7.7, 8.86, 8.21, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SIDDHA VINAY KUMAR', '22A81A4359@sves.org.in', '9849372827', 'student', 'CAI', '22A81A4359', '9849372827', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.02, 9.38, 9.08, 8.71, 8.74, 9.3, 9.16, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('TATINI PRUDHVI SARANYA', '22A81A4361@sves.org.in', '6301669596', 'student', 'CAI', '22A81A4361', '6301669596', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.79, 9.08, 8.46, 9.0, 8.33, 8.88, 8.88, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('THOTA AMRUTHA SINDHU', '22A81A4362@sves.org.in', '8919239911', 'student', 'CAI', '22A81A4362', '8919239911', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.0, 9.69, 9.0, 9.18, 8.74, 9.02, 8.88, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEERABATTHULA SAI CHANDANA', '22A81A4364@sves.org.in', '9581356416', 'student', 'CAI', '22A81A4364', '9581356416', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.01, 9.31, 8.69, 8.9, 8.74, 9.3, 9.16, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VUDATHA PAVANI SRI LAKSHMI SAVITHRI', '22A81A4365@sves.org.in', '9951251096', 'student', 'CAI', '22A81A4365', '9951251096', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.96, 9.38, 8.92, 9.35, 8.3, 9.3, 9.16, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ADDAGALLA REKHA SREE LAKSHMI HARI PRIYA', '22A81A4367@sves.org.in', '9441912666', 'student', 'CAI', '22A81A4367', '9441912666', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.58, 8.77, 8.0, 8.98, 8.26, 8.53, 8.81, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AINAPURAPU L M DATHA BHASKARA GOPAL', '22A81A4368@sves.org.in', '7569882778', 'student', 'CAI', '22A81A4368', '7569882778', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.19, 8.54, 7.77, 8.1, 7.91, 8.6, 8.53, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ALLADI PRIYA VARSHINI BHANU SREE', '22A81A4370@sves.org.in', '9959299885', 'student', 'CAI', '22A81A4370', '9959299885', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.54, 9.0, 7.23, 8.45, 8.19, 8.95, 9.3, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ALLI VENKATA SAI SURYA DIWAKAR', '22A81A4371@sves.org.in', '6302722352', 'student', 'CAI', '22A81A4371', '6302722352', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.11, 9.31, 8.92, 9.41, 9.02, 9.07, 9.3, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AMBADIPUDI ABRAHAM KRUPA KIRAN SARMA', '22A81A4372@sves.org.in', '9391115911', 'student', 'CAI', '22A81A4372', '9391115911', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.21, 8.46, 7.23, 8.04, 7.77, 8.81, 8.47, 8.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('AVULA KRISHNA VENKATA KOUSHIK', '22A81A4374@sves.org.in', '7382484830', 'student', 'CAI', '22A81A4374', '7382484830', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.25, 8.62, 7.77, 8.69, 7.56, 8.23, 8.53, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BATHULA SAI CHARAN', '22A81A4375@sves.org.in', '6309444011', 'student', 'CAI', '22A81A4375', '6309444011', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.99, 9.38, 8.69, 9.06, 8.74, 9.0, 9.09, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BATTELANKA PARASURAM SAI KUMAR', '22A81A4376@sves.org.in', '6303598606', 'student', 'CAI', '22A81A4376', '6303598606', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.99, 8.62, 7.0, 7.92, 7.28, 7.81, 8.53, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BUDDIGA SRIRAM', '22A81A4377@sves.org.in', '9032881413', 'student', 'CAI', '22A81A4377', '9032881413', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.28, 8.62, 7.69, 8.71, 8.05, 8.19, 8.67, 7.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('CHINIMILLI GNANA DEVI PRASANNA', '22A81A4378@sves.org.in', '6281659967', 'student', 'CAI', '22A81A4378', '6281659967', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.01, 8.08, 7.77, 8.22, 7.77, 7.67, 8.19, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DANDAMUDI VARUN', '22A81A4379@sves.org.in', '8309352741', 'student', 'CAI', '22A81A4379', '8309352741', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.49, 9.08, 8.0, 8.47, 7.98, 8.88, 8.33, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DWARAMPUDI LOKESH ADHIREDDY', '22A81A4381@sves.org.in', '9391598334', 'student', 'CAI', '22A81A4381', '9391598334', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.31, 9.0, 7.85, 8.57, 8.33, 8.02, 7.98, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GODITI SRI DEEPTI', '22A81A4384@sves.org.in', '8260936009', 'student', 'CAI', '22A81A4384', '8260936009', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.79, 9.23, 7.92, 9.06, 8.81, 8.74, 9.02, 8.65, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GRANDHI DILEEP KUMAR', '22A81A4385@sves.org.in', '9848576525', 'student', 'CAI', '22A81A4385', '9848576525', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.53, 8.92, 8.15, 8.71, 8.05, 9.02, 8.47, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('GUDIMELLA PAVANI VAISHNAVI', '22A81A4386@sves.org.in', '9014756327', 'student', 'CAI', '22A81A4386', '9014756327', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.41, 9.38, 7.77, 8.69, 8.19, 8.19, 8.6, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JAVVADI HARSHITHA', '22A81A4389@sves.org.in', '6281732203', 'student', 'CAI', '22A81A4389', '6281732203', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.8, 9.38, 8.77, 8.94, 8.26, 9.16, 8.88, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('JAYAVARAPU RAHITYA', '22A81A4390@sves.org.in', '6304919558', 'student', 'CAI', '22A81A4390', '6304919558', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.83, 9.23, 8.69, 8.86, 9.02, 9.02, 8.53, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KANTAMSETTI PUJITHA JYOTHI', '22A81A4393@sves.org.in', '7989474795', 'student', 'CAI', '22A81A4393', '7989474795', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.22, 9.54, 9.0, 9.41, 9.09, 9.35, 9.16, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KONDETI GAYATHRI VARAPRASADHINI', '22A81A4395@sves.org.in', '9912553797', 'student', 'CAI', '22A81A4395', '9912553797', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.62, 9.23, 8.54, 8.59, 8.26, 9.07, 8.47, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('KUNCHE MOUNIKA', '22A81A4397@sves.org.in', '9912941833', 'student', 'CAI', '22A81A4397', '9912941833', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.45, 9.15, 7.38, 8.63, 8.26, 9.02, 8.53, 8.09, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('LINGAMPALLI BHARGAV SAI', '22A81A4398@sves.org.in', '9390192684', 'student', 'CAI', '22A81A4398', '9390192684', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.46, 9.15, 8.23, 8.94, 7.42, 8.93, 8.12, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MAIPALA CHIRANJEEVI', '22A81A4399@sves.org.in', '9121859628', 'student', 'CAI', '22A81A4399', '9121859628', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.91, 9.38, 8.54, 9.18, 8.67, 9.07, 8.95, 8.57, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MANGINA PAVAN KUMAR PURNAYYA', '22A81A43A1@sves.org.in', '6281406054', 'student', 'CAI', '22A81A43A1', '6281406054', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.68, 9.0, 8.23, 8.71, 8.33, 9.28, 8.47, 8.74, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MEDANKULA TEJASWIN', '22A81A43A2@sves.org.in', '8639432353', 'student', 'CAI', '22A81A43A2', '8639432353', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.37, 9.08, 8.0, 8.47, 8.26, 8.02, 8.53, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NETHI SRI CHARAN MANI MALLESH', '22A81A43A5@sves.org.in', '6301908108', 'student', 'CAI', '22A81A43A5', '6301908108', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.89, 9.54, 8.85, 9.18, 8.4, 9.23, 8.4, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NILLA NANDINI VEERA NAGA LAKSHMI', '22A81A43A8@sves.org.in', '7032459373', 'student', 'CAI', '22A81A43A8', '7032459373', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.07, 9.54, 9.0, 8.94, 8.6, 9.42, 9.16, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PASAM HEMA PAVANI SAI DURGA', '22A81A43A9@sves.org.in', '9885155678', 'student', 'CAI', '22A81A43A9', '9885155678', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.8, 9.08, 9.0, 8.75, 8.67, 8.72, 8.74, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PADILAM SAI RAM', '22A81A43B0@sves.org.in', '7207385947', 'student', 'CAI', '22A81A43B0', '7207385947', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.65, 9.08, 7.85, 8.71, 8.47, 8.4, 9.09, 8.91, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PASUMARTHI HIMANTH NAGA CHARAN', '22A81A43B1@sves.org.in', '6300114947', 'student', 'CAI', '22A81A43B1', '6300114947', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.09, 9.69, 8.92, 9.04, 9.02, 9.21, 8.95, 8.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PATURI JAYASREE', '22A81A43B2@sves.org.in', '9030798879', 'student', 'CAI', '22A81A43B2', '9030798879', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.49, 9.38, 8.08, 8.71, 7.77, 8.81, 8.81, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PERUMALLA NITHIN', '22A81A43B4@sves.org.in', '6304550067', 'student', 'CAI', '22A81A43B4', '6304550067', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.16, 9.0, 7.69, 8.33, 7.98, 8.51, 7.98, 7.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PINNINTI DEEPTHI MAI', '22A81A43B5@sves.org.in', '9390987468', 'student', 'CAI', '22A81A43B5', '9390987468', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.22, 9.69, 9.0, 9.18, 9.02, 9.77, 9.16, 8.83, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('POKALA SAI KARTHIK', '22A81A43B6@sves.org.in', '7093592711', 'student', 'CAI', '22A81A43B6', '7093592711', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.88, 9.62, 8.62, 8.76, 8.47, 8.79, 9.02, 8.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SAMAYAMANTHULA SWARNA SRI', '22A81A43B8@sves.org.in', '9110352849', 'student', 'CAI', '22A81A43B8', '9110352849', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.54, 9.38, 8.31, 8.57, 8.33, 8.72, 8.33, 8.22, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SANNAYILA DEEPTHI', '22A81A43B9@sves.org.in', '9381698422', 'student', 'CAI', '22A81A43B9', '9381698422', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.81, 9.15, 8.38, 9.06, 8.33, 9.35, 8.88, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SURAVARAPU MANASA VALLI', '22A81A43C1@sves.org.in', '8328252833', 'student', 'CAI', '22A81A43C1', '8328252833', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.96, 9.23, 9.15, 9.29, 8.67, 9.21, 8.88, 8.3, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('SUTHAPALLI YASWANTH SRINIVAS GUPTHA', '22A81A43C2@sves.org.in', '8919645848', 'student', 'CAI', '22A81A43C2', '8919645848', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.69, 9.15, 8.46, 9.06, 8.26, 8.74, 9.16, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('UDISI RINA SAI LAKSHMI PRASANNA', '22A81A43C3@sves.org.in', '9154556856', 'student', 'CAI', '22A81A43C3', '9154556856', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.0, 9.46, 8.62, 9.18, 8.81, 9.21, 9.23, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('ULASA KIRAN ADITYA', '22A81A43C4@sves.org.in', '7330950541', 'student', 'CAI', '22A81A43C4', '7330950541', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.63, 9.0, 7.62, 8.65, 8.6, 9.0, 9.09, 8.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VADDI AMRUTHA', '22A81A43C5@sves.org.in', '9502973428', 'student', 'CAI', '22A81A43C5', '9502973428', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.03, 8.92, 7.77, 8.57, 7.49, 7.81, 8.05, 7.61, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VALLURI TEJASWI', '22A81A43C7@sves.org.in', '6301342247', 'student', 'CAI', '22A81A43C7', '6301342247', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.88, 7.46, 6.85, 8.04, 7.98, 8.51, 8.33, 7.87, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEEDHI SONY', '22A81A43C8@sves.org.in', '8639033911', 'student', 'CAI', '22A81A43C8', '8639033911', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.0, 7.15, 7.08, 8.22, 8.19, 8.65, 8.26, 8.26, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('VEERAVALLI SATISH', '22A81A43C9@sves.org.in', '6303811212', 'student', 'CAI', '22A81A43C9', '6303811212', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.87, 8.15, 7.0, 8.1, 7.7, 8.09, 7.98, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('Y GOPI PRADEEP KUMAR', '22A81A43D0@sves.org.in', '7093776351', 'student', 'CAI', '22A81A43D0', '7093776351', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.22, 9.69, 9.0, 9.24, 8.6, 9.58, 9.44, 9.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('BANDI SEERSHIKA', '23A85A4301@sves.org.in', '7670846135', 'student', 'CAI', '23A85A4301', '7670846135', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.58, 0.0, 0.0, 8.65, 7.91, 8.88, 8.74, 8.7, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('DAKSHANADI KOWSALYA', '23A85A4302@sves.org.in', '8121056974', 'student', 'CAI', '23A85A4302', '8121056974', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 9.03, 0.0, 0.0, 9.0, 8.74, 9.02, 9.16, 9.17, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('IMANDI HEMANTH MEHER SRI RAM KUMAR', '23A85A4303@sves.org.in', '7981836768', 'student', 'CAI', '23A85A4303', '7981836768', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.27, 0.0, 0.0, 8.41, 7.35, 8.44, 8.58, 8.48, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MURALA SASIDHAR', '23A85A4305@sves.org.in', '9492593121', 'student', 'CAI', '23A85A4305', '9492593121', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.17, 0.0, 0.0, 7.41, 6.37, 7.07, 7.51, 7.39, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('MADDALA AAKASH', '23A85A4307@sves.org.in', '9603446337', 'student', 'CAI', '23A85A4307', '9603446337', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.39, 0.0, 0.0, 8.71, 8.26, 8.26, 8.67, 8.0, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('NANDAM MOHANA ADITYA', '23A85A4309@sves.org.in', '6303661939', 'student', 'CAI', '23A85A4309', '6303661939', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 7.89, 0.0, 0.0, 8.1, 7.7, 7.67, 7.98, 7.96, 0.0, 0, 0);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number, is_submitted) 
VALUES ('PONDURU TRIVENI', '23A85A4311@sves.org.in', '9346109647', 'student', 'CAI', '23A85A4311', '9346109647', 1);
SET @user_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8, present_backlogs, history_of_backlogs) 
VALUES (@user_id, 8.73, 0.0, 0.0, 9.06, 8.12, 8.74, 9.02, 8.61, 0.0, 0, 0);

SET FOREIGN_KEY_CHECKS = 1;
UPDATE users SET is_submitted = 0 WHERE role = 'student';
