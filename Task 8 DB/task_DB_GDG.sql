CREATE TABLE Department (
    dept_code VARCHAR(10) PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    building_location VARCHAR(100),
    head_id INT UNIQUE
);

CREATE TABLE Instructor (
    instructor_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2) CHECK (salary > 0),
    hire_date DATE NOT NULL,
    dept_code VARCHAR(10) NOT NULL,
    city VARCHAR(50),
    street VARCHAR(50),
    zip_code VARCHAR(10),
    FOREIGN KEY (dept_code) REFERENCES Department(dept_code)
);

ALTER TABLE Department
ADD CONSTRAINT fk_head
FOREIGN KEY (head_id) REFERENCES Instructor(instructor_id);

CREATE TABLE InstructorPhone (
    instructor_id INT,
    phone VARCHAR(20),
    PRIMARY KEY (instructor_id, phone),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id)
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    street VARCHAR(50),
    zip_code VARCHAR(10)
);

CREATE TABLE StudentPhone (
    student_id INT,
    phone VARCHAR(20),
    PRIMARY KEY (student_id, phone),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
);

CREATE TABLE Course (
    course_code VARCHAR(10) PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    credits INT CHECK (credits > 0),
    dept_code VARCHAR(10),
    FOREIGN KEY (dept_code) REFERENCES Department(dept_code)
);

CREATE TABLE Prerequisite (
    course_code VARCHAR(10),
    prereq_code VARCHAR(10),
    PRIMARY KEY (course_code, prereq_code),
    FOREIGN KEY (course_code) REFERENCES Course(course_code),
    FOREIGN KEY (prereq_code) REFERENCES Course(course_code)
);

CREATE TABLE Dependent (
    dependent_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    name VARCHAR(100),
    birthdate DATE,
    relationship VARCHAR(50),
    FOREIGN KEY (student_id) REFERENCES Student(student_id)
    ON DELETE CASCADE
);

CREATE TABLE Enrollment (
    student_id INT,
    course_code VARCHAR(10),
    enrollment_date DATE,
    final_grade VARCHAR(2),
    PRIMARY KEY (student_id, course_code),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_code) REFERENCES Course(course_code)
);
INSERT INTO Department VALUES
('CS','Computer Science','Building A',NULL),
('IT','Information Technology','Building B',NULL),
('SE','Software Engineering','Building C',NULL),
('IS','Information Systems','Building D',NULL),
('AI','Artificial Intelligence','Building E',NULL);
INSERT INTO Instructor VALUES
(1,'Ahmed Ali',9000,'2020-02-10','CS','Cairo','Nasr','11511'),
(2,'Sara Mohamed',8500,'2019-03-15','CS','Giza','Dokki','12611'),
(3,'Omar Hassan',8000,'2021-01-10','IT','Cairo','Maadi','11728'),
(4,'Mona Adel',8700,'2018-07-21','IT','Alex','Stanley','21544'),
(5,'Khaled Samy',9100,'2017-05-11','SE','Cairo','Heliopolis','11341'),
(6,'Yara Gamal',7600,'2022-01-05','SE','Giza','Haram','12111'),
(7,'Hossam Ali',8300,'2020-11-09','IS','Cairo','Ain Shams','11221'),
(8,'Nour Ahmed',7900,'2021-06-19','IS','Giza','Faisal','12544'),
(9,'Tamer Adel',8800,'2019-09-02','AI','Cairo','Nasr','11511'),
(10,'Rania Samir',8400,'2020-03-12','AI','Giza','Dokki','12611'),
(11,'Mahmoud Fathy',8200,'2018-12-01','CS','Cairo','Shubra','11211'),
(12,'Ali Hamed',8100,'2017-08-10','CS','Giza','6Oct','12566'),
(13,'Salma Nabil',8300,'2021-02-15','IT','Cairo','Nasr','11511'),
(14,'Mostafa Eid',7800,'2019-04-20','IT','Giza','Haram','12111'),
(15,'Laila Sami',8600,'2020-09-17','SE','Alex','Gleem','21500'),
(16,'Karim Adel',8000,'2022-01-09','SE','Cairo','Maadi','11728'),
(17,'Hany Saber',7700,'2019-05-30','IS','Cairo','Helwan','11911'),
(18,'Dina Kamal',8100,'2020-11-01','IS','Giza','Dokki','12611'),
(19,'Youssef Omar',9200,'2018-03-03','AI','Cairo','Nasr','11511'),
(20,'Fatma Ashraf',8800,'2017-12-25','AI','Alex','Stanley','21544');
INSERT INTO Student VALUES
(101,'Ali Hassan','Cairo','Nasr','11511'),
(102,'Sara Ahmed','Giza','Dokki','12611'),
(103,'Omar Ali','Cairo','Maadi','11728'),
(104,'Mona Samy','Alex','Stanley','21544'),
(105,'Khaled Adel','Cairo','Heliopolis','11341'),
(106,'Yara Mostafa','Giza','Haram','12111'),
(107,'Hossam Nabil','Cairo','Ain Shams','11221'),
(108,'Nour Fady','Giza','Faisal','12544'),
(109,'Tamer Ali','Cairo','Nasr','11511'),
(110,'Rania Gamal','Giza','Dokki','12611'),
(111,'Mahmoud Omar','Cairo','Shubra','11211'),
(112,'Ali Samy','Giza','6Oct','12566'),
(113,'Salma Hany','Cairo','Nasr','11511'),
(114,'Mostafa Ali','Giza','Haram','12111'),
(115,'Laila Ahmed','Alex','Gleem','21500'),
(116,'Karim Hassan','Cairo','Maadi','11728'),
(117,'Hany Fathy','Cairo','Helwan','11911'),
(118,'Dina Ali','Giza','Dokki','12611'),
(119,'Youssef Adel','Cairo','Nasr','11511'),
(120,'Fatma Hassan','Alex','Stanley','21544');
INSERT INTO Course VALUES
('CS101','Intro to Programming',3,'CS'),
('CS102','Data Structures',3,'CS'),
('CS201','Algorithms',3,'CS'),
('IT101','Networking Basics',3,'IT'),
('IT201','Database Systems',3,'IT'),
('SE101','Software Engineering',3,'SE'),
('IS101','Information Systems',3,'IS'),
('AI101','Intro to AI',3,'AI'),
('AI201','Machine Learning',3,'AI'),
('AI301','Deep Learning',3,'AI');
INSERT INTO Enrollment VALUES
(101,'CS101','2024-02-01','A'),
(102,'CS101','2024-02-01','B'),
(103,'CS101','2024-02-01','A'),
(104,'CS101','2024-02-01','C'),
(105,'CS102','2024-02-01','B'),
(106,'CS102','2024-02-01','A'),
(107,'IT101','2024-02-01','B'),
(108,'IT101','2024-02-01','A'),
(109,'IT201','2024-02-01','C'),
(110,'IT201','2024-02-01','B'),
(111,'SE101','2024-02-01','A'),
(112,'SE101','2024-02-01','B'),
(113,'IS101','2024-02-01','A'),
(114,'IS101','2024-02-01','C'),
(115,'AI101','2024-02-01','A'),
(116,'AI101','2024-02-01','B'),
(117,'AI201','2024-02-01','A'),
(118,'AI201','2024-02-01','B'),
(119,'AI301','2024-02-01','A'),
(120,'AI301','2024-02-01','B'),
(101,'CS102','2024-02-02','A'),
(102,'CS102','2024-02-02','B'),
(103,'IT101','2024-02-02','C'),
(104,'IT201','2024-02-02','B'),
(105,'AI101','2024-02-02','A'),
(106,'AI201','2024-02-02','B'),
(107,'SE101','2024-02-02','A'),
(108,'IS101','2024-02-02','B'),
(109,'CS101','2024-02-02','C'),
(110,'CS101','2024-02-02','A');
SELECT student_id, name, city
FROM Student;
SELECT Instructor.name, Department.name, salary
FROM Instructor
JOIN Department
ON Instructor.dept_code = Department.dept_code;
SELECT Department.name, Course.course_code, Course.title
FROM Course
JOIN Department
ON Course.dept_code = Department.dept_code
ORDER BY Department.name;
SELECT Student.name, Enrollment.enrollment_date, Enrollment.final_grade
FROM Enrollment
JOIN Student ON Enrollment.student_id = Student.student_id
WHERE Enrollment.course_code = 'CS101';
SELECT course_code, COUNT(student_id) AS total_students
FROM Enrollment
GROUP BY course_code;
SELECT Instructor.name, salary, Department.name
FROM Instructor
JOIN Department ON Instructor.dept_code = Department.dept_code
ORDER BY salary DESC
LIMIT 1;
SELECT c1.title AS Course, c2.title AS Prerequisite
FROM Prerequisite
JOIN Course c1 ON Prerequisite.course_code = c1.course_code
JOIN Course c2 ON Prerequisite.prereq_code = c2.course_code;
SELECT Student.name, Dependent.name, Dependent.relationship
FROM Dependent
JOIN Student ON Dependent.student_id = Student.student_id;
SELECT Department.name, COUNT(Instructor.instructor_id) AS instructor_count
FROM Instructor
JOIN Department ON Instructor.dept_code = Department.dept_code
GROUP BY Department.name
HAVING COUNT(Instructor.instructor_id) > 5;
SELECT Student.name, COUNT(Enrollment.course_code) AS num_courses
FROM Enrollment
JOIN Student ON Enrollment.student_id = Student.student_id
GROUP BY Student.name
HAVING COUNT(Enrollment.course_code) > 3;
SELECT Course.course_code, Course.title
FROM Course
LEFT JOIN Enrollment
ON Course.course_code = Enrollment.course_code
WHERE Enrollment.student_id IS NULL;

