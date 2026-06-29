cmake_minimum_required(VERSION 4.2)
project(College_Database_Management_Program)

set(CMAKE_CXX_STANDARD 14)

include_directories(include)

add_executable(College_Database_Management_Program
        .idea/.gitignore
        ".idea/College Database Management Program.iml"
        .idea/material_theme_project_new.xml
        .idea/modules.xml
        .idea/workspace.xml
        "docs/College Relational Schema.png"
        docs/College_ER_Diagram.pdf
        "docs/Database Outline.pdf"
        sql/sample_queries.sql
        sql/schema.sql
        sql/seed.sql
        src/Database.cpp
        include/Database.h
        src/Students.cpp
        include/Students.h
        src/Courses.cpp
        include/Courses.h
        src/Departments.cpp
        include/Departments.h
        src/Enrollment.cpp
        include/Enrollment.h
        src/Exams.cpp
        include/Exams.h
        src/Attempt.cpp
        include/Attempt.h
        src/main.cpp
)
