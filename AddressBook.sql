-- UC1 --
show databases;
create database AddressBookService;
use AddressBookService;


-- UC2 --
create table addressBook (
firstname varchar(50) not null,
lastname varchar(50) not null,
address varchar(100) not null,
city varchar(50) not null,
state varchar(50) not null,
zip int not null,
phone long not null,
email varchar(50) not null);

desc addressBook;


-- UC3 --
insert into addressBook(firstname, lastname, address, city, state, zip, phone, email)
values('Rahul','Sharma','#20 Abc Apartments', 'Bengaluru','Karnataka','560001','9012345670','rahul@gmail.com');

insert into addressBook(firstname, lastname, address, city, state, zip, phone, email)
values('Navneet','Gautam','#30 Dynamic Apartments', 'Bengaluru','Karnataka','560026','8066456780','navneet@gmail.com');

insert into addressBook(firstname, lastname, address, city, state, zip, phone, email)	
values('Tejas','Singh','#12 Vrindavan Apartments', 'Hyderabad','Telengana','403201','9874320023','tejas@gmail.com');

insert into addressBook(firstname, lastname, address, city, state, zip, phone, email)	
values('Abhijeet','Kumar','#65 Lake View Apartments', 'Jaipur','Rajasthan','340340','7123456789','abhijeet@gmail.com');

insert into addressBook(firstname, lastname, address, city, state, zip, phone, email)	
values('Nilesh','Dev','#11 SLV Apartments', 'Jaipur','Rajasthan','340321','812345676','nilesh@gmail.com');

select * from addressBook;


-- UC4 --
update addressBook set city = 'Mysuru'
where firstname = 'Navneet';

select * from addressBook;


-- UC5 --
delete from addressBook
where firstname ='Rahul';

select * from addressBook;


-- UC6 --
select * from addressBook 
where city = 'Jaipur';

select * from addressBook 
where state = 'Karnataka';


-- UC7 --
select count(state) from addressBook
group by state;

select count(city) from addressBook
where state = 'Karnataka' group by state;


-- UC8 --
select * from addressBook 
where city= 'Jaipur'
order by firstname ASC;

-- UC9 --
