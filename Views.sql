--Let's create a view called EMPSALARY to display salary along with some basic sensitive data of employees from the HR database.
CREATE VIEW EMPSALARY AS 
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, SALARY
FROM EMPLOYEES; 

--Using SELECT, query the EMPSALARY view to retrieve all the records.
SELECT * FROM EMPSALARY;

--combining two tables EMPLOYEES and JOBS so that we can display our desired information from the HR database.
CREATE OR REPLACE VIEW EMPSALARY  AS 
SELECT EMP_ID, F_NAME, L_NAME, B_DATE, SEX, JOB_TITLE, MIN_SALARY, MAX_SALARY
FROM EMPLOYEES, JOBS
WHERE EMPLOYEES.JOB_ID = JOBS.JOB_IDENT;
SELECT * FROM EMPSALARY;

--Dropping a view
DROP VIEW empsalary;

--confirming deletion
SELECT * FROM EMPSALARY;