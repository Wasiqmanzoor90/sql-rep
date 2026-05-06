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


--joins--

/*
inner join
left join
right join 
outer join
*/

use mydb




create table department
(
DepartmentId int Primary Key,
DepartmentName varchar(50) not null,
DepartmentLocation varchar(30) not null
)



create table employ
(
empid int primary key,
empname varchar(30) not null,
gender varchar(10) not null,

DepartmentId int,
foreign key(DepartmentId) References department(DepartmentId)
)


select * from employ
select * from department
insert into department values
(4,'Marketing','LA'),(5,'House-Keeping','Banglore')








insert into employ values(101,'Moonis','M',2),
(102,'Abrar','M',2),
(103,'Ayaz','M',3),
(104,'Ahmad','M',3),
(105,'Madeeha','F',1),
(106,'Zaira','F',1),
(107,'Emaam','F',1),
(108,'Ubaid','M',2),
(109,'Shoib','M',3),
(110,'Tufail','M',2)
insert into employ values
(111,'Muskan','F',Null),
(1112,'Emaam','F',Null),
(114,'Shoib','M',Null)
(115,'Tufail','',2)
use mydb
select * from employ

select * from employ

--inner join
--only matching columns in both tables
select e.empname, e.gender, d.DepartmentName from employ e
inner join department d
on e.DepartmentId = d.DepartmentId

--left join
--use when we want all employes even if they dont belong to any department
select * from employ
select e.empname,d.DepartmentName from employ e
left join department d
on e.DepartmentId = d.DepartmentId

--Right Join 
--Use when we want all deparments if there were no enrolment
select e.empname,d.DepartmentName from employ e
right join department d
on e.DepartmentId = d.DepartmentId


--Full join(Everthing from both sides)

select e.empname,d.DepartmentName from employ e
left join department d
on e.DepartmentId = d.DepartmentId
union
select e.empname,d.DepartmentName from employ e
right join department d
on e.DepartmentId = d.DepartmentId









CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL UNIQUE
)

CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 18),
    Salary DECIMAL(10,2) CHECK (Salary > 0),
    DeptID INT
    foreign key(DeptID) References Department(DeptID)
    )

    INSERT INTO Department (DeptID, DeptName) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Operations');

    INSERT INTO Employee (EmpID, EmpName, Age, Salary, DeptID) VALUES
(1, 'Amit Sharma', 28, 45000, 2),
(2, 'Priya Singh', 32, 55000, 1),
(3, 'Rahul Verma', 26, 40000, 2),
(4, 'Neha Kapoor', 30, 60000, 3),
(5, 'Arjun Mehta', 35, 75000, 4),
(6, 'Sneha Reddy', 29, 48000, 5),
(7, 'Vikas Gupta', 40, 82000, 3),
(8, 'Pooja Nair', 27, 42000, 1),
(9, 'Karan Malhotra', 31, 67000, 2),
(10, 'Anjali Desai', 33, 72000, 4),
(11, 'Rohit Jain', 25, 39000, 5),
(12, 'Meera Iyer', 36, 88000, 3),
(13, 'Suresh Patel', 45, 95000, 5),
(14, 'Kavita Joshi', 29, 51000, 1),
(15, 'Deepak Yadav', 34, 68000, 2)

use mydb
select * from Department
select * from Employee


--Subqueries
--in simple words a sub query is a query with in a query(nested query)

--Employes earning more than average salary
select EmpName , Salary
from Employee
where Salary > (select AVG(Salary) from Employee)

--Highest Salary
select * from Employee
where Salary=(select MAX(Salary) from Employee)


--Minimum salary
select * from Employee
where Salary=(select MIN(Salary) from Employee)

--employ in same department as amit
select * from Employee
where DeptID=(
select DeptID from Employee
where EmpName = 'Amit Sharma'
)

--Get department name of Priya singh
select DeptName from 
Department
where DeptID = (
select DeptID from
Employee 
where EmpName = 'Priya Singh'
)

--Employes work in It Department
select * from
Employee
where DeptID=(
select DeptID from Department
where DeptName = 'IT'
)
select * from Employee

--employes earning less than average salary
select EmpName, Salary from Employee
where Salary<(select AVG(Salary) from Employee)


--second highest salary
select MAX(Salary) as secondhighest from Employee
where Salary<(select MAX(Salary) from Employee)

select * from Department


--Employes who are not in IT Department
select * from Employee
where DeptID!=
(
select DeptID from Department
where DeptName = 'IT'

)

--Highest salary in each department
select * from Employee e
where Salary =(
select max(Salary) from 
Employee
where DeptID = e.DeptID
)



--Transaction--
--Transaction is the commonds that are used to manage transaction in database
--these are used to manage the changes that are made by DML Staments

use mydb
drop table student

Create table student
(
StdId int,
Name varchar(30),
Class varchar(20)
)

select * from student
--commit is used to permanatly save any transaction in database
--rollback is commond that restores the database to the last commit state

--transation1 (commit)
begin transaction
insert into student values(1,'wasiq','11th')
commit
select * from student



--transaction2(rollback)

begin transaction
insert into student values(2,'umer','7th')
select * from student
rollback


select * from student


create table account(
accountId int,
HolderName varchar(30),
balance int
)

insert into account values(1,'wasiq','1000'),(2,'Madeeha',3200)


select * from account

--Any error in this transaction it will rollback everthing in previous state or we can say to last commit
begin transaction
begin try

update account set balance = balance-300 where accountId = 4 
--
--
--
--x
update account set balance =  balance+300 where accountId = 3

commit
end try
begin catch
rollback
end catch



use mydb
--Stored Procedure
--A stored procedure is sql commond or query that is prepared for collection of one or more sql statments saved in database for reuse
--Basically it's like encapsulation

create procedure getemployes
as
begin
select * from Employee
end


getemployes

--stored procedure with paramaetres
create procedure getemolybyid
@id int
as
begin
select * from Employee
where EmpID = @id
end

getemolybyid @id=5




--find employ by name
create procedure getemploybyname
@name varchar(30)
as
begin
select * from Employee
where EmpName = @name
end

getemploybyname @name = 'Vikas Gupta'

--here we make change in existing procedure
alter procedure getemployes

as
begin
select * from Employee
where Age>30
end

getemployes

drop procedure getemolybyid


select * from Employee



create procedure inserdata
@id int,
@name varchar(30),
@age int,
@sal int,
@depid int
as
begin
insert into Employee(EmpID,EmpName,Age,Salary,DeptID)
values(@id,@name,@age,@sal,@depid)
end

select * from Employee
where EmpID = 101

inserdata @id = 101,@name='wasiq',@age=25,@sal = 100000, @depid=2