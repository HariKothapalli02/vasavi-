-- Database Updates for Student Import
USE best_outgoing;

-- 1. Make email nullable as students are imported without specific emails initially
ALTER TABLE users MODIFY COLUMN email VARCHAR(255) UNIQUE DEFAULT NULL;

-- 2. Add backlog columns to academic_records
ALTER TABLE academic_records ADD COLUMN IF NOT EXISTS present_backlogs INT DEFAULT 0;
ALTER TABLE academic_records ADD COLUMN IF NOT EXISTS history_of_backlogs INT DEFAULT 0;

-- Update for Best Outgoing Student and Final Submission tracking
ALTER TABLE users ADD COLUMN is_best_outgoing TINYINT DEFAULT 0 AFTER signature_path;

-- Ensure final_scores has the is_final_submitted column (if not already present)
-- ALTER TABLE final_scores ADD COLUMN is_final_submitted TINYINT DEFAULT 0;

-- Optional: If you want to track when the announcement was made
-- ALTER TABLE users ADD COLUMN best_outgoing_date DATETIME DEFAULT NULL AFTER is_best_outgoing;

-- 3. Pre-load 6 Panel Members
INSERT INTO users (name, email, password, role) VALUES 
('Panel Member 1', 'panel1@srivasaviengg.ac.in', 'vasavi@2001#panel1', 'panel'),
('Panel Member 2', 'panel2@srivasaviengg.ac.in', 'vasavi@2001#panel2', 'panel'),
('Panel Member 3', 'panel3@srivasaviengg.ac.in', 'vasavi@2001#panel3', 'panel'),
('Panel Member 4', 'panel4@srivasaviengg.ac.in', 'vasavi@2001#panel4', 'panel'),
('Panel Member 5', 'panel5@srivasaviengg.ac.in', 'vasavi@2001#panel5', 'panel'),
('Panel Member 6', 'panel6@srivasaviengg.ac.in', 'vasavi@2001#panel6', 'panel');

-- 4. Pre-load Super Admin
INSERT INTO users (name, email, password, role, department) VALUES 
('Super Admin', 'iqac@srivasaviengg.ac.in', 'vasavi@2001#iqac', 'admin', NULL);
-- Note: Default password is 'password'

-- 5. Pre-load HOD details for Departments
INSERT INTO users (name, email, password, role, department) VALUES 
('HOD CSE/CST', 'hod_cse@srivasaviengg.ac.in', '$2y$10$WWP.hgTyTLkWpZPF2rpUiukByPAVTK7pVcuBv.eJqXuBraxHvF9BW', 'admin', 'CSE,CST'),
('HOD CAI/AIM', 'hod_cai@srivasaviengg.ac.in', '$2y$10$fPtldMvLZXxgvBrwO/RKtefNxWbcU1tIgagXWYz1ExKs8NKoGdW1q', 'admin', 'CAI,AIM'),
('HOD ECE/ECT', 'hod_ece@srivasaviengg.ac.in', '$2y$10$xz/b5D9kb.FnWOp4H2hhvOQEdci3Ng37CC3heUBeIWpKkh5il2Snq', 'admin', 'ECE,ECT'),
('HOD EEE', 'hod_eee@srivasaviengg.ac.in', '$2y$10$402Ibo0Qdbkq6gO1d6WIiOEzcgYcIKS1Gs4YRxqbrnSWCn9WBOXr2', 'admin', 'EEE'),
('HOD ME', 'hod_me@srivasaviengg.ac.in', '$2y$10$30s3a0QwM05BBUrWttRJVuQrXub0gE93aY8GTvm8xylKoHwJ03ZDC', 'admin', 'ME'),
('HOD CE', 'hod_ce@srivasaviengg.ac.in', '$2y$10$aeGgEfEUbfifjYPneR9vN.NPpeYjX9kmyRwgTPqvijVeOR11honHm', 'admin', 'CE');

-- 6. Unlock Students (Run this to restore access to students after import)
UPDATE users SET is_submitted = 0 WHERE role = 'student';
