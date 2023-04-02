CREATE TABLE  Employees1 (
    EmployeeID decimal(6,0) NOT NULL DEFAULT '0',
	FirstName varchar(20) DEFAULT NULL,
	LastName varchar(25) NOT NULL,
	Email varchar(25) NOT NULL,
	PhoneNumber varchar(20) DEFAULT NULL,
	HireDate date NOT NULL,
	JobId varchar(10) NOT NULL,
	Salary decimal(8,2) DEFAULT NULL,
	CommissionPct decimal(2,2) DEFAULT NULL,
	ManagerID decimal(6,0) DEFAULT NULL,
	DepartmentID decimal(4,0) DEFAULT NULL,
	CONSTRAINT pkEmployeeID PRIMARY KEY (EmployeeID),
	CONSTRAINT ukEmail UNIQUE  (Email)
 );
 
 CREATE TABLE dob (
  id INT NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO dob (id, first_name, last_name, date_of_birth)
VALUES (1, 'John', 'Doe', '1985-01-15'),
       (2, 'Jane', 'Smith', '1990-05-02'),
       (3, 'Bob', 'Johnson', '1988-09-22'),
       (4, 'Alice', 'Williams', '1995-03-10');
 
-- 1. Write a query that displays the first name and the length of the first name
--  for all employees whose name starts with the letters 'A', 'J' or 'M'.
--  Give each column an appropriate label. Sort the results by the employees
--  ' first names.

select FIRST_NAME,length(FIRST_NAME) as LENGTH from employee where FIRST_NAME like("A%") or FIRST_NAME like("J%") or FIRST_NAME like("M%") order by FIRST_NAME; 

--  2. Write a query to display the first name and salary for all employees.
--  Format the salary to be 10 characters long, left-padded with the $ symbol.
--  Label the column SALARY.

SELECT FIRST_NAME,LPAD(SALARY, 10, '$') as SALARY  FROM employee;

--  3. Write a query to display the employees with their code, first name, 
--  last name and hire date who hired either on seventh day of
--  any month or seventh month in any year.

select * from Employees1 where day(HireDate) = 7 or month(HireDate) = 7; 

--  4. Write a query to display the length of first name for employees where
--  last name contain character 'c' after 2nd position.
select FirstName,length(FirstName) as LENGTH,LastName from Employees1 where LastName like("__c%");


--  5. Write a query to extract the last 4 character of phone numbers.
select right(PhoneNumber,4) from Employees1 ;

--  6. Write a query to update the portion of the phone_number in the employees 
--  table, within the phone number the substring '124' will be replaced by '999'.
select PhoneNumber  from Employees1;
set sql_safe_updates = 0;
UPDATE Employees1 
SET PhoneNumber = REPLACE(PhoneNumber, '124', '999') 
WHERE PhoneNumber LIKE '%124%';

--  7. Write a query to calculate the age in year. 
select (year(curdate()) - year(date_of_birth)) as age from dob;
select year(curdate()) - year(date_of_birth) - case when month(curdate()) < month(date_of_birth) or month(curdate()) = month(date_of_birth) and day(curdate()) < day(date_of_birth) then 1 else 0 end as age from dob;

--  8. Write a query to get the distinct Mondays from hire_date in employees tables.
select distinct dayname(HireDate) as week1 from Employees1 where dayname(HireDate) = "Monday";

--  9. Write a query to get the first name and hire date from employees
--  table where hire date between'1987-06-01' and '1987-07-30'
select HireDate,FirstName from Employees1 where HireDate between '1987-06-01' and '1987-07-30';

--  10. Write a query to display the current date in the following format.
-- Sample output : 12:00 AM Sep 5, 2014 

SELECT date_format(CURRENT_TIMESTAMP(), '%h:%i %p %b %d, %Y ') as times;

--  12. Writea query to get the firstname, lastname who joined in the month of June.
select monthname(HireDate) as month1,FirstName,LastName from Employees1 where monthname(HireDate) = "June";

-- select month(HireDate) from Employees1; 

--  13. Write a query to get employee ID, last name, and date of first salary of the employees.
 select EmployeeID,FirstName,LastName,HireDate from Employees1 order by HireDate limit 1;

--  14. Write a query to get first name, hire date and experience of the employees. 
 select (year(curdate()) - year(HireDate)) as experience,FirstName from Employees1;

--  15. Write a query to get first name of employees who joined in 1987.
 select EmployeeID,FirstName,HireDate from Employees1 where year(HireDate) = 1987;

--  16. Write a query to rank employees based on their salary for a month
select Salary,monthname(HireDate) as month_name,FirstName from Employees1 order by Salary desc;

--  17. Select 4th Highest salary from employee table using ranking function
select Salary from Employees1 order by Salary desc limit 1 offset 3;
