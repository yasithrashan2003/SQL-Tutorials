create database students_details;
show databases;

use students_details;  

show tables;

drop table detials;

create table details (Name varchar(25),Age int, sex char(1),
doj date,city varchar(15),salary float);

insert into details
 values( "naruto",18,"M","2005-05-30","hidden Leaf",70000),
 ("Luffy",16,"M","2007-09-17","Sea",30000),
("Zoro", 19, "M", "2004-11-11", "Sea", 60000),
("Hinata", 18, "F", "2005-12-27", "Hidden Leaf", 68000),
("Sanji", 18, "M", "2004-03-02", "Sea", 55000),
("Kakashi", 29, "M", "1994-09-15", "Hidden Leaf", 90000),
("Nami", 18, "F", "2006-07-03", "Sea", 60000),
("Gaara", 18, "M", "2005-01-19", "Sand Village", 72000);

 select name,char_length(name) as len from details;
 
 select concat('yasith','rashan');
 
 select name,age, concat(name,'',age) as con from details;
 
 
 select reverse('yasith'); 
 
 select replace('orange is a vegetable','vegetable','fruit');
 
 select length(trim("         yasith      "));
 
 select position("fruits"  in " orange is a fruits") as name;
 
 select ascii('4');
 
 create table employee (Emp_Id int primary key, Emp_name varchar(25),age int, Gender char(1), Doj date, Dept varchar(20), city varchar(15),salary float);
 
 describe employee;
 
insert into employee values
(1, 'John Doe', 30, 'M', '2020-05-15', 'HR', 'New York', 60000),
(2, 'Jane Smith', 28, 'F', '2019-06-20', 'Finance', 'Los Angeles', 65000),
(3, 'Robert Brown', 35, 'M', '2018-07-10', 'IT', 'Chicago', 70000),
(4, 'Emily Davis', 40, 'F', '2017-08-25', 'Marketing', 'San Francisco', 72000),
(5, 'Michael Wilson', 45, 'M', '2016-09-30', 'Sales', 'Houston', 68000),
(6, 'Linda Johnson', 38, 'F', '2021-10-01', 'HR', 'New York', 64000),
(7, 'David Martinez', 32, 'M', '2022-01-12', 'Finance', 'Boston', 62000),
(8, 'Laura Hernandez', 29, 'F', '2023-03-05', 'IT', 'Seattle', 75000),
(9, 'James Taylor', 50, 'M', '2015-04-20', 'Marketing', 'Denver', 80000),
(10, 'Sophia White', 27, 'F', '2020-11-14', 'Sales', 'Miami', 67000);

select * from employee;

select distinct dept from employee;

select avg(age) from employee;

#avg age for each dept

select dept,round(avg(age),1) as avg_age from employee group by dept;

select dept,round(sum(salary),1) as Total_salary_by_dept from employee group by dept;


select count(emp_id),city
 from employee
group by city
order by count(emp_id) desc;

select year(doj) as year,count(emp_id)
from employee
group by year(doj);

create table sales(product_id int, sell_price float, quantity int , state varchar(20));

insert into sales  values
(101, 19.99, 150, 'New York'),
(102, 29.99, 120, 'California'),
(103, 9.99, 300, 'Texas'),
(104, 49.99, 100, 'Florida'),
(105, 15.99, 200, 'Illinois'),
(106, 25.99, 130, 'Pennsylvania'),
(107, 35.99, 110, 'Ohio'),
(108, 12.99, 250, 'Georgia'),
(109, 45.99, 90, 'Michigan'),
(110, 5.99, 400, 'North Carolina');

select * from sales;


select product_id, round(sum(sell_price *quantity),1) as revenue
from sales group by product_id; 


create table c_product(product_id int ,cost_price float);

insert into c_product
values (101,100),
(103,250);


select c.product_id, sum((s.sell_price-c.cost_price)*s.quantity) as profit from sales as s inner join c_product as c
 where s.product_id=c.product_id
 group by c.product_id;
 
 select * FROM employee;
 
 select dept,avg(salary) as avg_salary 
 from employee
 group by dept
 having avg(salary)>50000;
 
 select city,sum(salary) as total
 from employee
 group by city
 having sum(salary)>20000;
 
 select dept,count(emp_id)  as emp_count
 from employee
 group by dept
 having count(emp_id)>=2;
 
select dept,count(*)  as emp_count
 from employee
 group by dept
 having count(*)>2;
 
 
 select city, count(*) as emp_count
 from employee
 where city !='New York'
 group by city
 having count(*)>=1;

select dept,count(*) as emp_count
from employee
group by dept
having avg(salary)>65000








