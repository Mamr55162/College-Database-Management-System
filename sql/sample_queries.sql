USE college;
-- Select all columns from tables --
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Departments;
SELECT * FROM Exams;
SELECT * FROM Enrollment;
SELECT * FROM Attempt;

-- Select specific data using WHERE Clause --
SELECT * FROM Students WHERE student_id = 9;

SELECT * FROM Students WHERE fname = 'Ahmed';

SELECT s.*
FROM Students s
INNER JOIN Departments d ON d.department_id = s.department_id 
WHERE department_name = 'Computer Science';

SELECT * FROM Courses WHERE credit_hours = 3;

SELECT * FROM Exams WHERE exam_type = 'final';

SELECT DISTINCT s.*
FROM Students s
INNER JOIN Enrollment e ON e.student_id = s.student_id
WHERE YEAR(enrollment_date) > 2020;

-- Select specific ordered data using ORDER BY --
SELECT * FROM Students ORDER BY fname;

SELECT * FROM Students ORDER BY enrollment_year;

SELECT * FROM Exams ORDER BY weight;

SELECT * FROM Attempt ORDER BY mark DESC;

-- Select specific manipulated data using Aggregate Functions --
SELECT COUNT(*) AS students_count FROM Students;

SELECT COUNT(*) AS departments_count FROM Departments;

SELECT COUNT(*) AS courses_count FROM Courses;

SELECT AVG(mark) AS average_marks FROM Attempt;

SELECT MAX(mark) AS highest_mark FROM Attempt;

SELECT MIN(mark) AS highest_mark FROM Attempt;

SELECT SUM(credit_hours) AS total_credit_hours FROM Courses;

-- Select specific data using GROUP BY --
SELECT department_id, COUNT(student_id) AS student_count FROM Students GROUP BY department_id;

SELECT d.department_name, 
    COUNT(c.course_id) AS course_count 
FROM 
    Departments d
INNER JOIN 
    Courses c ON d.department_id = c.department_id
GROUP BY 
    d.department_id, 
    d.department_name;
    
SELECT attempt_id, AVG(mark) AS average_marks FROM Attempt GROUP BY attempt_id;

SELECT  c.course_code,
		e.exam_id,
	AVG(a.mark) AS average_mark
FROM 
	Courses c
JOIN
	Exams e ON e.course_id = c.course_id
JOIN
	Attempt a ON a.exam_id = e.exam_id
GROUP BY c.course_id,
		e.exam_id;

SELECT  d.department_id,
		d.department_name,
        AVG(a.mark) AS average_mark
FROM
	Departments d
JOIN
	Students s ON s.department_id = d.department_id
JOIN
	Attempt a ON a.student_id = s.student_id
GROUP BY d.department_name,
		d.department_id;
        
SELECT  d.department_id,
		d.department_name
FROM
	Departments d
JOIN
	Students s ON s.department_id = d.department_id
GROUP BY d.department_id,
		d.department_name
HAVING COUNT(s.student_id) > 5;

WITH StudentCourseTotals AS (
    -- Step 1: Calculate the total marks each student got in each course
    SELECT 
        e.course_id,
        a.student_id,
        SUM(a.mark) AS total_student_mark
    FROM 
        Exams e
    JOIN 
        Attempt a ON e.exam_id = a.exam_id
    GROUP BY 
        e.course_id, 
        a.student_id
)
-- Step 2: Average those total scores across the whole course
SELECT 
    c.course_code,
    c.course_name,
    ROUND(AVG(sct.total_student_mark), 2) AS course_average
FROM 
    Courses c
JOIN 
    StudentCourseTotals sct ON c.course_id = sct.course_id
GROUP BY 
    c.course_id,     -- Grouping by ID is safer than name/code
    c.course_code,
    c.course_name
HAVING 
    AVG(sct.total_student_mark) > 85;
    
WITH StudentCourseTotals AS (
    -- Step 1: Calculate the total marks each student got in each course
    SELECT 
        e.course_id,
        a.student_id,
        SUM(a.mark) AS total_student_mark
    FROM 
        Exams e
    JOIN 
        Attempt a ON e.exam_id = a.exam_id
    GROUP BY 
        e.course_id, 
        a.student_id
)
    
    
SELECT  s.student_id,
		s.fname,
        s.lname,
        ROUND(AVG(sct.total_student_mark), 2) AS overall_average
FROM
	Students s
JOIN
	StudentCourseTotals sct ON s.student_id = sct.student_id
GROUP BY 
    s.student_id,    
    s.fname,
    s.lname
HAVING
	AVG(sct.total_student_mark) > 90;