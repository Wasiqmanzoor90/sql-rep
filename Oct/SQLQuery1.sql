

use mydb1

/*
int  -- numerical data
char(30) --textual data
varchar ---textual data
float --- stores point values
datetime
*/
drop table employ

create table employ
(
id int,
Name varchar(100),
age int,
adress varchar(50),
salary int

)


select * from employ

alter table employ
add email varchar(30)

alter table employ
drop column adress



/*
DML (Data Manipulation language) 
Folloeing are the Dml comonds
Select -- it retreives  the data from databse
insert -- it adds data in particalr table
update --- it makes change in data that are presented in table
delete -- it deletes the data in a table
*/


insert into employ(id, name,age,adress,salary)
values(1,'umer',19,'PUL',20000),
(2,'wasiq',22,'PUL',24000),
(3,'ubaid',15,'Sgr',8000),
(4,'Khan',29,'KUP',50000)


select * from employ


/*
In SQL Server, clauses are built-in functions or keywords used to filter, 
group, organize, and structure data within a query
clause have these keywords:-
1.from
2.where
3.order by
4. group by
5. having
6. Top
7. Distinct
*/


update employ
set name= 'Madeeha'
where id = 2


select * from employ

delete employ
where name = 'wasiq'



truncate table employ


select * from employ
order by salary desc


select * from employ
order by age desc

select top 2 * from employ
order by salary desc


use mydb1

/*
Constraints are rules that are applied to table

1. Primary key --- uniquely identifies each row in table
2. Not Null--- null values are not allowed
3. Default --- pre defined
4. Unique --- Duplicates values are not allowed in table
5. check --- apply condition
6. Foreign key -- establish relationship between two tables
*/

drop table employ
Create table employ
(
empid int Primary key,
Name varchar(30) not null,
Email Varchar(40) Unique,
adress varchar (40) default 'Srinagar',
salary int,
Age int check(Age>18)
)

insert into employ(empid,Name,Email,salary,Age)
values(1,'Wasiq','w@gmail.com',14000,22)


insert into employ(empid,Name,Email,adress,salary,Age)
values(2,'Hasiq','H@gmail.com','BLR',14000,22)


insert into employ(empid,Name,Email,adress,salary,Age)
values(3,'Faiq','F@gmail.com','',14000,22)

insert into employ(empid,Name,Email,adress,salary)
values(4,'Wasiq','k@gmail.com','BLR',14000)

insert into employ(empid,Email,adress,salary,Age)
values(5,'a@gmail.com','BLR',14000,22)

select * from employ

update employ
set Age = 26
where empid = 3


select * from employ
where Email ='w@gmail.com'

select * from employ
where salary >10000


select * from employ
where salary <20000


--Aggerate--
select max(salary) as max_sal from employ
select min(Age) as min_age from employ
select sum(salary) as Total from employ
select avg(Age) as average from employ
select count(*) from employ


--And , OR, BETWEEN ,%--
select  * from employ
where adress = 'BLR' and salary >20000



select  * from employ
where adress = 'BLR' and salary >30000

select  * from employ
where adress = 'BLR' or salary >30000


select * from employ
where salary between 10000 and 15000


select * from employ
where name like 'a%'


select * from employ
where name like '%q'




use mydb1

select * from employ

alter table employ
drop constraint UQ__employ__A9D105348CC7BC5C

alter table employ
drop column email

INSERT INTO employ (empid, name, age, adress, salary)
VALUES
(1, 'Aamir', 25, 'Srinagar', 30000),
(2, 'Rahul', 28, 'Jammu', 35000),
(3, 'Zoya', 24, 'Anantnag', 28000),
(4, 'Aman', 30, 'Delhi', 45000),
(5, 'Sara', 26, 'Srinagar', 32000),
(6, 'Bilal', 29, 'Baramulla', 40000),
(7, 'Priya', 23, 'Mumbai', 25000),
(8, 'Adil', 32, 'Pulwama', 50000),
(9, 'Neha', 27, 'Chandigarh', 38000),
(10, 'Irfan', 31, 'Srinagar', 42000),
(11, 'Rohan', 22, 'Jammu', 22000),
(12, 'Ayesha', 25, 'Anantnag', 31000),
(13, 'Sameer', 35, 'Delhi', 60000),
(14, 'Pooja', 28, 'Mumbai', 39000),
(15, 'Danish', 26, 'Srinagar', 33000),
(16, 'Karan', 33, 'Jammu', 48000),
(17, 'Mehak', 24, 'Baramulla', 27000),
(18, 'Yasir', 29, 'Pulwama', 41000),
(19, 'Anjali', 27, 'Delhi', 36000),
(20, 'Farhan', 34, 'Srinagar', 55000)


truncate table employ

select * from employ



select count(*) from employ
where adress = 'Srinagar'


select count(*) from employ
where salary <50000


select sum(salary) from employ
where adress = 'Srinagar'







use mydb2


drop table employ
drop table departmet
create table department
(

deptid int primary key,
deptname  varchar(30),
deptlocation varchar(40)
)


create table employ
(
empid int primary key,
name varchar(30),
salary int,
age int,
deptid int,
foreign key(deptid) references department(deptid)
)


insert into department(deptid,deptname,deptlocation)
values(100,'HR','BLR'),(101,'CS','BLR'),(102,'Sales','SXR')






INSERT INTO employ (empid, name, salary, age, deptid)
VALUES

(1, 'Rahul', 35000, 25, 100),
(2, 'Priya', 42000, 28, 101),
(3, 'Amit', 30000, 24, 102),
(4, 'Sneha', 45000, 29, 100),
(5, 'Vikas', 38000, 27, 101),
(6, 'Neha', 32000, 23, 102),
(7, 'Rohit', 50000, 32, 100),
(8, 'Anjali', 41000, 26, 101),
(9, 'Karan', 36000, 25, 102),
(10, 'Pooja', 47000, 30, 100),
(11, 'Arjun', 39000, 28, 101),
(12, 'Meena', 34000, 24, 102),
(13, 'Sahil', 52000, 33, 100),
(14, 'Kavita', 44000, 29, 101),
(15, 'Deepak', 31000, 22, 102),
(16, 'Riya', 48000, 31, 100),
(17, 'Manish', 37000, 26, 101),
(18, 'Simran', 33000, 23, 102),
(19, 'Nikhil', 55000, 35, 100),
(20, 'Divya', 43000, 28, 101),
(21, 'Varun', 40000, 27, 102),
(22, 'Isha', 46000, 30, 100),
(23, 'Mohit', 35000, 25, 101),
(24, 'Ayesha', 32000, 24, 102),
(25, 'Rakesh', 60000, 36, 100),
(26, 'Tanya', 49000, 31, 101),
(27, 'Akash', 38000, 26, 102),
(28, 'Nisha', 53000, 34, 100),
(29, 'Suresh', 41000, 29, 101),
(30, 'Komal', 36000, 25, 102)



select * from employ

select * from department

--sub query 


select max(salary) from employ

select avg(salary) from employ



--second largest salary

select max(salary) as secondL from employ

--employes which earn less than average salary

select name, salary from employ
where salary<(select AVG(salary) from employ)

--department name of rahul

select deptname from department
where deptid=(
select deptid from employ
where name = 'Rahul'
)


---higest salary in each department

select * from employ e
where salary=(

select max(salary) from employ
where deptid = e.deptid
)


--employes from same department as rahul


select * from employ
where deptid =(
select deptid from employ
where name = 'Rahul'
)



--employes older than average age

select avg(age) from employ


select name , age from employ
where age>(

select AVG(age) from employ
)


--employes location

select name from employ
where deptid in
(
select deptid from department
where deptlocation = 'SXR'

)



--50 questions sub query

select * from employ
select * from department

--inner join both the condition should be true
select e.name , d.deptname from employ e join department d
on e.deptid = d.deptid


--left join
--use when we want to get all employes detail thath is from left side of table perhaps they doesnt have department
select e.name, e.age, d.deptname from employ e left join department d
on e.deptid = d.deptid


--right join
--use when we want to get all departments detail thath is from right side of table perhaps they doesnt have an employ
select e.name, e.age, d.deptname from employ e right join department d
on e.deptid = d.deptid

--full outer join

select e.name, e.age, d.deptname from employ e full outer join department d
on e.deptid = d.deptid



use mydb1



--CTE (Common table expression) is a view that dont get stored in databse

use mydb2


select e.name, e.salary, d.deptname from employ e join department d
on e.deptid = d.deptid




with det as
(

select e.name, e.salary, d.deptname from employ e join department d
on e.deptid = d.deptid

)
select * from det



--view is a virtual that get stored in your database it maintains code re usabilty


create view alldet as
(

select e.name, e.salary, d.deptname from employ e join department d
on e.deptid = d.deptid


)


alter view alldet as
(

select e.name, e.salary, e.age,d.deptname from employ e join department d
on e.deptid = d.deptid
)


drop view alldet

select * from alldet
select * from employ

update employ
set salary = 50000
where empid = 32
use mydb2

--WINDOWS FUNCTION
/*
The fundemental diffrence is that group by collapse your rows to provide high level summary
while windows function preserves individual rows so you can view an individual detail alongside aggerated data
*/

--it gives here unique rank to each row
--but based on a rule you give in over
select *, ROW_NUMBER() over(order by salary desc) as rn
from employ


--rank() gives same rank if vales are same
--but skipping the iteration

select *, RANK() over(order by salary desc) as rk
from employ


--same rank , same value but doenst skip iteration
select *, DENSE_RANK() over(order by salary) as dr
from employ



/*
The PARTITION BY clause in SQL divides a query's result set into smaller groups
(partitions) so that window functions can perform calculations independently within each group.
*/

with  wint as(
select empid, name, salary, deptid,
sum(salary) over(partition by deptid) as totalsal,
AVG(salary) over(partition by deptid) as avegsal
from employ
)
select * from wint