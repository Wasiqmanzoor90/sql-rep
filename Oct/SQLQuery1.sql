

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

