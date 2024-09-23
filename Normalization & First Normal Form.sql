--First Normal Form (1NF)
CREATE TABLE StudentsCourses_1NF (
    StudentID INT,
    StudentName NVARCHAR(50),
    Course NVARCHAR(50),
    Instructor NVARCHAR(50),
    PRIMARY KEY (StudentID, Course, Instructor)
);

INSERT INTO StudentsCourses_1NF (StudentID, StudentName, Course, Instructor) VALUES
(1, 'Alice', 'Math', 'Prof. Smith'),
(1, 'Alice', 'Science', 'Prof. Jones'),
(2, 'Bob', 'History', 'Prof. Brown'),
(3, 'Charlie', 'Math', 'Prof. Smith'),
(3, 'Charlie', 'History', 'Prof. Brown'),
(3, 'Charlie', 'Art', 'Prof. Taylor');

SELECT * FROM StudentsCourses_1NF;

--Second Normal Form (2NF)
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName NVARCHAR(50)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    Course NVARCHAR(50)
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    Instructor NVARCHAR(50)
);

CREATE TABLE StudentCourses (
    StudentID INT,
    CourseID INT,
    InstructorID INT,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

INSERT INTO Students (StudentID, StudentName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie');

INSERT INTO Courses (CourseID, Course) VALUES
(1, 'Math'),
(2, 'Science'),
(3, 'History'),
(4, 'Art');

INSERT INTO Instructors (InstructorID, Instructor) VALUES
(1, 'Prof. Smith'),
(2, 'Prof. Jones'),
(3, 'Prof. Brown'),
(4, 'Prof. Taylor');

INSERT INTO StudentCourses (StudentID, CourseID, InstructorID) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 3),
(3, 1, 1),
(3, 3, 3),
(3, 4, 4);

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Instructors;
SELECT * FROM StudentCourses;
