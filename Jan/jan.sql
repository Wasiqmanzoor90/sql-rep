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
values(104,'Banglore',70000),




select * from employe














