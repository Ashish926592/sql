-- 4. Write a SQL statement to create a table employees including columns
--  employee_id, first_name, last_name, email, phone_number hire_date, job_id,
--  salary, commission, manager_id and department_id and make sure that,
--  the employee_id column does not contain any duplicate value at the time of
--  insertion, and the foreign key column department_id, reference by the column 
--  department_id of departments table, can contain only those values which are
--  exists in the departments table and another foreign key column job_id,
--  referenced by the column job_id of jobs table, can contain only those
--  values which are exists in the jobs table.
 use sys;
 
 create table employees(
 employee_id int primary key auto_increment,
 first_name varchar(255) not null,
 last_name varchar(255) not null,
 email varchar(255) not null constraint check(email like '%_@__%.__%'),
 phone_number numeric(10) not null, 
 hire_date date not null,
 salary int not null,
 commission int not null,
 manager_id int not null,
 job_id int not null,
 department_id int not null,
constraint fk_job foreign key (job_id) references jobs1(job_id),
constraint fk_department foreign key (department_id) references department(department_id)
 );
 
 create table department(
 department_id int not null primary key,
 department_name varchar(255)
 );
 

 
 create table jobs1(
 job_id int not null primary key,
 jobs_title varchar(255),
 min_salary int,
 max_salary int
 );
 
 insert into jobs1 values(1,"devops",10000,100000);
 insert into jobs1 values(2,"web devloper",20000,200000) ;
 
 select * from jobs1;
 
 insert into department values(2,"PHP") ;
  insert into department values(3,".net");
  
INSERT INTO `sys`.`employees`
(`employee_id`,
`first_name`,
`last_name`,
`email`,
`phone_number`,
`hire_date`,
`salary`,
`commission`,
`manager_id`,
`job_id`,
`department_id`)
VALUES
(1,
"Ashish",
"Parmar",
"sam@gmail.com",
8000708493,
"2022-02-01",
10000,
500,
1,
1,
2
);
select * from employees;
 