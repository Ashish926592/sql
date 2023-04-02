-- Create the following table: Table Name: Employee EMPLOYEE_ID FIRST_NAME LAST_NAME SALARY JOINING_DATE DEPARTMENT 
-- 1 John Abraham 1000000 01-JAN-13 12.00.00 AM Banking 
-- 2 Michael Clarke 800000 01-JAN-13 12.00.00 AM Insurance 
-- 3 Roy Thomas 700000 01-FEB-13 12.00.00 AM Banking 
-- 4 Tom Jose 600000 01-FEB-13 12.00.00 AM Insurance
-- 5 Jerry Pinto 650000 01-FEB-13 12.00.00 AM Insurance 
-- 6 Philip Mathew 750000 01-JAN-13 12.00.00 AM Services 
-- 7 TestName1 123 650000 01-JAN-13 12.00.00 AM Services 
-- 8 TestName2 Lname% 600000 01-FEB-13 12.00.00 AM Insurance 
-- 1. Write create table syntax for employee table 
-- 2. Get all employee details from the employee table 
-- 3. Get First_Name,Last_Name from employee table 
-- 4. Get First_Name from employee table using  alias name “Employee Name”
--  5. Get employee details from employee table whose employee name is “John”
--  6. Get employee details from employee table whose employee name are “John” and “Roy”
--  7. Get employee details from employee table whose employee name are not “John” and “Roy” 
--  8. Get employee details from employee table whose first name starts with 'J' 
--  9. Get employee details from employee table whose first name contains 'o'
--  10. Get employee details from employee table whose Salary between 500000 and 800000 
--  11. Get unique DEPARTMENT from employee table
--  12. Select TOP 2 salary from employee table 
--  13. Store the output of below query in common table expression,and then find out the average of their salary
--  14. Get employee details from employee table whose Salary between 500000 and 800000
--  15. Get names of employees from employee table who has '%' in Last_Name. 
--  16. Give 10% incentive to each employee, find out the employee whose incentive amount is more  than 1lac, using derived table
use sys;
create table Employee (
   EMPLOYEE_ID int not null primary key,
   FIRST_NAME varchar(255) not null,
   LAST_NAME varchar(255) not null,
   SALARY int not null,
   JOINING_DATE  varchar(255) not null,
   DEPARTMENT varchar(255) not null
);
drop table Employee;
INSERT INTO `sys`.`employee`
(`EMPLOYEE_ID`,
`FIRST_NAME`,
`LAST_NAME`,
`SALARY`,
`JOINING_DATE`,
`DEPARTMENT`)
VALUES(1, "John","Abraham", 1000000, "01-JAN-13 12.00.00 AM", "Banking"),
(2, "Michael", "Clarke", 800000," 01-JAN-13 12.00.00 AM","Insurance"),
( 3, "Roy"," Thomas", 700000," 01-FEB-13 12.00.00 AM","Banking" ),
( 4 ,"Tom"," Jose", 600000 ,"01-FEB-13 12.00.00 AM","Insurance"),
(5 ,"Jerry"," Pinto", 650000, "01-FEB-13 12.00.00 AM", "Insurance" ),
( 6 ,"Philip"," Mathew", 750000, "01-JAN-13 12.00.00 AM","Services"), 
(7 ,"TestName1"," 123 ",650000," 01-JAN-13 12.00.00 AM","Services" ),
(8 ,"TestName2"," Lname%", 600000, "01-FEB-13 12.00.00 AM","Insurance" );

select FIRST_NAME,LAST_NAME from Employee;

-- 4. Get First_Name from employee table using  alias name “Employee Name”
select FIRST_NAME as "Employee Name" from Employee;

--  5. Get employee details from employee table whose employee name is “John”
select * from employee where FIRST_NAME="John";

--  6. Get employee details from employee table whose employee name are “John” and “Roy”
select * from employee where FIRST_NAME="John" or FIRST_NAME="Roy";
select * from employee where FIRST_NAME in("John","Roy") ;

--  7. Get employee details from employee table whose employee name are not “John” and “Roy”
select * from employee where FIRST_NAME not in("John","Roy") ;
 
--  8. Get employee details from employee table whose first name starts with 'J'
select * from employee where FIRST_NAME like("J%");
 
--  9. Get employee details from employee table whose first name contains 'o'
select * from employee where FIRST_NAME like("%o%");

--  10. Get employee details from employee table whose Salary between 500000 and 800000 
select * from employee where Salary between 500000 and 800000;

--  11. Get unique DEPARTMENT from employee table
select  distinct DEPARTMENT from employee; 

--  12. Select TOP 2 salary from employee table 
select  salary from employee limit 2;

--  13. Store the output of below query in common table expression,and then find out the average of their salary
 select avg(salary) from employee limit 2;

--  14. Get employee details from employee table whose Salary between 500000 and 800000
select * from employee where Salary between 500000 and 800000;

--  15. Get names of employees from employee table who has '%' in Last_Name.
select Last_Name from employee where Last_Name like("%\%%");
 
--  16. Give 10% incentive to each employee, find out the employee whose incentive amount is more than 1lac, using derived table
SELECT incentive_salary
  FROM (SELECT SALARY * 0.1 as incentive_salary from employee) AS test1_set  
  WHERE incentive_salary > 100000 ;  