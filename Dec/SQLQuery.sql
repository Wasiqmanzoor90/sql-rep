--DQL--
--DML
--DDL--

--Multi line coment--
/*
SQL (Structured Query Language) is the standard domain-specific programming language designed for managing,
querying, and manipulating data stored in relational database management systems (RDBMS)
*/


--Single line comment--
--This is sql database--



--Data Defination Language (DDL)--
/*
Create
Alter
Drop
Truncate

*/
Create database mydb1

Drop database mydb2 --This show error because this db i'snt there--

Drop database if exists mydb  --This handles error Gracefully--

CREATE DATABASE IF NOT EXISTS mydb

use mydb

/*Datatypes
1. Varchar and char that stores textual data its like string
2. Int deals with numerical data
3. DateTime deals with real time date and time
these are some data types that we use most commonly

create table table_name
(
name varchar(30),
adress char(20),
roll_no int
)

*/


create table student
(

name varchar(30),
roll_no int,
adress varchar(40)
)

--Here it only deletes the data of table--
truncate table student

--Here it deletes whole table with data--
drop table student

--Here we add a column into it--
alter table student
add dob datetime

select * from student



--Here we rename the column--
exec sp_rename 'student.name','fullname','COLUMN'

--Here we read or retreive the data--
select * from student


/*
Data Manipulation Language(DML)

DML Comonds
1- insert
2- update
3- delete
*/

--When we to insert data in table--
insert into student values('Anees',12,'Maisuma')

--When we insert data in bulk we use this way--
insert into student(name,roll_no,adress)
values('Wasiq',23,'Pampore'),
('Ahmad',24,'Rajbagh'),
('Moonis',25,'Harwan'),
('ulfat',26,'Chattabal'),
('Ahsan',27,'islambad')


select * from student





update student 
set roll_no=10
where name = 'Anees'

update student
set adress = 'Khanyar'
where roll_no=23

update student 
set name ='Raihan'
where roll_no =24




delete student
where name ='ulfat'


delete student
where roll_no = 10

select * from student




/*
constraint
constraint are rule that are apllied to table

Primary key--   uniquely identifies each row in table
Not Null  --    Null values are not alowed
Unique --       Duplicate values not allowed
Default ---     Allow a speacific a value in a column
Foreign Key --  Establishing realtion between two tables
Check ---       to apply condition

*/


use mydb
drop table employ

Create table employ
(
empid int primary key,
name varchar(30),
adress varchar(30) default 'Banglore',
salary int,
department varchar(30)
)

insert into employ(empid,first_name,Last_name,adress,age)
values(100,'wasiq','Manzoor','srinagar',23)


insert into employ(empid,first_name,Last_name,adress,age)
values(100,'Ahmad','Bhat','srinagar',23)   --- empid error

insert into employ(empid,first_name,Last_name,adress,age)
values(101,'ahsan','maliq','anantnag',17)  -- age error

insert into employ(empid,first_name,Last_name,age)
values(102,'Tufail','maliq',24)

select * from employ


--Homework Primary key--


insert into employ(empid,name,adress,salary,department)
values(100,'wasiq','New York',100000,'IT'),
(101,'Emaan','Mumbai',200000,'HR'),
(102,'Arjun','UP',30000,'Finance'),
(103,'Mohit','Hyderabad',70000,'Finance'),
(104,'Sonali','Delhi',15000,'House Keeping'),
(105,'Arun','Kolkata',45900,'HR'),
(106,'Amir','Jammu',67200,'IT'),
(107,'Moonis','Srinagar',110000,'IT'),
(108,'Abrar','Banglore',190000,'Mechanics'),
(109,'Ahsan','South Kashmir',38000,'HR'),
(110,'Tufail','Banglore',180000,'HR'),
(111,'Tiku','Kerla',13000,'Sweeper')

select * from employ


--WHERE--
select * from employ
where adress = 'Delhi'

select * from employ 
where salary > 100000

select * from employ
where department = 'HR' and salary >100000

select name, department from employ
where adress = 'south kashmir'

select name, adress,department,salary  from employ
where salary between 50000 and 80000

--Where there a in staring of name we get only that names--
select * from employ
where name like 'a%'

select * from employ
where name like '%n'




use mydb

select * from employ


--Order by is used to sort data on a particluar columns by default its sorts in ascending order--
select * from employ
order by salary


select * from employ
order by salary desc

select * from employ
order by name ,salary

select * from employ
where adress = 'Banglore'
order by salary desc


select * from employ
order by empid desc


--Top--

--The top keyword is used to limit the number of records returned by a query--
select top 3 * from employ

select top 6 *from employ


select top 2 * from employ
where department = 'IT'

select top 1 * from employ
order by salary desc


select top 2 * from employ
order by salary desc



select top 1 * from employ
order by salary


select top 3 * from employ
order by salary


alter table employ
add gender varchar(5)


update employ
set gender = 'M'
where empid = 111

use mydb
select * from employ

/*Aggegerate functions
count    returns number of rows
sum      returns the sum
avg      returns the average value
max      returns the maximum value
min      returns the minimum value
*/


select COUNT(*) from employ

select COUNT(*) from employ
where salary =100000

select COUNT(*) from employ
where salary >100000


select COUNT(distinct department) from employ

select COUNT(*) from employ
where gender = 'M'


select sum(salary) from employ

select sum(salary) from employ
where gender = 'F'


select avg(salary) from employ

select AVG(salary) from employ
where gender = 'M' 

select sum(salary) from employ
where adress = 'Banglore'

select avg(salary) from employ
where adress = 'Banglore'

use mydb
select MAX(salary) from employ

select min(salary) from employ

use mydb

select * from employ

---Group By--
--group by is a clause that organize rows with same values into groups---
select department, COUNT(*) from employ
group by department

select adress, COUNT(*) from employ
group by adress

select department ,COUNT(*) AS no_employ from employ
group by department 

select department ,COUNT(*) AS no_employ from employ
group by department 
order by no_employ desc

select department, COUNT(*)AS no_employ from employ
group by department
having COUNT(*)>2

select department, MAX(salary) as highest_salary from employ
group by department


select adress, AVG(salary) as avg_salary from employ
group by adress


select department, MAX(salary) as highest_salary from employ
group by department
order by highest_salary desc

use mydb

select * from employ
--Cities having average salary more than 100000
select adress, AVG(salary) as avg_salary from employ
group by adress
having AVG(salary)>100000

--Department having average female salary more than 30000
select department, AVG(salary) as avg_salary from employ
where gender = 'F'
group by department
having AVG(salary)>30000


--employ having salary betwenn 50000 to 100000

select name, avg(salary) as employ_salary from employ
group by name
having avg(salary) >=50000 and AVG(salary)<=100000


--employ having salary betwenn 50000 to 100000
select name, avg(salary) from employ
group by name
having avg(salary) between 50000 and 100000




/*
select 
where
Group by
having
order by
top
*/
