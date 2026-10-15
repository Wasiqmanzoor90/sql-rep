

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



--Group by--

--group by is a clause that organizes row with same value into groups
select adress, count(*) from employ
group by adress


select adress, COUNT(*) as no_employ from employ
group by adress
order by no_employ desc


select adress, max(salary) from employ
group by adress



select adress , avg(salary)from employ
group by adress

select adress, COUNT(*) from employ
group by adress
having COUNT(*)>3

select adress, AVG(salary) from employ
group by adress
having avg(salary)>30000


select adress, sum(salary) from employ
group by adress
having sum(salary) >50000


select adress, avg(age) from employ
group by adress
having AVG(age)>25



select * from employ