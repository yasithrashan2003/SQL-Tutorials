use parks_and_recreation;

select *
from employee_demographics;

select first_name,
(age+10) * 10 +10
from employee_demographics;


select distinct gender
from employee_demographics;


select *
from employee_salary
where first_name='Leslie';

select *
from employee_salary
where salary<= 50000;

select *
from employee_demographics
where gender !='Female';


-- AND OR NOT -- Logical Operator

select *
from employee_demographics
where birth_date > '1985-01-01' or not gender='male';

select *
from employee_demographics
where (first_name = 'Leslie' and age=44) or age> 55;


-- LIKE STATEMENT
-- % and _

select *
from employee_demographics
where first_name like 'a___%';

select *
from employee_demographics
where birth_date like '1989%';

select gender,avg(age)
from employee_demographics
group by gender;

select occupation,sum(salary)
from employee_salary
group by occupation;

select gender,avg(age),max(age), min(age),count(age)
from employee_demographics
group by gender;


select *
from employee_demographics
order by age,gender;

select *
from employee_demographics
order by gender,age;

# column Possition
select *
from employee_demographics
order by 5,4;

select gender,avg(age)
from employee_demographics
group by gender
having avg(age)>40;

select occupation,avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary)>75000;


select *
from employee_demographics
order by age desc
limit 2,1;


-- Aliasing

select gender,avg(age) as avg_age
from employee_demographics
group by gender
having avg_age>40;

select *
from employee_demographics;

select *
from employee_salary;

-- inner joins

select dem.employee_id,age,occupation
from employee_demographics as dem
inner join employee_salary as sal
on dem.employee_id =sal.employee_id;

-- outer joins

select *
from employee_demographics as dem
right outer join employee_salary as sal
on dem.employee_id =sal.employee_id;

-- self joins

select*
from employee_salary emp1
join employee_salary emp2
on emp1.employee_id +1 = emp2.employee_id
;


select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_santa_id,
emp2.first_name as first_name_emp,
emp2.last_name as last_name_emp
from employee_salary emp1
join employee_salary emp2
on emp1.employee_id +1 = emp2.employee_id
;


-- join multiple tables


select *
from employee_demographics as dem
inner join employee_salary as sal
on dem.employee_id =sal.employee_id
inner join parks_departments  pd
on sal.dept_id=pd.department_id
;

select * 
from parks_departments;



select first_name,last_name
from employee_demographics
union 
select first_name,last_name
from employee_salary;


select first_name,last_name,'Old Man' as Lable
from employee_demographics
where age > 40 and gender ="Male"
union
select first_name,last_name,'Old Lady' as Lable
from employee_demographics
where age > 40 and gender ="Female"
union
select first_name,last_name,'Highly Paid Employee' as Lable
from employee_salary
where salary >70000
order by first_name,last_name
;




-- String Functions
select first_name, length(first_name)
from employee_demographics;

select trim('      sky      ');


select first_name, left(first_name,4),  right(first_name,4),
substring(first_name,3,2 ),
substring(birth_date,6,2 ) as Birth_month
from employee_demographics;

select first_name,replace(first_name,'a','Z')
from employee_demographics;


select locate('x','Alexander');


select first_name,locate('An',first_name)
from employee_demographics;

select first_name,last_name,
concat(first_name,' ',last_name) as Full_Name
from employee_demographics;

-- Case statements ------

select first_name,last_name
last_name,age,
case
	when age < 30 then 'Young' 
    when age between 31 and 50 then 'Old'
    when age >=50 then "On death's Door"
end as age_bracket
from employee_demographics;


-- Pay Increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus

select first_name, last_name, salary,
case
	when salary < 50000 then salary + (salary *0.05)
    when salary > 50000 then salary * 1.07
end as New_Salary,
case
	when dept_id=6 then salary*.10
end as Bonus
from employee_salary;


select * 
from employee_salary;
select * 
from parks_departments;




-- Subqueries

select *
from employee_demographics
where employee_id in
					( select employee_id
					from employee_salary
                    where dept_id=1);

select first_name,salary,avg(salary)
from employee_salary
group by first_name,salary;

select first_name,salary,
(select avg(salary) from employee_salary)
from employee_salary
group by first_name,salary;

select gender, avg(age), max(age),min(age),count(age)
from employee_demographics
group by gender;

select gender,avg(`max(age)`)
from 						(select gender, avg(age), max(age),min(age),count(age)
							from employee_demographics
							group by gender) as Agg_table
group by gender;

-- sub2--

select gender, avg(age), max(age),min(age),count(age)
from employee_demographics
group by gender;


select gender
from (select gender, avg(age), max(age),min(age),count(age)
from employee_demographics
group by gender) as agg_age;

-- Tempory Table ---------

select gender, `max(age)`
			from (select gender,
					avg(age) as avg_age,
					max(age) ,
					min(age) as min_age,
					count(age) as count_age
					from employee_demographics
					group by gender) as agg_age
group by gender;
 







select avg(max_age)
from 
(select gender,
 avg(age) as avg_age,
 max(age) as max_age,
 min(age) as min_age,
 count(age)
from employee_demographics
group by gender) as Agg_table;



-- Window Functions

select dem.first_name,dem.last_name,gender, avg(salary) 
from employee_demographics dem
join employee_salary sal
	on dem.employee_id=sal.employee_id
group by dem.first_name,dem.last_name,gender;



select dem.first_name,dem.last_name,gender,salary, sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics dem
join employee_salary sal
	on dem.employee_id=sal.employee_id;


select dem.employee_id,dem.first_name,dem.last_name,gender,salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) rank_num,
dense_rank()  over(partition by gender order by salary desc) dense_rank_num
from employee_demographics dem
join employee_salary sal
	on dem.employee_id=sal.employee_id;


select first_name,salary,(select avg(salary)  from employee_salary)
from employee_salary
group by first_name,salary;



select first_name,salary, (select avg(salary)
from employee_salary)
from employee_salary
group by first_name,salary;



select avg(salary)
from employee_salary;




SELECT e.first_name
FROM employee_salary as e
join(
    SELECT gender, avg(age) as avg_age, max(age) as max_age, min(age) as min_age, count(age) as count_age
    FROM employee_demographics 
    GROUP BY gender
) as agg_age
ON e.gender = agg_age.gender;


-- Group by ---

select * from employee_demographics;

select * from employee_salary;

select first_name,occupation, count(occupation) as num
from employee_salary;

select gender,max(age)
from employee_demographics
group by gender;

select first_name,gender
from employee_demographics
group by gender ;


-- CTE

-- method 01

with CTE_Example as 
(
select gender,avg(salary) avg_sal, max(salary) max_sal,min(salary) min_sal,count(salary) count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id=sal.employee_id
group by gender
)
select avg(avg_sal)
from CTE_Example;

-- method 02


select avg(avg_sal)
from (select gender,avg(salary) avg_sal, max(salary) max_sal,min(salary) min_sal,count(salary) count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id=sal.employee_id
group by gender
)example_subqueury;


-- Join 2 tables using CTE

select avg(avg_sal)
from CTE_Example;

with CTE_Example as 
(
select employee_id,gender,birth_date
from employee_demographics 
where birth_date > '1985-01-01'
),
CTE_Example2 as 
(
select employee_id,salary
from employee_salary
where salary>50000
)
select *
from CTE_Example
join CTE_Example2
	on 
     CTE_Example.employee_id=CTE_Example2.employee_id
;


-- CTE example 03

with CTE_Example (gender,avg_sal,max_sal,min_salary,count_salary) as 
(
select gender,avg(salary) avg_sal, max(salary) max_sal,min(salary) min_sal,count(salary) count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id=sal.employee_id
group by gender
)
select *
from CTE_Example;


-- Tutoraial CTE

select *
from employee_demographics;


-- normal sql queury

select gender,avg(age)
from employee_demographics
group by gender;

-- CTE code
with cte_gender as 
		(
        select gender,avg(age) as age_avg ,min(age),max(age),count(age) as c_age
		from employee_demographics
		group by gender
			)

select gender,c_age
from cte_gender;


select * from employee_demographics;

select * from employee_salary;



-- First talble

select employee_id,first_name from employee_demographics;

-- Second talble

select employee_id,occupation,salary from employee_salary;


-- CTE join table

with cte_dem as 
				(select employee_id,first_name from employee_demographics),
cte_sal as
				(select employee_id,occupation,salary from employee_salary)
select *
from cte_dem
			join
cte_sal
on cte_dem.employee_id=cte_sal.employee_id;
						

-- Temporary Table

 -- method 01
 
 create temporary table temp_table
 ( first_name varchar(50),
 last_name varchar(50),
 favourite_movie varchar(100)
 );

select * from temp_table;

insert into temp_table values
('yasith','rashan','naruto');


select * from employee_salary;

create temporary table salary_over_50k
select *
from employee_salary
where salary >= 50000;

select * from salary_over_50k;

-- Store Procedures --------------------------------

select * from 
employee_salary
where salary >= 50000;

create procedure large_salaries()
select * from 
employee_salary
where salary >= 50000;

call large_salaries();


delimiter $$
create procedure large_salaries3()
begin
	select * from 
	employee_salary
	where salary >= 50000;
	select * from 
	employee_salary
	where salary >= 1000;
end $$
delimiter ;

call large_salaries3();


delimiter $$
create procedure large_salaries6(huggymuffin int)
begin
	select salary
    from employee_salary
	where employee_id = huggymuffin
    ;
end $$
delimiter ;


call large_salaries6(4);


-- Triggers and event ----------------------------

delimiter $$
create trigger employee_insert
	after insert on employee_salary
    for each row 
begin
	insert into employee_demographics (employee_id, first_name,last_name)
    values (new.employee_id,new.first_name,new.last_name);
end $$
delimiter ;

select * from employee_salary;

select * from employee_demographics;


insert into employee_salary (employee_id,first_name,last_name,occupation,salary,dept_id)
values(13,'Jean-Ralphio','Saperstein','Entertainment 720 CEO',1000000,null);


-- Events

select * from employee_demographics;

delimiter $$
create event delete_retirees
on schedule every 30 second
do
begin
	delete
    from employee_demographics
    where age >=60;
end $$
delimiter ;

show variables like 'event%';



