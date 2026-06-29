# 🎓 College Database Management System

A professional Student Management System built using **C++** and **MySQL**, designed to simulate a real university database system. The project follows proper **Database Design** principles starting from an **Entity-Relationship (ER) Diagram**, converting it into a **Relational Schema**, implementing the database in **MySQL**, and finally integrating it with a modular **C++ application**.

> This project is currently under active development.

---

# 📖 Overview

This project aims to demonstrate the complete software development workflow for a database-driven application.

Instead of storing data in text files or arrays, all information is stored inside a relational database using MySQL.

The application manages:

- Students
- Departments
- Courses
- Enrollments
- Exams
- Student Attempts & Grades

and will eventually support GPA calculation, transcript generation, searching, reporting, and more.

---

# 🚀 Features

### Current

- ✅ Entity-Relationship Diagram
- ✅ Relational Schema
- ✅ Database Design
- ✅ Normalized SQL Database
- ✅ Database Constraints
- ✅ Foreign Keys
- ✅ Seed Database
- ✅ Sample SQL Queries

### Planned

- ⏳ MySQL Database Connectivity
- ⏳ Complete C++ Backend
- ⏳ Object-Oriented Design
- ⏳ Student CRUD Operations
- ⏳ Department Management
- ⏳ Course Management
- ⏳ Enrollment System
- ⏳ Exam Management
- ⏳ GPA Calculator
- ⏳ Student Transcript
- ⏳ Reports & Statistics
- ⏳ Authentication
- ⏳ Console Interface

---

# 🏗️ Project Structure

```
College-Management-System/

│
├── docs/
│   ├── ER_Diagram.pdf
│   ├── Relational_Schema.pdf
│   └── Database_Outline.pdf
│
├── sql/
│   ├── schema.sql
│   ├── seed.sql
│   └── sample_queries.sql
│
├── include/
│   ├── Database.h
│   ├── Student.h
│   ├── Department.h
│   ├── Course.h
│   ├── Enrollment.h
│   ├── Exam.h
│   └── Attempt.h
│
├── src/
│   ├── main.cpp
│   ├── Database.cpp
│   ├── Student.cpp
│   ├── Department.cpp
│   ├── Course.cpp
│   ├── Enrollment.cpp
│   ├── Exam.cpp
│   └── Attempt.cpp
│
├── README.md
│
└── LICENSE
```

---

# 🗄️ Database Design

The database was designed following standard database engineering practices.

Development process:

```
Requirements

↓

Entity-Relationship Diagram

↓

Relational Schema

↓

Normalization

↓

MySQL Database

↓

Seed Data

↓

SQL Testing

↓

C++ Integration
```

---

# 📊 Database Entities

The database consists of the following core entities:

- Students
- Departments
- Courses
- Enrollments
- Exams
- Attempts

Relationships include:

- One Department contains many Students
- One Department offers many Courses
- Students enroll in multiple Courses
- Courses contain multiple Exams
- Students attempt multiple Exams

---

# 💾 Technologies Used

### Programming

- C++17

### Database

- MySQL 8+

### Design

- ER Modeling
- Relational Schema Design
- Database Normalization (1NF–3NF)

### Development Tools

- MySQL Workbench
- Visual Studio / VS Code
- Git
- GitHub

---

# 📂 SQL Files

## schema.sql

Contains the complete database schema:

- Tables
- Primary Keys
- Foreign Keys
- Constraints
- Data Types

---

## seed.sql

Populates the database with realistic sample data.

Includes:

- Departments
- Courses
- Students
- Enrollments
- Exams
- Attempts

---

## sample_queries.sql

Contains a collection of SQL queries demonstrating:

- SELECT
- WHERE
- ORDER BY
- GROUP BY
- HAVING
- JOIN
- Aggregate Functions
- Nested Queries
- Reports

---

# 🧩 Planned C++ Architecture

The project follows an Object-Oriented design.

Main classes include:

```
Database
Student
Department
Course
Enrollment
Exam
Attempt
StudentManager
```

Each class is responsible for a single component of the system.

---

# 📈 Planned Features

### Student Module

- Add Student
- Delete Student
- Update Student
- Search Student
- View Student Information

---

### Department Module

- Add Department
- Edit Department
- View Department Statistics

---

### Course Module

- Add Course
- Remove Course
- Assign Department

---

### Enrollment Module

- Enroll Student
- Drop Course
- List Student Courses

---

### Exam Module

- Add Exam
- Record Marks
- Edit Marks

---

### Reports

- Student Transcript
- GPA Calculation
- Department Statistics
- Top Students
- Course Statistics

---

# 🎯 Learning Objectives

This project demonstrates knowledge of:

- Database Design
- ER Modeling
- Relational Databases
- SQL
- Database Normalization
- Object-Oriented Programming
- C++
- Software Engineering
- Git Version Control

---

# 📚 Future Improvements

Future versions may include:

- GUI (Qt)
- Authentication System
- Password Hashing
- CSV Export
- PDF Transcript Generation
- Attendance System
- Instructor Management
- Semester Management
- REST API
- Web Frontend

---
# 📖 Documentation

Project documentation includes:

- Entity-Relationship Diagram
- Relational Schema
- Database Outline
- SQL Schema
- Seed Data
- Sample Queries

These files are available inside the `docs/` and `sql/` directories.

---

# 📌 Project Status

| Component | Status |
|-----------|--------|
| ER Diagram | ✅ Completed |
| Relational Schema | ✅ Completed |
| Database Design | ✅ Completed |
| SQL Schema | ✅ Completed |
| Seed Data | ✅ Completed |
| Sample Queries | ✅ Completed |
| C++ Classes | 🚧 Structure Created |
| MySQL Integration | ⏳ Planned |
| Student Module | ⏳ Planned |
| GPA Calculator | ⏳ Planned |
| Reports | ⏳ Planned |

---

# 🤝 Contributing

Suggestions, improvements, and pull requests are always welcome.

If you discover a bug or have an idea for improving the project, feel free to open an issue.

---

# 📄 License

This project is released under the MIT License.

---

> This repository is part of my software engineering and database systems learning journey. The goal is to build a fully functional, real-world student information system while following industry-standard development practices.
