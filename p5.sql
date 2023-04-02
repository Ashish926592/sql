-- 1. Write a SQL statement to add a foreign key constraint
--  named fk_job_id on job_id column of job_history table 
--  referencing to the primary key job_id of jobs table.
-- 2. Write a SQL statement to drop the existing foreign key fk_job_id
--  from job_history table on job_id column which is referencing
--  to the job_id of jobs table.
-- 3. Write a SQL statement to add a new column named location to the job_history
--  table.

use sys;
-- q-1
ALTER TABLE JobHistory
ADD CONSTRAINT fk_job_id FOREIGN KEY(Job_ID) REFERENCES Jobs(JobID);

-- q-2
ALTER TABLE JobHistory
DROP CONSTRAINT fk_job_id;

-- q-3
ALTER TABLE JobHistory
ADD Location varchar(30)