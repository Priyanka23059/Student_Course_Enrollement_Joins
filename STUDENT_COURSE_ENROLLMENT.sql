CREATE DATABASE StudentCourseDB;
Use StudentCourseDB;
CREATE TABLE Student(
StudentID INT PRIMARY KEY,
NAME VARCHAR(50),
Stream VARCHAR(50));

CREATE TABLE Course(
CourseID INT PRIMARY KEY,
Title VARCHAR(60),
Credits INT);

CREATE TABLE Enrollment (
    StudentID INT,
    CourseID INT,
    Grade VARCHAR(2),
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
INSERT INTO Student VALUES
(1, 'Sony', 'CSE'),
(2, 'Rony', 'ECE'),
(3, 'Ramu', 'EEE'),
(4, 'Ammu', 'IT');

INSERT INTO Course VALUES
(101, 'DBMS', 4),
(102, 'Python', 3),
(103, 'AI', 3),
(104, 'Networks', 3);

INSERT INTO Enrollment VALUES
(1, 101, 'A'),
(1, 102, 'B'),
(2, 103, 'A'),
(3, 104, 'B');

SELECT s.NAME AS StudentName, c.Title AS CourseTitle, e.Grade
FROM Student s
INNER JOIN Enrollment e ON s.StudentID = e.StudentID
INNER JOIN Course c ON e.CourseID = c.CourseID;

SELECT s.NAME AS StudentName, c.Title AS CourseTitle, e.Grade
FROM Student s
LEFT JOIN Enrollment e ON s.StudentID = e.StudentID
LEFT JOIN Course c ON e.CourseID = c.CourseID;
 
SELECT s.NAME AS StudentName, c.Title AS CourseTitle, e.Grade
FROM Student s
RIGHT JOIN Enrollment e ON s.StudentID = e.StudentID
RIGHT JOIN Course c ON e.CourseID = c.CourseID;

-- Step 1: LEFT JOIN (all students + matching courses)
SELECT s.NAME AS StudentName, c.Title AS CourseTitle, e.Grade
FROM Student s
LEFT JOIN Enrollment e ON s.StudentID = e.StudentID
LEFT JOIN Course c ON e.CourseID = c.CourseID

UNION

-- Step 2: RIGHT JOIN (all courses + matching students)
SELECT s.NAME AS StudentName, c.Title AS CourseTitle, e.Grade
FROM Student s
RIGHT JOIN Enrollment e ON s.StudentID = e.StudentID
RIGHT JOIN Course c ON e.CourseID = c.CourseID;
