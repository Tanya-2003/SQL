create database SISDB

create table Students(student_id int primary key,
first_name varchar(30),
last_name varchar(30),
date_of_birth date,
email varchar(50),
phone_number varchar(20))

insert into Students values
(1410,'Zeya','Linston','2003-02-01','ZeyaL@gmail.com','9457128622'),
(1420,'Abu','Jay','2002-04-25','abujay@gmail.com','9457018622'),
(1411,'Anisha','S','2002-11-24','anishas@gmail.com','9457188622'),
(1412,'Swetha','S','2002-08-14','swetha14@gmail.com','9457128452'),
(1415,'Sowmiya','Subramanian','2003-04-04','sowmi@gmail.com','9457128602'),
(1422,'Sindu','J','2002-04-27','sindu@gmail.com','9445128622'),
(1414,'Jane','Josetta','2002-07-24','janej@gmail.com','9457124522'),
(1432,'Pooja ','Sree','2002-07-24','spooja@gmail.com','9457088622'),
(1419,'Jeffrin','Johnson','2002-04-28','johnsonjeffrin@gmail.com','9457128633'),
(1404,'Steffy','Rose','2002-01-16','rsteffy@gmail.com','9451728622'),
(1408,'Eliza','Mercy','2002-12-04','meliza@gmail.com','9007128622'),
(1413,'Foustina','Sharon','2002-04-01','foustisharon@gmail.com','9457143622')

create table Courses(course_id int primary key, 
course_name varchar(40), 
credits int, 
teacher_id int,
foreign key (teacher_id) references Teacher(teacher_id))

insert into Courses values 
(010,'SQL',3,'511'),
(011,'Python basics',2,'501'),
(012,'Python Advanced',4,'512'),
(013,'Java Basics',2,'512'),
(014,'Java Advanced',5,'511'),
(015,'C# Theory',2,'500'),
(016,'C# Lab',5,'502'),
(017,'SQL Advanced',4,'503'),
(018,'Go',3,'502'),
(019,'Cyber Security Hands-on',6,'522'),
(020,'Mobile App Basics',4,'500'),
(021,'Mobile App Hans-on',5,'522'),
(022,'HTML,CSS Theory',2,'508'),
(023,'HMTL,CSS Lab',5,'508')

create table Enrollments(enrollment_id int primary key,
student_id int,
course_id int,
enrollment_date date,
foreign key (course_id) references Courses(course_id),
foreign key (student_id) references Students(student_id))

insert into Enrollments values
(313,1410,011,'2023-03-15')

insert into Enrollments values
(301,1410,010,'2023-02-15'),
(302,1420,010,'2023-04-12'),
(303,1411,012,'2023-01-02'),
(304,1412,011,'2023-05-18'),
(305,1415,023,'2023-12-12'),
(306,1422,022,'2023-12-12'),
(307,1414,021,'2023-08-04'),
(308,1432,020,'2023-07-13'),
(309,1419,019,'2023-10-19'),
(310,1404,018,'2023-11-15'),
(311,1408,017,'2023-11-25'),
(312,1413,015,'2023-09-11')

create table Teacher(teacher_id int primary key,
first_name varchar(20),
last_name varchar(20),
email varchar(40))

insert into Teacher values
(520,'Banu','S','banus@gmail.com')

insert into Teacher values
(511,'Mettilda','Mary','mmary@gmail.com'),
(501,'Prabhu','R','prabhur@gmail.com'),
(512,'Ram','Sundar','ramsundar@gmail.com'),
(500,'Vaishnavi','S','Vaish.s@gmail.com'),
(502,'Preethi','Harris','preeharris@gmail.com'),
(503,'Kalai','M','kalai.m@gmail.com'),
(522,'Angel','S','angel.s@gmail.com'),
(508,'Rajalaksmi','R','raji@gmail.com')

create table Payments(payment_id int primary key,
student_id int,
amount DECIMAL(10, 2),
payment_date date,
foreign key (student_id) references Students(student_id))

insert into Payments(payment_id,student_id,payment_date) values
(913,1410,'2023-02-20')

insert into Payments values
(901,1410,799.90,'2023-02-20'),
(902,1420,450.00,'2023-04-19'),
(903,1411,399.74,'2023-01-10'),
(904,1412,599.88,'2023-05-22'),
(905,1415,678.82,'2023-12-18'),
(906,1422,480.99,'2023-12-17'),
(907,1414,899.90,'2023-08-08'),
(908,1432,750.50,'2023-07-17'),
(909,1419,450.60,'2023-10-25'),
(910,1404,753.45,'2023-11-20'),
(911,1408,650.45,'2023-11-30'),
(912,1413,300.90,'2023-09-14')

--TASK 2
--1
insert into Students values(1443,'john','doe','1995-08-15','john.doe@example.com',1234567890)
select * from Students
--2
insert into Enrollments values(322,1443,016,'2023-04-22')
--3
update Teacher set email='angel@gmail.com' where first_name='Angel'
--4
delete from Enrollments where enrollment_id=312
select *from Enrollments where student_id=1443 and course_id=016
--5
update courses set teacher_id=500 where course_id=016
select*from courses
--6
DELETE FROM Students WHERE student_id = 1414;
DELETE FROM Enrollments WHERE student_id = 1414;
DELETE FROM Payments WHERE student_id = 1414;
--7
update payments set amount=2500 where amount=678.82

--TASK 3
--1
SELECT s.student_id, s.first_name, SUM(p.amount) AS total_payments
FROM Students s join Payments p on s.student_id = p.student_id 
WHERE s.student_id = 1410
GROUP BY s.student_id, s.first_name;
--2
SELECT c.course_id, c.course_name, COUNT(e.student_id) AS enrolled_students_count
FROM Courses c LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;
--3
SELECT s.first_name
FROM Students s LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.student_id IS NULL
--4
select s.first_name,s.last_name,c.course_name 
from Students s join Enrollments e on s.student_id = e.student_id
join Courses c on c.course_id = e.course_id
--5
select t.first_name,c.course_name 
from Teacher t join Courses c on t.teacher_id = c.teacher_id
--6
select s.first_name,e.enrollment_date 
from Students s join Enrollments e on s.student_id = e.student_id
where e.course_id = 018
--7
select s.first_name
from Students s left join Payments p on s.student_id = p.student_id
where p.amount = 0 or p.amount is null
--8
select c.course_name,c.course_id 
from Courses c left join Enrollments e on c.course_id = e.course_id
where e.course_id=0 or e.course_id is null
--9
SELECT distinct e1.student_id
FROM Enrollments e1 JOIN Enrollments e2 ON e1.student_id = e2.student_id
WHERE e1.course_id <> e2.course_id
--10
select t.first_name,t.last_name,t.teacher_id
from Teacher t left join Courses c on t.teacher_id = c.teacher_id
where c.teacher_id=0 or c.teacher_id is null

--TASK 4
--1
SELECT AVG(enrollment_count) AS average_enrollment
FROM (
    SELECT course_id, COUNT(student_id) AS enrollment_count
    FROM Enrollments GROUP BY course_id
) AS enrollment_counts
--2
SELECT student_id, amount, payment_date
FROM Payments WHERE amount = (
    SELECT MAX(amount) AS max_payment FROM Payments 
)
--3
SELECT course_id, course_name, 
    (SELECT COUNT(*) FROM Enrollments WHERE Enrollments.course_id = Courses.course_id) AS enrollment_count
FROM Courses
ORDER BY enrollment_count DESC
--4
SELECT teacher_id, first_name, last_name, email,(
	SELECT SUM(amount) FROM Payments p
	JOIN Enrollments e ON p.student_id = e.student_id
	JOIN Courses c ON e.course_id = c.course_id
	WHERE c.teacher_id = t.teacher_id
    ) AS total_payments
FROM Teacher t;
--5
SELECT student_id, first_name, last_name
FROM Students
WHERE (
    SELECT COUNT(DISTINCT course_id)
    FROM Enrollments
  ) = (
    SELECT COUNT(DISTINCT course_id)
    FROM Courses
  );
--6
SELECT first_name, last_name
FROM Teacher WHERE teacher_id NOT IN (
    SELECT DISTINCT teacher_id
    FROM Courses
);
--7
SELECT AVG(student_age) AS average_age
FROM (
    SELECT DATEDIFF(YEAR, date_of_birth, GETDATE()) AS student_age
    FROM Students
) AS student_ages;
--8
SELECT course_id, course_name
FROM Courses WHERE course_id NOT IN (
    SELECT DISTINCT course_id
    FROM Enrollments
);
--9
SELECT student_id, course_id,
    (
	SELECT SUM(amount)
	FROM Payments
	WHERE student_id = e.student_id
	AND course_id = e.course_id
    ) AS total_payments
FROM Enrollments e;
--10
SELECT student_id
FROM (
    SELECT student_id, COUNT(*) AS payment_count
    FROM Payments
    GROUP BY student_id
) AS payment_counts
WHERE payment_count > 1;
--11
SELECT s.student_id, s.first_name, s.last_name, SUM(p.amount) AS total_payments
FROM Students s
LEFT JOIN Payments p ON s.student_id = p.student_id
GROUP BY s.student_id, s.first_name, s.last_name;

SELECT student_id, first_name, last_name, 
    (SELECT SUM(amount) FROM Payments WHERE student_id = s.student_id) AS total_payments
FROM Students s;
--12
SELECT c.course_name,
    (SELECT COUNT(*)
	FROM Enrollments e
	WHERE e.course_id = c.course_id
    ) AS enrollment_count
FROM Courses c
--13
SELECT (SELECT AVG(amount) FROM Payments) AS average_payment_amount
