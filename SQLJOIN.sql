create database sql_join;

show databases;

use sql_join;

show tables;

create table cricket(cricket_id int auto_increment,
name varchar(30),
primary key(cricket_id));

create table football (football_id int auto_increment,
name varchar(30),
primary key(football_id));

insert into cricket (name)
values ('Stuart'),('Micheal'),('Johnson'),('Hayden'),('Fleming');

select * from cricket;

insert into football (name)
values ('Stuart'),('Johnson'),('Hayden'),('Langer'),('Astle');

select * from football;

select * from cricket as c inner join
football as f on c.name=f.name;

select c.cricket_id,c.name,f.football_id,f.name
from cricket as c inner join football as f
on c.name=f.name;


# update statements
create table products
(prod_id int,item varchar(30), sell_price float, product_type varchar(30));

insert into products values
(101, 'jewellery',1800,'luxury'),
(102,'T-shirt',100,'Non-luxury'),
(103,'Laptop',1300,'luxury'),
(104,'Table',400,'Non-Luxury');

select * from products;

create table orders
(order_id int,product_sold varchar(30),selling_price float);

insert into orders
select prod_id, item, sell_price
from products 
where prod_id in
(select prod_id from products where sell_price>1000);

select * from orders;























 
