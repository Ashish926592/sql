use sys;

-- 3. Write a SQL statement to create a table named jobs including
--  columns job_id, job_title, min_salary and max_salary,
--  and make sure that, the default value for job_title is blank and min_salary is 8000
--  and max_salary is NULL will be entered automatically at the time of insertion
--  if no value assigned for the specified columns.

create table jobs(
job_id int  not null primary key auto_increment,
job_title varchar(255) default "",
min_salary int default 8000,
max_salary int default null
);
select * from jobs;
insert into jobs values();
insert into jobs(job_title,min_salary,max_salary) values("Project Manager",200000,1000000);
insert into jobs(job_title,min_salary,max_salary) values("devops",10000,1000000);


