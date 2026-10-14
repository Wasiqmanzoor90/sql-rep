

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

