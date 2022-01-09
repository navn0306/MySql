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
alter table addressbook 
	add addressBookName varchar(50),
    add addressBookType varchar(50);
    
desc addressBook;

update addressBook set addressBookName = 'Book1' where firstname = 'Navneet';
update addressBook set addressBookName = 'Book2' where firstname = 'Tejas';
update addressBook set addressBookName = 'Book3' where firstname = 'Abhijeet';
update addressBook set addressBookName = 'Book4' where firstname = 'Nilesh';

update addressBook set addressBookType = 'Family' where firstname = 'Navneet';
update addressBook set addressBookType = 'Friend' where firstname = 'Tejas';
update addressBook set addressBookType = 'Family' where firstname = 'Abhijeet';
update addressBook set addressBookType = 'Friend' where firstname = 'Nilesh';

select * from addressBook;


-- UC10 --
select addressBookType, count(addressBookType) 
	from addressBook group by addressBookType;
    

-- UC11 --

create table name(
Slno int not null primary key auto_increment,
fristname varchar(30) not null,
lastname varchar(30) not null
);
desc name;

create table address(
Slno int not null primary key auto_increment,
address varchar(150),
city varchar(50),
state varchar(50),
zip int,
phone long,
email varchar(50),
contactId int,
foreign key(contactId) references name(Slno)
);
desc address;

create table addressBookTypes(
id int not null primary key auto_increment,
bookname varchar(20),
booktype varchar(20)
);
desc addressBookTypes;

create table addressBookContacts(
contactId int not null,
addressbookId int not null,
foreign key(contactId) references name(Slno),
foreign key(addressbookId) references addressBookTypes(id),
primary key(contactId,addressbookId)
);
desc addressBookContacts;

insert into name(fristname, lastname)
values('Navneet','Gautam');
insert into name(fristname, lastname)
values('Ajeet','Singh');
insert into name(fristname, lastname)
values('Nilesh','Patil');
insert into name(fristname, lastname)
values('Abhijeet','Singh');
select * from name;


insert into address(address, city, state, zip, phone, email, contactId)
values('#12 New City', 'Bengaluru', 'Karnataka', 560064, 234567876,'navneet@gmail.com',1);
insert into address(address, city, state, zip, phone, email, contactId)
values('#30 Old City Apartment', 'Mysore', 'Karnataka', 510021, 7376367232,'ajeet@gmail.com',2);
insert into address(address, city, state, zip, phone, email, contactId)
values('#41 SLV Apartrment', 'Kolkata', 'West Bengal', 207001, 986242672,'niliesh@gmail.com',3);
insert into address(address, city, state, zip, phone, email, contactId)
values('#12 Dynamic Apartments', 'Mumbai', 'Maharastra', 120021, 8765445678,'abhijeet@gmail.com',4);
select * from address;


insert into addressBookTypes(bookname, booktype)
values('Book1', 'Friends');
insert into addressBookTypes(bookname, booktype)
values('Book2', 'Family');
insert into addressBookTypes(bookname, booktype)
values('Book3', 'Friends');
insert into addressBookTypes(bookname, booktype)
values('Book4', 'Family');
select * from addressBookTypes;


insert into addressBookContacts(contactId, addressbookId)
values(1,1);
insert into addressBookContacts(contactId, addressbookId)
values(2,2);
insert into addressBookContacts(contactId, addressbookId)
values(3,3);
insert into addressBookContacts(contactId, addressbookId)
values(4,4);
select * from addressBookContacts;

-- UC6 Again--
select * from name, address
where State ='Karnataka';