SELECT * FROM EMPLOYEES;

--Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
SELECT *
FROM EMPLOYEES
WHERE JOB_ID in (select JOB_IDENT from jobs);

--Retrieve only the list of employees whose JOB_TITLE is Jr. Designer.
SELECT * FROM JOBS;
select * from employees
where JOB_ID IN 
(select JOB_IDENT from jobs where JOB_TITLE= 'Jr. Designer');

--Retrieve JOB information and who earn more than $70,000.
SELECT * FROM JOBS;
--SELECT * FROM JOB_HISTORY;
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT
from jobs 
where JOB_IDENT IN (select JOB_ID from employees where SALARY > 70000 );

--Retrieve JOB information and whose birth year is after 1976.
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT
from jobs 
where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE) >1976);

--Retrieve JOB information for female employees whose birth year is after 1976.
SELECT * FROM EMPLOYEES;
select JOB_TITLE, MIN_SALARY,MAX_SALARY,JOB_IDENT
from jobs 
where JOB_IDENT IN (select JOB_ID from employees where YEAR(B_DATE) >1976 AND SEX = 'F');

--Perform an implicit cartesian/cross join between EMPLOYEES and JOBS tables.
SELECT * FROM JOBS, EMPLOYEES;

--Retrieve only the EMPLOYEES records that correspond to jobs in the JOBS table.
SELECT *
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;

--Redo the previous query, but retrieve only the Employee ID, Employee Name and Job Title.
SELECT EMP_ID, F_NAME, L_NAME, JOB_TITLE
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_IDENT;