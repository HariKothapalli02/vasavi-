USE best_outgoing;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE academic_records;
DELETE FROM users WHERE role = 'student';
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ARAPUREDDY RAMA RANJITHA', '22a81a0103@sves.org.in', '$2y$12$ff5ibuFlsSHH6ixtR3MvcO8J30INkOutdSht1DfmoQdHSqLR9TQ0q', 'student', 'CE', '22A81A0103', '9398576433');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.7, 6.77, 7.69, 7.88, 7.42, 8.12, 7.74, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BOLLA RAVI TEJA', '22a81a0106@sves.org.in', '$2y$12$63O/zQPzSQpHjQL57bdToOxvI732mQ2gDTQFEGaH/0Qy6nwFSt.5y', 'student', 'CE', '22A81A0106', '7095337142');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.6, 8.38, 8.92, 9.29, 8.33, 9.02, 8.26, 7.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BOMMIDI HARSHA PRIYA', '22a81a0107@sves.org.in', '$2y$12$7igQb5yCDJiKo0csRo6iuezKVnglMW1kasLypfu7t0f4PYqb1qDaC', 'student', 'CE', '22A81A0107', '7396110435');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.09, 7.77, 8.38, 8.25, 8.14, 8.46, 7.56, 8.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DANGETI KAVYASRI', '22a81a0110@sves.org.in', '$2y$12$./x1c4NzUUlk76pkbOgHzOrfQZu82wU/CYZMvri7mWSA4B4sNr6gi', 'student', 'CE', '22A81A0110', '7981556235');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.47, 6.85, 6.69, 7.59, 7.65, 8.05, 7.74, 7.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DARAPUREDDI RAJESWARI', '22a81a0111@sves.org.in', '$2y$12$BBkT9NWSxeX.UiWRNqUqTuVJePLD4oaGxx0o5rDYXqhaLsX6gHGG.', 'student', 'CE', '22A81A0111', '9550334625');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.37, 7.15, 8.69, 8.29, 8.28, 8.61, 8.74, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GANDHAM BALA ANUHARIKA', '22a81a0115@sves.org.in', '$2y$12$i9BKBMw.tN1HRA4Ci5hAlutSNyRQgijz0TGGv6WTqCWPFVq.AsI7a', 'student', 'CE', '22A81A0115', '8919613022');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.23, 6.62, 7.38, 7.33, 7.21, 7.35, 7.49, 7.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GANDIREDDY HEMANTH', '22a81a0117@sves.org.in', '$2y$12$k1ii2CzNIZr6t0KqK0Y2uOwwQEyRVPyEWZsFVpX8cx20/2T78YG76', 'student', 'CE', '22A81A0117', '6300229412');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.76, 8.23, 8.92, 8.88, 8.67, 9.16, 8.46, 8.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GOLUGURI TANUJA', '22a81a0118@sves.org.in', '$2y$12$YpsN3nSjEdMUHvckWjJgOesp4AIeclu/DPqD4Bw23v.fwQkiyxJyG', 'student', 'CE', '22A81A0118', '7569225179');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.24, 5.92, 6.31, 7.59, 7.33, 7.67, 7.42, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KALAVAKUNTLA PAVANI DURGA', '22a81a0120@sves.org.in', '$2y$12$fPoQTw5QKBwtMubFlGoDP.u58kUCW7dHZRalNxaR3ZBj50WOpmX5u', 'student', 'CE', '22A81A0120', '8125765299');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.36, 8.08, 7.69, 8.53, 8.12, 8.95, 8.39, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOMMIREDDY JAYASRI', '22a81a0122@sves.org.in', '$2y$12$1.1C40XuBj4J.609xRMNzugwL38pxy4Y1pGW2ZLlWKcvksWfokcAu', 'student', 'CE', '22A81A0122', '9515585575');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.43, 8.54, 8.77, 8.35, 8.09, 8.88, 8.05, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MANNE PUJITA', '22a81a0128@sves.org.in', '$2y$12$0QMBS1zO3EV7gu1i16QIROX6L5KLA8wLnU05iI.1F.pfQe1kBpM/y', 'student', 'CE', '22A81A0128', '9912515727');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.3, 6.46, 7.08, 7.35, 7.53, 7.63, 7.21, 7.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MIDATANI SINDHUSHA NAGA SRI', '22a81a0129@sves.org.in', '$2y$12$OOj.HFhJ8UpTaSDR3Gf9suTz9/zAxTGs8Xh.gH8ImPUfrg2PJtjcq', 'student', 'CE', '22A81A0129', '7337586784');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.93, 8.92, 8.92, 9.41, 8.61, 9.58, 8.19, 8.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TARAGALLA YASASRI VENKATA LAKSHMI', '22a81a0141@sves.org.in', '$2y$12$SVpMdDWeS6T4jzVcI.ec3.8z.CDZXU1D9uAm3i3NtZrbjn/oiSSC.', 'student', 'CE', '22A81A0141', '8500058067');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.39, 6.46, 7.38, 7.51, 6.79, 7.91, 7.63, 7.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('AMBATI SURYA CHARAN', '23a85a0102@sves.org.in', '$2y$12$8HZFLmPHPXQXl0kAq7KKj.eZHXzFZCLf1Freb7.pkfi7CJ7HVfLZu', 'student', 'CE', '23A85A0102', '8121643757');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.42, NULL, NULL, 8.35, 8.58, 8.74, 8.12, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('AMMIREDDI ESWARI DEVI', '23a85a0103@sves.org.in', '$2y$12$.Hu1AyQ694wr8O9yF6SfauAUUR3d9FPkDgr0vzsUUpGD05tmIamtq', 'student', 'CE', '23A85A0103', '9182639275');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.39, NULL, NULL, 8.84, 8.33, 8.51, 8.19, 8.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MADHAVARAPU SAI SIVA SANTHOSH BABU', '23a85a0105@sves.org.in', '$2y$12$r586276lO8sbclGgW71JEu9CSYbOQ5IOpF/q5bZHiZAL40TV5q/sW', 'student', 'CE', '23A85A0105', '7386592365');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.74, NULL, NULL, 9.18, 8.88, 8.61, 8.39, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NANDURI BHARATH UMA LAKSHMAN', '23a85a0107@sves.org.in', '$2y$12$0f32pkfauaSo65NDaI4TJueJ2duaSH4.d3SGSjCZYlCKtF7cyyxPq', 'student', 'CE', '23A85A0107', '7013749946');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.07, NULL, NULL, 8.43, 7.79, 7.98, 7.63, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NETHALA TEJASWI', '23a85a0108@sves.org.in', '$2y$12$0sTEJlz7.zPNR8UJL9JiFOXnGeipxZVFlXemc8e5KKZosgGLoXetq', 'student', 'CE', '23A85A0108', '8317676245');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.39, NULL, NULL, 9.65, 9.44, 9.58, 9.02, 9.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SARIDE PRASANTH', '23a85a0110@sves.org.in', '$2y$12$tNyiiswDOeqG6mVkY/ZTUuYm6IGp25MZrUwXIPHNeo5haaRbg9LTu', 'student', 'CE', '23A85A0110', '8885019667');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.88, NULL, NULL, 9.25, 8.61, 9.02, 8.88, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VINUKONDA RAMA SATYANARAYANA', '23a85a0111@sves.org.in', '$2y$12$svBB5iaKpYO2RgNI9JBQC.o.dsIwJbd4Wbf0n3stPae1WEnp.8oAa', 'student', 'CE', '23A85A0111', '7815866367');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.46, NULL, NULL, 9.14, 8.05, 8.61, 8.12, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ANEGONDI TARUN KUMAR', '22a81a0501@sves.org.in', '$2y$12$pM5tbExeVZTYAcH3tSoBju4xNtjBKgD6ITvvfHJN.R6bRUb25hzrK', 'student', 'CSE', '22A81A0501', '8309196931');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.47, 8.85, 8.0, 8.94, 8.67, 8.16, 8.09, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BEELLA RUPADEVI', '22a81a0502@sves.org.in', '$2y$12$wh5LHvOtexs7gsxhYzPJYu75uhFAp87ZOr65wOf3nAHAjdeJW3la6', 'student', 'CSE', '22A81A0502', '7672009595');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.84, 9.54, 8.54, 9.06, 8.95, 8.37, 8.72, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BHIMASINGI VENKATESWARA RAO', '22a81a0503@sves.org.in', '$2y$12$qUK4NYDMOFbP5bGNG5k9ee.wZrohKcAiznR6BpgCeuIof22qSvCPm', 'student', 'CSE', '22A81A0503', '9491019773');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.56, 8.92, 9.08, 8.59, 8.33, 8.46, 8.46, 8.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DONGA SANKAR', '22a81a0506@sves.org.in', '$2y$12$w7HEwVORtjGg3KMN5lYFuuEAj2i/g51IFlU/8U6euLcxvoOR4kwiu', 'student', 'CSE', '22A81A0506', '7569505631');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.27, 9.31, 8.08, 8.35, 8.61, 7.88, 7.47, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('EDUPALLI JESHITHA VENKAT', '22a81a0507@sves.org.in', '$2y$12$9L8gECDAO4Oivh/biap26umZXsGdkpTU9E703NW/gmJcgxEDi65XK', 'student', 'CSE', '22A81A0507', '9182960108');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.82, 8.62, 6.85, 8.06, 7.49, 7.47, 8.02, 8.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GARAKA TEJASWINI', '22a81a0509@sves.org.in', '$2y$12$9/t1b5m5ojl3rmczBtXMjuuOwlp87PqSFm59rdOQ3v8Oz49AdsEue', 'student', 'CSE', '22A81A0509', '6304787664');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.67, 9.23, 9.08, 8.71, 8.46, 8.74, 8.3, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GAVARA SREEJA', '22a81a0510@sves.org.in', '$2y$12$ZiEql3ZzqnLhPEpwU2RaY.bpUUpY6oVrYvgbOZbDn3XBeXEF4juV.', 'student', 'CSE', '22A81A0510', '8688363045');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.72, 9.31, 9.38, 8.59, 8.88, 8.39, 8.23, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUBBALA MEGHANA', '22a81a0512@sves.org.in', '$2y$12$PHYYAv5vrVoiV0MiMQtohe3BFlH9J9TEDzApIclEcN582HZln9c.O', 'student', 'CSE', '22A81A0512', '9398934454');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.92, 8.46, 6.85, 7.94, 7.84, 7.98, 7.98, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('IMMIDISETTI SAI GANESH', '22a81a0513@sves.org.in', '$2y$12$elJIVkqabtV.Ng9pjodOR.hr2kvCRkhNd6y.NJbmMN3XRvEc4waOK', 'student', 'CSE', '22A81A0513', '9346797159');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.2, 8.54, 7.54, 8.35, 8.33, 8.39, 7.98, 8.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('INNI TANINKI', '22a81a0514@sves.org.in', '$2y$12$EXEkulkAdO8Gmhsz2OHNTeHfjU77xRgrYlA974ApW7YlJzKUc4Aee', 'student', 'CSE', '22A81A0514', '9573653146');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.22, 9.31, 8.92, 9.06, 9.51, 9.21, 9.37, 9.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KAMMILA SAI', '22a81a0516@sves.org.in', '$2y$12$QQZ9BW0MHcYkKqeaTBmU.eVliAZQ3SDldjb1a3FwQB4Ejo5GWk.NC', 'student', 'CSE', '22A81A0516', '8179077852');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.63, 8.0, 7.54, 7.71, 7.28, 7.84, 7.81, 7.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KANAK AGARWAL', '22a81a0517@sves.org.in', '$2y$12$UbpHMI2MlN6MZFCkQX2zhuiwEI6K5cR/FtcyN.bqEexaS5CF8muT2', 'student', 'CSE', '22A81A0517', '9346857997');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.95, 9.46, 9.23, 9.06, 8.74, 8.88, 8.81, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KILARU KIRAN SRI SAI', '22a81a0520@sves.org.in', '$2y$12$GFAH66Gp/wMRyxTigi9PEef2p1ZyoZddY2vrZiUyGN/J3FU4joAS2', 'student', 'CSE', '22A81A0520', '9392642327');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.09, 9.0, 7.92, 8.29, 7.98, 7.47, 8.02, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KURAM SUPREEYA', '22a81a0525@sves.org.in', '$2y$12$ec4zVYcHnG0kf2zpSQ1YnOUG8dspciJ.9UmHaISdxZ9L2dummwu0S', 'student', 'CSE', '22A81A0525', '8886097298');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.75, 8.31, 6.46, 7.94, 7.56, 8.26, 7.49, 8.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MANEPALLI MUKESH CHANDRA RAMA GANESH', '22a81a0529@sves.org.in', '$2y$12$8HniWP3DPGGHw9UUUod7v.si.c4YhlFfcwRYUDqT4C/EcQQvYWrUC', 'student', 'CSE', '22A81A0529', '8074034884');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.43, 8.62, 8.54, 8.65, 8.12, 8.61, 8.26, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MEDAPATI VENKATA SAI ABHIRAM REDDY', '22a81a0530@sves.org.in', '$2y$12$0SPOAQwfaTgFtqFURvSZEedtZ7w0mohsanJOnx98KK2rU34Du1k0q', 'student', 'CSE', '22A81A0530', '7702980878');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8, 8.38, 7.46, 8.23, 7.49, 8.46, 7.81, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MADEM JAYASRI', '22a81a0532@sves.org.in', '$2y$12$mvbhE19heMJNLFNpphAXi.xGVMViwEJ7fUGds0vTzDEUa2nok8.BO', 'student', 'CSE', '22A81A0532', '8019680503');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.54, 8.62, 8.62, 8.53, 8.39, 8.61, 8.3, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MANDAPAKA BALAMADHURI', '22a81a0533@sves.org.in', '$2y$12$cmiK4Ne7uLbhMsjalMXeuO5VYHM5Synh6b9isovsTMpTOjQEvhTRO', 'student', 'CSE', '22A81A0533', '8074975372');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.95, 7.85, 8.08, 8.59, 7.56, 8.07, 7.53, 7.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MEDAPATI UMESH ANJAN', '22a81a0534@sves.org.in', '$2y$12$Z/CLunSXrpTtb/DYCjPryOyPJq379pJ1WphdTHcfAyLuaagWOBDaS', 'student', 'CSE', '22A81A0534', '9346307371');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.62, 7.38, 6.77, 8.12, 7.35, 7.86, 7.81, 7.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MOHAMMAD AAKHIL', '22a81a0535@sves.org.in', '$2y$12$zPoTEySjElOMu0N8uB1OyuMcevHQzXDruiN6bHWdzcDptAdbqnX5O', 'student', 'CSE', '22A81A0535', '8919928452');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.04, 8.15, 7.15, 8.18, 8.05, 8.49, 8.19, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MOLLI LOVARAJU', '22a81a0537@sves.org.in', '$2y$12$tqzxlu6bXORhaO77cxnOsO.OskDE8SAn57UJlHb2jbXSRz9JfnhbG', 'student', 'CSE', '22A81A0537', '7993265890');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.66, 9.0, 7.77, 8.65, 8.67, 8.72, 8.93, 8.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MUCHERLA UMA DEVI', '22a81a0538@sves.org.in', '$2y$12$jNcEQatlRqPbFj7/276qqeMOb7t76vy0Z2wtrINdIRUMbS6Rv36KS', 'student', 'CSE', '22A81A0538', '9346696952');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.92, 7.54, 6.69, 8.35, 7.84, 8.51, 7.88, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NAIDU KIRAN MAHESH', '22a81a0539@sves.org.in', '$2y$12$tlf9X7GMPR5Ds9wmFhkp7ODO6TzhnaYQMTVa8rSUiMlmIZ1/G4fXi', 'student', 'CSE', '22A81A0539', '9392774033');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.62, 7.85, 7.31, 7.71, 7.7, 8.21, 7.35, 7.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NAKKA SHARMILA', '22a81a0540@sves.org.in', '$2y$12$TErs1YQn3QlFqBloQPmlaOQ7iNqqVxEjBegBp4P7LqTISgVeU3/8S', 'student', 'CSE', '22A81A0540', '9912016003');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.07, 9.15, 8.92, 9.06, 8.74, 9.44, 9.35, 8.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NALAMATI LAHARI', '22a81a0541@sves.org.in', '$2y$12$P.216jHwkVUkRop7xO.ITu2fS7Zdmq28Sw2WE/8FZeOyvP2w1j47K', 'student', 'CSE', '22A81A0541', '9989334599');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.91, 9.23, 9.08, 9.06, 8.81, 8.88, 9.3, 8.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NALLA THRISHITHA', '22a81a0542@sves.org.in', '$2y$12$QTUCwgM6Slj75PUeTmoCSu72xzBbgMli8EQKMOqVQxOY94DJXDPEK', 'student', 'CSE', '22A81A0542', '9676717115');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.86, 9.0, 8.54, 8.94, 8.74, 9.3, 8.95, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NALLA VARSHITHA BANU', '22a81a0543@sves.org.in', '$2y$12$4BDBBjnk3ws7qOQ.lo5KFOiRj/UWf7B5818nTKj73z8R77SGINgIa', 'student', 'CSE', '22A81A0543', '8985547973');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.22, 9.54, 9.38, 9.18, 9.02, 9.44, 9.16, 8.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NARNI VASANTHI LAKSHMI PRIYA', '22a81a0544@sves.org.in', '$2y$12$3dNdLEuWgwL40gj0ZUIlauzTn/tmyRzldLB9PIZZrexUQlQmx.nCS', 'student', 'CSE', '22A81A0544', '7093544020');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.14, 9.85, 9.38, 8.94, 9.02, 9.3, 9.16, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NERUTURI SRAVANI', '22a81a0545@sves.org.in', '$2y$12$GmTa57VVX.oPstwTwYKz4uyjRm.DYHFQPLaNY8.h8adfLyiestl8i', 'student', 'CSE', '22A81A0545', '9493442866');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.66, 7.85, 6.31, 7.88, 7.14, 7.95, 8.19, 8.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PADALA SAI KANAKA DURGA', '22a81a0546@sves.org.in', '$2y$12$uINbTZ0o517c9/fVNSBn1eh1HogeZt./DkYd1SO47ZElV6YvSkbBO', 'student', 'CSE', '22A81A0546', '9701749629');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.53, 9.15, 7.77, 8.23, 8.33, 8.65, 8.81, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PATSA JNANA VENKATA SATYA SRI', '22a81a0547@sves.org.in', '$2y$12$O3tpmBTOpzBzd6otQV1rSeG8TZhW2CvEvhv3bsuZhPPEeOFPuh2yK', 'student', 'CSE', '22A81A0547', '9494418933');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.29, 9.85, 9.15, 9.65, 9.16, 9.44, 9.3, 8.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PENMETSA SAI PHANEENDRA VARMA', '22a81a0548@sves.org.in', '$2y$12$R0ROwnWSCkKjkMHe8pOQMOWygGXkuNYCFrAAmXjhWR9bBGgsd6qUa', 'student', 'CSE', '22A81A0548', '9182838219');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.95, 9.38, 9.46, 9.23, 9.16, 8.37, 8.95, 8.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PEREPU PUJITHA', '22a81a0549@sves.org.in', '$2y$12$0RoD51SYs1aIKf99b/K9IemB.ZZPFYZeaB99nO0mHrPnN9kJBfAUO', 'student', 'CSE', '22A81A0549', '8688079531');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.29, 9.62, 9.69, 9.29, 9.3, 9.35, 9.21, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PINDI MOUNIKA', '22a81a0550@sves.org.in', '$2y$12$Q0Yigc8xt.smShrb30ZpTOuUhBTmW7desRYLt8leJTq8tyAps3IIm', 'student', 'CSE', '22A81A0550', '9989646255');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.54, 9.08, 8.15, 8.82, 8.26, 8.37, 8.54, 8.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('POTHULA LALITHASRIPANI', '22a81a0551@sves.org.in', '$2y$12$DyiTXfnqJeSOM1O4ePyG7ehElUN5H/FugIdb801pTnmdVLm1HEFYC', 'student', 'CSE', '22A81A0551', '9515071459');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.09, 9.54, 9.23, 9.29, 8.95, 8.81, 9.3, 8.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('REDDY KEERTHI YUGASRI', '22a81a0554@sves.org.in', '$2y$12$aenhqvZu.jyYgv7MECfOkeNd8sky5/F.UuXSkPHeY.C20kXjhzJHK', 'student', 'CSE', '22A81A0554', '7799551149');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.42, 8.85, 8.54, 8.59, 8.39, 8.74, 7.79, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SUMA SREE MANDRU', '22a81a0560@sves.org.in', '$2y$12$G88SHe9a2Jd3zE42t4wYc.t1lkwmAP5kGbWlIccawoOxkGWfQEBKm', 'student', 'CSE', '22A81A0560', '9063285803');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.82, 9.15, 8.15, 9.29, 8.95, 8.88, 8.58, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('THANGUDU SHANMUKHA RAO', '22a81a0561@sves.org.in', '$2y$12$.Ybe1mNCngy2vi2fibA4Q.2hgEhQ/9rBOqlf1EXv7zeOU1b0YPyfK', 'student', 'CSE', '22A81A0561', '8712248783');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.51, 8.69, 8.0, 8.94, 8.61, 8.74, 8.33, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('UNGATA YAMINI SAI SRI SUSEELA', '22a81a0563@sves.org.in', '$2y$12$K9Sz0nBpXmD5vm/3QownCuFBARCpSdDE2eWRa9UwJkX0zWlF.egxO', 'student', 'CSE', '22A81A0563', '7993692188');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.3, 9.62, 9.54, 9.06, 9.44, 9.56, 9.3, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VALLURI GOWTHAMI RUSHITHA', '22a81a0564@sves.org.in', '$2y$12$YKuOq7qxZm7ujNMzvirGx.Sdar19Ksu1Spbkf.F75rqfmi/bL1Lb.', 'student', 'CSE', '22A81A0564', '9392582344');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.93, 9.15, 8.69, 9.18, 8.74, 8.88, 9.16, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VANGALA MRUDULA', '22a81a0565@sves.org.in', '$2y$12$osNMSf0hHjIyRf6Ei0r8keSbnt/wOQ2seLNjA2LdDm5TBOpOuv6bi', 'student', 'CSE', '22A81A0565', '6281201159');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.46, 8.31, 8.0, 8.35, 8.74, 8.67, 8.74, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VEERAMALLA VENKATA DURGA PARVATHI', '22a81a0566@sves.org.in', '$2y$12$fdoFS4oCT.HXO9QhdAkVDekzU08vL73gRFHkkE.fOe6zxweGvLHny', 'student', 'CSE', '22A81A0566', '8121837543');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.66, 8.77, 8.85, 8.71, 8.81, 8.61, 8.61, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ADDALA GOPIKA ANJALI', '22a81a0567@sves.org.in', '$2y$12$MWcsq8GzIyYL580qySusVutpKqdkHB26w49Qz8HvvrF5ZKSgIrYP2', 'student', 'CSE', '22A81A0567', '9347514335');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.71, 8.62, 8.31, 8.43, 9.07, 8.88, 8.67, 8.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ANNAPAREDDY PRAVEEN KUMAR', '22a81a0568@sves.org.in', '$2y$12$pKnmzL1g.yxIDrx9MAu76uZfbMbKKa7hKkmJUCSne82Cpw3cCJgHK', 'student', 'CSE', '22A81A0568', '9866678399');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.65, 7.31, 7.38, 8.0, 7.63, 7.88, 7.63, 7.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ANYAM VENKATA NAGA BHAVANI PAVAN KUMAR', '22a81a0569@sves.org.in', '$2y$12$aaHyKxrPS1ifeg/51k8t1.hr2yhmmbGnCPUSA7ql.Z4KPY1FDze4y', 'student', 'CSE', '22A81A0569', '9398585389');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.11, 8.77, 7.54, 7.72, 7.98, 8.09, 8.54, 8.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BODDETI KUSUMA', '22a81a0572@sves.org.in', '$2y$12$KQ7hjVrNRKy7G7PrQ3CfAu4CWr6k9hZQo94U2RTAM513HIZZPFOA6', 'student', 'CSE', '22A81A0572', '9963870893');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.8, 9.23, 8.31, 8.78, 8.95, 8.74, 8.88, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHEBOLU NAGA PRASANNA', '22a81a0574@sves.org.in', '$2y$12$hHRRw0iFwvbTdZaE.J8rJ.TaRmTegIDhmK6Hp/TBBurwfKESfwI4y', 'student', 'CSE', '22A81A0574', '9490549112');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.84, 8.77, 9.38, 8.86, 8.88, 8.46, 9.16, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHIDARALA DURGAPRASAD', '22a81a0575@sves.org.in', '$2y$12$uuGYbzIKb93Fu/sByHOBP.q//xNFtf7LmRkTV5EukGjfKOlBYR.g6', 'student', 'CSE', '22A81A0575', '9618808831');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.59, 8.69, 9.0, 8.94, 8.51, 8.37, 8.54, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DASARI KEERTHI RAJU', '22a81a0577@sves.org.in', '$2y$12$6ZhSHuD4WdhVwEA9GjuUTOZ3QXUHK4Q6caf8Km8F.H2kBb3TBWniG', 'student', 'CSE', '22A81A0577', '7207466128');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.32, 7.08, 7.31, 7.47, 7.0, 7.6, 6.98, 7.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('EDUPALLI SUJITHA', '22a81a0578@sves.org.in', '$2y$12$K7Jel/HHhio1fCu2jwY2he8SKLYXjdmyqPA2phATqy.aT90WNCC.2', 'student', 'CSE', '22A81A0578', '8121736577');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.38, 8.69, 8.46, 8.78, 8.23, 8.74, 7.49, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('EEDARA TEJASWINI', '22a81a0579@sves.org.in', '$2y$12$k9igjMZ.YqqJoD/KgWtgReG5uMGChQu5U8H03mvK2ePhONDiHLnNi', 'student', 'CSE', '22A81A0579', '9392418489');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.21, 9.69, 9.15, 9.41, 9.02, 8.81, 9.3, 9.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GANDHAM HEMANTH SATYAVENKATA KRISHNAPRASAD', '22a81a0580@sves.org.in', '$2y$12$zAnAbNtsaCuIqnWAGejSA.PdUeX.w1q4r7xajXODIxXhJVZuwGMbi', 'student', 'CSE', '22A81A0580', '9652306468');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.81, 8.54, 7.77, 8.2, 7.33, 7.4, 7.47, 7.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GADAMSETTI RAMALAKSHMI', '22a81a0581@sves.org.in', '$2y$12$RPqpp6oRTx6I0jN1UpOIA.c1576sP697yka/xcP5I..XV8dv7ALnS', 'student', 'CSE', '22A81A0581', '9059318626');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.51, 8.69, 8.23, 8.82, 8.26, 8.33, 8.65, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUBBALA LOKESH', '22a81a0582@sves.org.in', '$2y$12$Z7GEXi2Me89Is4nL7y.eye6o5TIrURYZjUysx0/A2ujuaibHI30XC', 'student', 'CSE', '22A81A0582', '7995743710');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.01, 9.31, 9.08, 9.1, 9.16, 8.74, 8.81, 8.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUDAPATI SAI SATYA GANAPATHI', '22a81a0583@sves.org.in', '$2y$12$Y2tDnTX3tcYvtlNZc.lt7OzYkBPoESXAwazvam1RIrWgKsXdXJpM.', 'student', 'CSE', '22A81A0583', '9014889933');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8, 8.31, 8.0, 8.08, 8.19, 7.67, 7.91, 7.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUTTULA SOMA DURGA ARJUN', '22a81a0584@sves.org.in', '$2y$12$p0RgtOOuSvF/U1vn/MVrxun4HRm3K4eeo640peColBdKt6ECFR0eG', 'student', 'CSE', '22A81A0584', '7780733677');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.54, 8.38, 8.46, 8.9, 8.61, 8.72, 8.37, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KADIYAM DIVYA BHAVANI', '22a81a0588@sves.org.in', '$2y$12$5fD7rqbbOdUZvOcGwOY6euVjprCN15G3Z.I/rMuOrloNVgqJxn/OK', 'student', 'CSE', '22A81A0588', '9515767259');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.89, 9.08, 8.92, 9.02, 8.93, 8.95, 8.54, 8.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KAKANI SRIPADHA', '22a81a0589@sves.org.in', '$2y$12$89Ql7nqMqhzw9hQY4RsT9OMg.F6buYwHMGZ.ayLFybBbRUFPmQ77i', 'student', 'CSE', '22A81A0589', '6300889541');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.09, 8.15, 8.62, 8.71, 7.91, 7.74, 7.88, 7.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KARRI JAYA NAGA SRI', '22a81a0591@sves.org.in', '$2y$12$MJbyc5lEE./AgSiE0YP9YeU.8dUYU7xblUJuDCiBd1YJ9qJVpDVOG', 'student', 'CSE', '22A81A0591', '8019231338');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.49, 8.08, 8.31, 8.71, 8.74, 8.72, 8.02, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KESAVARAPU VENKATA SESHA PRASANNA VASAVI', '22a81a0594@sves.org.in', '$2y$12$iS.UTUpEibxlZlO6L/Eq4e56pfXPYZKlX0JJG6U6CoMNsTI45.ywq', 'student', 'CSE', '22A81A0594', '7981879511');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.87, 9.0, 8.62, 9.1, 9.16, 9.02, 8.74, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MOHAMMAD JAHEERUNNISA', '22a81a05a0@sves.org.in', '$2y$12$cr/.MwTPqQD4hX7W2CvB9uyVwXqLMXDYhuX2wEczm4e.IMQcy1U3G', 'student', 'CSE', '22A81A05A0', '7569826345');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.13, 9.38, 8.77, 9.18, 9.02, 9.02, 9.16, 9.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('POSIMSETTY LEELA SESHA BALAJI', '22a81a05a7@sves.org.in', '$2y$12$N/pOd3JryFfMxF54SZ10UejAWbJi55yk3D4UitXCESePB/dAPMEt2', 'student', 'CSE', '22A81A05A7', '8332955678');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.27, 9.46, 9.38, 8.96, 9.35, 9.16, 9.16, 9.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PESARAGANTI HARSHAVARDHAN', '22a81a05a9@sves.org.in', '$2y$12$Ex26D3JgH1juQc5ygGzZu.wV/heo6QgQjJsICMxOl3.VxSSblk4My', 'student', 'CSE', '22A81A05A9', '9515978355');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.5, 8.46, 8.54, 8.22, 8.61, 8.58, 8.61, 8.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('RAMOJU SAI KUMAR', '22a81a05b3@sves.org.in', '$2y$12$8k9wg9LVJ/.R9aCuV6IvS./TG4ej73Ggzhus7mKb5Uv4Y0ZMdSQi2', 'student', 'CSE', '22A81A05B3', '9177605366');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.49, 9.15, 8.15, 8.25, 8.93, 8.51, 8.39, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SADANALA RAJASRI SIVA PRIYA', '22a81a05b4@sves.org.in', '$2y$12$uxQP6/2qYpUDUm5HTzjlTOn/xrswrtNc.b9lsQDXERoGGjWTfS4xS', 'student', 'CSE', '22A81A05B4', '7680011211');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.03, 9.62, 9.08, 9.41, 9.3, 8.74, 8.54, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SANABOINA VAMSI NAGA SAI', '22a81a05b5@sves.org.in', '$2y$12$46pV/ErJv4Ae4lAWOQLzreburP1lJRMg69rHjtlssixmjUrZnAYBS', 'student', 'CSE', '22A81A05B5', '8555954068');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.38, 7.38, 7.15, 7.53, 6.93, 7.33, 7.53, 7.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SANAMANDRA VIJAYKUMAR', '22a81a05b6@sves.org.in', '$2y$12$Ncr2M00WcLsQARQGZ93th.kaibjWtay8IOX2FECYBasc8bGW33wYu', 'student', 'CSE', '22A81A05B6', '8008787061');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.93, 8.46, 7.69, 8.45, 8.16, 7.4, 7.77, 7.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SHAIK AASHIMA FATHIMA', '22a81a05b7@sves.org.in', '$2y$12$pCGCGampi1pbgzuZFM2NuOTfPQ0kPIYYoSj3918kcI8RaZrDrIlg.', 'student', 'CSE', '22A81A05B7', '9704924239');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.53, 8.85, 7.85, 8.9, 9.16, 8.3, 7.84, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TALLA SRINU', '22a81a05b8@sves.org.in', '$2y$12$HT237lmjial62VLDwUaHeOtfpWFznoVyyh7Z7lulKeA/RcKY4S6ma', 'student', 'CSE', '22A81A05B8', '7794969377');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.34, 8.85, 7.31, 8.9, 8.44, 8.3, 8.26, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TARAGALLA LAKSHMI AKHILA SWATHI', '22a81a05c0@sves.org.in', '$2y$12$p0xFA/TlzeCj2Rioe5MrbuSb63qptE.9G/rabQheaKP5JSz/PW5p.', 'student', 'CSE', '22A81A05C0', '7989790712');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.45, 9.69, 9.54, 9.65, 9.72, 9.3, 9.02, 9.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TATAVARTHI RISHI VARUN', '22a81a05c1@sves.org.in', '$2y$12$dtnrYFc4wGlRR8yIgWmUFOTqUldtXSdU0L4.iWeZOg8BWhFUmcavq', 'student', 'CSE', '22A81A05C1', '9347740140');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.16, 9.46, 8.54, 9.65, 9.02, 9.3, 8.88, 9.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VANKAYALA GANESH SIVA SAI KRISHNA', '22a81a05c5@sves.org.in', '$2y$12$SdcRCRGz2/rYKkyPw1rrsuA5zlLujDC2Lo9VDQbTKeH1E6b9OQQ2.', 'student', 'CSE', '22A81A05C5', '6300260522');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.28, 8.85, 7.15, 8.47, 7.95, 8.65, 8.33, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VALLURI REETHI', '22a81a05c6@sves.org.in', '$2y$12$T0wh.JYdLgCRrseKsqdUy.7txUvw4BhsSf1SdxTMlvyOMxJnkHzfS', 'student', 'CSE', '22A81A05C6', '7995435659');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.32, 8.85, 7.46, 8.47, 8.19, 8.37, 8.39, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VELAGALA VARSHA SRI', '22a81a05c8@sves.org.in', '$2y$12$tWTibyfkz6hM8/ikbonfGO9PhLXM.3kzn0d/yX/sfCBqXQ9ZioLq2', 'student', 'CSE', '22A81A05C8', '9154972789');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.6, 8.46, 7.69, 9.0, 8.42, 8.88, 8.67, 8.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VELUGULA HEMANTH', '22a81a05c9@sves.org.in', '$2y$12$KTCPrQaOoOdrIUh/Go.2vOwrdbziCmVHL/djiCz/d8D6nZ0LWdxEC', 'student', 'CSE', '22A81A05C9', '9542849956');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.25, 8.46, 7.08, 8.67, 8.67, 7.88, 8.54, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VEMULURI JAYA KANTH', '22a81a05d0@sves.org.in', '$2y$12$yamswwXInTF12JTZXsJxz.eYOt17cUnIOuDS9wPJgwJ5ss/Ua/imK', 'student', 'CSE', '22A81A05D0', '9573951246');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.59, 8.15, 7.0, 7.92, 7.49, 7.33, 7.77, 7.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('YADAVALLI LAKSHMI VYSHNAVI', '22a81a05d1@sves.org.in', '$2y$12$LvA0M6evb8BPgvbX9k39A.XmlDD87PtpBX/v5QJWyIIuxFEyU.Cv2', 'student', 'CSE', '22A81A05D1', '6301693123');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.15, 9.23, 8.92, 9.1, 9.16, 9.3, 9.3, 9.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('YALAMARTHI LAHARI', '22a81a05d2@sves.org.in', '$2y$12$51trrh6I1eBZk1jrOQhknun.7Ksnm4vii3Tp3Gr0n3cob2RqcO43O', 'student', 'CSE', '22A81A05D2', '6301833679');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.34, 8.38, 7.15, 8.43, 8.74, 8.61, 8.39, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ADABALA UMA SAHITHI', '22a81a05d4@sves.org.in', '$2y$12$aOBiR601tk0d6ViXpm.whO4mf4ZpWtLeZFJk53Mbvc/KNxjwMqE0S', 'student', 'CSE', '22A81A05D4', '9346344262');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.03, 9.38, 8.77, 9.06, 8.88, 9.02, 9.07, 9.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('AKULA MADHURI', '22a81a05d5@sves.org.in', '$2y$12$0COWs0JlSylQtKsuZyw56ubqG1WGzM2OuzGGQPtujkZjbCJyP.n.2', 'student', 'CSE', '22A81A05D5', '8341192827');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.3, 8.15, 7.0, 8.18, 8.54, 9.16, 8.23, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ARIGELA RAMAKRISHNA VINAYAK', '22a81a05d6@sves.org.in', '$2y$12$wwVkhlhk6KoEJ5ZTTQtOFupOYVRZTzaWrO7xjkSwsEIa6AaSNQW5S', 'student', 'CSE', '22A81A05D6', '9550461464');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.14, 8.23, 7.38, 8.59, 7.91, 8.46, 8.39, 7.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BODDU JAYANTH PATHRUDU', '22a81a05d9@sves.org.in', '$2y$12$/2iyxulKa.TNJlsrLaoUReJLv5biLc22qxqlR5bvdziiF1JyoiqkW', 'student', 'CSE', '22A81A05D9', '9493422727');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.1, 7.54, 7.62, 8.1, 8.33, 8.46, 8.05, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHALLA VISHNU VARDHAN', '22a81a05e0@sves.org.in', '$2y$12$3Pazp8MKcidnHUaKSHgOjOqv8o5fWfKGt77sG87yszqtlEfZbUzqG', 'student', 'CSE', '22A81A05E0', '8919758517');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.99, 9.38, 8.92, 8.94, 9.02, 9.16, 8.88, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHIKKALA VYSHNAVI', '22a81a05e1@sves.org.in', '$2y$12$WGeLvaGU7YiE3l2Naafgqegj3i5CEy2jRBsBqM4kXJMmly7wMT.2u', 'student', 'CSE', '22A81A05E1', '9390558534');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.41, 8.38, 7.92, 8.82, 8.39, 8.54, 8.46, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DINDUKURTHI CHATURVED', '22a81a05e4@sves.org.in', '$2y$12$zXiTBOhrh8YMmlMwoT5NROrlw3rZhQrMHgzPMJhwfy1deEAVum/dS', 'student', 'CSE', '22A81A05E4', '9059632955');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.18, 8.08, 7.92, 8.33, 8.05, 8.67, 8.39, 7.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ELIPE MOUNIKA', '22a81a05e5@sves.org.in', '$2y$12$.0ttYFj3G63BnYzcPeEpBOlRo091ubsZ5BDDIe9Tja7xndanyhi.e', 'student', 'CSE', '22A81A05E5', '9963129370');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.11, 9.08, 9.08, 9.22, 9.02, 9.3, 9.3, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GANNI MAHITHA LAKSHMI', '22a81a05e6@sves.org.in', '$2y$12$Z1EbRAmzDUPRYF2QKDUn3eBapOtpv4hS0l8LRoafoVtJ.88SIyjBq', 'student', 'CSE', '22A81A05E6', '8179542429');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.12, 9.15, 9.08, 9.29, 9.02, 9.44, 9.3, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GARAKA SNEHA LATHA', '22a81a05e7@sves.org.in', '$2y$12$fCKJUnRQeRaiD4dSL9yqhOC5L0HtLMDas0Mcd2CsyJBabMakC/ZYO', 'student', 'CSE', '22A81A05E7', '9502048286');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.12, 9.54, 8.77, 9.06, 8.88, 9.44, 9.3, 8.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GOLUGURI AYYAPPA SRI SAI REDDY', '22a81a05e8@sves.org.in', '$2y$12$Tx89ABx4y.Gc6qVEZ/eQnOvjf.j2.KkuWSiCFw7g8DUkMOtX6jQUW', 'student', 'CSE', '22A81A05E8', '9701539868');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.78, 8.31, 7.31, 8.04, 7.0, 8.05, 8.02, 7.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUBBALA VENKATA VARSHINI', '22a81a05e9@sves.org.in', '$2y$12$UI3dmOO3CEnGUYuxUyd3meuUebJaTaosw5LT98cSq4qpgSs.Ozy5e', 'student', 'CSE', '22A81A05E9', '9912778655');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.91, 9.54, 8.92, 8.98, 8.88, 9.02, 8.79, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUNJI MADHU BABU', '22a81a05f1@sves.org.in', '$2y$12$81YUBsAwM5dODxWp9gP94e4ro8T0VS1b6r1vvczQeYVppX6x02KoC', 'student', 'CSE', '22A81A05F1', '8074440534');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.55, 8.0, 6.31, 8.16, 7.63, 7.77, 7.56, 7.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('INDUKURI MEGHASINDHU', '22a81a05f3@sves.org.in', '$2y$12$irYon/bEmGODZY99FLjEt.bKkD4Ig4oGrLO8A/hyDAs9AbNZWTaBa', 'student', 'CSE', '22A81A05F3', '6302032121');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.03, 9.54, 9.23, 8.86, 9.02, 9.02, 9.35, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOPPULA PAAVANI VENKATA SAI', '22a81a05f4@sves.org.in', '$2y$12$SDnN3UmxyvfnO9pP3mlRzervruJlohPDrAVB9nLugHK6DODt/rkle', 'student', 'CSE', '22A81A05F4', '8331872336');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.96, 9.23, 9.23, 8.71, 8.74, 8.95, 9.3, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KANDIKATLA DHARANI', '22a81a05f5@sves.org.in', '$2y$12$TdkwS00jYga3sXt6Dx./yux71xrtV9OynDBMI7KsHFSgISBYXUhcq', 'student', 'CSE', '22A81A05F5', '8143914511');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.57, 8.08, 7.38, 8.51, 8.67, 9.09, 9.44, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KARRI ANJANI NAGA KOTESWARI', '22a81a05f6@sves.org.in', '$2y$12$L6zgNAchW/lEyvmBxQIMqeo7MbankZSVw23wi/4lP9Of1q5TD/48y', 'student', 'CSE', '22A81A05F6', '6301837306');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.66, 9.23, 8.31, 8.59, 8.33, 8.88, 9.02, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KARRI SAI GOWRY VIKAS REDDY', '22a81a05f7@sves.org.in', '$2y$12$ScZDmoxWd5k7kv6Tmhq2w.l4ysnbOme7bQJcS3YAiQ.4Nhokx.ALW', 'student', 'CSE', '22A81A05F7', '9908059846');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.01, 9.0, 8.38, 9.1, 9.16, 9.44, 9.21, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KASINIKOTA VENKAT', '22a81a05f8@sves.org.in', '$2y$12$DUL0Jhtn5W44mrrFmvTXLON7oCwjhy5ofLZb1ipqsjsV8BryRMqPG', 'student', 'CSE', '22A81A05F8', '8374788644');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.42, 7.77, 6.77, 7.88, 7.07, 7.56, 7.53, 7.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KATTA JAYA DURGA PEDDI LAKSHMI', '22a81a05f9@sves.org.in', '$2y$12$mNV0gNhf1kncZnb.h8UrHOxKutLowoK7ty5IFkwMqqiIyjCCw5.O.', 'student', 'CSE', '22A81A05F9', '9177076673');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.71, 8.46, 7.85, 8.59, 8.54, 9.44, 9.44, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KATTA PALLAVI DURGA YADAV', '22a81a05g0@sves.org.in', '$2y$12$UBFPKzU8kuFSvu2Jt6NRWuGOAslyoXeVZ6AFvKKULbTBZu1QeAB2K', 'student', 'CSE', '22A81A05G0', '9493043266');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.28, 9.54, 9.08, 9.41, 9.3, 9.21, 9.72, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOTA NAGA MANJUSHA', '22a81a05g2@sves.org.in', '$2y$12$loQ57cDpgnuXXid8VpmThO7MmmRK.jBMOsyBcWv9c0tz9mkX1kewC', 'student', 'CSE', '22A81A05G2', '7993327777');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.86, 9.0, 8.38, 8.82, 8.74, 9.16, 9.44, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MATTA PRATHYUSHA DHANA LAKSHMI', '22a81a05g3@sves.org.in', '$2y$12$dRkLCJwuel8239O.0eixGuduUShf06NtTTGo9MfUx2kaynHaI.JHW', 'student', 'CSE', '22A81A05G3', '9121802399');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.94, 9.0, 8.54, 9.1, 9.02, 9.16, 9.02, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MANDAPATI VIJAYA LAKSHMI', '22a81a05g5@sves.org.in', '$2y$12$9y1ss8D38hq2swigsIjVe.a5xwy348ii2LgNJFisNNNqEjdmLIOsy', 'student', 'CSE', '22A81A05G5', '6305442259');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.58, 8.54, 7.31, 8.94, 8.54, 9.16, 9.02, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MAREEDU SAIRAM', '22a81a05g6@sves.org.in', '$2y$12$GvDsnVOSASBT/TY6bAzUwuK7NOcwmdglfAICpmZr33yuMUAxL9oCG', 'student', 'CSE', '22A81A05G6', '8501890522');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.58, 9.0, 8.38, 8.59, 8.46, 8.88, 8.67, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MOHAMMAD AZMATULLA', '22a81a05g8@sves.org.in', '$2y$12$PWi25xP9MQNhHgpjqAzd9u12bD5tD8KMTE1oKrS3hdw/k.owGmqQ6', 'student', 'CSE', '22A81A05G8', '7569512424');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.63, 9.0, 8.08, 8.71, 8.19, 9.09, 8.88, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MOHAMMAD RAHIMUNNISA', '22a81a05g9@sves.org.in', '$2y$12$R0W2iq3N1SlJAcmnriUoeOEAwNUkPoJ.zT3gVLlo/cwjt7Kgkg2UW', 'student', 'CSE', '22A81A05G9', '9014022798');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.14, 9.38, 8.15, 8.59, 7.91, 8.02, 7.84, 7.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MUKKU MOHITH', '22a81a05h1@sves.org.in', '$2y$12$..CEMyqbElqAMg5DRV8u3OD6dPoFhEX8XqXQpDq/DbFXjmH/E2QXu', 'student', 'CSE', '22A81A05H1', '9346370710');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.47, 8.85, 8.54, 8.71, 8.19, 8.81, 8.26, 7.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NANDAMURI LOKESH SRI ABHIRAM', '22a81a05h2@sves.org.in', '$2y$12$owE8su1CueEXmY4qRWrZyuMCMkoDky2niORhmIpDnKeUZJjH//C7y', 'student', 'CSE', '22A81A05H2', '9014953519');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.49, 8.38, 8.23, 8.86, 8.74, 8.95, 8.19, 7.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NERELLA N S VENKATA SIVA SAI RIHITHA', '22a81a05h4@sves.org.in', '$2y$12$gq996fSPd3n1vk0TMSVraukVs4i1rHU5QilA5XopTQIo3HgmZ5uD6', 'student', 'CSE', '22A81A05H4', '8790150978');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.31, 9.38, 9.23, 9.41, 9.44, 9.58, 9.44, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PALLAPOLU SAI MEGHANA', '22a81a05h5@sves.org.in', '$2y$12$L10bcUcy89n5gov4GmFNP.hqdfJCCm0SGWKVRJfuf7yEleRHfzELG', 'student', 'CSE', '22A81A05H5', '9618692300');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.19, 9.15, 8.69, 9.77, 9.16, 9.3, 9.44, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PANTHAGANI SWEETY', '22a81a05h6@sves.org.in', '$2y$12$512wzMzNiqrvY6WCwYGSeeO7LWNMPOqqvktDh8hrJUEInXRHZsIIC', 'student', 'CSE', '22A81A05H6', '9063672646');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.11, 8.08, 7.15, 8.23, 8.39, 8.33, 8.09, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PARIMI JNANA SAI', '22a81a05h7@sves.org.in', '$2y$12$bMnllO9qX5y01Xmqu3YAAu33tTVoujcaDuwthai/Y3BoLXcwyjdtG', 'student', 'CSE', '22A81A05H7', '6281815552');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.58, 8.46, 8.31, 9.12, 8.46, 8.61, 8.46, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PAVANI PUNYAMANTHULA', '22a81a05h8@sves.org.in', '$2y$12$WcQACsD0713L4mHYxKc5p.71V06ZboCVCZPYRHHh5eVoTz2NpsNrm', 'student', 'CSE', '22A81A05H8', '7569505926');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.3, 9.31, 8.08, 8.94, 7.63, 8.39, 7.98, 7.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PEDAMURTHI KIRANKUMAR', '22a81a05h9@sves.org.in', '$2y$12$5xiOADQhQ/Bv6ds6/Q6koeItbl4gkIeoEBglQWj.kugERlzCCC9nS', 'student', 'CSE', '22A81A05H9', '9014268313');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.73, 7.15, 7.31, 7.8, 8.33, 7.67, 7.67, 8.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PRATTI GAYATRI', '22a81a05i2@sves.org.in', '$2y$12$wM.IBqD8FNdZSbGxWP4RqewqBC14vfauuXXOk6v/5cQqyvaJkCvIS', 'student', 'CSE', '22A81A05I2', '9390561761');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.58, 8.92, 8.77, 9.06, 8.74, 8.67, 8.09, 7.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('RAMBHA RASMITHA LEKHA', '22a81a05i6@sves.org.in', '$2y$12$O8HmBGpqS874uMzxGJ/LsuFykE069QUvaBVVtXGrG/8vmXClWR3xe', 'student', 'CSE', '22A81A05I6', '9121487799');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.99, 8.92, 9.23, 8.94, 9.44, 8.74, 8.95, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('RAPARLA PRASANNA KUMAR', '22a81a05i7@sves.org.in', '$2y$12$.yWQSdTFc5qkrrJbOCLr6.K/TFclPDx68HNIXXERxa2i.5JA7nNZ.', 'student', 'CSE', '22A81A05I7', '9392693465');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.37, 9.08, 9.23, 9.18, 10.0, 9.58, 9.3, 9.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SAMUDRALA S S N V RANGA DURGA MAHATHI', '22a81a05i9@sves.org.in', '$2y$12$HkNncFHgECD6LDogIo3WWuZYEY.GcUMsf4Masc7DVBKEXaRxbwaIO', 'student', 'CSE', '22A81A05I9', '8500012222');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.05, 9.08, 8.77, 8.94, 9.3, 9.58, 8.88, 8.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TEKI VIJAYARATNAM', '22a81a05j2@sves.org.in', '$2y$12$X4f0vowhTWwzpWbD/Yl4AOBcpWtO0DMSPcuK8A390dXZKgBsn9bQu', 'student', 'CSE', '22A81A05J2', '8688132605');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.16, 8.46, 8.0, 8.16, 8.33, 8.19, 7.56, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TUMMALAPALLI MANIKANTA VINAY', '22a81a05j3@sves.org.in', '$2y$12$RKODE3C0FeoH.t4tDtq16Og26y5caRFZesvMDwg6Jc9RD6DKT79Hy', 'student', 'CSE', '22A81A05J3', '9550085889');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.76, 7.31, 7.31, 8.04, 7.91, 7.84, 7.74, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('UMMIDI CHAITANYA SURYA SAI DEEPTHI', '22a81a05j4@sves.org.in', '$2y$12$7Dt9asGQGg8Mbd6oTgb.xuI3Wh7hqep7s93hnwKpgeaYiNGCfcC4.', 'student', 'CSE', '22A81A05J4', '8143163882');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.76, 8.77, 8.31, 8.94, 9.02, 9.16, 8.61, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('UKKUSURI VENKATA KRISHNA PRASAD', '22a81a05j5@sves.org.in', '$2y$12$jbG0QowuZOn.0NDskPLzdeggNCGOFycf/3IeR8ST1Bz1R7Pbhr9Im', 'student', 'CSE', '22A81A05J5', '9705849347');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.47, 7.46, 7.38, 7.28, 7.21, 7.7, 7.49, 7.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('YARAMOLU LAKSHMI SADWIKA', '22a81a05j7@sves.org.in', '$2y$12$Oo2MW9xpDxA3vS2BSRbC1.Xkib5KWa9gcCbG8Ep1KqRHStEqybYo.', 'student', 'CSE', '22A81A05J7', '7989968788');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.46, 8.69, 7.85, 8.35, 8.46, 8.61, 8.88, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('YERRAGOLLA BHARGAVI', '22a81a05j8@sves.org.in', '$2y$12$fxik.YJiT5DkyeT/pivRXeEgaSeNYs33Aopz268qVBG8Xm7do6wAy', 'student', 'CSE', '22A81A05J8', '9550223469');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.64, 8.62, 8.31, 8.53, 8.88, 8.74, 9.16, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ALLU ROHINI JNANA PRASOONA', '22a81a05j9@sves.org.in', '$2y$12$UYFaM.ergK0wSzFMVVVGbueq7aezzskZ/qZIsZHynhGqMOEKn8hse', 'student', 'CSE', '22A81A05J9', '9505268966');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.38, 8.15, 7.23, 8.35, 8.23, 8.95, 9.02, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ANDRA TULASI LAKSHMI TANYA', '22a81a05k0@sves.org.in', '$2y$12$zjA04jPmB34TxXTzfwaPy.KQY.ZXmVbSlm2rksOWyu2GH7YOM8m3m', 'student', 'CSE', '22A81A05K0', '6302601497');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.24, 9.54, 9.62, 8.94, 9.3, 9.02, 9.44, 8.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ACHANTA MADHUR', '22a81a05k1@sves.org.in', '$2y$12$ACZsHzATC8qx5Quhq6CnnOxd7wvwTuL6NYl4mWymjBojoabuo8rGm', 'student', 'CSE', '22A81A05K1', '8712279935');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.37, 9.54, 9.54, 9.29, 9.44, 9.3, 9.16, 9.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ACHYUTHA DURGA YASASWINI', '22a81a05k2@sves.org.in', '$2y$12$Uc0phvfRDbOA7JcrvOMWIuG0WwZKgg0OwJzzmI/8iT.If7Zsc6hWy', 'student', 'CSE', '22A81A05K2', '6301189990');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.3, 9.54, 9.54, 9.18, 9.51, 9.02, 9.3, 9.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ANKADI UDAYA SRI', '22a81a05k3@sves.org.in', '$2y$12$Quk.tIfq/V7W0IjLf/GKgOa.4oLvzDI3vdbgfaiLp09bIbROI2jTi', 'student', 'CSE', '22A81A05K3', '8519817259');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.43, 8.62, 8.08, 7.88, 8.61, 8.46, 9.02, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('APPASANI JYOTHI PRANEETHA', '22a81a05k4@sves.org.in', '$2y$12$eLukk7t.PndRnq/kaASyheWE2YiGmcq6vx9kwEHmK1inmHwDRPU1K', 'student', 'CSE', '22A81A05K4', '7993863539');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.91, 9.38, 8.69, 8.65, 8.74, 9.16, 8.74, 9.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BADAMPUDI SRIYA', '22a81a05k5@sves.org.in', '$2y$12$0Q2CEw7O9suOtOn7Bmx7xuamZkRV1BsjBdkrq8LU94KH9ZraWQtA6', 'student', 'CSE', '22A81A05K5', '9502182533');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.8, 9.08, 9.08, 8.59, 8.67, 8.65, 9.02, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BANDARU UMA DEVI', '22a81a05k6@sves.org.in', '$2y$12$omv4E4fykqN.fMf3KqxWqeQFI3IpQ2x4CW1nPhd3/XpRfH/lxtuTK', 'student', 'CSE', '22A81A05K6', '7075664542');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.54, 8.62, 8.31, 8.18, 8.46, 8.61, 9.16, 8.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BHUSHI BINNU ANURAGH', '22a81a05k9@sves.org.in', '$2y$12$wqU8/in0NGcWC91hjOEIM.3XH9xagiqyZKM7t9EDJbuPUtcP0AspW', 'student', 'CSE', '22A81A05K9', '9393397621');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.76, 7.23, 7.0, 7.86, 7.7, 7.98, 8.19, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BOKKA KUSUMA SRI', '22a81a05l0@sves.org.in', '$2y$12$ShEKr.Fi.hBnOetcXtCLyuQVN18l2k9wVBMnpYB9YQRfajXj65TTm', 'student', 'CSE', '22A81A05L0', '7207431798');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.14, 9.38, 8.77, 9.18, 9.07, 9.44, 9.16, 8.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BURILA RAMYA', '22a81a05l1@sves.org.in', '$2y$12$m0F0.umUsdP3u9aDihQ.NepYTX5vorgsWZ0f91HTPi5QkgHSGslY2', 'student', 'CSE', '22A81A05L1', '9121553665');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.76, 8.46, 8.0, 9.06, 8.65, 9.02, 9.37, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHINTAPALLI LOKESH', '22a81a05l2@sves.org.in', '$2y$12$CI4jelg.FJ01u0x4sxufH.nJxcxyFYtM15NNz3MlwBgKLVkP92DsW', 'student', 'CSE', '22A81A05L2', '9908872977');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.19, 9.38, 9.23, 9.53, 9.16, 9.3, 9.16, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DARLA JYOTHSNA', '22a81a05l3@sves.org.in', '$2y$12$/641hSgEZ5AeRojli2Q.9.HbYj.2Bqz21j2mzWoWZd4/mJhi6e8hu', 'student', 'CSE', '22A81A05L3', '9391681988');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.42, 8.08, 8.77, 8.53, 8.42, 8.88, 8.54, 7.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DASU RAJA GOPAL', '22a81a05l5@sves.org.in', '$2y$12$bFcNbj0yL/xYRiyfy1na.emyQVHUktXheVFgQBQ4g.05F2dIla6zG', 'student', 'CSE', '22A81A05L5', '7036619772');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.58, 8.0, 6.92, 7.51, 7.56, 7.63, 7.49, 7.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DOPPASANI VENKATESH', '22a81a05l7@sves.org.in', '$2y$12$9Nayi2pMEcqcsuMAnqt4EuQ7HGjgxqlQ90uOYAcUJZmK6RZgFJUZm', 'student', 'CSE', '22A81A05L7', '9110561475');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.73, 8.0, 7.38, 7.88, 7.56, 7.42, 7.77, 8.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('EERLA PREM CHANDU', '22a81a05l9@sves.org.in', '$2y$12$tOp8rDK7ynzlYY7JvC/AHeUfpJw0fVe9aefxNzCA.vBeY2nb2EHEu', 'student', 'CSE', '22A81A05L9', '7093790711');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.77, 7.62, 7.62, 8.45, 7.4, 7.91, 7.84, 7.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GAMINI PAPA RATNA SRI PRAVEENA', '22a81a05m0@sves.org.in', '$2y$12$tnHguBygoW9chC.mfRL/a.GU4PDVNIk0i2trH6tIIHX3s0aScgWWm', 'student', 'CSE', '22A81A05M0', '9963477168');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.93, 9.54, 8.77, 8.59, 8.88, 9.02, 9.02, 8.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUBBALA ANUDEEPIKA', '22a81a05m1@sves.org.in', '$2y$12$I1KPYiFQet5Poohbjso7POL1wJYxm.4Z9pbizG8BwXzN1.x2xkULm', 'student', 'CSE', '22A81A05M1', '9182114749');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.94, 9.77, 8.69, 9.06, 8.65, 8.74, 9.02, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUBBALA SATISH', '22a81a05m2@sves.org.in', '$2y$12$vRPBzdCjbfL8ISsTuiGUpO.jBbgVoUn3PM0eWJ7chb4Ptomj17veK', 'student', 'CSE', '22A81A05M2', '7075753498');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.15, 7.85, 8.08, 8.12, 7.95, 8.02, 8.33, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KAKARLA SUBHASH', '22a81a05m4@sves.org.in', '$2y$12$y6T9P5k2ik16TkeCQCGL1u2o/6r0M8w.fyZ6XCaXzulTXW8kF249.', 'student', 'CSE', '22A81A05M4', '9550583815');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.49, 7.62, 6.92, 7.51, 7.33, 7.56, 7.28, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KAVALA DHANUSH GOPI', '22a81a05m6@sves.org.in', '$2y$12$hdhYi24MMC/fg3JuE8sL2OowdCgbaEa5CP6EYCn2cJfmeNWhE/tCG', 'student', 'CSE', '22A81A05M6', '6281716735');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.04, 9.31, 9.0, 8.94, 9.16, 9.16, 8.74, 9.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MEDEPALLI TRIVENI', '22a81a05n0@sves.org.in', '$2y$12$fGX4vO.DC3zOnmiWqCL0s.ZCoKqFwmXXJU7VZKD.71atzYdsaRZ/W', 'student', 'CSE', '22A81A05N0', '6305456772');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.78, 9.46, 8.54, 8.82, 8.88, 8.61, 8.74, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MULLAPUDI APARNA', '22a81a05n2@sves.org.in', '$2y$12$qsO8DJYhI6BmQ1RVyc02GOtUQzJ8ysqV/A4TL5mhchxCbSvZMtg6q', 'student', 'CSE', '22A81A05N2', '9885849927');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.92, 9.38, 9.0, 8.82, 8.54, 9.09, 8.61, 9.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NAYUDU RATNA SITARA', '22a81a05n4@sves.org.in', '$2y$12$DEoCANfyQbyvIQO2e18t3Oy7WLo2qx4q3FbknzvCSKrpIk1/ZHJrG', 'student', 'CSE', '22A81A05N4', '6303915133');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.75, 8.77, 8.23, 8.71, 8.81, 9.16, 8.61, 8.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('OBHILISETTI DHANUSH', '22a81a05n7@sves.org.in', '$2y$12$SfsQY/t1WpmgDM5VTCYQseLy7IMlOsQIFjkyb1133zxCR6jezNEJq', 'student', 'CSE', '22A81A05N7', '9346475931');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8, 7.38, 6.62, 8.47, 7.98, 8.33, 8.61, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PACHIGOLLA VENKATA SANDEEP', '22a81a05n8@sves.org.in', '$2y$12$QvjCh756cYMeUmmzGE5x4OEREq08lS3viKyhN1VBDmZ9th78AUOk.', 'student', 'CSE', '22A81A05N8', '8688213171');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.22, 7.92, 7.54, 8.65, 7.65, 8.46, 8.74, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PADAMATA PURNASAI', '22a81a05n9@sves.org.in', '$2y$12$e5sr7nTUlPZGMVQKqGNn/OsptYUz8rhBZPNjllfXrVvjkXr/BVc5i', 'student', 'CSE', '22A81A05N9', '8919233703');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.53, 8.31, 8.77, 8.69, 8.07, 8.54, 8.88, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PALLI PALLAVI SATYA', '22a81a05o0@sves.org.in', '$2y$12$QcVuqrrag9KssCUB0o/1zubjIVd4E8nbekxD1hws5ttjtoWOE9z86', 'student', 'CSE', '22A81A05O0', '8008101249');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.27, 9.38, 8.92, 9.18, 9.44, 9.44, 9.44, 9.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PEKETI YAJNICA SAI', '22a81a05o1@sves.org.in', '$2y$12$nGlOJCnWUnON7j25KMq8qOU/M6hLx23Vfr.fVhM.e6k/iqdHimhOu', 'student', 'CSE', '22A81A05O1', '6303050173');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.42, 8.62, 7.85, 8.12, 8.33, 8.61, 8.74, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PILLA MADHAV GANESH', '22a81a05o2@sves.org.in', '$2y$12$AKQUnl1/Y9Bns24NuAZXduqoX6pfaHyj28ABUZ1.sNkAWW9VZNsja', 'student', 'CSE', '22A81A05O2', '8919420562');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.79, 7.85, 6.62, 7.59, 7.47, 8.12, 8.23, 8.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('POTNURI CHAITANYA', '22a81a05o4@sves.org.in', '$2y$12$5VJ3fg7YgeBa87.W4Nql1.VlG2kPmfzJn9BDc6TN257Ko6XMyRGe2', 'student', 'CSE', '22A81A05O4', '6305484994');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.59, 8.85, 8.92, 8.71, 8.35, 8.3, 8.46, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PULUGU SAKULJI', '22a81a05o5@sves.org.in', '$2y$12$04LazfANfIb2NJYsC9MvXeoWAFNw7dXy9dJ6Cg07phUxczSIe5wSa', 'student', 'CSE', '22A81A05O5', '7013567728');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.18, 8.15, 7.77, 8.59, 7.98, 8.19, 8.12, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('RACHURI HARISH', '22a81a05o7@sves.org.in', '$2y$12$oRJyXZsByUS3/NN0rkXFIu71LjG4mEU4y68dItPMIbipV3xQyBsky', 'student', 'CSE', '22A81A05O7', '9908545726');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.16, 8.54, 7.85, 8.35, 8.16, 7.6, 8.44, 8.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SADA RAMYA', '22a81a05o8@sves.org.in', '$2y$12$9B4AAbQop.cp/5bv48gPQ.SD8ntaX4NNNX5KYBWVhJxPOnIBM3eYG', 'student', 'CSE', '22A81A05O8', '9502391167');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.99, 9.08, 8.85, 9.29, 9.02, 9.16, 8.93, 8.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SODIMELLA LAVANYA', '22a81a05p2@sves.org.in', '$2y$12$cGJpvQYE.KnMUH3fVT0jN.ITxYUqtHh5t2bY/7NS2mf3XcUmY0SQW', 'student', 'CSE', '22A81A05P2', '7013666565');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.55, 8.92, 7.85, 8.53, 8.72, 8.74, 8.61, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TAMARADA RUPA SARASWATHI', '22a81a05p3@sves.org.in', '$2y$12$GN4SRflAcxzSAFriEo1ZA.k.VYv1IB86Qloygko9aDhtKS.5K7GO2', 'student', 'CSE', '22A81A05P3', '7702678743');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.88, 9.23, 8.46, 8.82, 8.72, 9.37, 8.88, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TANETI RAKESH', '22a81a05p4@sves.org.in', '$2y$12$Wh4XFiCKnHlH54lR3xNpDePVW/Y50DnWZpRpon7CWIcAkBn4aVUum', 'student', 'CSE', '22A81A05P4', '8466858878');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.51, 8.46, 8.46, 8.47, 8.37, 8.74, 8.61, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('UKKUSURI SIVA KRISHNA', '22a81a05p6@sves.org.in', '$2y$12$FaH2kr/UhxukygiP/OVaEeVkxyy931h3xKoE6iRnKwHzHsK5lk7su', 'student', 'CSE', '22A81A05P6', '8374527123');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.16, 8.38, 8.0, 7.92, 7.91, 8.61, 8.23, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('UNGARALA LEELA KRISHNA MANIKANTA', '22a81a05p7@sves.org.in', '$2y$12$SePyZYrGf72dJXvKlQ7rf.RpFITt9XM3U06geZm/w16R6durBCcTS', 'student', 'CSE', '22A81A05P7', '8074322939');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.2, 8.38, 7.62, 8.59, 8.49, 8.46, 8.12, 7.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VAJHULA JAHNAVI SRIVALLI', '22a81a05p8@sves.org.in', '$2y$12$sABTIvVPC6daW8cEhy1PYONMYlIzA67cXohoel4R5eTiYA1W6JCB6', 'student', 'CSE', '22A81A05P8', '6303431118');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.92, 8.54, 7.92, 7.08, 7.74, 8.46, 7.81, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VASA BABY PRANEETHA', '22a81a05p9@sves.org.in', '$2y$12$JHztltZ1G09eeto8EEP63uBFKpmu1XO5TGMoCiKv4SD5vcHwju3k.', 'student', 'CSE', '22A81A05P9', '9032636196');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.09, 8.46, 7.54, 8.06, 7.88, 8.26, 8.3, 8.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VATHUMILLI LAKSHMI SRI SAI GANESH', '22a81a05q0@sves.org.in', '$2y$12$gDmrPK8nyox1W5DlDm0B5.rPdGGmHb3K07CXHpcH9fglxI/VsEGgK', 'student', 'CSE', '22A81A05Q0', '8008149866');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.26, 9.0, 8.23, 8.23, 7.84, 8.46, 8.51, 7.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VEERAMALLU HARIKA SRI', '22a81a05q1@sves.org.in', '$2y$12$ijkjPpW/VG5C0dfY/k26qe5ULRsygW5VTrBxyPaUc7cuncjdcJeCK', 'student', 'CSE', '22A81A05Q1', '8125627996');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.83, 8.38, 7.38, 7.94, 7.4, 8.02, 7.98, 7.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VEGIREDDY GAGAN VAISHNAV TEJ', '22a81a05q2@sves.org.in', '$2y$12$djhHuPH8A4dtFxYYfCOv6u86immVZIufHzN6WOOR.iCfgCBI55cSS', 'student', 'CSE', '22A81A05Q2', '9347974737');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.64, 9.0, 8.69, 8.78, 8.67, 8.88, 8.46, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('YANDAMURI LIKHITA SAI', '22a81a05q4@sves.org.in', '$2y$12$tMHQVOSzhbzJu80k.pVZ0eEdTDNEGYloZtYNgxHchKY02FqZTW/JO', 'student', 'CSE', '22A81A05Q4', '8074607919');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.88, 9.54, 8.54, 8.71, 9.07, 9.23, 9.02, 8.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BURADA DAAKSHINYA', '23a85a0501@sves.org.in', '$2y$12$nU9EIOtZkol0IHMGtOIp1uIzM2XChqf.t33q72hpQMcLOoEIcfawO', 'student', 'CSE', '23A85A0501', '8639436070');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.48, NULL, NULL, 8.47, 8.61, 8.51, 8.61, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GANDI GEETHA SRILAKSHMI', '23a85a0502@sves.org.in', '$2y$12$10Xsw/Kyq2ljCXvZhM9Bce3y5zPP70GXApcOPtU9hjXsNEr4uKFkG', 'student', 'CSE', '23A85A0502', '9000278936');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.01, NULL, NULL, 9.18, 8.88, 8.86, 9.58, 8.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KAICHARLA VANI ISWARYA', '23a85a0503@sves.org.in', '$2y$12$pNCvzPNmvS8CXXjZ5SRNSeZYikX1LU2S2XBUODQFERypmwSCVE0sO', 'student', 'CSE', '23A85A0503', '9391232049');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.01, NULL, NULL, 8.82, 8.95, 9.16, 9.3, 8.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KAMMILI MANOJ VAMSI', '23a85a0504@sves.org.in', '$2y$12$7xQ5CsKo8f82FBsVsPr8m.tLvXmzaT.RyC2xUbq.U2KwwyZzNGDKS', 'student', 'CSE', '23A85A0504', '9398049662');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.39, NULL, NULL, 8.59, 8.26, 8.72, 8.3, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KAMIREDDY NAVANEETH', '23a85a0508@sves.org.in', '$2y$12$eA6Ffw9vqnV7YG8xepYroOFJGIi3SlVzMlOVYDBTtT6xvV3o3VX6.', 'student', 'CSE', '23A85A0508', '8074489477');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.02, NULL, NULL, 7.88, 7.98, 8.09, 8.39, 7.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KANCHARLA SRI NAGA SURYA SATYA SAI HEMANTH', '23a85a0509@sves.org.in', '$2y$12$KTUmK2Km66rPHBRFSQTzv.yo/ryYwuHzDGbORP/xeihb1PD/pWO.i', 'student', 'CSE', '23A85A0509', '9618293059');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.52, NULL, NULL, 7.35, 7.35, 7.74, 7.56, 7.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('YERRA LALITHA', '23a85a0513@sves.org.in', '$2y$12$C77HTb3CAQTADly5Wxz8vusyiJL/5Q7zvHLIkg/2e8Ardy7kSxJqi', 'student', 'CSE', '23A85A0513', '9392996091');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.78, NULL, NULL, 7.71, 7.49, 7.47, 7.91, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('AGARTHI VENKATA RAMANA', '23a85a0514@sves.org.in', '$2y$12$3IczJmL1DmXN8L5nfplveuQqBq6PhCfViJVZ6DuKAmOmXDIgPa2Yq', 'student', 'CSE', '23A85A0514', '8686645005');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.05, NULL, NULL, 7.98, 7.63, 8.12, 8.37, 8.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHERUKU VEERA VENKATA DURGA LAKSHMI', '23a85a0515@sves.org.in', '$2y$12$OZS/gaJCaaBDcaXwwos9OOZ6EfYTvywFQCF/SQLTX4gRlqP0VpR8i', 'student', 'CSE', '23A85A0515', '6300209727');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8, NULL, NULL, 7.47, 7.35, 8.26, 8.19, 8.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DWARAMPUDI SAI PAVAN MANIKANTAN REDDY', '23a85a0516@sves.org.in', '$2y$12$Lwm19.Jd7UECg1vigGSA6uY73nBYu1yP/YRZ8z9D33.7Jfk5HSnfW', 'student', 'CSE', '23A85A0516', '9014786685');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.42, NULL, NULL, 7.28, 7.42, 7.12, 6.91, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SOMA AMRUTHA VARSHINI', '23a85a0518@sves.org.in', '$2y$12$/jzGo2w7HypNZG7DabrKXO1JL58h.aUov8b.TcHeiuk7JMwH7S50O', 'student', 'CSE', '23A85A0518', '9390697594');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.41, NULL, NULL, 8.18, 8.26, 8.46, 8.54, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ABBABATHULA SIRISHA', '23a85a0520@sves.org.in', '$2y$12$bK9.hI910tuRCr3uQvL6ce4uB/.tOW4lnLUfpLsp3O2FdPIJaj4Sy', 'student', 'CSE', '23A85A0520', '9391955329');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.04, NULL, NULL, 7.59, 7.77, 8.19, 8.23, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DODDA BHAVANA VAISHNAVI', '23a85a0522@sves.org.in', '$2y$12$cEuolQJpQ7Gf2mJIjNDFnehrLbSWvACvfWHruj7dlYmiOeMA73RT.', 'student', 'CSE', '23A85A0522', '9908002569');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.44, NULL, NULL, 8.23, 8.14, 8.54, 8.51, 8.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ELIGANTI BALA KRISHNA', '23a85a0523@sves.org.in', '$2y$12$MBlVmqgMuG.SbV2GrfOCZ.Og41HHuGMwFgE/P2PUiAFEvEqUHFW/a', 'student', 'CSE', '23A85A0523', '8978819688');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.82, NULL, NULL, 8.04, 7.3, 8.05, 7.74, 7.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NEELAM UMA VENKATA NAGA RAJU', '23a85a0525@sves.org.in', '$2y$12$6Ojxg2eK/cKZzRtOf3bRmOTjD3isSvn58FMmVveq.SRH0sr7aJ.ta', 'student', 'CSE', '23A85A0525', '9392511479');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.68, NULL, NULL, 7.88, 7.12, 7.0, 7.81, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('AJAY VARDHAN BALINA', '22a81a0401@sves.org.in', '$2y$12$rvxh7sWx404.1jB/lra9KOUAzxQfPPhmOvxzMcT0dRDPYezPzw6Pe', 'student', 'ECE', '22A81A0401', '9849966697');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.39, 8.54, 8.38, 8.33, 8.12, 8.65, 8.39, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('AMJURI SOWMYA SRI', '22a81a0403@sves.org.in', '$2y$12$wgkYlMMTK3Flo66puVptte20P7rxDdiEN9nbxItVTYKtCo8xyg.Q6', 'student', 'ECE', '22A81A0403', '9492920461');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.16, 8.46, 8.54, 7.94, 7.56, 8.65, 8.09, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BANDUCHODE SHANVITH SAI', '22a81a0404@sves.org.in', '$2y$12$USDThAa0fn5QsgngxcWMUuHuJha8VzP80SmOjYWGUQj0fG2RMPJpq', 'student', 'ECE', '22A81A0404', '7013227750');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.59, 8.15, 7.77, 8.1, 7.35, 8.09, 7.49, 6.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BOMMA LEELA SRI SINDHU', '22a81a0406@sves.org.in', '$2y$12$VETBzrokaPQ44WTpiRxzDeWjt0RtJ9NoOWuYgsWpDWzRBB1Ox1kda', 'student', 'ECE', '22A81A0406', '7995889161');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.84, 8.54, 8.08, 7.63, 7.42, 7.88, 7.81, 7.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BORRA RAMANJALI', '22a81a0407@sves.org.in', '$2y$12$cOl0RENVAEMr8TtBuSutbO4KZENvMK352pkVpyGLwsqASkLU7b09W', 'student', 'ECE', '22A81A0407', '8179474231');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.94, 9.46, 8.85, 8.43, 8.88, 9.44, 9.02, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BURUGUPALLI SINDHU', '22a81a0408@sves.org.in', '$2y$12$1qReSBof2jZS56NnDTyww./j1yPGwLD3J1.KgAnzIyfRFntbHH.fy', 'student', 'ECE', '22A81A0408', '9346418624');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.03, 8.62, 7.69, 7.82, 8.05, 8.23, 8.09, 7.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHITROJU YASASWINI KEERTHI', '22a81a0411@sves.org.in', '$2y$12$PAvr4ibbrOGCw7l08Q70au6BVV/aoXwKwzzFzQ6/f.nRECTISkqrO', 'student', 'ECE', '22A81A0411', '9885465529');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.38, 7.46, 7.62, 7.28, 7.42, 7.74, 7.28, 6.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('EPI THANISHKA', '22a81a0417@sves.org.in', '$2y$12$f7FD.vnZ8K7N4HAFjWCle.L8oDOb1VqHdIRBY9.eHG/2iVmo0yDBy', 'student', 'ECE', '22A81A0417', '9133922748');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.02, 8.31, 8.15, 7.63, 7.42, 8.74, 8.46, 7.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GANDROTHU BHAVANI', '22a81a0418@sves.org.in', '$2y$12$y2PT78KljsdwEwA6Q2rzEOPuxNZzx0TKYEXWmcvz95uT/Zf/vfv/q', 'student', 'ECE', '22A81A0418', '9121475339');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.64, 7.38, 8.31, 7.18, 7.35, 8.12, 7.63, 7.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KATAM DINESH ROY', '22a81a0426@sves.org.in', '$2y$12$f1Q0g9bgrDRmNnlf.QBnNOdYM3FHtQdc/s8obJ3BqRDsP2QmpDARi', 'student', 'ECE', '22A81A0426', '7331136079');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.96, 8.23, 7.77, 7.47, 8.26, 8.16, 7.77, 8.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KESANAKURTHI SANTHI', '22a81a0427@sves.org.in', '$2y$12$du.mgkIsCfumsEwkvbGOhuhcjRDz/YJcYuaHbMMMgjrWyFsR6LhD6', 'student', 'ECE', '22A81A0427', '8790986182');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.42, 8.92, 8.92, 8.49, 7.98, 8.81, 8.67, 7.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MANIKIREDDY SATISH', '22a81a0436@sves.org.in', '$2y$12$o0eADEJIArzZxRA5ZxNGie/BrCOKYYHpg0zywt6jN1CW.vkOPOXci', 'student', 'ECE', '22A81A0436', '6301007676');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.05, 7.69, 8.46, 8.06, 7.88, 8.81, 7.91, 7.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NALAM SATHVIKA', '22a81a0441@sves.org.in', '$2y$12$ckAQWhakI/9DiFCtIoXxjustMntT0NPMEtVadzv3OAd33Tfvp6XZW', 'student', 'ECE', '22A81A0441', '6304062936');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.64, 8.08, 7.85, 7.28, 7.77, 7.77, 7.77, 7.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NUNNA V N P L MEGHAMALA', '22a81a0442@sves.org.in', '$2y$12$KRFyqpiRddDgrYZF07yMpueIJZ2hQ/qv/ynk3JYNltL8kl8jvBtlW', 'student', 'ECE', '22A81A0442', '9866141504');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.8, 8.92, 9.23, 8.71, 8.46, 9.44, 8.88, 8.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PAKALAPATI MOUNIKA LAKSHMI', '22a81a0443@sves.org.in', '$2y$12$C91khFI.xQ7U/utnIRSyX.AE5H.0U9p8hoMYrB04lBvAIRMwGBjlq', 'student', 'ECE', '22A81A0443', '9346422248');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.47, 8.23, 7.92, 7.06, 7.28, 7.67, 7.77, 6.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('POLISETTY MOUNICA SURYA DURGA NAGA SREE', '22a81a0447@sves.org.in', '$2y$12$D5q2of8agtq8TGeLvKZTBuECjMCNUbESzN1GqxSWSU5kJXH4j24JC', 'student', 'ECE', '22A81A0447', '8247523131');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.4, 8.54, 8.69, 8.33, 8.54, 8.74, 8.65, 7.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('RATNALA PAPA', '22a81a0449@sves.org.in', '$2y$12$EE.SxREU/NXHROMbYpnV6uZiY4BBf9KI4HcOs8yoZ5gk84RV1api.', 'student', 'ECE', '22A81A0449', '7569509557');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.06, 9.38, 9.54, 9.12, 8.95, 8.95, 9.09, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ROHITHA YERRA', '22a81a0451@sves.org.in', '$2y$12$miF6dO0HntIm2sLkb0Ul2.gMcy.SkPeQu3ETswWbehGRDH01GL/aO', 'student', 'ECE', '22A81A0451', '7286970144');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.7, 9.15, 9.15, 8.61, 8.74, 8.74, 8.54, 8.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SHAIK RAJIYA', '22a81a0453@sves.org.in', '$2y$12$zJJ6Xb8FhNLhXxXTAKGHku9WA//h46Ueufb14oJMHAQn92MP3sEki', 'student', 'ECE', '22A81A0453', '8374324633');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.69, 9.0, 9.38, 9.06, 8.05, 8.61, 8.86, 7.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TULA DEEPIKA', '22a81a0457@sves.org.in', '$2y$12$jrUhZxh9pl3rXjGRSTpV4uhQ8LpnjlVnJPQhspYhellzJAATkgsCe', 'student', 'ECE', '22A81A0457', '8074277119');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.33, 7.31, 7.38, 7.04, 6.98, 8.19, 7.95, 6.56, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VAMISETTI DHANESH', '22a81a0461@sves.org.in', '$2y$12$jTuJUsE.Fmkl1k4mddUcMOq1do4nKNt7mZkigEuRtRTLwTpM4vgwu', 'student', 'ECE', '22A81A0461', '7794058703');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.74, 7.54, 8.0, 7.53, 7.26, 8.33, 7.98, 7.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('YADADA VARSHINI', '22a81a0464@sves.org.in', '$2y$12$JC9a6Aa4ZYnq0prq8jU3TOoFKW1srgAUObZSFXflxQtWNxpc2YLT6', 'student', 'ECE', '22A81A0464', '9391939425');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.61, 8.77, 8.62, 8.35, 8.46, 9.23, 8.67, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('AKASAPU KALYANI', '22a81a0467@sves.org.in', '$2y$12$1lbG6Relj/uykGRv56rSuuplkxJXJ9xuuFTOPkEhapYnCropgygg2', 'student', 'ECE', '22A81A0467', '7287851677');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.78, 9.08, 8.85, 8.94, 8.51, 9.02, 9.3, 7.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BELLANI BALA GOWTHAMI', '22a81a0471@sves.org.in', '$2y$12$z2Mvv1khfxySdeOYrSVb5OwoA202/c53GxL3gYS8EuxKgd4xc5tRC', 'student', 'ECE', '22A81A0471', '9542328541');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.09, 8.38, 9.0, 7.8, 7.81, 8.72, 8.16, 6.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHEKURI JAGADEESH VARMA', '22a81a0474@sves.org.in', '$2y$12$lsDf989Zzv4PFc8jLxxUY.NDcZZeeh2fLO97MWEdPrdCJiB6GcanW', 'student', 'ECE', '22A81A0474', '8688775567');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.59, 8.46, 8.0, 7.55, 6.86, 8.05, 7.67, 6.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DIDDE AJAY KUMAR', '22a81a0477@sves.org.in', '$2y$12$KKQISiJ1Od7hfH9cS7aCA.gaKB.Ktgm8DSenjYG9NBi45HMDJBGv2', 'student', 'ECE', '22A81A0477', '8688753586');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.45, 9.15, 9.0, 8.45, 7.91, 8.74, 8.33, 7.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ELIPE JYOTHIRMAYEE SNEHALATHA', '22a81a0478@sves.org.in', '$2y$12$M/fQlnwrCqCsp7wba8Qk6uE3ePiw2BhaH5EoBXI2sIIQJw13lbCou', 'student', 'ECE', '22A81A0478', '9441994077');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.26, 8.92, 8.08, 8.47, 8.33, 8.39, 8.3, 7.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GAJJANA GEETANJALI', '22a81a0479@sves.org.in', '$2y$12$2nJKYlqnOHARz8isrTxKueMz7d.hiYB6O07mvCuiGI1U4pVnc0SFi', 'student', 'ECE', '22A81A0479', '6305064354');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.83, 9.23, 8.77, 8.88, 8.37, 9.44, 9.09, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GANAPAVARAPU ANUSHA', '22a81a0480@sves.org.in', '$2y$12$VrmJrux1zE8Fi5zTr1Fnoup1SEApUVEpXzZjtWHf4jVK.gh5ryTdu', 'student', 'ECE', '22A81A0480', '6281271123');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.47, 7.77, 7.38, 7.18, 7.47, 8.19, 7.33, 7.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GAYATHRI UNNAMATLA', '22a81a0482@sves.org.in', '$2y$12$IYLSUlck7zixyVQGRzikru94Kn5zkA/VRbuoiCmk8NBai04G7I/re', 'student', 'ECE', '22A81A0482', '8008853136');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.91, 8.69, 8.92, 8.98, 8.88, 9.28, 9.3, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GIDDA LAHARI', '22a81a0483@sves.org.in', '$2y$12$toXxAjVBtLyQez0DLv6d7uKLocBd1auZDv6my8/DUUYMQWoVHY/Sm', 'student', 'ECE', '22A81A0483', '6304188234');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.99, 7.69, 8.92, 7.77, 7.42, 8.12, 8.51, 7.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GORLI SRIKANTH', '22a81a0484@sves.org.in', '$2y$12$rvuBW9QDzyPCc6UhTpJ6..JIHutXcdqkwF2hs2Nsd5bX5lEd6Ua6C', 'student', 'ECE', '22A81A0484', '8247455874');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.3, 8.92, 8.46, 8.8, 7.67, 8.79, 8.02, 7.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('INDALA SRINIVAS', '22a81a0486@sves.org.in', '$2y$12$mF8XYLYHANbEqjgkwh1Y8eZKovKYHhlEnbg4jGhswWMYHWRcjN7bC', 'student', 'ECE', '22A81A0486', '9346525595');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.96, 9.08, 8.38, 8.06, 7.49, 7.88, 7.95, 7.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('JADDU YAMUNA NAGA DEEPTHI', '22a81a0487@sves.org.in', '$2y$12$Iwxhp0kI2Qd2QFUGKTArmu9ZSZC7ZCUrU.I5AkgJQ.KYE2G1BKhyC', 'student', 'ECE', '22A81A0487', '7396317003');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.71, 8.69, 9.23, 8.9, 8.51, 9.09, 8.54, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KALAGARA ESWARI VENKATA DEEPIKA', '22a81a0488@sves.org.in', '$2y$12$zwOn1yfp2MRGLeWOnyYSsOKeAqH.VJWLMf1Prt6R/i2ZVh0OYKUli', 'student', 'ECE', '22A81A0488', '6304834930');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.05, 7.85, 7.38, 7.67, 8.61, 8.39, 8.3, 8.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KADALI UDAY KIRAN', '22a81a0489@sves.org.in', '$2y$12$j3Zt0Zq9x7wG3mQXHvnLHO/lpTse5w4pNooLuow.eC06RPATTNxl.', 'student', 'ECE', '22A81A0489', '8074553625');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.21, 9.23, 8.85, 7.96, 7.84, 8.39, 8.12, 7.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KATTUNGA PAVAN SAI', '22a81a0492@sves.org.in', '$2y$12$1c1tSAj.1weJK9he6fAI0eybld.1vsuR9ub7zbMGUmVbVRnT9MnDK', 'student', 'ECE', '22A81A0492', '9346860273');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.17, 8.38, 7.77, 7.98, 7.95, 8.51, 8.09, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOKKIRIPATI SAILAJA', '22a81a0493@sves.org.in', '$2y$12$kAP02Y7rGQlVGVDYXFjspOowrl3FB.AiST9R6ZV2VQ3ris.NZVQu2', 'student', 'ECE', '22A81A0493', '9059736089');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.42, 9.15, 8.46, 8.33, 8.39, 8.67, 8.44, 7.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOTTADA SANDEEP', '22a81a0496@sves.org.in', '$2y$12$3ixaoB.hOnnAaXuTfRQxIOZLQAbVRNzmF6QROogw9psIt.A7LKG3O', 'student', 'ECE', '22A81A0496', '9908060957');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.89, 8.23, 7.69, 7.77, 7.74, 8.33, 7.67, 7.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOVVURI SIRI', '22a81a0498@sves.org.in', '$2y$12$S3T6NftSw3KnhSvt3WntT.3Qa8KxHBYzjO7I1/uJFNJKGOKVtdU1q', 'student', 'ECE', '22A81A0498', '9493756499');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.18, 8.62, 7.92, 8.18, 8.19, 8.54, 8.3, 7.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MANCHINA PURUSHOTTAM SAI SANKAR', '22a81a0499@sves.org.in', '$2y$12$qTI2Io8wPe8iimPUUj2pTOxbBrI9hsuhxxfyIt4ADBeudUxE6WZZm', 'student', 'ECE', '22A81A0499', '9121479234');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.28, 8.15, 6.85, 7.43, 7.19, 7.6, 7.26, 6.56, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MALLIPUDI SIVA KRISHNAMA RAJU', '22a81a04a2@sves.org.in', '$2y$12$U/AQRtIvhqKUF0ly2k6Z1.IRQ5p/3MmXZUMeW7fQ7X8erGJU0HJsi', 'student', 'ECE', '22A81A04A2', '9391357807');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 6.91, 7.92, 7.23, 6.76, 6.7, 7.12, 6.77, 6.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MANDELA VYSHNAVI DEVI', '22a81a04a3@sves.org.in', '$2y$12$izR../GdL3.jZGUU8C29cefHCaVyCdyeOGVN7NS3cHi6rSxLhslem', 'student', 'ECE', '22A81A04A3', '9502453119');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.63, 8.92, 8.23, 8.57, 8.54, 8.86, 8.88, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NALLAMILLI LEHYA SRI VENKATA HARSHITHA', '22a81a04a6@sves.org.in', '$2y$12$szUnWawOiXRQRD.YdZcJGOaDiHgE/I9Loxjrl4XOs2Q7T2m1DsWT.', 'student', 'ECE', '22A81A04A6', '8688225119');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.03, 8.77, 7.92, 8.1, 7.56, 8.44, 8.44, 7.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NANDYALA BHASKARA SATYA SAI VARMA', '22a81a04a7@sves.org.in', '$2y$12$8bcJ6C.1oO7s8rJJifBxSu9ID9m13guBQ4ChMb0f1NBRM75OB7Rfu', 'student', 'ECE', '22A81A04A7', '9493268458');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.24, 8.69, 8.85, 8.35, 7.81, 8.61, 7.67, 7.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PASUPULETI KUSUMA NAGA SAI SAHITI', '22a81a04a8@sves.org.in', '$2y$12$nh3MXs/885SrlwTiE2KHI.Qx7aUVRi8OunwmDHliUR3rbVKcF/ZYS', 'student', 'ECE', '22A81A04A8', '9392538374');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.54, 8.85, 8.69, 8.94, 8.37, 9.02, 8.33, 7.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PALLI ESWAR SUBHASH', '22a81a04b1@sves.org.in', '$2y$12$iZ5FcEpqNcK.GTNP44slmu67e4iU3fJJQc.TwmYLzygTl9favA4Jy', 'student', 'ECE', '22A81A04B1', '9502622477');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.25, 7.77, 7.46, 6.88, 7.12, 7.63, 6.98, 7.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PASUPULETI KUSUMA SATYA SAI JYOTHI', '22a81a04b3@sves.org.in', '$2y$12$irs3bo2/s.rV.RJoVMBqfeZKgHfctUkcpUHiSdcYYvGIw4.6VwSDe', 'student', 'ECE', '22A81A04B3', '9000746151');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.91, 8.15, 8.0, 8.22, 8.16, 7.74, 7.47, 7.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PATTAPU YASASWI', '22a81a04b4@sves.org.in', '$2y$12$243d8ghIgk2zlTzt/gvrieqhqSpnUp4IQIGgaintwgOIES0iC4Kt2', 'student', 'ECE', '22A81A04B4', '8019672368');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.29, 8.31, 8.62, 8.06, 8.33, 8.95, 8.16, 7.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PENNADA SINDHU', '22a81a04b5@sves.org.in', '$2y$12$4avNtLTnBVx6UKoQm2gaju/qV5Mf0qoKp18/uhIuyiTK3Xn.VyeIi', 'student', 'ECE', '22A81A04B5', '9014621288');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.47, 8.54, 8.46, 8.51, 8.61, 8.81, 8.44, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('POLUMATI SHANTHI PRIYA', '22a81a04b7@sves.org.in', '$2y$12$TAQB.v5gTcRzJaq6C0eT7.nKmEH5HpTvNsMQCNY5BxXRZdd/PpXK.', 'student', 'ECE', '22A81A04B7', '7032609863');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.78, 8.54, 7.38, 7.59, 7.33, 7.95, 8.23, 7.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PONNADA LEELA VENKATESH', '22a81a04b8@sves.org.in', '$2y$12$H4q85o2iLyA0HFJvUbTWtOe8fFrCvDSxFwajExv5w.FTCPcKOy9Ke', 'student', 'ECE', '22A81A04B8', '9392746816');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.31, 7.77, 6.92, 7.28, 7.12, 7.7, 7.33, 7.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('POTHUREDDYPALLI LAVANYA', '22a81a04c0@sves.org.in', '$2y$12$6vgRhrNKtLoQxzoUX7W52.hEB.Q6mEY.Ii2GBMobBZimWwEaL.j1S', 'student', 'ECE', '22A81A04C0', '9392745610');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.09, 8.77, 8.69, 7.94, 7.7, 8.26, 7.74, 7.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('RAYI MAHESH SURYA', '22a81a04c2@sves.org.in', '$2y$12$jBBdK0FXuXqGiKl7345mIOGOUtiWSKHPWWO0J5Z4BMFQtg4HHbPsy', 'student', 'ECE', '22A81A04C2', '8374111134');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.79, 8.15, 8.08, 7.65, 7.56, 7.88, 7.67, 7.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SATTI MADHU SUDHANA REDDY', '22a81a04c4@sves.org.in', '$2y$12$1GBXN4mBjjF.YnxZv.t1ruF692Deb0wXwiA.TcGmqm0TA1fBqOP7G', 'student', 'ECE', '22A81A04C4', '7382287989');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.78, 9.38, 9.23, 8.9, 8.37, 8.88, 8.61, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SUNKAVALLI SUSMITHA', '22a81a04c7@sves.org.in', '$2y$12$YDSP8MhoVkVK0PLcmYuqGu8KsZI9bN4fNvDQ9nyPsOV3G7.GiSGn.', 'student', 'ECE', '22A81A04C7', '9390630155');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.53, 8.69, 8.77, 8.86, 8.19, 8.65, 8.54, 8.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('UNDAVALLI LAVANYA', '22a81a04c9@sves.org.in', '$2y$12$2W2ZPmMGRfk853mLJLMxDulyLJzMQM1FXpiShgdFgRbmvKse0Neem', 'student', 'ECE', '22A81A04C9', '6301860398');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.26, 8.54, 8.62, 7.94, 8.05, 8.65, 8.39, 7.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('UPPALA MANASA LAKSHMI', '22a81a04d0@sves.org.in', '$2y$12$.yNf.W1dG1UgPc8Vo8PhkOrb.LTjOZnpDBYbzrBbH7f/WqZCNp4Mq', 'student', 'ECE', '22A81A04D0', '9346385909');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.36, 8.85, 8.92, 8.14, 8.26, 8.39, 8.33, 7.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BATCHA HEMANTH', '22a81a04d7@sves.org.in', '$2y$12$yUlGbhTZga80d27CVNidlezsO/Jf27oQVNp7h.ZpVclnGWPnAa0ze', 'student', 'ECE', '22A81A04D7', '9392033204');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.97, 7.92, 8.23, 8.1, 7.98, 8.54, 7.74, 7.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BOKKA SAI MOULIKA', '22a81a04d9@sves.org.in', '$2y$12$GHisJ7RDqOL17o9mzCdfKuLLEkSbh/Ng01iD7uERgmUoAkIEqMHBy', 'student', 'ECE', '22A81A04D9', '8328201279');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.28, 7.54, 6.92, 7.57, 7.19, 7.74, 7.26, 6.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BOLLIPO AMMULU', '22a81a04e0@sves.org.in', '$2y$12$8SeszrWlm5U9TAQaicv6DeN1XwIa5z7hGL4EP/pG3NXBHwhtlHK5C', 'student', 'ECE', '22A81A04E0', '8977434605');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.85, 8.85, 8.38, 9.06, 8.88, 9.3, 9.02, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BORA ASHOK', '22a81a04e1@sves.org.in', '$2y$12$0euYYbmSh.3gynUfNwbnP.PW4XQh7zahm3arvW7RgFYsRdiwb7dmC', 'student', 'ECE', '22A81A04E1', '8247640537');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.42, 7.38, 7.38, 7.75, 7.14, 7.95, 6.91, 7.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHILAKA TIRUMALA BHASKAR', '22a81a04e4@sves.org.in', '$2y$12$2e7WsLJYiWn6rfLFaALfXu5JihqvtW5HJcGAptgVTScAiYOLOViY2', 'student', 'ECE', '22A81A04E4', '6281683818');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.39, 7.08, 7.38, 7.49, 6.91, 8.02, 7.74, 7.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DARABOENA UMA SATYA KUMARI', '22a81a04e5@sves.org.in', '$2y$12$kMPrsrbBU.6Rd0aBNrRdFO85GxvhB5dxDpn7OxJynoNEJ.lvxG4hK', 'student', 'ECE', '22A81A04E5', '8688175988');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.62, 9.23, 8.62, 8.78, 8.12, 8.81, 9.02, 7.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('EDUPALLI HEMA', '22a81a04e7@sves.org.in', '$2y$12$uxWHtNS0pmOtzKQsM5.deeGmueGCgCnJPiWIdgZVrwv6UMJ4yzeyW', 'student', 'ECE', '22A81A04E7', '7815859148');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.89, 9.23, 9.62, 9.18, 8.33, 9.02, 8.88, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GADI SUSHMA', '22a81a04e8@sves.org.in', '$2y$12$JtCiMAUUqkHzca6dDVDDqeGyNUf002pYTcVZRaIAb0HimbYI.qcHm', 'student', 'ECE', '22A81A04E8', '7032942353');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.33, 8.62, 7.69, 8.57, 7.6, 9.09, 8.74, 7.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GANTA MANIKANTA VENKATA SATYA GANESH', '22a81a04e9@sves.org.in', '$2y$12$nd7GyxHu7Xv0StO/NZkcKuS7qaRgLIWFJ7y8AJmIGzNbWeXVe9ge2', 'student', 'ECE', '22A81A04E9', '7893791378');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.84, 7.92, 8.0, 7.86, 7.19, 8.02, 8.16, 7.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GOLLAPALLI AISHWARYA', '22a81a04f0@sves.org.in', '$2y$12$CFHyzDrOXst5JuXsjUIaaefrwS5yQ/GN1ehHj3Nib2.BBs3ySIppy', 'student', 'ECE', '22A81A04F0', '9346762049');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.92, 8.23, 7.54, 7.55, 7.53, 8.44, 8.19, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUBBALA YAMINI', '22a81a04f1@sves.org.in', '$2y$12$e6LxcPozf9CJM30hI6grB.oThbkn/oMQv4mFha6xQq1c3ptdam8Uu', 'student', 'ECE', '22A81A04F1', '9502624264');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8, 7.77, 7.69, 7.94, 7.47, 8.72, 8.67, 7.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUDALA GANESH', '22a81a04f2@sves.org.in', '$2y$12$wKLscT4MJT9vzldDuzkM4OygJ5uzZlaobb00bbHmDlW9D.E6PPeUW', 'student', 'ECE', '22A81A04F2', '9951699635');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.53, 9.0, 8.77, 8.59, 8.19, 9.16, 8.54, 7.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUNDAY SUKUMAR', '22a81a04f4@sves.org.in', '$2y$12$26i2RFhia7ZkilMVGs1rIebJrNHs3OOOwMw0OxGQS2GA.gbA95waO', 'student', 'ECE', '22A81A04F4', '8688780887');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.34, 9.23, 8.54, 8.35, 8.05, 8.46, 7.91, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KARANAM SANTHA KUMARI', '22a81a04f6@sves.org.in', '$2y$12$m8SEH4twCgXKFX7yOcdJS.xvS9YmKQqCFA3eD9bAKXOSr/gn6ppE.', 'student', 'ECE', '22A81A04F6', '7093776366');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.28, 9.23, 8.77, 7.9, 7.33, 8.46, 8.61, 7.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KATAM LILLY GRACE', '22a81a04f8@sves.org.in', '$2y$12$lObYJECVlA9SfvU9pjg2H..kQk9mSHx7IZMqJHwMl69jjeljfUAci', 'student', 'ECE', '22A81A04F8', '8247751755');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.2, 8.31, 8.46, 8.39, 7.49, 8.67, 8.12, 7.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KATTUNGA LASYA SREE', '22a81a04f9@sves.org.in', '$2y$12$wZvpvdFIR9mnNW459VLbvOa6j.AVNpLHhjeX4Q03df/ckut3CO8OK', 'student', 'ECE', '22A81A04F9', '9014517749');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.79, 9.46, 8.54, 8.71, 8.23, 9.16, 8.74, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOMMURI UMA DEVI', '22a81a04g1@sves.org.in', '$2y$12$x14AjoNi1DR89nYlKDWgPOYxkRSa2lhos2QQwJt2tHhvtOUQXB.am', 'student', 'ECE', '22A81A04G1', '7093156913');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.38, 8.77, 8.46, 8.02, 7.81, 8.81, 8.58, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KONDROTHU CHANDRASHEKHAR', '22a81a04g3@sves.org.in', '$2y$12$k8coe37CYVXl9H9tdZevKec/mSLKVCvAF4nyP7NSxcgK2Wb.VFV02', 'student', 'ECE', '22A81A04G3', '9391040510');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.55, 8.69, 8.92, 8.49, 8.61, 9.3, 8.19, 7.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOTIPALLI IKYATA', '22a81a04g5@sves.org.in', '$2y$12$K2CsxTh1kCW01VoT6kGW4uLLn2bNX8wynchKs82rnocMXT9we/.8O', 'student', 'ECE', '22A81A04G5', '8121226375');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.34, 9.23, 8.85, 8.33, 7.49, 8.54, 8.46, 7.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MATURI R S S BHASKARA GUPTA', '22a81a04g6@sves.org.in', '$2y$12$nSZTm/ZFvrCDCabkByVAIOmcUSKI23z0L7yWl8HyH1DPZ0cNANJa2', 'student', 'ECE', '22A81A04G6', '9398193636');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.13, 8.38, 8.69, 7.8, 7.42, 8.26, 8.33, 8.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MADDIPATI DEVI PRASANNA', '22a81a04g7@sves.org.in', '$2y$12$tx3LwZ8N90mBmumljXTTrue3GlLvnwiAbjftMseb.4PnZOHgBM6Oi', 'student', 'ECE', '22A81A04G7', '6303036303');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.36, 8.92, 8.08, 8.29, 7.19, 9.14, 8.88, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MAMIDI KIRANMAYI', '22a81a04g8@sves.org.in', '$2y$12$Sak55U6e0hb8Cx85Z3O0Ie3BKwVN1WWUj2MUawg1ZxWLo7H67NdDO', 'student', 'ECE', '22A81A04G8', '9492579433');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.43, 8.69, 8.46, 8.31, 7.98, 8.67, 8.81, 8.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MANNEM SAI GOPI', '22a81a04g9@sves.org.in', '$2y$12$pmZmj936iAHCR8OoR2Nda.l1CH5AXq/JOZLwAhrl1/EqIW3SioMfy', 'student', 'ECE', '22A81A04G9', '6304104836');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.11, 8.31, 8.08, 7.8, 7.98, 8.16, 8.33, 8.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NALLAMILLI SRI MAHALAKSHMI', '22a81a04h4@sves.org.in', '$2y$12$ShbtRCGLozVV53DGRepI9.y4d4cj.aAC6z/WHrsDpWEm2kVvAWon2', 'student', 'ECE', '22A81A04H4', '8500456827');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.32, 8.85, 8.08, 7.92, 8.19, 8.95, 8.67, 7.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PYDIKONDALA SUSHMA', '22a81a04h9@sves.org.in', '$2y$12$bpuaTU/cVzTRnMi63Zv1suEOdp.OYBsrsFNqlZ6XtamkN8LEgI4gW', 'student', 'ECE', '22A81A04H9', '7780296635');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.01, 8.62, 8.54, 7.86, 7.56, 8.67, 7.98, 7.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('RANGISETTI KARTHIK', '22a81a04i0@sves.org.in', '$2y$12$a3rBzVF4PXDThnt9TEayk.l9gN7puwkUnZNY1f1MkMIcYAD1fKcn.', 'student', 'ECE', '22A81A04I0', '7799228593');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.75, 8.15, 7.92, 7.57, 6.91, 7.77, 7.98, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SANKU SWATHI', '22a81a04i2@sves.org.in', '$2y$12$QdbJhHDrkDTML3zPMDWaveL4VYxpxU4lkFNNML/r9sL1SeTa9kVFC', 'student', 'ECE', '22A81A04I2', '9182866711');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.07, 9.08, 8.38, 8.25, 7.47, 8.19, 7.98, 7.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('UNDRAJAVARAPU VALLIKA', '22a81a04i4@sves.org.in', '$2y$12$MLfWu7Mq2nWyfe3oO.4.re02dTX5MA/8nmwGdcO5cIyVA018pAiYq', 'student', 'ECE', '22A81A04I4', '7780427917');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.72, 8.0, 6.85, 7.53, 7.47, 8.54, 7.91, 7.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VADAPALLI JOHNDAVID', '22a81a04i5@sves.org.in', '$2y$12$1PjwV4YSImegXlYTH.HSo.O8fHM2LbQvclbQ7rkDwLnsZG9JMzuwW', 'student', 'ECE', '22A81A04I5', '9392225365');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.74, 9.69, 8.85, 8.98, 8.39, 9.16, 8.23, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VATTIKUTI SATYA PUJASRI', '22a81a04i7@sves.org.in', '$2y$12$ghHE0qIi/0W9T.j.Hscoae5iYlsE6KLW9MPnLDej7mSg35J131uWu', 'student', 'ECE', '22A81A04I7', '7386740744');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.38, 8.85, 8.54, 8.43, 7.98, 8.81, 8.12, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VELAGANA VARA SINGA LAKSHMI', '22a81a04i8@sves.org.in', '$2y$12$wuyGgguyYwrXb2jQ80LLoOB0rozPoT3RJgTQpbL4iHeagHkzkUyW6', 'student', 'ECE', '22A81A04I8', '9989152327');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.43, 9.23, 8.23, 8.02, 7.98, 8.81, 8.54, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('YANDAMURI HIMA ESWAR', '22a81a04i9@sves.org.in', '$2y$12$HocdWR3BGVc4YxYP5yrm9Oqvst3UVyHsu9XOdbyrnLhtRdow7EoL2', 'student', 'ECE', '22A81A04I9', '9705365085');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.66, 9.15, 8.46, 9.14, 7.7, 9.3, 8.51, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHAVAKULA DUMBESH', '23a85a0403@sves.org.in', '$2y$12$7Su/qTVy2BRWQ/3xfVvdweGUJID/YkPElhQ.2lGwKpvchobZoKvXC', 'student', 'ECE', '23A85A0403', '9502606788');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.09, NULL, NULL, 8.2, 8.12, 8.61, 8.19, 7.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GRANDHI MOHAN KUMAR', '23a85a0406@sves.org.in', '$2y$12$AEdSUb/ZpB5C8cAwK7CuSeUXRqqsUV1CO3jVs5VeoR7tgP10DHjXi', 'student', 'ECE', '23A85A0406', '7207276683');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.78, NULL, NULL, 8.65, 9.02, 9.44, 8.74, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PITANI SAPTAGIRI', '23a85a0407@sves.org.in', '$2y$12$gAYBjgHAEV.RvFToh9eW9.PS1BoW/axlJ98gyX1wKJVtvb/LDnDzC', 'student', 'ECE', '23A85A0407', '7893055149');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.11, NULL, NULL, 8.02, 7.7, 9.16, 8.39, 7.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SATTI HEMANTH SRI ADHINARAYANA REDDY', '23a85a0408@sves.org.in', '$2y$12$1Qao8gyRETFy9Z7IyERqJuHuBabtiEnjCEgCaUQabLI38sHEgN.pq', 'student', 'ECE', '23A85A0408', '9347299578');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.82, NULL, NULL, 7.47, 7.63, 8.3, 8.12, 7.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SEEPANI PAVAN KARTHIK', '23a85a0409@sves.org.in', '$2y$12$ah4DUoJaP2ClF59ipIXcBuDxDXGL3sj5QDfMkxF0AAZr9ebkW7UMS', 'student', 'ECE', '23A85A0409', '9247442925');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.34, NULL, NULL, 8.29, 8.46, 9.02, 8.33, 7.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('IRAPU NAVYA SREE', '23a85a0411@sves.org.in', '$2y$12$y.jmpLQn/JKVsbqb0dIBIuUmt3lBFlquBeSkBDk/hU8bh.9BIpD12', 'student', 'ECE', '23A85A0411', '9490424676');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.65, NULL, NULL, 7.53, 7.4, 8.44, 7.67, 7.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NAIDU HARIKA SRI', '23a85a0412@sves.org.in', '$2y$12$6v0jycGXSZXEz86hLCfvj.0auxsb2ZSI/e2TuLYktCk6DuSb4X3rK', 'student', 'ECE', '23A85A0412', '9392519363');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.89, NULL, NULL, 7.86, 7.95, 8.81, 7.74, 7.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PASUPULETI UMA DURGA NAVYA SRI', '23a85a0413@sves.org.in', '$2y$12$jCs3NmSNHN6bGHVGR0sh6ebQLqbXuxzsD28QioS/zmaz6QFFmmYHy', 'student', 'ECE', '23A85A0413', '9346880519');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.32, NULL, NULL, 8.33, 8.09, 9.02, 8.58, 7.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PATHURI ANJALI', '23a85a0414@sves.org.in', '$2y$12$idfvGX/dpDAIZlOGtAmNHOxL0WsOqNQYSSofzLn/YSYz.QJhrt9nu', 'student', 'ECE', '23A85A0414', '9391742802');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.81, NULL, NULL, 8.06, 7.42, 8.33, 7.95, 7.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VARI HEMA SRI DURGA', '23a85a0415@sves.org.in', '$2y$12$kcZx7gPzbIUbv0FlEiB6wusqpLVBAq1qQZsbQn2jLovUm1kM/J4HW', 'student', 'ECE', '23A85A0415', '8688369521');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8, NULL, NULL, 8.0, 7.81, 9.02, 8.3, 6.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BOKKA RAJESH', '23a85a0416@sves.org.in', '$2y$12$FWdAN6NSkhbj0u3whHht6uj27dn0zs8GelR6GXv8dCUrBmWEzk.Qm', 'student', 'ECE', '23A85A0416', '7989425043');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.27, NULL, NULL, 8.47, 8.12, 8.81, 8.46, 7.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GADI PAVAN MANIKANTA KUMAR', '23a85a0418@sves.org.in', '$2y$12$vqzkhZoK6o7LCwl8NXiizuw9GrJ6G4I9.of.T2e8.t30wT1UYNTmC', 'student', 'ECE', '23A85A0418', '7995113027');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.3, NULL, NULL, 8.37, 8.33, 8.67, 8.26, 7.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUTTA JYOTHIKA', '23a85a0419@sves.org.in', '$2y$12$1MnA9K1dr38fEW0GwOYN8u6eUF3qyHiORl7tnzLg93EByrwhuc4jm', 'student', 'ECE', '23A85A0419', '9381852551');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.86, NULL, NULL, 7.47, 7.53, 8.51, 8.12, 7.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('LOKAVARAPU VISHNU VARDHAN', '23a85a0420@sves.org.in', '$2y$12$xTT6nndmKKEk188I.GMVAeUacWYOZPR5eABsQV75qCTwbC82l7gla', 'student', 'ECE', '23A85A0420', '9381093539');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.57, NULL, NULL, 8.75, 8.46, 8.88, 8.54, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MAGANTI ANITHA', '23a85a0421@sves.org.in', '$2y$12$0kCnEx20/m.4Al6Qqo3Fb.L2EuE23jELLgI3ORCKLweDG6XxDPnw.', 'student', 'ECE', '23A85A0421', '7416956352');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.86, NULL, NULL, 7.39, 7.07, 8.74, 8.19, 7.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MAMILLAPALLI LOKESH', '23a85a0422@sves.org.in', '$2y$12$mDBvIQm44XivrO0aZn.wJuB4OKBfYQXuQOuiBlscPpFfTpy0J4wZq', 'student', 'ECE', '23A85A0422', '7674044571');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.48, NULL, NULL, 8.33, 8.65, 8.95, 8.61, 7.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MARADANI LOKESH', '23a85a0423@sves.org.in', '$2y$12$fJnVW2EDOGS94wMWn9Kn1.pRl3ww0ILDo/hOu/qbtK5miUekTTCpi', 'student', 'ECE', '23A85A0423', '7569939852');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.68, NULL, NULL, 7.57, 7.28, 8.3, 8.12, 7.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MEESALA LOKESH PAVAN SEETHAYYA NAIDU', '23a85a0424@sves.org.in', '$2y$12$qxnveybUgWqd5SZTifUppe7yPRqXKAWma41.fpdVmw2VezUIed.OO', 'student', 'ECE', '23A85A0424', '8686965700');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.34, NULL, NULL, 8.18, 8.46, 8.74, 8.33, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MOTUPALLI SANTHOSH KUMAR', '23a85a0425@sves.org.in', '$2y$12$uia23TriCndJlI24Bzu6DeghVM3JK8VOQW7xQVBzweok/EEIfufAi', 'student', 'ECE', '23A85A0425', '9866397585');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.81, NULL, NULL, 8.08, 7.4, 8.09, 8.39, 7.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ROUTHU VENKATA SAI DURGA', '23a85a0428@sves.org.in', '$2y$12$UO.Q2gWVF8FinjURhLw2VejcCvxOxbE8rPyFgzPRoafC6bEABSk3G', 'student', 'ECE', '23A85A0428', '6301302278');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.89, NULL, NULL, 7.57, 7.77, 8.51, 8.26, 7.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SHAIK SAYYAD BAJI', '23a85a0429@sves.org.in', '$2y$12$G1BGwRFebm.6cpv2W8Mt0.9qcbFinLT8eNunP5PbjYGvdKsXK8TMu', 'student', 'ECE', '23A85A0429', '9491475673');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.16, NULL, NULL, 8.45, 8.05, 8.81, 8.16, 7.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BOMMAGANI KRISHNA PAVANI', '22a81a0205@sves.org.in', '$2y$12$ajjXMDyYAXWqeuCYdjzUj.y12LDiUJ3.r/aLakIV4fretm0HhLIAG', 'student', 'EEE', '22A81A0205', '7569631892');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.44, 7.62, 6.69, 7.49, 7.07, 7.95, 7.63, 7.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DASARI TRIVYANJALI', '22a81a0208@sves.org.in', '$2y$12$SSvPk460wsxyno0xtF3XXOhNL8dF5z/cpHlBJDugZFHDUpy1JqSjK', 'student', 'EEE', '22A81A0208', '7842523239');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.25, 8.62, 8.62, 8.29, 7.63, 8.33, 8.33, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DONDAPATI MAHIDHAR', '22a81a0210@sves.org.in', '$2y$12$PATNAuJXEu/Xri30uBJyLu/Vu2vQf6lLCk/YoGCv7/NKAjwmHgCl2', 'student', 'EEE', '22A81A0210', '9491898776');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.46, 7.77, 7.62, 7.88, 7.0, 7.47, 7.14, 7.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GADUGOYILA GEETHA SANTHOSHINI', '22a81a0212@sves.org.in', '$2y$12$fJZswFqaMshiZ9s8UvhpCeo1GtvDqmWxgq5A5IXzb.qghZKIFweLO', 'student', 'EEE', '22A81A0212', '7675059094');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.42, 9.15, 8.46, 7.94, 7.98, 8.79, 8.61, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOLA ANJALI DEVI', '22a81a0219@sves.org.in', '$2y$12$9TtvaTgW/7L3x.4zFEy2EeCrLVIieGJ7/rK5KAwiCjzqef7oUOxB2', 'student', 'EEE', '22A81A0219', '9848804574');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.53, 8.31, 6.77, 7.22, 7.07, 7.86, 7.81, 7.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KURAM MOUNIKA', '22a81a0223@sves.org.in', '$2y$12$mtcrph18E5PGsKjHgLHu/u.U6y0NAa1jVjpTttYFe6mI8RirhExg6', 'student', 'EEE', '22A81A0223', '7989589925');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.17, 8.54, 7.69, 8.35, 7.56, 8.16, 8.67, 8.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MACHAGANTI ANUSHA', '22a81a0225@sves.org.in', '$2y$12$Pj5lC1np3nB/O92AfeKeM.D5ic6Sz7TMa3MgYtDhz5bFMGrHUyJKu', 'student', 'EEE', '22A81A0225', '8977087257');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.61, 8.85, 8.38, 8.53, 8.05, 8.42, 8.93, 9.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PUROHIT KUSHUBU', '22a81a0238@sves.org.in', '$2y$12$OueEnBbyIdv4N63lVnC59.Hm5/LgN6oDbpjk.B1OYKtGQjcvXIpPK', 'student', 'EEE', '22A81A0238', '8317619479');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.53, 7.92, 7.08, 7.23, 7.35, 7.51, 7.84, 7.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ROWTHU KUMARI NAGA SAI DHANA LAKSHMI', '22a81a0240@sves.org.in', '$2y$12$KuyMeRqDRaXAsdehXAaurOZ4dwZeUWVO1Ty4pVqnnISWKvBS1Okiq', 'student', 'EEE', '22A81A0240', '7794905377');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.64, 7.38, 7.62, 7.39, 6.93, 7.7, 8.39, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('AMBATI SHARON KUMAR', '22a81a0246@sves.org.in', '$2y$12$Tb8dHDNGNhcpS.1l7RMYWOC708wDj/XgXUer8tQU8NRvYfPLLIkjC', 'student', 'EEE', '22A81A0246', '8328168181');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.04, 7.0, 6.62, 6.72, 6.63, 7.63, 7.05, 7.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('AVISETTI SAI SATYA SRI', '22a81a0248@sves.org.in', '$2y$12$uZFmMOibMFZ45SDjYKohaOaBW5JruNQvGVyHo5kOHb7CHGJYd/zb.', 'student', 'EEE', '22A81A0248', '8008904712');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.34, 8.23, 7.77, 8.47, 7.91, 8.33, 8.88, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BODDU ASRITHA RANGA VAISHNAVI', '22a81a0249@sves.org.in', '$2y$12$5gGf1PbQ/z/tFz5LNrSC7e4oE3Cc5oArKGCpPMXFYcmiKS6olBWde', 'student', 'EEE', '22A81A0249', '6305777495');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.41, 8.69, 8.31, 8.16, 7.77, 8.46, 8.74, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BOLLA HARISHMA PADMAJA', '22a81a0250@sves.org.in', '$2y$12$Kw2mwGm55ggP8R3VSsmWTORm3h3EEJlIl68RIXIg8y7d6RuDuGYGe', 'student', 'EEE', '22A81A0250', '9550696158');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.29, 7.46, 6.92, 7.33, 6.93, 7.35, 7.7, 7.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KANCHARLA DINESH', '22a81a0259@sves.org.in', '$2y$12$1FZ0lTP4Wjugzm4iepMeGes78x/liHhb8iL2MEmlzFLVnsPsCRlwq', 'student', 'EEE', '22A81A0259', '8688926896');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.49, 9.38, 8.62, 7.31, 6.49, 7.14, 6.86, 7.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KODURI HARSHITHA', '22a81a0264@sves.org.in', '$2y$12$hycnM2MM3RptvUDWs1MIxuIsH//wBJpjbgXOqz.es3XIFRs/6Nm/a', 'student', 'EEE', '22A81A0264', '6305312585');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.78, 8.08, 7.38, 7.43, 7.49, 7.77, 8.12, 8.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOLLEPARA VASAVI RATNA SRILEKHA', '22a81a0265@sves.org.in', '$2y$12$FOlWsT.CD2nJt.yy54NLLONh9f6vFn/0/hOtWlymfVMTIron9eSpe', 'student', 'EEE', '22A81A0265', '9949973741');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.56, 8.69, 8.31, 8.35, 8.12, 8.61, 9.02, 8.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOTTALA PAVAN KUMAR', '22a81a0267@sves.org.in', '$2y$12$P1ouN/xahZdZ9.Bvclz0Mu8xACkp8L4nTKNJrsQjIoq/Lyfnek1Ba', 'student', 'EEE', '22A81A0267', '9100878904');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.64, 8.69, 7.92, 7.47, 7.21, 7.07, 7.49, 7.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MALLABATHULA PAVANI', '22a81a0271@sves.org.in', '$2y$12$WAQptAPTPBOzVQE4ihPXluL5VnP/4qpUNNPh4lH/Hkpfi.vvlIfES', 'student', 'EEE', '22A81A0271', '9121645169');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.85, 7.77, 7.31, 7.77, 7.7, 7.91, 7.98, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('METLA UDAYKIRAN', '22a81a0273@sves.org.in', '$2y$12$HQaFK6g46BdXbXvBl.JRfezKf.TwgCXNABzQ0vRqL31vjSjNnSbpW', 'student', 'EEE', '22A81A0273', '8639620930');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.95, 9.31, 8.62, 8.22, 7.49, 7.42, 7.07, 7.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MIRIYALA BOBBY', '22a81a0274@sves.org.in', '$2y$12$gqeF.axB1enmE.icNjGrL.uKUD06pbNUoQXJA9pqILO9E77VIvA7K', 'student', 'EEE', '22A81A0274', '9676010869');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.8, 8.62, 7.62, 7.45, 6.86, 7.56, 8.39, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NULI VASAVI NAGA SRI VARSHINI', '22a81a0276@sves.org.in', '$2y$12$E85p7sTXeJyYsHcS3DBUAuot6Fn1559ZBpK.oLgytAgjzBb0/BeZS', 'student', 'EEE', '22A81A0276', '7396671393');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.61, 8.62, 8.38, 8.69, 8.19, 8.61, 8.88, 8.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('POLINATI BINDU SRI', '22a81a0278@sves.org.in', '$2y$12$OrGwjn57.iAxZVLwcHbQWu/ULooaYK8WKWPEWBqn1ezi8HiWUl15C', 'student', 'EEE', '22A81A0278', '7013553595');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.58, 8.77, 8.0, 8.49, 8.33, 8.46, 9.02, 8.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('RATALA VIRAJALA MEENA KUMARI', '22a81a0283@sves.org.in', '$2y$12$Ssi17Fr5uzvYFSqQsAh6Eehne3UUVQksD6Y3SnycgEo4sXfMmNMNW', 'student', 'EEE', '22A81A0283', '9392372260');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.29, 8.15, 8.62, 8.35, 7.77, 7.77, 8.65, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('RAGU PUJITHA', '22a81a0284@sves.org.in', '$2y$12$y/lh.ZNQhlX4yYVPChE6z.gMjd.VI/V7d9S289wuxxgoRjEm2OxrS', 'student', 'EEE', '22A81A0284', '9392857046');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.86, 8.0, 7.23, 7.77, 7.35, 8.05, 8.12, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VALLEPALLI PAVAN KUMAR', '22a81a0287@sves.org.in', '$2y$12$G8eCJco0V2RntDD3iNHDrOEW6Ex7/oxqIyz7CuF9gi/XCsIcRVgVm', 'student', 'EEE', '22A81A0287', '9392623327');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.59, 7.69, 7.08, 7.84, 7.0, 7.84, 7.72, 7.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BANDILA LEELA VINODINI', '23a85a0201@sves.org.in', '$2y$12$1Uw99sbPDMFk6NNFzOygE.3Vn3l7nzPc9Ahs635KftGXGhlzL3nHS', 'student', 'EEE', '23A85A0201', '8121696433');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.18, NULL, NULL, 8.0, 8.05, 8.37, 8.67, 7.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KANDULA GOVARDHAN', '23a85a0204@sves.org.in', '$2y$12$M.WLvOsLdzvUhMxBy3y2bOlc/UwJwCZia6M/mtasDBd.dHw3gbha2', 'student', 'EEE', '23A85A0204', '9063378454');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.11, NULL, NULL, 7.84, 7.56, 8.3, 8.61, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOLUPURI SANTHOSHA KUMARI', '23a85a0213@sves.org.in', '$2y$12$YW7BRzTCs8Se9LlfoxvwquMIZVw1r23yIIrNTZ42dx5.OJk5pLuyG', 'student', 'EEE', '23A85A0213', '7095482993');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.16, NULL, NULL, 8.1, 7.91, 8.19, 8.23, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MARISETTI MOHAN SATYA MANIDEEP', '23a85a0215@sves.org.in', '$2y$12$VBHAIoHlzaFJKy0B3k/xn.778t9hmQdH7DcW6Qler.FjeZ1/1mmSK', 'student', 'EEE', '23A85A0215', '6304348087');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.14, NULL, NULL, 8.0, 8.05, 7.84, 8.67, 8.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TELU KRISHNA PAVAN', '23a85a0216@sves.org.in', '$2y$12$C8f64geIGlmFdiOZ/ZdtP.596hjY.hZJMI4949KFTTC6Og8/cBNiq', 'student', 'EEE', '23A85A0216', '8309966933');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.86, NULL, NULL, 7.77, 7.35, 7.91, 8.95, 7.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TIRUMALAREDDY NAVYA SRI', '23a85a0217@sves.org.in', '$2y$12$g5hQuSIU6A653HCaS5Jx0eXOduYn7JHbtlFlLAOUMRcY78umhRhG2', 'student', 'EEE', '23A85A0217', '6301448855');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.51, NULL, NULL, 8.22, 8.05, 8.61, 9.02, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VAMISETTI DHARMENDRA SIVA SAI', '23a85a0218@sves.org.in', '$2y$12$mpH0pH9j/ymg0Y2dyUgu4.GzPJkEDT1T13RuN3F8trtyjfSft4TIS', 'student', 'EEE', '23A85A0218', '9490670706');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.05, NULL, NULL, 7.82, 7.77, 7.98, 8.16, 8.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ADAPA KIRAN KUMAR', '22a81a0301@sves.org.in', '$2y$12$SffK.gj9sq7mqzDwNgUqju3COSAnSv55VkHBzlElbgIOAGfMKW5MO', 'student', 'ME', '22A81A0301', '6303126759');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 6.91, 7.0, 6.62, 6.65, 6.56, 7.09, 7.56, 6.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ADDAGARLA VENKATESH', '22a81a0302@sves.org.in', '$2y$12$7DUKxQ8zTyrUhqfFGc8HcupjbMG7umQFuOYg21pGqr/8avQi.PPRu', 'student', 'ME', '22A81A0302', '7995358981');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.43, 8.92, 8.08, 8.29, 8.26, 8.56, 8.88, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BANDULA DEVENDRA', '22a81a0306@sves.org.in', '$2y$12$6f9dsVcIVrTBDuzDJ1SLruyq.oepJAnqNOZi.pWJ1Ov8HZBntBv8q', 'student', 'ME', '22A81A0306', '9666606135');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.37, 7.85, 7.38, 7.06, 7.23, 7.91, 7.07, 7.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHELLAMSETTI T V V N SAI PAVAN GANESH', '22a81a0309@sves.org.in', '$2y$12$siY4Fd9c02DL/Dy.9qCygOHiv0F2IUE8/X8qyd7ETJKAn7YxvLBvC', 'student', 'ME', '22A81A0309', '9907983333');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.62, 8.85, 7.38, 7.47, 7.4, 7.65, 7.6, 7.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GANTEDA PRAVEEN KUMAR', '22a81a0316@sves.org.in', '$2y$12$TAdns9myQeT74vnJyjePfOd937.s3wcvdrbyKdrg0jb6v/yV363eG', 'student', 'ME', '22A81A0316', '7780416830');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.45, 9.08, 8.69, 8.41, 8.42, 8.46, 8.74, 7.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GATTIM SRI NAGA AYYAPPA', '22a81a0318@sves.org.in', '$2y$12$1D/kZxzT9uC5wjj2CBv8aeC3g5Zn4T53ImAgkajV7PIL6qkYfZ1zi', 'student', 'ME', '22A81A0318', '9959382191');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.51, 7.23, 7.62, 7.18, 7.56, 7.84, 7.84, 7.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GOPISETTI ANANTH LAKSHMI KUMAR', '22a81a0320@sves.org.in', '$2y$12$5PeEGf8tnctBKah0xZCMeO5u5Q6GIQU8VSTxzvgGNXhCubQWbwkbq', 'student', 'ME', '22A81A0320', '7013470235');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.09, 9.38, 9.69, 8.82, 9.23, 9.3, 8.88, 8.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KARRI ROHITH REDDY', '22a81a0326@sves.org.in', '$2y$12$nKzFeum680TewRVLBlkJfuSgQQNxlZ.6FOwxUnVLnbt6IJ0xUH9rS', 'student', 'ME', '22A81A0326', '9959157018');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.54, 7.92, 7.38, 7.12, 7.47, 7.19, 8.3, 7.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KODURI PHANI VENKATA KUMAR', '22a81a0329@sves.org.in', '$2y$12$q4.KK.1pgmmo7bSZ2Nr8mO7RebYDf3bJCaEZwpFl6bdz3CXVXV.b2', 'student', 'ME', '22A81A0329', '9014387928');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.33, 9.0, 8.08, 7.88, 8.26, 8.54, 8.44, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PALAKALURI TARUN KUMAR', '22a81a0347@sves.org.in', '$2y$12$IWsu75rPTQe1jhydZ2PR7e5WK99rQyFwITuEsuiblA5fWnWZq92d2', 'student', 'ME', '22A81A0347', '9705865237');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.12, 6.92, 6.85, 6.96, 7.19, 7.35, 7.33, 7.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PYDIMUKKULA PULLA RAO', '22a81a0353@sves.org.in', '$2y$12$mpHacP0HP.NoU2lQI3WBF.X5fasQaQ9aaAh2HRlTUK5ffPdpeGNgS', 'student', 'ME', '22A81A0353', '9618720497');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.33, 7.08, 7.0, 7.65, 7.19, 7.35, 7.74, 7.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SARIDE VIGNESWARA RAO', '22a81a0355@sves.org.in', '$2y$12$aixbllSSHcyMbJ4XinU4TuecOsKCl2ZPNx5LNFicihY34kwVLjKgm', 'student', 'ME', '22A81A0355', '9182268681');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.71, 9.08, 8.46, 8.59, 8.61, 9.14, 8.88, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('THORAM RAMA LAKSHMAN', '22a81a0360@sves.org.in', '$2y$12$hqPUDt4EgUVzrrnmVUY30.bC.iwGSUivLH6oqaxONsg6B0vqX92Ga', 'student', 'ME', '22A81A0360', '9676808216');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.95, 7.54, 7.15, 7.72, 8.09, 8.39, 8.67, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('YADLAPALLI SRI SAI VENKATA DURGA ESWAR', '23a85a0303@sves.org.in', '$2y$12$ykTz8rBFF0UB9iS1n5CJcOMqnqoe68eacBRX2da9AvGJhl1oIpGxW', 'student', 'ME', '23A85A0303', '6305769980');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.45, NULL, NULL, 7.25, 7.6, 7.26, 7.91, 7.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHIKKA SOHAN SATYA VARDHAN', '23a85a0304@sves.org.in', '$2y$12$/z5mtnC/k.InPaj5hGglVeSrO9LZ4lqyOYuVwa8ZtcGIV9nr/d3cq', 'student', 'ME', '23A85A0304', '9701565312');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.05, NULL, NULL, 8.18, 8.23, 8.44, 8.12, 7.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHIKKALA VIJAYA KUMAR', '23a85a0305@sves.org.in', '$2y$12$KUdb/vQgrZJIOYP45Cl8D.aYvcU0qAaqqoOFrYwRo6E6orraAqRyS', 'student', 'ME', '23A85A0305', '7893744131');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.15, NULL, NULL, 8.88, 8.79, 9.7, 9.3, 9.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GARIKIPATI CHANDU', '23a85a0307@sves.org.in', '$2y$12$tuUB5Chx9szFqNilP5.uDeXiQK79n7Rz3qbJQkfnylFvLuLaaH/RO', 'student', 'ME', '23A85A0307', '8185092634');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.83, NULL, NULL, 8.61, 8.86, 8.58, 9.07, 9.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GOLLAMANDALA KRUPAKAR', '23a85a0308@sves.org.in', '$2y$12$Fp1icpsgrjg5hyaQL5WTxejLWOKkt6yhN3ue.Ou2xd4ARqMp8eXQO', 'student', 'ME', '23A85A0308', '9121532016');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.31, NULL, NULL, 7.49, 7.33, 7.49, 7.4, 6.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VEERAMALLA MANIKANTA SAI DURGA NARAYANA', '23a85a0310@sves.org.in', '$2y$12$MKUs/Dmp04rj49.KSrTxAeA.iD4BiuE68ZYPczTDh0dmXriRQo7by', 'student', 'ME', '23A85A0310', '9392101094');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.16, NULL, NULL, 6.72, 6.77, 7.67, 7.49, 7.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUNDA SATYANARAYANA', '23a85a0311@sves.org.in', '$2y$12$zNPuMZAYSG6St3VnTFqVI.NmzPAfjSMRI.WK8ucsV4NPA8ULHRpqy', 'student', 'ME', '23A85A0311', '6301751110');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.8, NULL, NULL, 7.43, 7.74, 7.98, 8.39, 7.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('JAGALINKI HEMA SURYA VARDHAN', '23a85a0312@sves.org.in', '$2y$12$J4C0mdP8RQVMRIqqJmbHpuDNGfzdW8KT7pygkqtuNEWOxMs3c4Bk2', 'student', 'ME', '23A85A0312', '9390886869');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.44, NULL, NULL, 8.41, 8.46, 9.07, 8.74, 7.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('JALADHANI SRAVYA DURGA', '23a85a0313@sves.org.in', '$2y$12$dznWPIPEnLI4R5Sc5GGAuOpj2CaAkW26OdkbcOVb5SY5Zd.MnTDXy', 'student', 'ME', '23A85A0313', '9573578309');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.51, NULL, NULL, 8.35, 8.81, 8.79, 8.79, 7.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KATTA DURGA PRASAD', '23a85a0314@sves.org.in', '$2y$12$i82IHxQKJaUUx5WHw.dazO/17vPRw10Rx7ce/D4WQ9EPld50TTEja', 'student', 'ME', '23A85A0314', '7286947147');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.17, NULL, NULL, 7.23, 7.14, 7.74, 6.7, 7.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MADDIRALA ABHIRAM', '23a85a0315@sves.org.in', '$2y$12$iLIs2CpqjrjVor7sgI9S5ODpd8ZlXGRk9L.8VgdhKsNOJ9nRnhj9O', 'student', 'ME', '23A85A0315', '9391672823');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 6.83, NULL, NULL, 6.84, 7.12, 6.84, 6.7, 6.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MUNTA L V V S SUBRAHMANYAM', '23a85a0316@sves.org.in', '$2y$12$CpQYiC26DNX.SO1XM9GbcuT2MJdem6475vAKW782giL4dBjJV1V4m', 'student', 'ME', '23A85A0316', '9390417117');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.06, NULL, NULL, 8.18, 7.77, 9.28, 8.51, 6.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NUTANGI SANTHOSH', '23a85a0317@sves.org.in', '$2y$12$boUppfb2/SqYn8SoWk7ItegYx1KV0PRiSl3Skn7EqA7f3Dmp2dOhi', 'student', 'ME', '23A85A0317', '6281906246');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.51, NULL, NULL, 7.08, 7.23, 7.74, 7.98, 7.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NUTANGI SYAM BABU', '23a85a0318@sves.org.in', '$2y$12$tPX3dkPo086GLNimCdUgBeVmBqUwvbffTDkhLmhCLLwmSgESNyzMS', 'student', 'ME', '23A85A0318', '8519829419');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.25, NULL, NULL, 7.25, 6.95, 6.77, 7.63, 7.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('UBA RAVINDRA BABU', '23a85a0320@sves.org.in', '$2y$12$LMMthDgui1B92Zg2Ek198.lDTxSbQOM.XT3XX.sAvdUBAwyCeUgjG', 'student', 'ME', '23A85A0320', '9676939873');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.28, NULL, NULL, 7.35, 7.3, 7.65, 6.7, 7.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ADAPA JNANA CHANDRIKA', '22a81a0601@sves.org.in', '$2y$12$6uhnLJUMZzx.rBx1bDBEA.fcEBJkF4HxSZh5rbTdX6uUsYm9X7oTu', 'student', 'CST', '22A81A0601', '8639602234');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.94, 9.0, 7.92, 8.94, 9.16, 9.3, 9.44, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('AKULA HARI SREE', '22a81a0602@sves.org.in', '$2y$12$axyCj.SkroDQRtJpv1k5Hu.tFi8/COJ8mZ9puC9rs5kfDfsxGwCNS', 'student', 'CST', '22A81A0602', '9440132111');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.08, 9.38, 8.54, 9.06, 9.16, 9.72, 9.16, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BANDARU BHARGAVI', '22a81a0604@sves.org.in', '$2y$12$sVjphgOf3/l25FB2EVf12unUknoCOP63aWn7CG3yTOmDb7WdyuVoy', 'student', 'CST', '22A81A0604', '9381599420');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.51, 8.62, 8.08, 8.59, 8.88, 8.67, 8.61, 8.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BANGARU MOHAN RAO', '22a81a0605@sves.org.in', '$2y$12$U6iN2lHGGf8PqRiGjCPQr.UWT0A50sCJfRLmn77N2VM0mtyLlBdQ2', 'student', 'CST', '22A81A0605', '7075591109');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.05, 8.31, 7.62, 8.04, 8.16, 8.12, 8.39, 7.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BITRA PRAVALLIKA', '22a81a0606@sves.org.in', '$2y$12$W4j.0b7YLKLMdbCs5bvi9OEhbmWvKoMyYVm.sPu4YhSTaursVVcNy', 'student', 'CST', '22A81A0606', '8688118719');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.43, 8.31, 7.92, 8.23, 8.54, 8.37, 8.88, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHALLA YASASWI', '22a81a0609@sves.org.in', '$2y$12$RUiA9EnWgqRbf4VflpJkjOxsk6j7tjA12R88fNFw5j2WuQljMYwXS', 'student', 'CST', '22A81A0609', '7702782648');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.91, 9.62, 8.23, 9.06, 8.37, 9.16, 9.3, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DARISI VENKATA LAHARI', '22a81a0611@sves.org.in', '$2y$12$Jg4dCtipYr79XvcDxH/F7OvXhNR2bK2wxWrzh8AUwhnMu/uB8VrNS', 'student', 'CST', '22A81A0611', '9390980889');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.09, 9.38, 9.08, 9.1, 9.3, 9.16, 8.46, 9.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DOMMETI L S VASANTHI', '22a81a0613@sves.org.in', '$2y$12$iyhvdjrwGSeQeG2hCaCwxescbI7QFK5nYuC6XJ.X9ua9vaNxzPsvS', 'student', 'CST', '22A81A0613', '9701594369');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.98, 9.31, 8.62, 9.06, 8.88, 9.02, 8.81, 9.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('EDUPALLI LIKHITHA SAI', '22a81a0614@sves.org.in', '$2y$12$6oqYdFr13vWGIAhhk/jALOgNs5vziQsKK3ZJa3KokyYzjXfA.blnK', 'student', 'CST', '22A81A0614', '9346553146');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.74, 9.0, 8.38, 8.71, 8.93, 8.74, 8.74, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GANDHARAPU MOUNIKA', '22a81a0615@sves.org.in', '$2y$12$EfyIpEn8JMc8B8wEqH78T..70n6xlxVNsqzsACA7XnMJ3bf7a9lIS', 'student', 'CST', '22A81A0615', '9014670724');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.14, 8.46, 7.08, 8.29, 8.23, 8.05, 8.26, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GOTHAM SRI NAGA SIRISHA', '22a81a0616@sves.org.in', '$2y$12$lNOr8vVa.eRZkMK4wloQo.HdSjel3Kff2XJgNcSIbtHahZQjZwQ7e', 'student', 'CST', '22A81A0616', '9642973891');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.05, 8.77, 7.31, 8.51, 7.88, 7.81, 7.77, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('JANGA SRINIVASA REDDY', '22a81a0619@sves.org.in', '$2y$12$3zxdse9L7HZWlGH.rHooiuPIXGEhC795CzDaAuLAn5nAJRSM.5.Zq', 'student', 'CST', '22A81A0619', '6300041199');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.52, 9.31, 8.92, 8.35, 8.09, 8.54, 8.19, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KADIMI HARIKA', '22a81a0622@sves.org.in', '$2y$12$.TWLNvxV6XmFaXAl/gNDy.RFlwtjDhF6lXKooqjx3KkgKD3jj9hda', 'student', 'CST', '22A81A0622', '7207033984');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.04, 9.46, 9.08, 9.22, 8.74, 9.02, 9.16, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KAMISETTY TANUJA', '22a81a0623@sves.org.in', '$2y$12$4RuXHNX89elko2y3jNkUue9yl6zSufLvOQ4PFaQJhqPbQy4IzHxXm', 'student', 'CST', '22A81A0623', '9440443459');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.28, 9.31, 9.23, 9.45, 9.21, 9.44, 9.44, 8.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KARELLA PAVANI VINAY KUMAR', '22a81a0624@sves.org.in', '$2y$12$csUnZ3Eb51LKykDz/q6uzODHDcSBQ73jcvBa43bsnNOqOUYFDK4wi', 'student', 'CST', '22A81A0624', '6304397055');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.91, 8.69, 8.69, 8.86, 8.93, 9.02, 9.23, 8.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KARPURAM CHARANI', '22a81a0625@sves.org.in', '$2y$12$FTT.iEmDtzTE7N.LmYPp2eLR9Sc5mLYyNtE73lYA8dpTMj7MgJ0pi', 'student', 'CST', '22A81A0625', '7670995314');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.47, 9.0, 7.69, 8.59, 8.3, 8.74, 8.61, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MADICHERLA SHANMUKHA SAI PRAKASH', '22a81a0629@sves.org.in', '$2y$12$gEunT8.5G5nLTetQVoQRn.aStXv558CIWV13BKMvmxzCjQzK3vw/K', 'student', 'CST', '22A81A0629', '9550985975');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.75, 8.77, 8.54, 8.39, 8.81, 8.74, 9.02, 9.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MADIPALLI V VENKATA NAGA SRI MANICHANDANA', '22a81a0630@sves.org.in', '$2y$12$YsAv7/JgotYnogKYTs/ndu4afSF4Znq8isucbWbe2pB.s5qe3dSxW', 'student', 'CST', '22A81A0630', '9491577669');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.78, 9.08, 8.31, 8.86, 8.88, 8.12, 9.44, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MEDIDI PRAVALLIKA', '22a81a0631@sves.org.in', '$2y$12$K/VrV577AmA4lxzrDOHEDuSMIAlayrSc4INTM1hgv3dQ11umbTfMq', 'student', 'CST', '22A81A0631', '9063771180');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.71, 9.15, 8.46, 8.94, 8.46, 8.46, 9.02, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MEKA MAHESH KIRAN', '22a81a0632@sves.org.in', '$2y$12$8v5FEqYJ2JLJvE9tZpl.auPkQB04IE7BdQBE7Ep6kLMdyCGwH7w86', 'student', 'CST', '22A81A0632', '8919557642');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.02, 8.31, 7.23, 8.23, 7.67, 7.98, 8.12, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MOHAMMED HAFEEZA KHAN', '22a81a0633@sves.org.in', '$2y$12$mKuQhjvEJubqaLXL927p6evK.3N8JXVdwzJkHX/IMl1OkWmHgEjii', 'student', 'CST', '22A81A0633', '6305899256');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.35, 8.08, 6.92, 8.35, 8.51, 8.46, 9.09, 8.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MUTYALU CHAITANYA NAGAVALLI', '22a81a0634@sves.org.in', '$2y$12$kl4sFYcwT7eB6vuxdheSPeJ/fCoZv.yUXxpXKOMf.cTM7f3BOA3sy', 'student', 'CST', '22A81A0634', '9100853997');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.99, 9.38, 8.69, 9.18, 9.16, 8.61, 9.23, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NAGASURI TULASI SWETHA', '22a81a0635@sves.org.in', '$2y$12$glrBPYoiIeBrnQ3nWrzfOuJ5ijDaliSr2O8tvHcxnSWzkueBoUyIS', 'student', 'CST', '22A81A0635', '8247805516');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.83, 9.23, 8.77, 8.71, 8.88, 8.67, 9.02, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NALLANICHAKRAVARTHULA SRI HARSHITA', '22a81a0636@sves.org.in', '$2y$12$9GDh2KlYHGCHwkYTZhjArO9wieCsXKQtbQlFS0FFOmoVPJUcJUTMW', 'student', 'CST', '22A81A0636', '8500712540');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.49, 8.85, 7.69, 8.59, 8.16, 8.74, 8.88, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PADALA MOHAN REDDY', '22a81a0637@sves.org.in', '$2y$12$/3dgxFsI8r7vHz37UFo7XeA0drX6PFpTPKQDmvJ1rUXOC75UTFYX2', 'student', 'CST', '22A81A0637', '8074274880');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.68, 8.77, 8.69, 8.59, 8.46, 9.02, 9.16, 8.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PALLELA RAJA', '22a81a0638@sves.org.in', '$2y$12$znjG9RIfaCdNeSOmM1.rF.bV6hEtk5Ad0Zdq.rPKD8EbF7J0b7DGu', 'student', 'CST', '22A81A0638', '9392848155');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.03, 9.0, 8.69, 8.86, 9.35, 9.16, 9.23, 8.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PANJA MADHAN', '22a81a0639@sves.org.in', '$2y$12$teuXPMtiKzrC8pSyEgY6teVA4fSCtl/qihNq7C7HhT4gt4vdKW38i', 'student', 'CST', '22A81A0639', '7729959225');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.86, 8.23, 7.31, 7.88, 7.56, 8.33, 7.7, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PATSA YEGNAVALLAKA SUBRAHMANYA SAI', '22a81a0640@sves.org.in', '$2y$12$wFK8T6W66GRlhUhj5arrguvur2MGByou0iN1jU85X1B0sKXRZlgR6', 'student', 'CST', '22A81A0640', '9989379211');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.55, 8.62, 8.23, 8.47, 8.26, 8.74, 9.16, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PENUMATSA V V V VARMA', '22a81a0641@sves.org.in', '$2y$12$qj7P2cJUbRQVHzn01BI0l.p7TAemesPKhLHLs4UV0M.ig6P9v2PWW', 'student', 'CST', '22A81A0641', '9059565817');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.01, 7.92, 6.69, 8.18, 8.02, 8.33, 8.39, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('POLAVARAPU GANAPATI VARA PRASAD', '22a81a0642@sves.org.in', '$2y$12$RFEAxU2ymH40bCVZT96wv.M1N7ohhdfrH6bKUtqkFmndXfEfp4egO', 'student', 'CST', '22A81A0642', '6304852672');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.96, 9.08, 9.08, 8.86, 8.88, 9.3, 9.02, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PONNA VIJAYA DURGA SAI MALLESWARA RAO', '22a81a0643@sves.org.in', '$2y$12$hd55.Wlj1o3xxbcDDKkc/OXE5Qi6ZA/WnxsCXcTcFyVamWJcI9eTO', 'student', 'CST', '22A81A0643', '8374742540');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.53, 8.69, 8.54, 8.59, 8.37, 8.46, 8.61, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PYDI GEETHA RANI SRI', '22a81a0644@sves.org.in', '$2y$12$LahXpyWfg7olpJkKpn6PY.31o7JeVl4fgjD16Jl6ldkpDWmBAKSGe', 'student', 'CST', '22A81A0644', '9866095276');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.59, 8.85, 7.38, 8.29, 9.02, 9.16, 8.67, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PYDIPALA SAI AKASH', '22a81a0645@sves.org.in', '$2y$12$YB8NNfjc89Os5U9D6eeuM.73RdZjnR.O55IXVl7srR/vm/QGzA9kO', 'student', 'CST', '22A81A0645', '6281856728');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.72, 8.69, 8.54, 8.45, 9.16, 8.61, 9.02, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('RAJAHMUNDRY SWATHI', '22a81a0647@sves.org.in', '$2y$12$C0SxaFVheeId.5gYYgd0Y.KUxXvS8759UOdUxy.SRpesv/CWus9a6', 'student', 'CST', '22A81A0647', '9573113968');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.01, 9.23, 9.08, 8.71, 9.35, 8.74, 9.3, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('RAMISETTI JYOTHIRMAYI', '22a81a0648@sves.org.in', '$2y$12$1FMe4Ol3wxOVZJVCJUlmz.fM4JzdtdOyUbCYmdiMoAmio.Ux3Ibk6', 'student', 'CST', '22A81A0648', '9381569121');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.06, 9.23, 8.62, 9.06, 8.93, 9.44, 9.3, 8.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('RELANGI SRI LAKSHMI MOHANA SASI SARAYU', '22a81a0649@sves.org.in', '$2y$12$Uu1pDX72.wy5WxmVPNHjiONH/.jmQVcDn42ChCv6BO9cbCMh69I7S', 'student', 'CST', '22A81A0649', '9491017359');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.74, 9.38, 9.23, 8.94, 8.37, 8.46, 8.54, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SHAIK CHAN BASHA', '22a81a0651@sves.org.in', '$2y$12$jGAN0atYXOc6AEQVD2fE3..0OqfwohbofqLA5TRlj.3YhF/biOcb2', 'student', 'CST', '22A81A0651', '9550360289');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.01, 7.62, 7.08, 8.29, 8.3, 8.16, 8.23, 8.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TAMANAMPUDI YASASWINI SRI', '22a81a0654@sves.org.in', '$2y$12$ymjJY.KiK4iM36KhLIZ3se0OHeVVet5evAOr35W0su8tQQv5RtxBu', 'student', 'CST', '22A81A0654', '8639507184');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.63, 9.15, 8.85, 8.63, 8.81, 8.19, 8.54, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('UCHINTHALA SUPRIYA', '22a81a0657@sves.org.in', '$2y$12$PeUuWPdj/R1aNyp74N3BLeT3vnOYOiVLvwEKNxj3sipncYHZ.5u/q', 'student', 'CST', '22A81A0657', '9398553910');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.41, 9.31, 9.85, 9.41, 9.58, 9.3, 9.44, 9.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('URLA HASINI', '22a81a0658@sves.org.in', '$2y$12$efiEi/o5vaIfttX3VvH5f.ysp3lu4xZsZhJdbVyAsMxQvGOkva.vq', 'student', 'CST', '22A81A0658', '6304576772');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.91, 8.08, 7.38, 7.77, 7.4, 8.09, 7.91, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VARA JEESON BABU', '22a81a0660@sves.org.in', '$2y$12$yjxAEKgh121559F/DWwJ8eMJTVk2IJjziPUV5eBQU3k6YETRLFCYy', 'student', 'CST', '22A81A0660', '6302050750');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.93, 8.85, 7.46, 8.1, 7.81, 7.81, 7.95, 7.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VEJJU YAJNA SRIDEVI', '22a81a0661@sves.org.in', '$2y$12$bkxWefIxPjzqL4XPfe4ipuKU5eQAt6M3YFkipvpyauMBtNVqcPDWi', 'student', 'CST', '22A81A0661', '7013603135');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.7, 8.85, 8.38, 8.71, 8.74, 8.81, 8.81, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VELAGALA LOWKYA BHAVANA', '22a81a0662@sves.org.in', '$2y$12$UoiL8UsL2Ts0uDNZoEM9GuN4yOOSaO8yPyOSTWXXJiXvvvjovFXiK', 'student', 'CST', '22A81A0662', '9440403126');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.95, 9.38, 8.92, 8.82, 9.21, 9.09, 8.61, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('YALAMARTHI SABDHA', '22a81a0666@sves.org.in', '$2y$12$/75av.QD9FAMLUUBIAsWvekJWjjQ3DpDbDSevz9uLDy1Bj54eInN2', 'student', 'CST', '22A81A0666', '8317569500');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.57, 8.31, 8.77, 8.47, 8.37, 8.88, 8.95, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('AMARTHALURI SRIDHAR', '23a85a0601@sves.org.in', '$2y$12$tpQzhUpy8AF1uGGSEPR.9efQ/h6ulFmlTu85gF00cIKoIdJ8MKhIW', 'student', 'CST', '23A85A0601', '9014343213');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.23, NULL, NULL, 8.06, 8.23, 8.39, 8.44, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BEELLA OM ABHIRAM', '23a85a0603@sves.org.in', '$2y$12$T6QUEailRP.4RojASiPqKO/Qwy0aY4/FCCBSLPpplPmh7d6hLA9oS', 'student', 'CST', '23A85A0603', '7815858575');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.59, NULL, NULL, 8.51, 8.26, 8.81, 8.37, 9.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOLANUVADA CHANDRA SHEKAR', '23a85a0604@sves.org.in', '$2y$12$NC1ByJf.Of365GCYIPzUbets5du6JHQ5IH6g5.SDRqgF6J.tbcdua', 'student', 'CST', '23A85A0604', '7995709015');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.95, NULL, NULL, 8.33, 7.4, 7.84, 8.02, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('RUDRARAJU JOGI SUBRAHMANYAM RAJU', '23a85a0605@sves.org.in', '$2y$12$BWDwZjCLLg4/QjDTcecA2O.IijnLZB702Eh6pbeLMp9n33.eVuIJO', 'student', 'CST', '23A85A0605', '6304958379');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.74, NULL, NULL, 8.41, 7.63, 7.21, 7.33, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SEEPANI VEENASREE', '23a85a0606@sves.org.in', '$2y$12$fR4Xcaa.cnHiOSdMNzZbYeBXAqdYlKElYDE1cWgUj8W5y/GrH5ZmK', 'student', 'CST', '23A85A0606', '7382490099');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.93, NULL, NULL, 8.18, 7.91, 7.91, 7.81, 7.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHILLA YASASWINI', '22a81a1410@sves.org.in', '$2y$12$UWOLp1lZmHzl6rI4B1A1P.C8clt01ofuzf1BJ2swAfrKGRUOtkMt6', 'student', 'ECT', '22A81A1410', '7075084586');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.02, 8.54, 7.85, 7.96, 7.81, 8.46, 8.44, 7.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DUNDI CHARMI', '22a81a1413@sves.org.in', '$2y$12$1ievapX.9kzvC6sTzOjD7uYAp074iEQUveK9mVr7hkBtrV7EcrIe2', 'student', 'ECT', '22A81A1413', '9704226347');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.66, 9.23, 8.92, 8.65, 8.61, 9.3, 8.33, 7.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DUNDI DINESH VARDHAN', '22a81a1414@sves.org.in', '$2y$12$TsA8jt.37aKsEw5eGfv9rei2FuLgR497RKM.z13hlKVF1mR5DcE.e', 'student', 'ECT', '22A81A1414', '9014310778');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.11, 8.15, 8.31, 7.94, 7.67, 8.88, 8.05, 7.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GOUTHU BANDHAVI', '22a81a1416@sves.org.in', '$2y$12$.e3ios.vvQ7c7DkMNmqGcugitu35A0Xaa/ymPDKFDdiB09KJ1mwIa', 'student', 'ECT', '22A81A1416', '6304653334');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.91, 8.77, 8.08, 8.06, 7.77, 7.88, 8.09, 6.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUNA DEEPIKA', '22a81a1417@sves.org.in', '$2y$12$KIZnstpTvnT/X.fBMHgcJuWTJ.gZkXBnmmTHydjZy3Pmns0Enu0t2', 'student', 'ECT', '22A81A1417', '8522885943');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.78, 8.69, 8.23, 7.25, 8.09, 8.19, 7.81, 6.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUNA NAGA RAGHURAM', '22a81a1419@sves.org.in', '$2y$12$jkFWnqSYpZCAK/xOXMpYa.m8Tqt2zYYG6DudeA4GPpxE4Pcxf3Zd.', 'student', 'ECT', '22A81A1419', '6304169886');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 6.93, 7.15, 6.46, 6.96, 6.56, 7.88, 6.7, 6.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUTALA SATYA VENKATA MURALI', '22a81a1420@sves.org.in', '$2y$12$u2981Q5FE6Cs8QHa6IxNBOBxz7pA4xY.HjePIj.mih1/rw/yJleBq', 'student', 'ECT', '22A81A1420', '7093433273');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.26, 6.77, 7.46, 7.02, 6.84, 7.63, 7.47, 7.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KONAKALLA NAGA KEERTHI SREE', '22a81a1424@sves.org.in', '$2y$12$qQZwCzHB.Mgc59etSwBQROwsJynTjX0qWVk5RXXj15jj2NzzDmJN6', 'student', 'ECT', '22A81A1424', '9014664846');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.93, 8.38, 8.31, 8.18, 7.91, 8.33, 7.56, 7.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOKKIRALA HEMA DURGA', '22a81a1427@sves.org.in', '$2y$12$RTSy9Qg8f763OD3KH1PEyOWmuNDeXkbE78y0tYK3AqTr.rNRoUBGS', 'student', 'ECT', '22A81A1427', '9393144492');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.53, 8.92, 9.15, 9.06, 8.74, 8.88, 7.56, 7.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOMMURI YAMINI', '22a81a1428@sves.org.in', '$2y$12$cXitf1ZaPKuyLFaSHzob.ueL1rfP5ptcLLrFB37nNHNY0TEbrSK0m', 'student', 'ECT', '22A81A1428', '9502214116');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.32, 8.92, 8.23, 7.94, 8.19, 8.74, 8.46, 7.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KURELLA LAKSHMI SRI SATYA', '22a81a1430@sves.org.in', '$2y$12$BotGU8Ln84E.2CAlfJV3keS0mVw94KOQghE0XKZu2oiqNi599k2zS', 'student', 'ECT', '22A81A1430', '9985902617');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.93, 8.31, 8.23, 7.9, 7.77, 8.39, 7.74, 7.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MADDALA BHARGAVI', '22a81a1433@sves.org.in', '$2y$12$mN1P5.CXyg4bUVdCsruZueFOEu0LRIr4SCy0RoFVYd9vfK35T3W06', 'student', 'ECT', '22A81A1433', '6304927113');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.53, 8.46, 8.62, 8.37, 8.88, 9.02, 8.74, 7.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MADDALA DURGA VENKATA SATYASAI', '22a81a1434@sves.org.in', '$2y$12$g84PQjc2giketau4qlXOD.TAtuVjbbWjCXJrEX4DHas0ipCT6NKn6', 'student', 'ECT', '22A81A1434', '8919996452');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.38, 7.0, 7.69, 7.02, 7.81, 7.4, 7.81, 7.04, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MADDIPATLA SUMA', '22a81a1435@sves.org.in', '$2y$12$7D1/tAwJ4VpphdE33qet1.J85/upe.K4SVDkfSQdu3t3g.0S8Mzb6', 'student', 'ECT', '22A81A1435', '9515082239');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.29, 8.46, 8.23, 8.25, 8.26, 8.54, 8.33, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MANEPALLI AKSHAYA', '22a81a1436@sves.org.in', '$2y$12$k4Ib8p.CmMlSKw6AhE4kYeea37RjeGfhcPrnIvvlLpxdFvtMXz0A6', 'student', 'ECT', '22A81A1436', '8919327193');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.01, 9.0, 9.38, 9.47, 8.74, 9.16, 8.88, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MOTEPALLI SAMEERA', '22a81a1440@sves.org.in', '$2y$12$/wBeSK4UOBiu/FZNAypj5.nvXxoGopr//tTTKaa/QoiHO0WtCPZQ.', 'student', 'ECT', '22A81A1440', '7793957469');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.14, 7.92, 7.31, 8.31, 7.95, 8.95, 8.23, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NILABOINA LAKSHMI NAGA DURGA VINEETHA', '22a81a1441@sves.org.in', '$2y$12$J1/0zl3TBRd9N.IFsosEPeXvPUM9nP7PMVGY6XOBVNTwowv3Uphgm', 'student', 'ECT', '22A81A1441', '9014912129');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.76, 7.38, 8.15, 7.61, 7.12, 8.37, 8.51, 7.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('POSINA CHANDRIKA', '22a81a1447@sves.org.in', '$2y$12$S8Xn4S6W/MQ0emoQhLE5UuDacnaox/irNbbZSSzIvX/a1pPW6n0py', 'student', 'ECT', '22A81A1447', '9182125066');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.83, 8.0, 8.0, 7.67, 7.6, 8.09, 8.26, 7.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PUTTA YAGNA SRI HARSHITHA', '22a81a1450@sves.org.in', '$2y$12$vsGjIg/gEMrapVq4wQl.NubZTdlYW99jBWJGcJcikN3UsJeBWwG4O', 'student', 'ECT', '22A81A1450', '9494127969');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.23, 9.08, 8.54, 8.06, 7.91, 8.33, 8.46, 7.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SUNKARA SRAVANI', '22a81a1455@sves.org.in', '$2y$12$3vWZpYgul4T6CdcfT.JSO.JVofL.MZSEItEHFvzDDc0eJNiSBWjT6', 'student', 'ECT', '22A81A1455', '9441566833');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.38, 9.08, 9.0, 8.23, 8.3, 8.61, 8.05, 7.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TALAMSETTI GOPIKA SRITHA', '22a81a1456@sves.org.in', '$2y$12$dgs5m0KhW7Yu.ohmemDlH.bolzMgv6E/wp64x/nfqopUs.A.H0AG.', 'student', 'ECT', '22A81A1456', '6305127334');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.82, 8.92, 9.0, 8.88, 8.61, 9.3, 8.74, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TORATI JAYASURYA TEJASWINI', '22a81a1459@sves.org.in', '$2y$12$Z3JOlBH4FIYKYrrTd3Fa2Oz8dOPTnErkjBvSTxyCCE/jmo5hez0s6', 'student', 'ECT', '22A81A1459', '9121741618');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.24, 8.54, 8.23, 8.25, 7.81, 8.67, 8.74, 7.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VALLABHANENI NANDHINI', '22a81a1460@sves.org.in', '$2y$12$PyDD7rYCTvBKiaZC1lGqNuMDRUegQTXDR2cmti4VUuU1EqaIK1bWW', 'student', 'ECT', '22A81A1460', '9346267633');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.65, 8.46, 7.77, 7.78, 7.47, 7.98, 7.63, 6.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VUDDAGIRI HEMA SIVA HARIKA', '22a81a1462@sves.org.in', '$2y$12$ZANrsd6Ptjxzm15/0hbHVe6975ZgTt6GxUo8hbMCSvmz.VwITnKgi', 'student', 'ECT', '22A81A1462', '8341249257');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.39, 9.15, 8.69, 8.82, 7.95, 8.46, 8.19, 7.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('YADLAPALLI LAKSHMI PRASUNA', '22a81a1463@sves.org.in', '$2y$12$UXO5uCJJC5pSSma8rdoCB..kwbCCSUJF8fD24BqAii6a4zGqrgdIS', 'student', 'ECT', '22A81A1463', '8712251369');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.07, 8.31, 7.77, 7.82, 7.81, 8.67, 8.33, 7.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('YARRA SYAMALA', '22a81a1465@sves.org.in', '$2y$12$EPUi5QbzhFdz2cUriXsjvuS9.QsSG6JlCUBILNYgcj9PvObin3SE6', 'student', 'ECT', '22A81A1465', '9676899766');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.32, 9.08, 8.46, 8.41, 7.88, 8.95, 7.91, 7.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('AKASAPU VARUN MANIKANTA', '23a85a1401@sves.org.in', '$2y$12$hLRLT33DR2GMPv/wX8iBUeOxVWtSvtecKnT.FaYWhw7cuFCYIj.Yu', 'student', 'ECT', '23A85A1401', '9640448199');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.68, NULL, NULL, 7.14, 7.4, 7.98, 8.33, 7.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ABDUL SAMEER', '22a81a6101@sves.org.in', '$2y$12$bBsmsvcyIc2URdueVHXlgu0J8Tu67FsTOPp7A9YbevVVnZ9KjmPku', 'student', 'AIM', '22A81A6101', '8179055865');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.32, 8.15, 8.31, 8.45, 8.46, 8.37, 8.02, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ADDAGARLA ADITHYA SATYA TRINADHA SHANMUKH', '22a81a6102@sves.org.in', '$2y$12$eKhBHYn1t1rm/towTn1dZuSsfw/bWpA47.6QUuyAyGZjJvtqQyq9G', 'student', 'AIM', '22A81A6102', '9381625956');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.88, 8.23, 7.46, 7.63, 7.49, 8.44, 7.84, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ADIMELLI SRIKANYA', '22a81a6103@sves.org.in', '$2y$12$5wwuBl2sdT4JG.PnqIigB.QWCs2lXuenBodcJO69CN8MXZuKTkjJa', 'student', 'AIM', '22A81A6103', '7569236353');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.3, 8.69, 7.85, 8.14, 8.26, 8.3, 8.33, 8.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('B LAXMI VENKATA RAMA DURGA SOWJANYA', '22a81a6105@sves.org.in', '$2y$12$DVsRV.aohIea5nJ2lDxrvuHqbtr3j93LxaylrehSgsQmaO3cK8KnO', 'student', 'AIM', '22A81A6105', '9542519285');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.68, 8.77, 7.38, 7.78, 7.14, 7.4, 7.91, 7.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BADAM SAI BHAVANI', '22a81a6106@sves.org.in', '$2y$12$Y17FNu2gMtQwohtqRSbQcO/m3CpPhdsGPZMkWLmI/CrHrUIqUYU/G', 'student', 'AIM', '22A81A6106', '7032565991');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.75, 7.46, 7.92, 7.23, 7.35, 7.74, 8.26, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BORRA VIJAY VINAYAK', '22a81a6107@sves.org.in', '$2y$12$3lg4jOfcqKKWGZB.v/yTauH4KPVcNjLpg//rElF1b7rN5LE00qKOK', 'student', 'AIM', '22A81A6107', '6304153598');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.93, 8.62, 8.08, 7.23, 7.63, 8.09, 7.67, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BULUSU VENKATA DURGA SRI HARSHINI', '22a81a6109@sves.org.in', '$2y$12$ce2V5kj334GPcHv4zjdNOeksP7Z7FMC0RNS82wNOSwIjJF2p.ZLGy', 'student', 'AIM', '22A81A6109', '6304938149');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.18, 8.54, 7.62, 7.23, 8.33, 8.51, 8.74, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BUSI PALLAVI', '22a81a6110@sves.org.in', '$2y$12$cNEX5pBZyYFJ/RGZ55Tz/OyzbzjjI2j0WaZPl7ZDGIFY6DQMkOE3W', 'student', 'AIM', '22A81A6110', '6302975519');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.65, 7.62, 6.62, 7.18, 7.21, 8.02, 8.61, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHELLABOINA YESURAJU', '22a81a6112@sves.org.in', '$2y$12$Lo6WNAZumU3zlBCR4VPhbuRsUY5rTrHyHhzH4ln4M7CvMWNqPOURm', 'student', 'AIM', '22A81A6112', '9392234389');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.91, 9.23, 9.0, 9.02, 8.46, 9.02, 9.02, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DAGULURI RAJU', '22a81a6115@sves.org.in', '$2y$12$.jLrnl2kzlT4.A.Ol1LyKu6tMhQv5mYSOKpQEOzz9I/5qIds3kfqS', 'student', 'AIM', '22A81A6115', '9866942197');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.09, 8.08, 7.85, 7.88, 7.91, 8.46, 8.19, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GORREMUTCHU SOLOMON MATTHEWS', '22a81a6121@sves.org.in', '$2y$12$vJLdHoaMesi5VwcFtLQdnOiPTfMQHRiHW0U18i4tR0BG5wSGcnSli', 'student', 'AIM', '22A81A6121', '6305718769');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.09, 8.77, 8.46, 8.39, 7.84, 7.7, 7.84, 7.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('JAKKANI SREE TARAKA VAMSI KRISHNA', '22a81a6122@sves.org.in', '$2y$12$VhyiENh96F4ZVQRPZvKPEOmdqaR3JascawQGjtZA2ednyjkE8h7Ia', 'student', 'AIM', '22A81A6122', '8919159595');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.64, 8.77, 8.15, 9.06, 8.33, 8.61, 9.02, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('K PURNA SATYA SAI SAHITHI', '22a81a6124@sves.org.in', '$2y$12$a/VS7xqpWi/5xHJfSjk1SuEZ8x/XORcoXiQ/L22y/WLeEMiKd0uXq', 'student', 'AIM', '22A81A6124', '8106124961');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.52, 9.15, 8.15, 8.69, 8.54, 8.37, 8.44, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KARRI ROHIT SAI LAKSHMAN REDDY', '22a81a6125@sves.org.in', '$2y$12$fj3KJMR..kN4irbk19C3ge50JKiYS02yTJmfdmJSuaYHJmUM/xXS6', 'student', 'AIM', '22A81A6125', '9493957945');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.51, 9.38, 8.08, 8.39, 7.28, 8.61, 9.21, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KANTHETI VIVEKRAM', '22a81a6128@sves.org.in', '$2y$12$aAal.Fgj0hEol3o4lY4LwuYUgpcTkGAoAXjnDI9FrESTyDXzHl91a', 'student', 'AIM', '22A81A6128', '8522020692');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.66, 9.08, 8.31, 8.65, 8.05, 8.74, 8.93, 8.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KAVALA JITHENDRA', '22a81a6130@sves.org.in', '$2y$12$gzPbbc0Mfdckr7GNpfBepe/Uf6nnk.RQDGXhgJAl9cfAZD581WBju', 'student', 'AIM', '22A81A6130', '8309042235');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.53, 8.77, 8.08, 8.98, 7.91, 8.88, 8.72, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOMBATHULA AKHIL BABU', '22a81a6131@sves.org.in', '$2y$12$OKqWZKB3pTT0wzPbnqQ53uR5XPFydSiP6yCF/2kqbE8ny6N8HQjgO', 'student', 'AIM', '22A81A6131', '9346658378');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.62, 7.69, 7.46, 7.82, 7.21, 7.95, 7.47, 7.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOMMU LAKSHMI LAVANYA', '22a81a6132@sves.org.in', '$2y$12$CvCw6L0B/qNXFVevulcs8OHfTHOVIIJKxt9zg5ag.JDsx6IhPUXa2', 'student', 'AIM', '22A81A6132', '6302303231');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.39, 9.08, 8.62, 8.28, 8.05, 8.37, 8.33, 8.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KONDAVEETI MONICA', '22a81a6134@sves.org.in', '$2y$12$Xt4cV.eRL19iD6z0UhVnS.gDH3tmJq9MCIbH7X2UN1WmD4dhjTqIq', 'student', 'AIM', '22A81A6134', '9121344797');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.45, 8.92, 7.54, 8.71, 8.33, 8.65, 8.33, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MOHAMMAD ISHAQ', '22a81a6137@sves.org.in', '$2y$12$W7Fimw45oe/Z1xDz.v.qYeBVNXSiFlQNrfdsYJyi47COVZGDmnRFy', 'student', 'AIM', '22A81A6137', '9393265888');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.11, 8.15, 7.08, 7.94, 7.91, 8.46, 8.61, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MUNISETTI VENKATA LAVANYA', '22a81a6141@sves.org.in', '$2y$12$GuX3sbZYRZEsIOo.m05m1O5B/kTpqtQZ8Sx8lEFHVvAMkSzZK0DFW', 'student', 'AIM', '22A81A6141', '7075291677');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.79, 9.38, 8.46, 8.92, 8.39, 9.21, 8.74, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NALLAMELLI BABY SARANYA', '22a81a6142@sves.org.in', '$2y$12$lv9QXG.wlR50x45lAxPxauY9K7NOBJYLi5KyPV5D8mn2VJfOChl76', 'student', 'AIM', '22A81A6142', '9133391118');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.11, 8.62, 7.46, 7.92, 7.63, 7.95, 8.54, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NAVABATTULA MANOHAR NAGA SRI SAI', '22a81a6143@sves.org.in', '$2y$12$/RHHAgGgMdTJbqIDzNfT/ulFSsbpIHQ1Fpa0nGw5fRGjDvrPVnkYO', 'student', 'AIM', '22A81A6143', '6305083757');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.34, 8.08, 8.46, 7.92, 7.98, 8.58, 8.61, 8.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NELLI RAJA', '22a81a6145@sves.org.in', '$2y$12$.J9JB7.8JiKhIGyugKzZduDyXhZT0KVbyF3L/tuDkOoFM1ZMwq4FO', 'student', 'AIM', '22A81A6145', '7601057948');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.96, 8.46, 7.0, 7.59, 7.84, 8.33, 8.09, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PABBA HARSHINI', '22a81a6146@sves.org.in', '$2y$12$.U7hW.DdF43DISQImaUNROtnKwvPvXfk01oGVkCz1Cdmwu5zjZzii', 'student', 'AIM', '22A81A6146', '9121930594');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.34, 9.23, 8.08, 8.06, 8.12, 8.46, 8.61, 7.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PALURI MOUNIKA', '22a81a6147@sves.org.in', '$2y$12$Idzn15gkUwBO1uKrH3rQw.hyS86go00r89SnOKQwDA4TPn64VZKNm', 'student', 'AIM', '22A81A6147', '8374611254');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.64, 8.85, 7.77, 8.39, 8.54, 8.88, 9.44, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PATHURI BHUVANESWARI', '22a81a6149@sves.org.in', '$2y$12$ynTUYTi4HNElUjC4VikKy.6dhU8/cRanczsj98LC2m9jKdA1lvl7G', 'student', 'AIM', '22A81A6149', '7569046467');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.11, 9.69, 8.92, 9.28, 8.88, 9.16, 9.23, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PULAPA INDIRA', '22a81a6151@sves.org.in', '$2y$12$tkNQcsduQ5uy7Uhvwhu4xu5pO4PU8ulflaVEggJPEOpiuo8sdYhaS', 'student', 'AIM', '22A81A6151', '7780462957');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.79, 9.62, 8.31, 8.82, 8.12, 8.88, 9.02, 8.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SARIKA ANJANEYA KARTHIK', '22a81a6154@sves.org.in', '$2y$12$x86MNMdp.6khC2nCmXqB.OmXxpWbfs5xoMdxXDaI2WoKqoF5U6hba', 'student', 'AIM', '22A81A6154', '7396351571');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.25, 8.46, 7.85, 8.71, 7.7, 8.19, 8.88, 7.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SIMHADRI TARUNI', '22a81a6155@sves.org.in', '$2y$12$QG9CLL6HOGaWhkPDT/R.0uWt2vtCjIVShmBVwNa0iDQaOI0LOObiW', 'student', 'AIM', '22A81A6155', '8184945533');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.11, 9.62, 9.08, 8.98, 8.88, 9.16, 9.16, 8.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TAMMINEEDI REKHA PRABHU', '22a81a6157@sves.org.in', '$2y$12$Gx8wyw0MY51DrzCezUDWFu3OtIMsaJQpJWgn/2hv84jzM90EuCmNW', 'student', 'AIM', '22A81A6157', '9392947775');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.94, 9.46, 8.69, 8.86, 8.74, 8.88, 9.16, 8.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TIRUPATHI SHANMUKHA PRIYA', '22a81a6159@sves.org.in', '$2y$12$42v8jw3.i5gtye//aEmjDujehtDkeHu9sSaKLZ5o8W0z6S0loxKBi', 'student', 'AIM', '22A81A6159', '6300372367');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.88, 9.31, 9.0, 9.06, 8.74, 8.46, 9.02, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TIRUVEEDULA L.N.V.S.M.L.DHEERAJ', '22a81a6160@sves.org.in', '$2y$12$8LFgIEcUWLVK0AuEvFEnned79xhPTU7khxcHgHjEzpUGV0pS9rpRy', 'student', 'AIM', '22A81A6160', '7842420613');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.24, 8.77, 8.23, 8.29, 8.19, 8.02, 8.26, 7.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VEDANTAM VENKATA MODA SRI VAISHNAVI', '22a81a6162@sves.org.in', '$2y$12$VAqqsg9Hd4JKZvlrLbt1L.t0W/Po4wT/tmS6.l9YznEYEeQxbJhym', 'student', 'AIM', '22A81A6162', '8106962366');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.75, 8.92, 8.08, 8.86, 8.67, 9.02, 9.02, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VANTIPALLI PURNA SRI', '22a81a6163@sves.org.in', '$2y$12$Te0q2.YKAjb8SzjVBDIhHO38AAfD5CPEfigFhDg6rL8SFfhJw8QTi', 'student', 'AIM', '22A81A6163', '9459893333');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.93, 9.62, 8.69, 9.23, 8.67, 8.86, 8.81, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ADABALA JAYA MOUNIKA', '22a81a6167@sves.org.in', '$2y$12$k8rlkL57OWgePNpWE3i/tO1yiq.mvHE/BQWYAuioi3VBVN5KbPY6i', 'student', 'AIM', '22A81A6167', '8019736844');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.83, 9.31, 8.62, 8.94, 8.33, 8.61, 9.02, 9.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ANEM PADMA RAMA SOWJANYA GANESWARI', '22a81a6169@sves.org.in', '$2y$12$yiQPpIZmNfnlEP8BDYppHuWmQkxTJgJ7c0YyqYVZOWoGFrtF33DEG', 'student', 'AIM', '22A81A6169', '7013975155');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.82, 8.54, 8.23, 9.29, 8.88, 8.88, 9.44, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BONDADA VAHINI SATYA KALA', '22a81a6172@sves.org.in', '$2y$12$vzifAwFBT..VRi0PoH0sSuXU/oxxKmywtxSG45E/OeygBogC8yqYq', 'student', 'AIM', '22A81A6172', '6301100912');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.41, 8.77, 7.92, 8.71, 7.91, 8.12, 8.65, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BORRA VIKASH', '22a81a6173@sves.org.in', '$2y$12$0yV0SlB29vQzuWeE98rhkei9vvsqN7NO6hoxfkPsiCh9TRq/qQCa.', 'student', 'AIM', '22A81A6173', '9441133755');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.95, 8.0, 7.54, 7.98, 7.77, 7.81, 7.74, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BURRA AVINASH', '22a81a6174@sves.org.in', '$2y$12$MD8kbLfHBIdcDFed0wacU.Wf.sOpbcmdB7BsrPGRTsvuJIba3X1hu', 'student', 'AIM', '22A81A6174', '9704935980');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.76, 7.69, 7.23, 7.75, 7.35, 7.53, 7.81, 8.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHENNURI VASANTHI', '22a81a6176@sves.org.in', '$2y$12$RP5GWS98R7.Iks6Ain6.3uUqL72fUtAn7XKHz/xYJoDqzGWxpm4pm', 'student', 'AIM', '22A81A6176', '7997292889');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.8, 7.77, 7.15, 7.71, 7.63, 7.88, 7.98, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DANDUBOINA JYOTHI SWAROOP', '22a81a6179@sves.org.in', '$2y$12$Y1/jRL9bLY7.J/0EkkCNFe56jRjWPlcIS/9Wd/QWO00UmnSjOtLoW', 'student', 'AIM', '22A81A6179', '6301007254');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.88, 7.85, 7.69, 7.86, 7.63, 8.23, 7.53, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DUGGIRALA SAI KOUSHYA', '22a81a6180@sves.org.in', '$2y$12$32t4j625FTIGd16JM0U4YOAu6D6nbl7lQAmC4IRQM7Ei7xnnpV0b2', 'student', 'AIM', '22A81A6180', '8374099466');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.39, 8.31, 7.69, 8.59, 8.39, 8.61, 8.37, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GHANTA VENU MADHURI', '22a81a6182@sves.org.in', '$2y$12$HhXZJGWbhE9RgAHXdxqiyu0ysydEJtogw1OfTquN9Q6CYQELI4EyC', 'student', 'AIM', '22A81A6182', '6304726531');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.79, 8.92, 8.46, 9.06, 8.54, 9.16, 8.61, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('INDANA RAGHAVENKATA SATYANARAYANA', '22a81a6186@sves.org.in', '$2y$12$kQGudyTFGa7dznqcjUivtuPfhof077Xu89xBC6o4FY0fqC2lymKJu', 'student', 'AIM', '22A81A6186', '6300073279');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.07, 9.69, 9.08, 9.18, 9.3, 9.02, 8.74, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KALLA RAMA SRI SAI SANDEEP', '22a81a6188@sves.org.in', '$2y$12$GLrZ5ZXeYp4BrWoO3sXfm.oZGHiMOcuOiGiBWdDzxPw54ahlADRXG', 'student', 'AIM', '22A81A6188', '9951334833');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.31, 8.38, 8.31, 8.41, 7.98, 8.67, 7.95, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KARUTURI KOUSHIKA', '22a81a6189@sves.org.in', '$2y$12$YF/ceFF.zl91kluI/4/Uheb3ynV5XvICYZq2Hu38ep9QHaDy6v632', 'student', 'AIM', '22A81A6189', '9848602023');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.83, 8.31, 7.38, 8.29, 7.7, 7.67, 7.74, 7.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOCHERLA HINDU', '22a81a6190@sves.org.in', '$2y$12$5B3BNmYfXijOuj5j0wH7FOtStoB4psrxEfMWPu8kd7iGPpkDjF3wK', 'student', 'AIM', '22A81A6190', '8247267574');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.29, 8.38, 7.62, 8.71, 7.98, 8.09, 8.51, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOTTU SATYANARAYANA', '22a81a6194@sves.org.in', '$2y$12$i2AlvjxHIreM/xTORw9UD.ygAa5QegZ/7sTsah8L07bAUxijXhNz.', 'student', 'AIM', '22A81A6194', '8074645996');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.62, 8.0, 6.85, 7.69, 8.05, 7.53, 7.26, 7.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOVVURI NIMEELA', '22a81a6195@sves.org.in', '$2y$12$kJtkbcMDaTvVqJJTDQ61h.91yFcssklGrGxbMPD0yYoF/9IDWG2rS', 'student', 'AIM', '22A81A6195', '9000158272');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.47, 7.0, 6.46, 7.53, 7.63, 7.67, 7.53, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MANE B S S BHASKAR SHANMUKHA VAMSI', '22a81a6196@sves.org.in', '$2y$12$2dsm9ktnlCj7xP8WQtXEh.TqDMZaxVzcJ1LLUmXFyVn9h4O0h0ciK', 'student', 'AIM', '22A81A6196', '6305611826');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8, 8.85, 7.23, 8.18, 7.98, 7.81, 7.81, 8.13, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MANIKALA VIJAY KRISHNA', '22a81a6198@sves.org.in', '$2y$12$gNGAaajsscVf0V7Gh0i4/udMY5RAtKwV6g5CQ8cbHLssDZygrraIu', 'student', 'AIM', '22A81A6198', '9391843437');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.34, 7.54, 7.0, 7.82, 7.12, 7.09, 7.19, 7.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MATTA KIRAN KUMAR', '22a81a6199@sves.org.in', '$2y$12$eVds9sF4rBpiMANLx4YyyeubvaLim/8th6Wg5GRATp8auhXWflv9i', 'student', 'AIM', '22A81A6199', '8866899666');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.01, 8.23, 7.23, 8.47, 8.05, 7.81, 8.09, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MENNI MADHAVI LATHA', '22a81a61a0@sves.org.in', '$2y$12$yRCQtF4FaUDgB63YINy9t.kWEcyF4sU6QGRzxgBEVGoSCdga6Mvza', 'student', 'AIM', '22A81A61A0', '9177243781');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.8, 9.0, 7.92, 8.82, 8.67, 8.88, 9.3, 8.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NAINARAPU KRISHNA CHAITANYA', '22a81a61a2@sves.org.in', '$2y$12$fx8oC4Fe35Q3hAUogFYEDeADvQkE0z.U8qj07TdMhqyFRSl/XRVD.', 'student', 'AIM', '22A81A61A2', '9133544634');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.06, 8.08, 7.08, 8.39, 8.67, 8.16, 7.33, 8.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NAMBULA ESWAR AKASH', '22a81a61a4@sves.org.in', '$2y$12$433M75gQbHkExFF1XdN8H.0Cry1kClKK0n.EjTBw7WSPkua9CrsrO', 'student', 'AIM', '22A81A61A4', '8341462856');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.06, 8.23, 7.69, 8.39, 7.63, 7.95, 7.47, 8.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PALLAPOTHU NAGA KRISHNA MADHURIMA', '22a81a61a8@sves.org.in', '$2y$12$eFiIhiP0cENkppHqdEkUQ.VC4Wp79Uq5nAc85lyq70h4Il4FbhP3m', 'student', 'AIM', '22A81A61A8', '7989846096');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.9, 9.31, 8.69, 8.98, 8.74, 8.95, 8.81, 8.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PAMIDI RESHMITHA SREE', '22a81a61a9@sves.org.in', '$2y$12$Ma94rgrm5SF8g4C63NAHmepdB62WMsNF2evv/gNTOkxU5DVIW8wNm', 'student', 'AIM', '22A81A61A9', '9347318653');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.92, 8.92, 7.85, 7.92, 7.77, 7.88, 7.67, 7.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PATTAN FARJANA', '22a81a61b2@sves.org.in', '$2y$12$YZx7bLKd2usiUfGtRlIqd.Ziu6w.grP2G59/XMXEnGcU6y1x5wOfu', 'student', 'AIM', '22A81A61B2', '9704019178');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.32, 8.62, 7.0, 8.71, 8.54, 8.23, 8.67, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('RAMISETTI VISWAJA', '22a81a61b7@sves.org.in', '$2y$12$1GhHJhaPDTpJ3IE/IzBCr.EK19SKLwI3l268pJMPtkD2lKd/3uHWO', 'student', 'AIM', '22A81A61B7', '8639179966');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.93, 9.46, 8.54, 9.06, 8.74, 9.02, 8.88, 8.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SABBARAPU MOHAN GANESH', '22a81a61b8@sves.org.in', '$2y$12$.14ogek7yfqIFHwVRgen/uBi8.XoMOflirMNks9Nm33tDy5TEfyfu', 'student', 'AIM', '22A81A61B8', '9052811658');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.86, 8.77, 7.46, 8.22, 7.35, 7.37, 7.67, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SHEIK RIHANA', '22a81a61c0@sves.org.in', '$2y$12$nSgrlxYyD2SDROqolPyXa.R0DwqlVoi5E/GnbxhH2lyOvUk05Fn92', 'student', 'AIM', '22A81A61C0', '8688004493');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.23, 8.15, 7.46, 8.47, 7.98, 8.3, 8.54, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SOMA GOWTHAMI', '22a81a61c2@sves.org.in', '$2y$12$DYOwsTZkupAvG2oDqGGK1.JHJASXsAkKbir8wCpw9aka.R5LAlW2K', 'student', 'AIM', '22A81A61C2', '9391318590');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.59, 9.08, 7.85, 8.77, 8.39, 8.95, 8.58, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('UNDURTHI KARTHIK SANJAY', '22a81a61c5@sves.org.in', '$2y$12$C/8W.eZ89V6EuoR5dgg/X.zDuc/o08gQFPvT2NDKa7z4.y2WH0Zi.', 'student', 'AIM', '22A81A61C5', '7396496696');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.47, 7.54, 7.0, 7.57, 7.28, 7.6, 7.4, 7.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VARRI BINDU SURYA SRI', '22a81a61c6@sves.org.in', '$2y$12$sCLkk54VLMostxzaMLDXB.XeEL1J6vu92KcnfBSaSQmjPvbOlA3d.', 'student', 'AIM', '22A81A61C6', '9100927227');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.12, 8.31, 7.54, 8.1, 8.46, 8.16, 8.05, 8.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VEERANKI SAI SRIVALLI', '22a81a61c8@sves.org.in', '$2y$12$ITvKuSx55UyOb/k46irX..5xI2DdvxfSyxDuh540baTItGT4nZl6.', 'student', 'AIM', '22A81A61C8', '9573821549');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.61, 8.77, 8.46, 8.41, 8.26, 8.88, 8.88, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VERNENI SANKEERTHANA', '22a81a61c9@sves.org.in', '$2y$12$0Ee8cCHXUCks/NXEf6ZwHOoHX9I.DzY/UnzwbzO9sWx1piNNuaGLu', 'student', 'AIM', '22A81A61C9', '9959322022');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.97, 9.69, 9.23, 9.29, 8.46, 9.16, 8.88, 8.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TALAPATI RAVINDRA', '23a85a6106@sves.org.in', '$2y$12$CA4txWeHMTDNvChYULXs2eo3k55/vwdu6.nKZJf8t5TIGGof7X8IK', 'student', 'AIM', '23A85A6106', '7207022630');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.11, NULL, NULL, 8.33, 8.19, 7.88, 8.39, 7.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VEMPADAPU RAMA KRISHNA', '23a85a6108@sves.org.in', '$2y$12$XBRNQNrnTOgSgsFMoO5Uuun9fIk.4PO6SlORVxAa179FKWw3FyA7O', 'student', 'AIM', '23A85A6108', '9390492076');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.12, NULL, NULL, 8.29, 7.98, 8.74, 8.02, 7.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KANDEPU JAGAN MOHAN SAI', '23a85a6110@sves.org.in', '$2y$12$JBsABRyTuv.40CPQsuZ5Leh329A8WjJu9TAaWB6nXsUoGoKp/PTSe', 'student', 'AIM', '23A85A6110', '7671001426');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.35, NULL, NULL, 7.71, 6.72, 6.88, 7.6, 7.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KUDUPUDI NARSIMHA SAI SANDEEP', '23a85a6111@sves.org.in', '$2y$12$B/U67qlRICqRmjdeP.3LfOnjTJHjNlVXG.Q7L6Wpa54VY/xtaLUF2', 'student', 'AIM', '23A85A6111', '9014532005');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.86, NULL, NULL, 8.23, 7.91, 7.67, 7.88, 7.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BUDDANA DURGA VARA PRASAD', '22a81a4302@sves.org.in', '$2y$12$d7wgHayV8sivKKUnNHpZJOEHk3/HG/jjY7.nTK.MTCCMAx66aSGDa', 'student', 'CAI', '22A81A4302', '8919766303');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.73, 8.46, 7.15, 7.84, 6.98, 7.74, 7.53, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('D B ABHISHEK ANANTAPALLI', '22a81a4305@sves.org.in', '$2y$12$Q1QqoH9k1UMq0ezkRxDPKefct9cUxC0KODr2IupboRo7187c/Wb2W', 'student', 'CAI', '22A81A4305', '8317618694');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.17, 9.38, 8.77, 9.53, 8.81, 9.16, 9.58, 8.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GARIMELLA VASANTHA SURYA PRASAD', '22a81a4306@sves.org.in', '$2y$12$tuecftJHehsJdgoIZ4Y3zeHRh0j7ShHhle9JN7WlrFWLSFoL6mmES', 'student', 'CAI', '22A81A4306', '7893156396');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.26, 8.0, 8.23, 9.06, 7.67, 7.88, 8.05, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GETCHA BHEESHMIKA', '22a81a4307@sves.org.in', '$2y$12$0Qp5k1IzdKrLVIOFZ.GZ2e3/a2d69OpirPTMduOmmxrmnEe5ThCwa', 'student', 'CAI', '22A81A4307', '7013333902');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.12, 8.38, 7.46, 7.75, 7.84, 8.19, 8.67, 8.52, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GOLTHI SONI HARIKA', '22a81a4309@sves.org.in', '$2y$12$qFnt9zjBvpTIy2x2NEa7XuExWO0izRoWWKh/RhQEb1CSJHh4k5.I.', 'student', 'CAI', '22A81A4309', '7989682765');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.91, 8.77, 7.92, 8.0, 7.12, 7.7, 7.81, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUDIMETLA ANU KARISHMA', '22a81a4310@sves.org.in', '$2y$12$VmM.dXqPX8cRh/Knty9BX.JrUg9MaNBRjFxGdA.AP39pvTG.1iaFy', 'student', 'CAI', '22A81A4310', '8328533689');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.24, 9.85, 9.08, 9.29, 9.21, 9.02, 9.44, 8.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GULLA HARI SANKARA BHAVANI PRASAD', '22a81a4311@sves.org.in', '$2y$12$6KoAGYfUXiFRlVmjjskwBu18IS9qq57DsnzabpNn4Bfe1rB9lP59O', 'student', 'CAI', '22A81A4311', '8978615307');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.21, 8.38, 7.38, 7.63, 8.02, 8.09, 8.74, 9.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('JALLA PADMA SRI', '22a81a4312@sves.org.in', '$2y$12$.Bse4lQU9rE.9jh/v6VJ8O1tmKlu.OOklxp7KLsL6znlCJhmRWjOW', 'student', 'CAI', '22A81A4312', '8520847664');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.18, 8.54, 7.23, 7.86, 7.05, 8.74, 9.14, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KUNCHANAPALLI HEMA LALITHA DURGA', '22a81a4316@sves.org.in', '$2y$12$TjjC6q8a82NCo4mzze1cl.Vmfl5LBdJEYcw2OguY5kn1pdtOK91Qi', 'student', 'CAI', '22A81A4316', '9392996754');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.89, 8.0, 7.38, 7.51, 7.26, 7.98, 8.51, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KAKUMANU VENKATA SAI SRI DEEPIKA', '22a81a4317@sves.org.in', '$2y$12$yBhBCDBQRsnihhwAIBQbA.4fdUoCADh0GqO6Mm69gk8iplwYQLjQW', 'student', 'CAI', '22A81A4317', '8712152004');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.89, 9.46, 8.69, 8.75, 8.26, 8.95, 9.21, 9.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KARUTURI POOJITHA', '22a81a4318@sves.org.in', '$2y$12$Bn6caAN49ZQc2Th0Cu.xu.HhaLGhyrImIxAXJ5ottA7TrGD7TwRBG', 'student', 'CAI', '22A81A4318', '7671968916');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.63, 8.54, 8.46, 8.71, 8.05, 8.88, 8.61, 9.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KESANI NAVYA SREE', '22a81a4321@sves.org.in', '$2y$12$9Eb1zXTvJTcebi0h6IypJO9NaJJfO9Hd6ouOlHWEQ06NWUAwyoux2', 'student', 'CAI', '22A81A4321', '9392485248');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.71, 8.46, 8.23, 8.94, 8.39, 9.16, 8.67, 9.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOKKIRIMETTI PAVAN NAGA VENKATA KUMAR', '22a81a4322@sves.org.in', '$2y$12$b78.Zlh.4JBnqqgLdp/I6OdLOFiyvgZ49OYtC7ru2AcwkMtwbMEAK', 'student', 'CAI', '22A81A4322', '9010635259');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.11, 9.0, 7.62, 8.37, 7.33, 8.46, 8.33, 7.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOLLEPARA SATHVIKA', '22a81a4323@sves.org.in', '$2y$12$x9xc1F7iNdO9Y.sTk3xCjeLdqGAH6GU/lrahM0uJfSLUeZWmYOCXG', 'student', 'CAI', '22A81A4323', '8096513001');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.3, 9.0, 7.69, 8.94, 7.47, 7.77, 8.33, 8.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KONA KARTHIK', '22a81a4324@sves.org.in', '$2y$12$B9lzNoiOVbavYwnxeKG3P.ZUj5y/dkox8tzG/RrB2Kd6.qcm2AZG6', 'student', 'CAI', '22A81A4324', '9640715598');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.99, 8.0, 6.85, 7.86, 7.81, 8.61, 8.05, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KONGARA MEGHANA', '22a81a4325@sves.org.in', '$2y$12$iyu/4nVXPlw41VOU2sBl9.6JmeqUAxJ0odDo9HbMcdJTmRlLS64HC', 'student', 'CAI', '22A81A4325', '9381687830');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.22, 9.23, 9.31, 9.41, 9.3, 9.44, 9.02, 8.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KOTHA DREAM SRI VENKATA THANMAI', '22a81a4327@sves.org.in', '$2y$12$ieW7p6e9/9.X80eATiSDBOhYwKuUO.4wMO4j0kluivZ7H5yysZ.sq', 'student', 'CAI', '22A81A4327', '8297877555');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.2, 9.69, 8.62, 9.08, 8.88, 9.44, 9.58, 9.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('LINGAM GOWTHAM KUMAR', '22a81a4329@sves.org.in', '$2y$12$1nEVwshbKvulFUpqeeZm7.TIqHpdcxiXhynmMGDN0xui60JvHIaeq', 'student', 'CAI', '22A81A4329', '9014305640');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.8, 8.08, 7.0, 8.0, 7.35, 8.19, 8.05, 7.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MALLIDI SURYANARAYANA REDDY', '22a81a4330@sves.org.in', '$2y$12$9zzY.H1VtxBtdlZ9hbVrpOnJZmoMiyDMxWPwSqXbujnZJAObKXZ1u', 'student', 'CAI', '22A81A4330', '9347445773');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.2, 9.08, 7.77, 8.2, 8.23, 8.19, 8.02, 7.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MAGANTI BAVANA', '22a81a4331@sves.org.in', '$2y$12$5ybv.995lo/sj27jWQHu9uheW/5litYJi9p/80xNYbmk7An1esOwK', 'student', 'CAI', '22A81A4331', '9030207566');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9, 9.46, 9.0, 9.29, 8.95, 8.61, 9.3, 8.43, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MAKA JAHNAVI NAGA SAI', '22a81a4333@sves.org.in', '$2y$12$EBqtj9Ojze.S5NNvk1dvOe4Uu4eLIlWQFPUIAFHWN.AkuY2r/msxS', 'student', 'CAI', '22A81A4333', '8519807791');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.05, 8.0, 7.69, 7.94, 7.42, 8.26, 8.81, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MEDA GOVARDHANA SUBHASH', '22a81a4335@sves.org.in', '$2y$12$g9Elj8aIIJ7yukCmAhvaDuQte9PhgpzsheADfrlgSplIgAiAV85cy', 'student', 'CAI', '22A81A4335', '9392676529');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.77, 9.08, 8.69, 8.82, 8.61, 8.67, 8.88, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NAARLA DURGA PRASAD', '22a81a4338@sves.org.in', '$2y$12$EuBvdKLpYlN0vXERI/h41Ozi2o6Dur6DiZ6Z9d0KvLtoYGjOLsL7m', 'student', 'CAI', '22A81A4338', '7013379791');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.91, 9.46, 9.15, 9.02, 8.61, 9.16, 8.58, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NAGIREDDY TULASI SATYAVATHI', '22a81a4339@sves.org.in', '$2y$12$gSYYaJc9UJkZ3/b2r9ve6uIZkrvz/ZocqzQUOunNL.EGOb5987OQa', 'student', 'CAI', '22A81A4339', '9652562592');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.43, 8.69, 7.85, 8.49, 8.33, 8.61, 8.65, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NARKIDIMILLI SAKETH', '22a81a4340@sves.org.in', '$2y$12$j9c1w.TD/i9brTzpeOCOkOl7JhF0oV3NH9ZGBNEjaN.NYuwifxhYy', 'student', 'CAI', '22A81A4340', '8555883949');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.09, 9.69, 9.08, 9.0, 8.88, 9.16, 9.16, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ODURI SRINIVAS', '22a81a4342@sves.org.in', '$2y$12$ej3BfZoYzHbWkeeJah/GOeRi27OSOg7yjyDxy7wCFcbLVe6CR.d7C', 'student', 'CAI', '22A81A4342', '9959325457');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.38, 9.62, 9.38, 9.41, 9.16, 9.3, 9.58, 9.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PADILAM KALYAN KUMAR', '22a81a4344@sves.org.in', '$2y$12$i80w4zYyFiuO7tQS0FN8m.IDh1BzQ5bGKZJ59f6M0Xv4lXFImlywi', 'student', 'CAI', '22A81A4344', '6300808054');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.25, 9.85, 9.38, 9.41, 8.61, 9.16, 9.16, 9.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PAIDY DEEPAK', '22a81a4345@sves.org.in', '$2y$12$GWo/UjyqdLnEfE8eYOJFxeIShVR.zNUwTOwVaDAGTHw7BXOloPKxq', 'student', 'CAI', '22A81A4345', '9618045505');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.04, 8.08, 7.54, 7.96, 7.7, 8.23, 8.44, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PALLI KALYAN BABU', '22a81a4346@sves.org.in', '$2y$12$gwk1BGIy7tVsPXZbCNT72.mgp.Kgk4243RvRkabJrOYBjwXkARIwu', 'student', 'CAI', '22A81A4346', '8121606415');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.24, 8.69, 8.54, 7.9, 7.91, 7.77, 8.16, 8.78, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PEDAPUDI SRINIVASA SAIRAMA DATTATREYA', '22a81a4347@sves.org.in', '$2y$12$Jh6qlvuQCFQWGGl7KeLRiO4QGygBAkNSWl7V4HuerPd/gr8YTs7mK', 'student', 'CAI', '22A81A4347', '9390447466');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.11, 9.46, 7.92, 7.9, 7.21, 7.67, 8.33, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PERURI SANDEEP', '22a81a4349@sves.org.in', '$2y$12$agFMLwzmQvHcDjeFpfiq0.Kns7c..ss9AhGpVJnZheSy7NevVRhUC', 'student', 'CAI', '22A81A4349', '9063507445');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.1, 8.31, 7.54, 8.1, 7.91, 8.33, 8.12, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PINNINTI DEEPIKA', '22a81a4350@sves.org.in', '$2y$12$9gCUb5IHxF2TK20zJs.VyuUVRcAkcIcm9E2h4SwRLcZwjnG.Tc1XW', 'student', 'CAI', '22A81A4350', '9490043898');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.99, 9.38, 8.46, 8.8, 8.74, 9.3, 9.02, 9.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('RAPAKA DIVYA', '22a81a4351@sves.org.in', '$2y$12$OEYmQohNKB4OVBuEsKh64e2uT9sFQd4Qlc/q2YIwAl4ZEXcffhn0i', 'student', 'CAI', '22A81A4351', '9963099088');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.99, 9.23, 8.92, 9.14, 8.88, 8.74, 9.16, 8.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ROWTHULA VARSHINI', '22a81a4352@sves.org.in', '$2y$12$l6TxAKfdPn0ORqs0UA3IReRKgOnOLBzzeO5kVwSP97Gmn2sHC1GVW', 'student', 'CAI', '22A81A4352', '8247336585');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.42, 8.15, 7.77, 8.53, 8.58, 8.46, 9.02, 8.35, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SINGAMSETTI SYAMANTH UMA SAI KIRAN', '22a81a4353@sves.org.in', '$2y$12$2SxkDIZ33E04L6wxYxQLRuYPHeuvh30FEDyCivnwAd7AonNOKvG9K', 'student', 'CAI', '22A81A4353', '7671888674');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.61, 9.0, 7.69, 8.69, 8.61, 8.88, 8.46, 8.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SAKILE BALU MAHENDRA', '22a81a4355@sves.org.in', '$2y$12$Cul4z9pZoTTuG6aRDBE4ue/dCUZDtSY2lATw0JB.jG.wUvDFBGTcq', 'student', 'CAI', '22A81A4355', '9491919575');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.28, 8.77, 8.15, 8.2, 7.91, 8.33, 8.61, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SALADI DEEPIKA', '22a81a4356@sves.org.in', '$2y$12$FaTZK.yZXIJ01hJzuDXE1u8Jf2MSKxNQGI8FVD6B13r3AG7qUKmzy', 'student', 'CAI', '22A81A4356', '9392499985');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.28, 9.62, 8.92, 9.29, 8.65, 9.72, 9.72, 9.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SARIKA CHANDU SRI VENKATA PAVAN KUMAR', '22a81a4357@sves.org.in', '$2y$12$TEraQmeevxFEp2nAzt618eOhKJJqA8OUcDfbyTOSwwNHp3Nf77ek.', 'student', 'CAI', '22A81A4357', '9014664141');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.18, 8.15, 7.62, 8.04, 7.7, 8.86, 8.21, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SIDDHA VINAY KUMAR', '22a81a4359@sves.org.in', '$2y$12$IdGLjWBd5eZmGpZ6roCAYOxg2v7AJfsZyHx2MfSV7OJjXu5vBg7dq', 'student', 'CAI', '22A81A4359', '9849372827');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.02, 9.38, 9.08, 8.71, 8.74, 9.3, 9.16, 8.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('TATINI PRUDHVI SARANYA', '22a81a4361@sves.org.in', '$2y$12$sEKEgbp76peEHio/x15wxeT88Jj3vbbPxGT.ecGc9kFPLGsMZjtxC', 'student', 'CAI', '22A81A4361', '6301669596');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.79, 9.08, 8.46, 9.0, 8.33, 8.88, 8.88, 8.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('THOTA AMRUTHA SINDHU', '22a81a4362@sves.org.in', '$2y$12$noKvBWPginU/DgyzUBVXCubxE5MiObI1BLIJPcR5Y1oupSHdF.N4e', 'student', 'CAI', '22A81A4362', '8919239911');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9, 9.69, 9.0, 9.18, 8.74, 9.02, 8.88, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VEERABATTHULA SAI CHANDANA', '22a81a4364@sves.org.in', '$2y$12$f4gZ4pTymcTfqMof1DeShOPVHlRsQpy4qr9t0JAgu7RosW2hMJj7a', 'student', 'CAI', '22A81A4364', '9581356416');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.01, 9.31, 8.69, 8.9, 8.74, 9.3, 9.16, 8.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VUDATHA PAVANI SRI LAKSHMI SAVITHRI', '22a81a4365@sves.org.in', '$2y$12$3fDLLsYIliSF7hXhDUwjGOFnpwzGoPTfBpOl8VMIlIoB3Nls9gB/u', 'student', 'CAI', '22A81A4365', '9951251096');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.96, 9.38, 8.92, 9.35, 8.3, 9.3, 9.16, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ADDAGALLA REKHA SREE LAKSHMI HARI PRIYA', '22a81a4367@sves.org.in', '$2y$12$QxijadEeKC3JcEd5QqK8pORTjEv/g4mJQlbUgLiuFsmVVEi/7pIj2', 'student', 'CAI', '22A81A4367', '9441912666');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.58, 8.77, 8.0, 8.98, 8.26, 8.54, 8.81, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('AINAPURAPU L M DATHA BHASKARA GOPAL', '22a81a4368@sves.org.in', '$2y$12$XQU91bAJQt/BtT5nyR2OC.MAEhjcSeucMR3xk7chsaZcIqXX3/VF2', 'student', 'CAI', '22A81A4368', '7569882778');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.19, 8.54, 7.77, 8.1, 7.91, 8.61, 8.54, 7.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ALLADI PRIYA VARSHINI BHANU SREE', '22a81a4370@sves.org.in', '$2y$12$EUrl7Qr8iWBHWzLKf4zjR.fnjQCFSk7HmgHVBob2lnvMAIlwZLZD6', 'student', 'CAI', '22A81A4370', '9959299885');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.54, 9.0, 7.23, 8.45, 8.19, 8.95, 9.3, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ALLI VENKATA SAI SURYA DIWAKAR', '22a81a4371@sves.org.in', '$2y$12$8S40bjvHFOAS0qu.heYdq.1W6K7U9827LsZw/3MAPhTYrlpLbxo5C', 'student', 'CAI', '22A81A4371', '6302722352');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.11, 9.31, 8.92, 9.41, 9.02, 9.07, 9.3, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('AMBADIPUDI ABRAHAM KRUPA KIRAN SARMA', '22a81a4372@sves.org.in', '$2y$12$/iNaolU9b8EgBl5BwVD4cOXDi.61UPIjq6PutHrROXp.TKLNhEuDm', 'student', 'CAI', '22A81A4372', '9391115911');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.21, 8.46, 7.23, 8.04, 7.77, 8.81, 8.46, 8.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('AVULA KRISHNA VENKATA KOUSHIK', '22a81a4374@sves.org.in', '$2y$12$ckO4U4nrEmYA9JgEOatqR.Elki734aWBb8GNEjfae8EW9m2KkbA2K', 'student', 'CAI', '22A81A4374', '7382484830');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.25, 8.62, 7.77, 8.69, 7.56, 8.23, 8.54, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BATHULA SAI CHARAN', '22a81a4375@sves.org.in', '$2y$12$DWBvIuvdU.Xs9c7AbmK29OxhgXhc3L7MKhnnfHPVfiFkO1BXGg/CK', 'student', 'CAI', '22A81A4375', '6309444011');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.99, 9.38, 8.69, 9.06, 8.74, 9.0, 9.09, 8.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BATTELANKA PARASURAM SAI KUMAR', '22a81a4376@sves.org.in', '$2y$12$5Hw3jIoqJEhJhfk304Pk3eZSPa5CVYYEAUCJNJI2QtkH/8S/TIuj.', 'student', 'CAI', '22A81A4376', '6303598606');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.99, 8.62, 7.0, 7.92, 7.28, 7.81, 8.54, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BUDDIGA SRIRAM', '22a81a4377@sves.org.in', '$2y$12$ah1p14USeXsfftM4.xhAueVuZ3.cbhpITTiHX2z7B5EaS3olmcq.O', 'student', 'CAI', '22A81A4377', '9032881413');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.28, 8.62, 7.69, 8.71, 8.05, 8.19, 8.67, 7.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('CHINIMILLI GNANA DEVI PRASANNA', '22a81a4378@sves.org.in', '$2y$12$JNt2M/K3HIwpIcHCCG1k3uofySlaoMwz6aQ167ntyCe13mjY23V12', 'student', 'CAI', '22A81A4378', '6281659967');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.01, 8.08, 7.77, 8.22, 7.77, 7.67, 8.19, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DANDAMUDI VARUN', '22a81a4379@sves.org.in', '$2y$12$KBGFB2PhG2ZDUTXu3dgEieazVOhRnv3NMSPlBjVV1JxMm8/Z1q5Ju', 'student', 'CAI', '22A81A4379', '8309352741');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.49, 9.08, 8.0, 8.47, 7.98, 8.88, 8.33, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DWARAMPUDI LOKESH ADHIREDDY', '22a81a4381@sves.org.in', '$2y$12$LvqvG5WNJvf4U.xw..OtguFHhCzy.90Sayceg80JJB7zzpCafIwFK', 'student', 'CAI', '22A81A4381', '9391598334');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.31, 9.0, 7.85, 8.57, 8.33, 8.02, 7.98, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GODITI SRI DEEPTI', '22a81a4384@sves.org.in', '$2y$12$Goyo2mMdpaoAb1yVFDF0weh9y6kx4/SaWnkc0WD5N7.SLgLW1hxTK', 'student', 'CAI', '22A81A4384', '8260936009');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.79, 9.23, 7.92, 9.06, 8.81, 8.74, 9.02, 8.65, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GRANDHI DILEEP KUMAR', '22a81a4385@sves.org.in', '$2y$12$vuuTm1zReAB31UETySr0P.8BZmSlfU8Hp7RkpFoEFy.1pKI66hdoS', 'student', 'CAI', '22A81A4385', '9848576525');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.53, 8.92, 8.15, 8.71, 8.05, 9.02, 8.46, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('GUDIMELLA PAVANI VAISHNAVI', '22a81a4386@sves.org.in', '$2y$12$KxBRZiHO6lKtICbow03nYuqrfcjyjngZuWoVvPHOwa6AwlV60FvhO', 'student', 'CAI', '22A81A4386', '9014756327');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.41, 9.38, 7.77, 8.69, 8.19, 8.19, 8.61, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('JAVVADI HARSHITHA', '22a81a4389@sves.org.in', '$2y$12$WqYThRmqYVNcXEmktuProO.xVRNWYXBjAJ04NGKg97Fwjb0JGsNai', 'student', 'CAI', '22A81A4389', '6281732203');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.8, 9.38, 8.77, 8.94, 8.26, 9.16, 8.88, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('JAYAVARAPU RAHITYA', '22a81a4390@sves.org.in', '$2y$12$iiB94sfS7oziV3SjJfC5M.8Hztv.czkjeisc36mKwBD1Xxt49/7FS', 'student', 'CAI', '22A81A4390', '6304919558');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.83, 9.23, 8.69, 8.86, 9.02, 9.02, 8.54, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KANTAMSETTI PUJITHA JYOTHI', '22a81a4393@sves.org.in', '$2y$12$7ZjMVx4Sq3Vhygp7meFc4ejB//N.W7C04eEKWnUeriTn7H0XDXbDm', 'student', 'CAI', '22A81A4393', '7989474795');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.22, 9.54, 9.0, 9.41, 9.09, 9.35, 9.16, 8.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KONDETI GAYATHRI VARAPRASADHINI', '22a81a4395@sves.org.in', '$2y$12$F90MhnQCGhQimEyj8XUrvOUBVi6IaPP1rGp98h7OaH8kapG2pGv/G', 'student', 'CAI', '22A81A4395', '9912553797');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.62, 9.23, 8.54, 8.59, 8.26, 9.07, 8.46, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('KUNCHE MOUNIKA', '22a81a4397@sves.org.in', '$2y$12$xUq.RytqcqpGbu92lv6WDeMLZvgzufpEwup0fbipO68eI.co6v5Gm', 'student', 'CAI', '22A81A4397', '9912941833');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.45, 9.15, 7.38, 8.63, 8.26, 9.02, 8.54, 8.09, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('LINGAMPALLI BHARGAV SAI', '22a81a4398@sves.org.in', '$2y$12$hkZE6S35vjbbPuPbwUmWf.2w.YEiBtwQ2R2ov5rQyPnn6alCTiAQy', 'student', 'CAI', '22A81A4398', '9390192684');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.46, 9.15, 8.23, 8.94, 7.42, 8.93, 8.12, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MAIPALA CHIRANJEEVI', '22a81a4399@sves.org.in', '$2y$12$qD/RPn5hKfANBDS/WCSAHeyG/VBN2pMJD25lfDFT081F7qBhl67mC', 'student', 'CAI', '22A81A4399', '9121859628');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.91, 9.38, 8.54, 9.18, 8.67, 9.07, 8.95, 8.57, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MANGINA PAVAN KUMAR PURNAYYA', '22a81a43a1@sves.org.in', '$2y$12$LaTrJXRqxCOxDJlHNHtJ1eMoJR5pYS5Q1QorIevMk0j8d62JOw.Ce', 'student', 'CAI', '22A81A43A1', '6281406054');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.68, 9.0, 8.23, 8.71, 8.33, 9.28, 8.46, 8.74, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MEDANKULA TEJASWIN', '22a81a43a2@sves.org.in', '$2y$12$X9MRY734OjXsJd9UZKL8pOccUSTiGuwW5yEp7/ApIrLkdNI4MGB.K', 'student', 'CAI', '22A81A43A2', '8639432353');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.37, 9.08, 8.0, 8.47, 8.26, 8.02, 8.54, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NETHI SRI CHARAN MANI MALLESH', '22a81a43a5@sves.org.in', '$2y$12$obQhOJtbzvAua0fg3DaYh.WDlmpyyJGYTFNfJ3CPlx44nRv9J2NYW', 'student', 'CAI', '22A81A43A5', '6301908108');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.89, 9.54, 8.85, 9.18, 8.39, 9.23, 8.39, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NILLA NANDINI VEERA NAGA LAKSHMI', '22a81a43a8@sves.org.in', '$2y$12$nujJ/JokA4bpblkrzLyw/O69Tmpj5t/lHaZ8YVUc.E2DPjXVbkxjy', 'student', 'CAI', '22A81A43A8', '7032459373');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.07, 9.54, 9.0, 8.94, 8.61, 9.42, 9.16, 8.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PASAM HEMA PAVANI SAI DURGA', '22a81a43a9@sves.org.in', '$2y$12$O/9CDQrB4f9lTvI/bulfeeIUTMlh4oVrZr71EMz3SWV/rOIMPaHli', 'student', 'CAI', '22A81A43A9', '9885155678');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.8, 9.08, 9.0, 8.75, 8.67, 8.72, 8.74, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PADILAM SAI RAM', '22a81a43b0@sves.org.in', '$2y$12$G.VCs4tSFtR2IbrNh3M1WOqz9zk8Fak/x5Zf9oN8VXc4r45NoqItq', 'student', 'CAI', '22A81A43B0', '7207385947');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.65, 9.08, 7.85, 8.71, 8.46, 8.39, 9.09, 8.91, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PASUMARTHI HIMANTH NAGA CHARAN', '22a81a43b1@sves.org.in', '$2y$12$XP220zqUIek0Gt.yzMfGZ.C/EXDNdyIyHGpPuvgMpYyn2S5jNPKMG', 'student', 'CAI', '22A81A43B1', '6300114947');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.09, 9.69, 8.92, 9.04, 9.02, 9.21, 8.95, 8.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PATURI JAYASREE', '22a81a43b2@sves.org.in', '$2y$12$ZyNlL/vZZXHia3O0SAQ2sOBAUjUXNYu5kBuZqQP9X1k4NJEyBB9h.', 'student', 'CAI', '22A81A43B2', '9030798879');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.49, 9.38, 8.08, 8.71, 7.77, 8.81, 8.81, 7.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PERUMALLA NITHIN', '22a81a43b4@sves.org.in', '$2y$12$NPmqxiF9p18ZCp/rbD.JbOgRolCSm7xsfgAVAbuIpEmXCzk9aN4/W', 'student', 'CAI', '22A81A43B4', '6304550067');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.16, 9.0, 7.69, 8.33, 7.98, 8.51, 7.98, 7.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PINNINTI DEEPTHI MAI', '22a81a43b5@sves.org.in', '$2y$12$UGzINLt30IJcJMR5FP0qPeqOAaCfZj5OLHc04iWqX/CYg2pWgz73C', 'student', 'CAI', '22A81A43B5', '9390987468');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.22, 9.69, 9.0, 9.18, 9.02, 9.77, 9.16, 8.83, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('POKALA SAI KARTHIK', '22a81a43b6@sves.org.in', '$2y$12$fXGvRsWg708QksmonAFCUutqXPcK8wDxpZ20CULXS5GLolB/tnrLG', 'student', 'CAI', '22A81A43B6', '7093592711');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.88, 9.62, 8.62, 8.77, 8.46, 8.79, 9.02, 8.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SAMAYAMANTHULA SWARNA SRI', '22a81a43b8@sves.org.in', '$2y$12$k3s1MTIe8VrRbeCGgIkVzuxPqAHf.yIku77esIZ3Ww9Alaz21hLGC', 'student', 'CAI', '22A81A43B8', '9110352849');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.54, 9.38, 8.31, 8.57, 8.33, 8.72, 8.33, 8.22, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SANNAYILA DEEPTHI', '22a81a43b9@sves.org.in', '$2y$12$p6sxWW6ZEy6z.nMh4Sza1.XONqo6NEHSh00pXd8V1TGmHhYkyzn.G', 'student', 'CAI', '22A81A43B9', '9381698422');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.81, 9.15, 8.38, 9.06, 8.33, 9.35, 8.88, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SURAVARAPU MANASA VALLI', '22a81a43c1@sves.org.in', '$2y$12$IFLxEbX1x9qarAmldLFuoOVRYMGP0FsASNI9wOrhNUIQwvb21/4dC', 'student', 'CAI', '22A81A43C1', '8328252833');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.96, 9.23, 9.15, 9.29, 8.67, 9.21, 8.88, 8.3, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('SUTHAPALLI YASWANTH SRINIVAS GUPTHA', '22a81a43c2@sves.org.in', '$2y$12$9GsNCm8df7PPyeer.zb5VuPYnqWbGTHy9QslyPYJtm6WFlHD1mUI2', 'student', 'CAI', '22A81A43C2', '8919645848');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.69, 9.15, 8.46, 9.06, 8.26, 8.74, 9.16, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('UDISI RINA SAI LAKSHMI PRASANNA', '22a81a43c3@sves.org.in', '$2y$12$0CbxdqcjmZVV3swTZKP68ufbQwYHcnYZ9X2rmoDBSEvy65jZLGqz2', 'student', 'CAI', '22A81A43C3', '9154556856');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9, 9.46, 8.62, 9.18, 8.81, 9.21, 9.23, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('ULASA KIRAN ADITYA', '22a81a43c4@sves.org.in', '$2y$12$rCJVmZZN5cInnkOthvm6huBowdc7egYOvINLfhHyUSt8f6Fa2HYDm', 'student', 'CAI', '22A81A43C4', '7330950541');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.63, 9.0, 7.62, 8.65, 8.61, 9.0, 9.09, 8.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VADDI AMRUTHA', '22a81a43c5@sves.org.in', '$2y$12$RxMC07sBAlPHEz9jLaVkIOHWkEPn6MiZJw.G/7FZvExPpUVr0JhNW', 'student', 'CAI', '22A81A43C5', '9502973428');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.03, 8.92, 7.77, 8.57, 7.49, 7.81, 8.05, 7.61, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VALLURI TEJASWI', '22a81a43c7@sves.org.in', '$2y$12$5gmTJPTDAHYd01ZyO9tmNODtBrZhaGiFoIsb3l.xWpHSc5x4EEgfW', 'student', 'CAI', '22A81A43C7', '6301342247');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.88, 7.46, 6.85, 8.04, 7.98, 8.51, 8.33, 7.87, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VEEDHI SONY', '22a81a43c8@sves.org.in', '$2y$12$yW2b5iy6I6AMJveUcnNbFeC0D1hbTcsSlXV3ssa1SzhvuYjknwurW', 'student', 'CAI', '22A81A43C8', '8639033911');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8, 7.15, 7.08, 8.22, 8.19, 8.65, 8.26, 8.26, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('VEERAVALLI SATISH', '22a81a43c9@sves.org.in', '$2y$12$UJgQinZ1hMmj./QOpf/d.OipwQ/jtetV8eN1ALC.f2tOiyjp5vDL6', 'student', 'CAI', '22A81A43C9', '6303811212');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.87, 8.15, 7.0, 8.1, 7.7, 8.09, 7.98, 7.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('Y GOPI PRADEEP KUMAR', '22a81a43d0@sves.org.in', '$2y$12$aKLnYbganDaR3tmKgEb1uewsxWD8e7sYWAo12wJ.0WgQ/QDZU2f1.', 'student', 'CAI', '22A81A43D0', '7093776351');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.22, 9.69, 9.0, 9.23, 8.61, 9.58, 9.44, 9.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('BANDI SEERSHIKA', '23a85a4301@sves.org.in', '$2y$12$zxp5OCNt7OwOiOXZgQM84u5PT2M/G27gEfuthT4DjnHqT91C2sEAG', 'student', 'CAI', '23A85A4301', '7670846135');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.58, NULL, NULL, 8.65, 7.91, 8.88, 8.74, 8.7, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('DAKSHANADI KOWSALYA', '23a85a4302@sves.org.in', '$2y$12$MxdYEsGs.7XsqH6LeaDrp.IcyFRl9ngQFwq2Ep6NkzZf9YaG1nI2u', 'student', 'CAI', '23A85A4302', '8121056974');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 9.03, NULL, NULL, 9.0, 8.74, 9.02, 9.16, 9.17, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('IMANDI HEMANTH MEHER SRI RAM KUMAR', '23a85a4303@sves.org.in', '$2y$12$Ql2bmXMfuJSE.YI3a0SoSePpCSfTibrukfffg.nTsa97dUOQTsDSO', 'student', 'CAI', '23A85A4303', '7981836768');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.27, NULL, NULL, 8.41, 7.35, 8.44, 8.58, 8.48, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MURALA SASIDHAR', '23a85a4305@sves.org.in', '$2y$12$82S5186oPRkJ6.yVR6YEnuSF2fEH/CFWINPqpx.MnOCyOdJJCWKoa', 'student', 'CAI', '23A85A4305', '9492593121');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.17, NULL, NULL, 7.41, 6.37, 7.07, 7.51, 7.39, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('MADDALA AAKASH', '23a85a4307@sves.org.in', '$2y$12$Oim0vh7dOkpNpYRgav889e195YGA0WhmpIXSeNH719G3J5cyi2xZm', 'student', 'CAI', '23A85A4307', '9603446337');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.39, NULL, NULL, 8.71, 8.26, 8.26, 8.67, 8.0, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('NANDAM MOHANA ADITYA', '23a85a4309@sves.org.in', '$2y$12$B.Y6anOfS8pHtwl64sNtIuDQCBwLscpKVV9udKU4fd0EM6rqvTuw.', 'student', 'CAI', '23A85A4309', '6303661939');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 7.89, NULL, NULL, 8.1, 7.7, 7.67, 7.98, 7.96, NULL);

INSERT INTO users (name, email, password, role, department, roll_number, contact_number) VALUES ('PONDURU TRIVENI', '23a85a4311@sves.org.in', '$2y$12$xPnwu27hUwcWhBpGwMkLQu1vCeftPkWE0UWcjOqiIbh4sQckSB/7S', 'student', 'CAI', '23A85A4311', '9346109647');
SET @last_id = LAST_INSERT_ID();
INSERT INTO academic_records (user_id, cgpa, sgpa_sem1, sgpa_sem2, sgpa_sem3, sgpa_sem4, sgpa_sem5, sgpa_sem6, sgpa_sem7, sgpa_sem8) VALUES (@last_id, 8.73, NULL, NULL, 9.06, 8.12, 8.74, 9.02, 8.61, NULL);
