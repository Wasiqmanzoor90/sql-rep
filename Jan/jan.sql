--single-line commet
--This sql Day 1

--Multi line commet--
/*

*/
--DATA MANIPULATION LANGUAGE(DDL)--
--Data defination Language(DDL)--
--Transaction control language(TCL)--

--Data type tell which type a data a particulat holds--

--char    holds textual data
--varchar  holds textual data
-- int      numerical data
--boolean   true/false 



create table employ
(
id int,
Name varchar(20)
)


create database mydb1

use mydb
drop database db2  --error
drop database if exists db2 --handle error gracefully
drop database mydb1  --here we are droping the databse


/*Data defination lamguage(DDL):-DDL is used to define the structure 
DDL Comands are as Follow:-
1. CREATE    Create a table
2. Alter     Make Change in existing Table or we cany it modifies the structure of table
3. Truncate   it deletes internal content of table
4. Drop       Drop means when delete whole table with data and its content
*/

drop table student

Create table student
(
roll_no int,
Name varchar(20),
Section varchar(10),

)

truncate table student   --Here truncate only delete data not table 
drop table student   --Here it delete whole table 

Alter table student 
add class varchar(30)
select * from student  



/*Data mainpulation Language(DML):- Dml deals with existing table or we can say existing instannce
DML Comands
1 . SELECT      it retreives data from database
2. Insert       Adding data in particular table 
3. Update       it updates existing data that are presented in table
4. Delete       it deletes a particulat value inide a table 
*/



insert into student(roll_no,Name,Section, class)
values(1,'wasiq','A','10th'),
(2,'umer','B','10th')


select * from student



use mydb


select * from student



insert into student(roll_no,Name,Section,class)
values(3,'Reeb','C','11th'),
(4,'Jasira','D','12th'),
(5,'Alim','A','7th'),
(6,'Aina','D','11th')



--Clause in sql means to filter data ,order data etc it use es some keywords that are as follow
--From
--Where
--order by
--Having
select * from student

update  student
set Name ='Reeba'
where roll_no = 3



delete from student
where roll_no=1









/* 

constraints are rule that are applied to table

1. Primary key ---   uniquely identifies each row in table
2. Not Null  ---- Null values are not allowed
3. Unique   ---- Duplicate values are not allowed in table
4. Default   --Pre- Defined 
5. Forign Key --- establish relation between two table
6. Check  --- to apply condition
*/


use mydb

create table employe
(
empid int primary key,
Name Varchar(30) not null,
Adress Varchar(40) default 'Mumbai',
Salary int
)

insert into employe(empid,Name,Adress,Salary)
values
(109,'Aqib', 'Mumbai',80000)





select * from employe



use mydb

select * from employe

--Where--
select * from employe
where Adress = 'Banglore'

select * from employe
where Name = 'Sahil'


select * from employe 
where Salary > 50000

select * from employe
where Salary <50000


select * from employe
where empid = 100



--Aggerate--

select max(Salary) from employe
select min(Salary) as minimimsalary from employe
select sum(Salary) as Total_Salary from employe
select avg(Salary) from employe
select count(*) from employe





use mydb


select * from employe



select * from employe
where Adress = 'Banglore' and Salary >70000



select * from employe
where Adress = 'Banglore' or Salary >70000


select * from employe
where Name like '%n'


select * from employe
where Name like 'r%'


select * from employe
where Salary between 50000 and 100000


select Name, Salary from employe
where empid = 101




select * from employe
order by Salary desc



select * from employe
order by Name desc


select * from employe
order by Name,Salary desc


--Top return total number of rows

select top 2 * from employe
order by Salary desc


use mydb
select * from employe

select count(*) as Banglore_P from employe
where Adress = 'Banglore'


select avg(Salary) from employe
where Adress = 'Banglore'


select COUNT(*) from employe
where Salary >50000



select sum(Salary) from employe
where Adress = 'Banglore'


select AVG(salary) from employe

select * from employe
where Salary > 70000



select max(Salary) from employe
where Salary <(select max(Salary) from employe)




use mydb
select * from employe

alter table employe
add Department varchar(30)


update employe
set Department = 'Finance'
where empid =109

--Group By--
--Group by is a clause that organise rows with same value int groups
select Adress,count(*) from employe
group by Adress



select Adress,count(*) as no_employ from employe
group by Adress
order by no_employ desc



select Department, COUNT(*) as no_employ from employe
group by Department 
order  by no_employ desc



select Department, COUNT(*) from employe
group by Department
having COUNT(*) > 3


select Department, MAX(Salary) from employe
group by Department



select Adress, Min(Salary) from employe
group by Adress


select Department, AVG(Salary) as avg_salary from employe
group by Department


use mydb

drop table employe
drop table Department




create table Department
(
DepartmentId Int Primary key,
DepartmentName varchar(30),
DepartmentLocation varchar(30)
)


create table employe
(
empid int primary key,
empname varchar(30),
salary int,
age int check(age>18),
DepartmentId int,
foreign key(DepartmentId) references Department(DepartmentId)
)



select * from Department
select * from employe


insert into Department(DepartmentId,DepartmentName,DepartmentLocation)
values(105,'Mechanical','Srinagar'),(102,'HR','Mumbai'),(103,'Marketing','Banglore')



INSERT INTO employe (empid, empname, salary, age, DepartmentId) VALUES
(1, 'John Doe', 75000, 28, 101),
(2, 'Jane Smith', 82000, 34, 102),
(3, 'Michael Brown', 61000, 22, 103),
(4, 'Emily Davis', 95000, 41, 101),
(5, 'David Wilson', 54000, 25, 104),
(6, 'Sarah Martinez', 88000, 31, 102),
(7, 'James Anderson', 72000, 29, 103),
(8, 'Amanda Thomas', 67000, 27, 101),
(9, 'Robert Jackson', 105000, 45, 104),
(10, 'Lisa White', 59000, 23, 102),
(11, 'William Harris', 83000, 36, 103),
(12, 'Megan Martin', 91000, 38, 101),
(13, 'Kevin Thompson', 64000, 26, 104),
(14, 'Rachel Garcia', 76000, 30, 102),
(15, 'Brian Martinez', 52000, 21, 103),
(16, 'Christine Robinson', 110000, 48, 101),
(17, 'Timothy Clark', 69000, 32, 104),
(18, 'Laura Rodriguez', 80000, 33, 102),
(19, 'Jason Lewis', 58000, 24, 103),
(20, 'Stephanie Lee', 97000, 42, 101);

insert into employe(empid, empname, salary, age)
values(21,'wasiq',100000,35),(22,'Reeb',2000000,25),(23,'Adil',500000,25)






select * from employe
select * from Department



--inner join retreives data from two diffrent tables on the basis of same column

select e.empname, e.salary, d.DepartmentName  from employe e
inner join Department d
on e.DepartmentId = d.DepartmentId

--Left join 
--use when we want to get all employes that is from left side of table perhaps they doesnt have a department

select e.empname , d.DepartmentName from employe e
left join Department d
on e.DepartmentId = d.DepartmentId


--Right join
--when we want to get data from the right side of table perhaps it meets condition or not
select e.empname , d.DepartmentName from employe e right join Department d
on e.DepartmentId = d.DepartmentId
use mydb

select * from employe
select * from Department



select d.DepartmentName,e.empname from Department d right join employe e
on e.DepartmentId = d.DepartmentId



--full outer join returns all the rows from both side of the table
select d.DepartmentName,e.empname from Department d full outer join employe e
on e.DepartmentId = d.DepartmentId

--sub query
--sub query mean query within query or we can say nested query


use mydb
select AVG(salary) from employe

--we wanr employes which less than average salary
select empname , salary from employe
where salary<(select AVG(salary) from employe)


--second highest salary
select MAX(salary) as second_highest from employe
where salary<(select MAX(salary) from employe)


--highest salary in each department
select * from employe e
where salary=(
select MAX(salary) from employe
where DepartmentId = e.DepartmentId

)

--employ from same department as emily davis

select * from employe
where DepartmentId=(
select DepartmentId from employe
where empname='Emily Davis'
)


--get  department name of emily davis
select DepartmentName from Department
where DepartmentId=(
select DepartmentId from employe
where empname = 'Emily Davis'
)


use mydb

select * from employe
select * from Department


--get department of jane smith
select DepartmentName from Department
where DepartmentId=(

select DepartmentId from employe
where empname  ='jane smith'

)



--Employes work i It department

select * from employe
where DepartmentId = (
select DepartmentId from Department
where DepartmentName ='IT'

)

--Department with no employ

select DepartmentName from Department
where DepartmentId Not in
(
select DepartmentId from employe
)
--employes located in diffrent cities
select empname from employe
where DepartmentId in
(

select DepartmentId from Department
where DepartmentLocation = 'Mumbai'
)

--employes older than averge age
select empname, age from employe
where age >
(
select AVG(age) from employe
)


use mydb

--Trasaction is the commond that is used to managa changes in database its used with dml commonds

--commit is uded to sava data in databse
--rooback is commond that restores the database to last commit state 


select * from student
begin transaction
insert into student (7,'Mary','D','3rd')
commit
select * from student





create table account
(

accntid int,
holdername varchar(30),
balance int
)

insert into account values(1,'wasiq',1000),(2,'Maryam',5000)

select * from account


begin transaction
 begin try

update account set balance  = balance-1100 where accntid =1
--/
--/
--/
update account set balance  = balance+300 where accntid =1
commit
end try
begin catch
rollback
end catch



--stored Procedure

use mydb
create procedure getemployes
as
begin
select * from employe
end


getemployes


--stored procedure
--A stored procedure is sql comond or query that is prepared for collection of one or more sql statement in database for resuse
--it's like a encapsulation


create procedure getemploybyid
@id int
as
begin
select * from employe
where empid = @id
end

getemploybyid @id = 1



create procedure getemploybyname
@name varchar(20)
as
begin
select * from employe 
where empname = @name
end

getemploybyname @name = 'Reeb'



--here we update the existing procedure
alter procedure getemployes
as
begin
select * from employe
where age >25
end


getemployes

--Here we delete the procedure
drop procedure getemploybyid




use mydb


select * from employe
where salary >30000

--view
--in sql server view is commond that is used to see data visulaization without effecting the databse

create view employsalar as
select empid, empname , salary
from employe 
where salary >30000




select * from employsalar

select * from employe



create view senioremployview as

select empname from employe
where age > 30


select * from senioremployview



drop view senioremployview