Part 1: Create the Database Tables

1. Table Names and Schema
The database successfully created two tables: students and tutoring_requests. The tables command displayed:
students     tutoring_requests
The .schema command confirmed that both tables were created with the required columns, primary keys, foreign key, and constraints.
2. Which column is the primary key in each table?
The student_id column is the primary key in the students table. The request_id column is the primary key in the tutoring_requests table.
3. Which column is the foreign key, and what relationship does it represent?
The student_id column in the tutoring_requests table is the foreign key. It connects each tutoring request to the student who submitted it.
4. Why is student_email marked UNIQUE?
The student_email column is marked UNIQUE to prevent multiple student records from using the same email address. This helps avoid duplicate student accounts.

Part 2: Insert Students and Tutoring Requests
1. INSERT Statements
I inserted two students into the students table and three tutoring requests into the tutoring_requests table. Jordan Lee has two requests, while Avery Patel has one request.
2. SELECT Results
The students table contains:
Jordan Lee — jordan.lee@utah.edu
Avery Patel — avery.patel@utah.edu
The tutoring_requests table contains three requests:
Request 1: Jordan Lee — Forms

Request 2: Jordan Lee — SQL SELECT

Request 3: Avery Patel — SQLite CRUD
3. Why does Jordan have one student row but two request rows?
Jordan has one student row because each student only needs to be entered into the database once. Jordan has two request rows because the student can submit multiple tutoring requests. Both requests use the same student_id to connect them to Jordan's student record.

Part 3: Read the stored data
1. JOIN Query
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
The query successfully displayed all three tutoring requests with the student's name, email, course, topic, preferred date, preferred time, and status.
2. What does the JOIN condition connect?
The JOIN condition connects the student_id column in the tutoring_requests table to the student_id column in the students table. This allows the database to match each request with the correct student.
3. What is the difference between JOIN and WHERE?
JOIN combines information from two related tables, while WHERE filters the information based on a specific condition.
4. Why should the application retrieve one request by request_id instead of by topic alone?
The application should use request_id because each request has a unique ID. A topic could be used by multiple students, so searching by topic alone might return more than one request.

Part 4: Update One Request
1. UPDATE Statements
I updated Jordan's first request by changing the topic from Forms to HTML Forms. I also changed Avery's request status from Open to Cancelled.
2. Why is a specific WHERE clause essential in an UPDATE statement?
A WHERE clause is important because it identifies the exact record that needs to be changed. Without it, the UPDATE statement could change every row in the table.
3. Why does the Peer Tutoring Hub use a Cancelled status instead of immediately deleting a real request?
The system uses Cancelled to keep a record of the request. This allows the application to maintain its history instead of permanently removing important information.

Part 5: Delete One Test Request
1. INSERT Statement
I inserted an additional test tutoring request with the topic Delete Practice.
2. DELETE Statement
I used a DELETE statement with a specific request_id to remove only the test request.
3. Verification
After deleting the test request, I used SELECT to verify that it was removed. The original three tutoring requests remained in the database.
4. Why is a WHERE clause essential in a DELETE statement?
A WHERE clause identifies the specific record that needs to be deleted. Without it, the DELETE statement could remove every record in the table.

Part 6: Reflect on the CRUD Workflow
1. CRUD Table

CRUD Action

SQL Statement

Peer Tutoring Hub Example

Create

INSERT

Adding a new student or tutoring request

Read

SELECT

Viewing student information and tutoring requests

Update

UPDATE

Changing a request topic or cancelling a request

Delete

DELETE

Removing a test tutoring request

2. How does the database preserve the connection between a student and that student's requests?
The database uses the student_id foreign key in the tutoring_requests table to connect each request to the correct student in the students table.
3. Which database constraint prevents two student rows from using the same email address?
The UNIQUE constraint prevents two student records from using the same email address.
4. What could happen if an UPDATE or DELETE statement did not include a WHERE clause?
Without a WHERE clause, an UPDATE or DELETE statement could affect every record in the table. This could accidentally change or delete important information.
5. When the application later receives values from an HTML form, why should PHP send those values as parameters instead of placing them directly into SQL text?
PHP should use prepared statements and parameters to protect the database from SQL injection attacks. It also helps ensure submitted information is handled safely.