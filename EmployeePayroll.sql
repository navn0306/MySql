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
select max(basic_pay) from employee_payroll
where gender = 'M';
select count(gender) from employee_payroll
	where gender = 'M';
select count(gender) from employee_payroll
	where gender = 'F';


-- UC8 --
alter table employee_payroll
	add phone_number varchar(30),
	add department varchar(30) not null;

alter table employee_payroll
	add address varchar(250) default 'ABC';


-- UC9 --
alter table employee_payroll
	rename column salary to basic_pay;

alter table employee_payroll
	add deductions int,
	add taxable_pay int,
	add income_tax int,
	add net_pay int;


-- UC10 --
insert into employee_payroll(name, basic_pay, start_date,department)
	values('Terrisa',500000,'2021-05-09','sales');

insert into employee_payroll(name, basic_pay, start_date, gender, phone_number, department, deductions, taxable_pay, income_tax, net_pay)
	values('Terrisa', 500000, '2021-05-09','F','2345678', 'marketing', 2000, 3400, 4000, 12000);


-- UC11 --
create table employee (
	id int not null auto_increment primary key,
	name varchar(50),
	gender varchar(10),
	phone  varchar(15),
	address varchar(250),
	startDate Date not null
);
desc employee;

create table payroll (
	id int not null auto_increment primary key,
    basic_pay int,
    deductions int,
    income_tax int,
    taxable_pay int,
    net_pay int,
    emp_ID int,
    foreign key (emp_Id) references employee(id)
);
desc payroll;

create table department (
	id int not null auto_increment primary key,
	dept_name varchar(50) not null
);
desc department;

create table employee_department (
	employee_id int not null,
    department_id int not null,
    foreign key(employee_id) references employee(id),
    foreign key(department_id) references department(id),
    primary key(employee_id,department_id)
);
desc employee_department;


-- UC12 --
	-- UC4 Again --
use payroll_service;

insert into employee(name, gender, phone, address, startDate)
values('Daniel', 'M','3456789','#30 New city', '2020-05-09');
insert into employee(name, gender, phone, address, startDate)
values('Bill', 'M','3647763231','#12 Old city', '2020-03-19');
insert into employee(name, gender, phone, address, startDate)
values('Charlie', 'F','9876542345','#56 Dummy city', '2020-11-22');
insert into employee(name, gender, phone, address, startDate)
values('Terisa', 'F','156789283','#56 Blue city', '2020-07-17');

select * from employee;


insert into payroll(basic_pay, deductions, income_tax, taxable_pay, net_pay, emp_ID)
values(25000,1500,1000,1200,9000,1);
insert into payroll(basic_pay, deductions, income_tax, taxable_pay, net_pay, emp_ID)
values(30000,1800,1400,1500,10000,2);
insert into payroll(basic_pay, deductions, income_tax, taxable_pay, net_pay, emp_ID)
values(28000,1700,1300,1400,11000,3);
insert into payroll(basic_pay, deductions, income_tax, taxable_pay, net_pay, emp_ID)
values(26000,1600,1250,1200,12000,4);

select * from payroll;


insert into department (dept_name)
values('sales');
insert into department (dept_name)
values('marketing');
insert into department (dept_name)
values('Human Resources');

select * from department;


insert into employee_department (employee_id, department_id)
values (1,1);
insert into employee_department (employee_id, department_id)
values (2,3);
insert into employee_department (employee_id, department_id)
values (3,1);
insert into employee_department (employee_id, department_id)
values (4,1);
insert into employee_department (employee_id, department_id)
values (4,2);

select * from employee_department;


	-- UC5 Again --
select basic_pay, name 
	from payroll , employee
	where name = 'Bill' AND emp_ID = 2;
    
select * from employee
	where startDate between '2020-05-01' and Date(now());
    
    
	-- UC7 Again--
select sum(basic_pay) from employee, payroll
	group by gender;
    
select avg(basic_pay) from employee, payroll
	group by gender;
    
select max(basic_pay) from employee, payroll
	where gender = 'M';
    
select count(gender) from employee
	where gender = 'M';

select count(gender) from employee
	where gender = 'F';
