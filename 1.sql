create database db;
use db;
create table student(
 id int primary key,
 name varchar(255)
);

insert into student values(1,'ashish');

select * from student;
use db;
create table worker1(
worker_id int not null primary key auto_increment,
First_name char(24),
Last_name char(23),
Salary int(15),
Joining_date datetime,
department char(22)
);

insert into worker1 values 
(1,'ashish', 'parmar',100000,'20-10-2 09.00.00','HR'),
(2,'ashwin','chavda',500000,'20-09-12 09.00.00','ADMIN'),
(3,'dhaval','chavda',600000,'20-08-22 09.00.00','CEO'),
(4,'samidh','darji',2300000,'20-07-3 09.00.00','SE'),
(5,'nensi','darji',null,'20-05-20 9.00.00','SSE'),
(6,'vivek','kundra',800000,'20-10-20 09.00.00','ACCOUNT'),
(7,'ronak','adroja',900000,'20-03-21 09.00.00','ACCOUNT'),
(8,'raj','rabari',100000,'20-01-20 09.00.00','ADMIN');
select * from worker1;
DROP tables worker1;

create table bonus(
worker_ref_id int,
bonus_amount int(10),
bonus_date datetime,
foreign key(worker_ref_id)
     references worker(worker_id)
     on delete cascade
);

insert into bonus values 
 (1,5000,'16-02-20'),
 (2,4000,'16-02-20'),
 (3,8000,'16-02-20'),
 (4,6000,'16-02-20'),
 (5,null,'16-02-20'),
 (5,5000,'16-02-20');
 
 select * from bonus;
 
 create table title(
worker_ref_id int,
worker_title char(23),
AFFECTED_EROM datetime,
   foreign key(worker_ref_id)
   references worker(worker_id)
     on delete cascade
 );

insert into title values
(1,'Manager','2016-03-12 00:00:00'),
(3,'Executive','2016-04-20 00:00:00'),
(2,'Executive','2016-05-24 00:00:00'),
(4,'manager','2016-03-08 00:00:00'),
(6,'Asst.Manager','2016-02-24 00:00:00'),
(5,'Executive','2016-11-11 00:00:00'),
(8,'Lead','2016-5-21 00:00:00'),
(7,'Lead','2016-03-20 00:00:00');

select * from title;

select 44+55;

select now();

select ucase('Dhaval');
select lcase('Ashish');

select * from worker1 where Salary > 500000;

select * from worker1 where department = 'SE';

-- between
select * from worker1 where salary between 500000 and 1000000;

-- IN
select * from worker1 where department in ('HR','SE','Admin');

-- NOT
select * from worker1 where department not in ('HR','SE','Admin');

-- IS NULL
select * from worker1 where Salary is NULL;

-- Pattern searching (_=1 char,%=many char)

select * from worker1 where first_name like '_a_';
select * from worker1 where last_name like '_a%';
select * from worker1 where first_name like '%a_';
select * from worker1 where first_name like '%a%';

-- sorting using order by

select * from worker1 order by salary desc;
select * from worker1 order by salary;

-- DISTINCT
select distinct department from worker1;

-- DATA GROUPING(AGGREGATION(COUNT))
select department, count(department) from worker1 group by department;

-- AVG SALARY PER DEPARTMENT
select department, avg(salary) from worker1 group by department;

-- MIN salary
select department, min(salary) from worker1 group by department;

-- MAX salary
select department, max(salary) from worker1 group by department;

-- TOTAL salary
select department, sum(salary) from worker1 group by department;

-- GROUP BY HAVING
select department, count(department) from worker1 group by department having count(department)>1;

-- where use to filter the row from the table based
-- having use to filter the row from the group based

-- DDL 
-- 1)Primary key(NOT NULL,UNIQUE,ONLY ONE PRIMARY KEY)
-- 2)Foreign Key
-- 3)UNIQUE
-- 4)check
create table account(
id int primary key,
name varchar(255) unique,
balance int not null default 0
constraint acc_balance_chk check(balance > 1000)
);
use db;

insert into account values(1,'a',10000);
insert into account values(2,'b',8800);

use temp;

select * from account;
drop table account;

-- 5)default

-- ALTER OPERTAIONS
use db;
create table account(
  id int primary key,
  name varchar(255),
  balance int not null default 0
);
select * from account;
 -- ADD new column
 alter table account add interest float not null default 0; 
 
 -- MODIFY
 alter table account modify interest double not null default 0;
 
 desc account_details;
 
-- CHANGE COLUMN  -RENAME THE COLUMN
alter table account change column  interest saving_interest float not null default 0;

-- DROP TABLE
alter table account drop saving_interest;

-- rename table
alter table account rename to account_details;
use db;

-- DML
create database temp;

use temp;

create table customer(
  id int primary key,
  cname varchar(225),
  address varchar(255),
  gender char(55),
  city varchar(255),
  pincode int
);
drop table customer;

insert into customer values
  (1,'jay kumar','shivaji nagar','male','botad',364710),
  (2,'jesh','shivaji nagar','male','botad',364756),
  (3,'mangal','shivaji nagar','male','botad',364333),
  (4,'ram kumar','shivaji nagar','male','botad',364555);

-- update
update customer set address='mumbai', gender='m' where id =1;
select * from customer;

-- update multiple rows
set SQL_SAFE_UPDATES = 0;
update customer set pincode = pincode + 1;

-- delete
delete from customer where id = 11;

-- delete all
delete from customer;

--

create table order_details(
 order_id int primary key,
 delivery_date date,
 cust_id int,
 foreign key(cust_id) references customer(id) on delete cascade
);
-- on delete cascade forign key ma id hashe to pan delete karva deshe 
drop table order_details;

insert into order_details values 
(1,'2020-04-22',1),
(2,'2020-05-12',2),
(3,'2020-03-22',3),
(4,'2020-03-02',4);

select * from order_details;
-- direct delete nai thai schema ma apde on delete cascade lakvu padshe
--  foreign key(cust_id) references customer(id) on delete set null
-- on delete set null thi jo apde customer table n values delete kari nakhvi to null set kari nakhshe
 delete from customer where id = 1;
 
 
 -- replace
 -- data already present,replace
 -- data not present ,insert
 select * from customer;
 replace into customer (id,city) values(1251,'manali');
 replace into customer (id,cname,city) values (14,'code','dddd');
 
 replace into customer set id = 3,cname='ashish',city='sdas';
 
 -- replace vs upate
 
 -- if row is not present, replace will add a new row while update will do nothing
 
 -- joins
 -- a)inner join - To apply joins, there should be a common alternate.
 -- b)outer join
      -- 1)left outer join- all data from left table and the matched data from the right table
      -- 2)Right outer join- all data from right table and the matched data from the left table
      -- 2)full outer join- all data from when their is a match on left or right table data
-- c)cross join-cartion product(*)
-- d)self joine-emlate(inner join and as)


create table project (
  id int,
  empId int,
  name varchar(22),
  startdate date,
  clientId int
);
DROP table project;
insert into project values 
(1,1,'A','2020-03-20',3),
(2,2,'B','2020-04-22',1),
(3,3,'C','2020-05-26',5),
(4,3,'D','2020-06-28',2),
(5,5,'E','2020-07-02',4);

create table employee(
  id int primary key,
  fname varchar(255),
  lname varchar(255),
  age int,
  emailID varchar(255),
  phoneNo int,
  city varchar(255)
  );
  drop table employee;
  select * from employee;
   insert into employee values
   (2,'dhaval','parmar',23,'ashish01@gmail.com',969898,'ahmedabad'),
   (3,'dhaval','chavda',21,'dhaval01@gmail.com',969878,'delihi'),
   (4,'mehul','parmar',24,'mehul01@gmail.com',969897,'kolkata'),
   (5,'samidh','darji',21,'samidh01@gmail.com',969899,'jaipur');

create table client(
  id int primary key,
  first_name varchar(255),
  last_name varchar(255),
  age int,
  emailID varchar(255),
  phoneNo int,
  city varchar(255),
  empId int
  );
   drop table client;
insert into client values
   (1,'jainam','parmar',23,'jainam01@gmail.com',964898,'kolkata',3),
   (2,'hiren','parmar',23,'hiren01@gmail.com',969858,'ahmedabad',3),
   (3,'valji','chavda',21,'valji01@gmail.com',969878,'delihi',1),
   (4,'mayur','parmar',24,'mayur01@gmail.com',969887,'hyderabad',5),
   (5,'nensi','darji',21,'nensi01@gmail.com',969898,'jaipur',2);
  
-- inner join
-- enlist all the employees ID's, names along with the project allocated to time
select * from employee as e inner join project as p on e.id = p.empId ;

-- without inner keyword
select * from employee as e,project as p where e.id = p.empId ;

-- fetch out all the employee ID's and their contact detail who have been working
-- from jaipur with the clients name working in hyderabad

select e.id, e.emailID, e.phoneNo, c.last_name,c.first_name from employee as e
 inner join client as c on e.id = c.empId where e.city = 'jaipur' and c.city='hyderabad';
 
-- left join 
-- fetch out each project allocated to each employee

select * from employee as e left join project as p on e.id =p.empId;

-- right join 
-- list out the projects along with the employee's name and their respective allocated emailid.

select p.id, p.name, e.fname ,e.lname, e.emailID from employee as e right join project as p on e.id = p.empId;

-- cross join
select p.id, p.name, e.fname ,e.lname from employee as e cross join project as p;

use temp;

create table dept1(
   empid int,
   name varchar(255),
   role varchar(255)
);
drop table dept1;
insert into dept1 values
(1,'A','engineer'),
(2,'B','salesman'),
(3,'C','manager'),
(4,'D','salesman'),
(5,'E','engineer');

create table dept2(
   empid int,
   name varchar(255),
   role varchar(255)
   
);

insert into dept2 values
(3,'C','manager'),
(6,'F','marketing'),
(7,'G','salesman');

-- set operations

-- List out all the employees in the company(using union)
select * from dept1
union
select * from dept2;
use db;
use temp;

-- list out all the employees in all departments who work as salesman
select * from dept1 where role = 'salesman'
union
select * from dept2 where role = 'salesman';
  
-- list out all the employees who work both the departments.
-- Intersect
select dept1.* from dept1 inner join dept2 using(empid);  

-- list out all the employee working in dept1 but not in dept2.
-- Minus
select dept1.* from dept1 left join dept2 using(empid);
  
  
  -- sub Queries
  
  -- where clause same table 
  -- employee with age > 30
  select * from employee where age in (select age from employee where age > 22);
  
  -- where clause different table
  -- emp details working in more than 1 project
  select * from employee where id in(
  select empID from project group by empID having count(empId) > 1
  );
select * from project;

-- single value subquery
-- emp details having age > avg(age)

select * from employee where age > (select avg(age) from employee);

-- from clause -derived tables
-- select max age person whose first name contains has 'a'
select * from employee;
select max(age) from (select * from employee where fname like '%h%')As temp;

-- corelated subquery
-- find  3rd oldest employee
select * from employee e1 where 2 = (select count(e2.age)from employee e2 where e2.age >= e1.age);

-- view
select  * from employee;

-- creating a view
create view custom_view as select fname, age from employee;

-- viewing from view
select * from custom_view;

-- Altering the view
alter view custom_view as select fname,lname,age from employee;

-- drop
drop view if exists custom_view;