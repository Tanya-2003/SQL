create table ward(studName varchar (50), roll_no int, dept varchar(20), dept_id int, year_of_study int,class varchar(2),minor varchar(20))

create table admins(dept varchar(20), dept_id int, tutor varchar(20))

insert into ward values 
('Zeya',150,'IT',2,2,'B','CS'),
('Anisha',120,'CS',1,3,'A','AR'),
('Alex',101,'CIVIL',4,4,'A','CAD'),
('Dan',145,'MECH',3,3,'A','MD'),
('Evelyn',148,'ECE',5,2,'A','DC'),
('Harshad',111,'EEE',6,2,'A','RR')

insert into admins values 
('CS',1,'Volkov'),
('IT',2,'Medaows'),
('MECH',3,'Brian'),
('CVIIL',4,'Smith'),
('ECE',5,'Butler'),
('EEE',6,'Flyn')

insert into admins values
('ADIS',7,'Matt')
select * from ward
select * from admins

--cross join
select * from ward cross join admins

--inner join
select studName,roll_no,minor from ward inner join admins on ward.dept_id = admins.dept_id

--left outer join
select studName,roll_no,minor from ward left join admins on ward.dept_id = admins.dept_id

--right outer join
select studName,roll_no,minor from ward right join admins on ward.dept_id = admins.dept_id

--full outer join
select studName,roll_no,minor from ward full outer join admins on ward.dept_id = admins.dept_id
