-- ============================================================
--  College Database — Updates
--  1. Add course_code column to Courses
--  2. Set course_code for all 18 courses
--  3. Update Exams: new max_mark & weight values
--  4. Update Attempt marks scaled to new max_marks
-- ============================================================

USE college;

-- ============================================================
-- 1. ADD course_code COLUMN
--    Format: 3-letter dept prefix + 3-digit number  e.g. CSC101
-- ============================================================

ALTER TABLE Courses
    ADD COLUMN course_code VARCHAR(7) UNIQUE AFTER course_id;


-- ============================================================
-- 2. SET course_code FOR ALL 18 COURSES
--    Dept prefixes:
--      CS  → CSC   |  EE → ELE   |  BA → BUS
--      BME → BME   |  MC → MED
-- ============================================================

-- Computer Science
UPDATE Courses SET course_code = 'CSC101' WHERE course_id = 1;  -- Programming Fundamentals
UPDATE Courses SET course_code = 'CSC102' WHERE course_id = 2;  -- Data Structures
UPDATE Courses SET course_code = 'CSC103' WHERE course_id = 3;  -- Database Systems
UPDATE Courses SET course_code = 'CSC104' WHERE course_id = 4;  -- Algorithms Analysis

-- Electrical Engineering
UPDATE Courses SET course_code = 'ELE101' WHERE course_id = 5;  -- Circuit Analysis
UPDATE Courses SET course_code = 'ELE102' WHERE course_id = 6;  -- Digital Electronics
UPDATE Courses SET course_code = 'ELE103' WHERE course_id = 7;  -- Signals & Systems
UPDATE Courses SET course_code = 'ELE104' WHERE course_id = 8;  -- Control Systems

-- Business Administration
UPDATE Courses SET course_code = 'BUS101' WHERE course_id = 9;  -- Principles of Management
UPDATE Courses SET course_code = 'BUS102' WHERE course_id = 10; -- Marketing Fundamentals
UPDATE Courses SET course_code = 'BUS103' WHERE course_id = 11; -- Accounting Basics

-- Biomedical Engineering
UPDATE Courses SET course_code = 'BME101' WHERE course_id = 12; -- Human Anatomy
UPDATE Courses SET course_code = 'BME102' WHERE course_id = 13; -- Medical Imaging
UPDATE Courses SET course_code = 'BME103' WHERE course_id = 14; -- Biomedical Signals

-- Media & Communication
UPDATE Courses SET course_code = 'MED101' WHERE course_id = 15; -- Media Writing
UPDATE Courses SET course_code = 'MED102' WHERE course_id = 16; -- Broadcasting Techniques
UPDATE Courses SET course_code = 'MED103' WHERE course_id = 17; -- Digital Journalism
UPDATE Courses SET course_code = 'MED104' WHERE course_id = 18; -- Public Relations


-- ============================================================
-- 3. UPDATE EXAM max_mark AND weight
--
--    New schema (total = 95, weights reflect importance):
--      Quiz        max_mark =  5   weight = 10
--      Assignment  max_mark = 10   weight = 15
--      Midterm     max_mark = 20   weight = 25
--      Project     max_mark = 10   weight = 15
--      Final       max_mark = 50   weight = 35
--
--    We use exam_type to do it in 5 clean bulk UPDATEs
--    (all courses share the same structure).
-- ============================================================

UPDATE Exams SET max_mark =  5,  weight = 10.00 WHERE exam_type = 'Quiz';
UPDATE Exams SET max_mark = 10,  weight = 15.00 WHERE exam_type = 'Assignment';
UPDATE Exams SET max_mark = 20,  weight = 25.00 WHERE exam_type = 'Midterm';
UPDATE Exams SET max_mark = 10,  weight = 15.00 WHERE exam_type = 'Project';
UPDATE Exams SET max_mark = 50,  weight = 35.00 WHERE exam_type = 'Final';


-- ============================================================
-- 4. RESCALE ATTEMPT MARKS TO FIT NEW max_marks
--
--    Formula:  new_mark = ROUND( old_mark / old_max * new_max, 2 )
--
--    Old → New max_mark per type:
--      Quiz        10  →  5    (scale × 0.5)
--      Assignment  10  → 10    (unchanged)
--      Midterm     25  → 20    (scale × 0.8)
--      Project     15  → 10    (scale × 0.6667)
--      Final      100  → 50    (scale × 0.5)
--
--    We JOIN Attempt → Exams to reach exam_type in one pass.
-- ============================================================

-- Quiz  (old max 10 → new max 5)
UPDATE Attempt a
JOIN   Exams   e ON a.exam_id = e.exam_id
SET    a.mark = ROUND(a.mark / 10 * 5, 2)
WHERE  e.exam_type = 'Quiz';

-- Assignment  (old max 10 → new max 10, no change needed)
-- Included for completeness / explicit confirmation
UPDATE Attempt a
JOIN   Exams   e ON a.exam_id = e.exam_id
SET    a.mark = ROUND(a.mark / 10 * 10, 2)
WHERE  e.exam_type = 'Assignment';

-- Midterm  (old max 25 → new max 20)
UPDATE Attempt a
JOIN   Exams   e ON a.exam_id = e.exam_id
SET    a.mark = ROUND(a.mark / 25 * 20, 2)
WHERE  e.exam_type = 'Midterm';

-- Project  (old max 15 → new max 10)
UPDATE Attempt a
JOIN   Exams   e ON a.exam_id = e.exam_id
SET    a.mark = ROUND(a.mark / 15 * 10, 2)
WHERE  e.exam_type = 'Project';

-- Final  (old max 100 → new max 50)
UPDATE Attempt a
JOIN   Exams   e ON a.exam_id = e.exam_id
SET    a.mark = ROUND(a.mark / 100 * 50, 2)
WHERE  e.exam_type = 'Final';
