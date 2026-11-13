-- Part 1: Create tables

CREATE TABLE students (
    student_id INTEGER PRIMARY KEY,
    student_name TEXT NOT NULL,
    student_email TEXT NOT NULL UNIQUE
);

CREATE TABLE tutoring_requests (
    request_id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    course TEXT NOT NULL,
    topic TEXT NOT NULL,
    preferred_date TEXT NOT NULL,
    preferred_time TEXT NOT NULL,
    status TEXT NOT NULL DEFAULT 'Open',
    created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);
-- Part 2: Insert students

INSERT INTO students (student_name, student_email)
VALUES
('Jordan Lee', 'jordan.lee@utah.edu'),
('Avery Patel', 'avery.patel@utah.edu');

-- Insert tutoring requests
INSERT INTO tutoring_requests
(student_id, course, topic, preferred_date, preferred_time)
VALUES
(1, 'IS 6465', 'HTML Forms', '2026-11-20', '10:00 AM'),
(1, 'IS 6465', 'SQL SELECT', '2026-11-22', '1:00 PM'),
(2, 'IS 6465', 'SQLite CRUD', '2026-11-24', '2:00 PM');

-- Part 3: Read the stored data

-- 1. Display all students
SELECT * FROM students;

-- 2. Display all tutoring requests
SELECT * FROM tutoring_requests;

-- 3. Display only Open requests
SELECT * FROM tutoring_requests
WHERE status = 'Open';

-- 4. Display one request using request_id
SELECT * FROM tutoring_requests
WHERE request_id = 1;

-- 5. Display requests with student information using JOIN
SELECT
    tutoring_requests.request_id,
    students.student_name,
    students.student_email,
    tutoring_requests.course,
    tutoring_requests.topic,
    tutoring_requests.preferred_date,
    tutoring_requests.preferred_time,
    tutoring_requests.status
FROM tutoring_requests
JOIN students
ON tutoring_requests.student_id = students.student_id
ORDER BY tutoring_requests.preferred_date;

-- Part 4: Update one request

UPDATE tutoring_requests
SET topic = 'HTML Forms'
WHERE request_id = 1;

-- Cancel Avery's request

UPDATE tutoring_requests
SET status = 'Cancelled'
WHERE request_id = 3;

-- Part 5: Delete one test request

-- Insert a test request
INSERT INTO tutoring_requests
(student_id, course, topic, preferred_date, preferred_time)
VALUES
(1, 'IS 6465', 'Delete Practice', '2026-11-26', '3:00 PM');

-- Delete the test request
DELETE FROM tutoring_requests
WHERE request_id = 4;

-- Verify that the test request was deleted
SELECT * FROM tutoring_requests;