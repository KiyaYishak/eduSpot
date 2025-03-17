
CREATE DATABASE EduSpot;

-- Use the database
USE EduSpot;

-- Table for storing student data
CREATE TABLE students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for storing teacher data
CREATE TABLE teachers (
    teacher_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for storing uploaded files by teachers
CREATE TABLE files (
    file_id INT AUTO_INCREMENT PRIMARY KEY,
    teacher_id INT,
    student_id INT,
    file_name VARCHAR(255) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- Sample data for students
INSERT INTO students (full_name, username, password, email) 
VALUES 
('Samuel Tesfaye', 'samuel_tesfaye', 'hashed_password_here', 'samuel@example.com'),
('Mekdes Tsegaye', 'mekdes_tsegaye', 'hashed_password_here', 'mekdes@example.com'),
('Haile Gebre', 'haile_gebre', 'hashed_password_here', 'haile@example.com');

-- Sample data for teachers
INSERT INTO teachers (full_name, username, password, email) 
VALUES 
('Marta Getachew', 'marta_getachew', 'hashed_password_here', 'marta@example.com'),
('Yosef Belay', 'yosef_belay', 'hashed_password_here', 'yosef@example.com'),
('Tena Kebede', 'tena_kebede', 'hashed_password_here', 'tena@example.com');

-- Sample data for file uploads by teachers
INSERT INTO files (teacher_id, student_id, file_name, file_path) 
VALUES 
(1, 1, 'database_management.pdf', 'uploads/database_management.pdf'),
(2, 2, 'network_security.pdf', 'uploads/network_security.pdf'),
(3, 3, 'data_structures.pdf', 'uploads/data_structures.pdf');


-- Student login query (example: Samuel Tesfaye)
SELECT * FROM students
WHERE (username = 'samuel_tesfaye' OR email = 'samuel@example.com') 
AND password = 'hashed_password_here';

-- Teacher login query (example: Marta Getachew)
SELECT * FROM teachers 
WHERE username = 'marta_getachew' 
AND password = 'hashed_password_here';





