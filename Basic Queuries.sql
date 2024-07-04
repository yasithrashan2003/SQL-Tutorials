show databases;
use mysql;
show tables;
select * from db;
create database sql_intro;
show databases; 

create table emp_detials (Name varchar(25),Age int, sex char(1),
doj date,city varchar(15),salary float);

show databases;
describe emp_details;
RENAME TABLE emp_detials  TO emp_details;
show tables;


describe emp_details;

insert into emp_details
 values( "naruto",18,"M","2005-05-30","hidden Leaf",70000),
 ("Luffy",16,"M","2007-09-17","Sea",30000);
 
 select * from emp_details;
 
 select distinct city from emp_details;
 
 select count(Name) as count_name from emp_details;
 
 select sum(salary) from emp_details;
select avg(salary) from emp_details;

select name,age,city from emp_details;

select * from emp_details where age >17;

select name,sex,city from emp_details where sex="M";

select * from emp_details where city ="sea" or city ="hidden leaf"; 

select * from emp_details where 
city in("hidden leaf");

select * from emp_details where 
doj between '2005-01-01' and '2010-06-03';

select * from emp_details where
age>15 and sex='m';

select sex,sum(salary) as total_salary from emp_details
group by sex;

select * from emp_details order by salary desc;

select (10/50) as addition;
 
 select length('yasith rashan') as lengthl;
 
 select repeat('@',10);
 
 select upper("yasith");
 
 select curdate();
 
 select day(curdate());
 
 select now();


 # sting functions
 
 select lcase('YAS');
 
 select character_length('yasith rashan');
 use sql_intro;
 
 show tables;
 
 select name,char_length(name) as len from emp_details;
 
 select * from emp_details;
 
 create table emp_detials (Name varchar(25),Age int, sex char(1),
doj date,city varchar(15),salary float);

show tables;
 select name,char_length(name) as len from emp_details;
 

































