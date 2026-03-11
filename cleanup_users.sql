-- SQL to clear all user data and reset tables
SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE academic_records;
TRUNCATE TABLE co_curricular;
TRUNCATE TABLE extracurricular;
TRUNCATE TABLE final_scores;
TRUNCATE TABLE file_uploads;
TRUNCATE TABLE interview_marks;
TRUNCATE TABLE department_toppers;
TRUNCATE TABLE users;

SET FOREIGN_KEY_CHECKS = 1;

-- Note: You will need to recreate your Admin account after running this.
