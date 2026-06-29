CREATE DATABASE college;

USE college;

CREATE TABLE Students(
student_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
national_id CHAR(14) UNIQUE,
fname VARCHAR(50) NOT NULL,
lname VARCHAR(50) NOT NULL,
gender ENUM('Male', 'Female') NOT NULL,
birth_date DATE,
email VARCHAR(100) UNIQUE,
phone VARCHAR(20) UNIQUE,
enrollment_year YEAR,
department_id INT UNSIGNED,
FOREIGN KEY ( department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Departments(
department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
department_name VARCHAR(100)
);

CREATE TABLE Courses(
course_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
course_name VARCHAR(50),
credit_hours TINYINT UNSIGNED,
department_id INT UNSIGNED,
FOREIGN KEY ( department_id ) REFERENCES Departments(department_id)
);

CREATE TABLE Exams(
exam_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
exam_type ENUM('Quiz','Midterm','Assignment','Project','Final'),
max_mark TINYINT DEFAULT 100,
weight DECIMAL(5,2),
course_id INT UNSIGNED,
FOREIGN KEY ( course_id ) REFERENCES Courses(course_id)
);

CREATE TABLE Enrollment(
enrollment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
student_id INT UNSIGNED,
course_id INT UNSIGNED,
enrollment_date DATE,
semester ENUM('Summer','Fall','Spring'),
enrollment_status ENUM('Enrolled','Completed','Dropped','Withdrawn'),
FOREIGN KEY ( student_id ) REFERENCES Students(student_id),
FOREIGN KEY ( course_id ) REFERENCES Courses(course_id)
);

CREATE TABLE Attempt(
attempt_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
student_id INT UNSIGNED,
exam_id INT UNSIGNED,
mark DECIMAL(5,2),
attempt_date DATE,
attempt_number TINYINT UNSIGNED,
FOREIGN KEY ( student_id ) REFERENCES Students(student_id),
FOREIGN KEY ( exam_id ) REFERENCES Exams(exam_id)
);
