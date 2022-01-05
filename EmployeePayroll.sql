-- UC1 --
show databases;
create database payroll_service;
use payroll_service;


-- UC2 --
create table employee_payroll (
id int not null auto_increment,
name varchar(50) not null,
salary double not null,
start_date Date not null,
primary key (id)
);
desc employee_payroll;


-- UC3 --
insert into employee_payroll(name, salary, start_date)
values('Navneet',500000,'2021-05-09');
insert into employee_payroll(name, salary, start_date)
values('Bill',500000,'2021-05-09');
insert into employee_payroll(name, salary, start_date)
values('Charlie',650000,'2021-03-01');
insert into employee_payroll(name, salary, start_date)
values('Kritika',40000,'2021-02-07');


-- UC4 --
select * from employee_payroll;


-- UC5 --
select salary from employee_payroll
where name = 'Navneet';

select * from employee_payroll
where start_date between '2021-03-01' and Date(now());


-- UC6 --
alter table employee_payroll add gender char(1) ;
update employee_payroll set gender = 'M'
where id < 5;
update employee_payroll set gender = 'F'
where id = 5;

-- UC7 --
select sum(salary) from employee_payroll
group by gender;
select avg(salary) from employee_payroll
group by gender;
select max(salary) from employee_payroll;






