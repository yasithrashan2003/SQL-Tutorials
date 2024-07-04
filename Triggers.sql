create database triggers;

use triggers;

#before insert triggers

create table customers
(cust_id int, age int, name varchar(30));

delimiter //
create trigger age_verify
before insert on customers
for each row
if new.age<0 then set new.age=0;
end if; //

insert into customers values
(101,27,"James"),
(102,-40,"Ammy"),
(103,23,"Ben"),
(104,-82,"angela");



select* from customers;

# after insert trigggers

create table customers1
( id int auto_increment primary key,
name varchar(40) not null,
email varchar(30),
birthday date);
  

Delimiter //
create trigger
check_null_dob
after insert
on customers1
for each row
begin
if new.birthday is null then
insert into message(messageID,message)
values (new.id,concat('hi',new.name,'please update'));
end if;
end //
delimiter ;

insert into customers1 (name, email, birthday)
values
("nancy","nanacy@abc.com",null),
("ronald","ronald@xyz.com","1998-11-14"),
("ronaldo","ronaldo@xyz.com","1999-11-14");

select * from message;

#before update
create table employees
(emp_id int primary key,
emp_name varchar(25),
age int,
salary float);

insert into employees values
(101,"jimmy",25,70000),
(102,"steve",24,72000),
(103,"david",25,60000),
(104,"pat",25,50000),
(105,"speed",25,40000),
(106,"luffy",25,30000);

delimiter //
create trigger upd_trigger
before update 
on employees
for each row
begin
if new.salary=50000 then
set new.salary=85000;
elseif 
new.salary < 40000 then
set new.salary = 100000;
end if;
end //
delimiter ;

UPDATE employees
SET salary = 2000;



insert into employees values
(108,"jimmyyy",25,1000);

select * from employees;


# before delete

create table salary
(eid int primary key,
validfrom date not null,
amount float not null);

insert into salary (eid,validfrom,amount) values
(101,'2005-05-01',55000),
(102,'2003-12-30',68000),
(103,'2004-09-09',75000);


select * from salary;

create table salarydel
(id int primary key auto_increment,
eid int, validfrom date not null,
amount float not null,
deletedat timestamp default now());

delimiter $$
create trigger salary_delete
before delete
on salary
for each row 
begin
insert into salarydel(eid,validfrom,amount)
values(old.eid, old.validfrom, old.amount);
end$$
delimiter ;


delete from salary where
eid=101;

select * from salarydel;









