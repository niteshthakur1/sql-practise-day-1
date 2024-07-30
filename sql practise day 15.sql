CREATE DATABASE SchoolDB;
USE SchoolDB;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    Major VARCHAR(50)
);
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Instructor VARCHAR(100)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Grade CHAR(1),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Students (StudentID, FirstName, LastName, Age, Major) VALUES
(1, 'John', 'Doe', 20, 'Computer Science'),
(2, 'Jane', 'Smith', 22, 'Mathematics'),
(3, 'Emily', 'Johnson', 21, 'Physics');

INSERT INTO Courses (CourseID, CourseName, Instructor) VALUES
(101, 'Introduction to Programming', 'Dr. Alan Turing'),
(102, 'Calculus I', 'Dr. Isaac Newton'),
(103, 'Physics I', 'Dr. Albert Einstein');

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, Grade) VALUES
(1, 1, 101, 'A'),
(2, 2, 102, 'B'),
(3, 3, 103, 'A'),
(4, 1, 102, 'C'),
(5, 2, 103, 'B');

SELECT FIRSTNAME,LASTNAME FROM Students
where major = 'computer science';

SELECT * FROM COURSES
WHERE INSTRUCTOR =  'Dr. Alan Turing';


SELECT FIRSTNAME,LASTNAME
FROM Students
where studentid in(select studentid from enrollments
where courseid = 101);


SELECT avg(AGE)
from students 
where studentid in (select studentid from enrollments where courseid = 102);


SELECT
Students.FirstName, Students.LastName, Courses.CourseName 
FROM ENROLLMENTS
join students ON enrollments.studentid = students.studentid
join courses ON enrollments.courseid = courses.courseid ;

SELECT courses.coursename,count(ENROLLMENTS.courseid) as numberofstudents
FROM ENROLLMENTS
JOIN COURSES ON ENROLLMENTS.courseid = courses.courseid
group by courses.coursename;


SELECT Instructor 
FROM Courses
WHERE CourseID IN (SELECT CourseID FROM Enrollments)
GROUP BY Instructor
HAVING COUNT(DISTINCT CourseID) >= 2;

SELECT Courses.CourseName, Students.FirstName, Students.LastName
FROM Courses
RIGHT JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
RIGHT JOIN Students ON Enrollments.StudentID = Students.StudentID;


SELECT Students.FirstName, Students.LastName, Courses.CourseName
FROM Students
RIGHT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
RIGHT JOIN Courses ON Enrollments.CourseID = Courses.CourseID;


SELECT Courses.CourseName, Courses.Instructor
FROM Courses
LEFT JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
WHERE Enrollments.CourseID IS NULL;

SELECT DISTINCT s2.FirstName, s2.LastName
FROM Enrollments e1
JOIN Students s1 ON e1.StudentID = s1.StudentID
JOIN Enrollments e2 ON e1.CourseID = e2.CourseID
JOIN Students s2 ON e2.StudentID = s2.StudentID
WHERE s1.FirstName = 'John' AND s1.LastName = 'Doe' AND s1.StudentID != s2.StudentID;
