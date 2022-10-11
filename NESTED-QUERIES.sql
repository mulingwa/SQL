SELECT * FROM EMPLOYEES;

--Execute a failing query (i.e. one which gives an error) to retrieve all employees records whose salary is lower than the average salary.
SELECT * FROM 
EMPLOYEES 
WHERE SALARY < AVG(SALARY);

--Execute a working query using a sub-select to retrieve all employees records whose salary is lower than the average salary.
SELECT Emp_ID, F_Name, L_Name, Salary
FROM EMPLOYEES 
WHERE Salary < (SELECT AVG(SALARY) FROM EMPLOYEES);

--Execute a failing query (i.e. one which gives an error) to retrieve all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
SELECT Emp_ID, F_Name, L_name, MAX(Salary)
FROM Employees;

--Execute a Column Expression that retrieves all employees records with EMP_ID, SALARY and maximum salary as MAX_SALARY in every row.
SELECT Emp_ID, F_Name, (SELECT MAX(SALARY) FROM EMPLOYEES) MAX_SALARY
FROM EMPLOYEES;

--Execute a Table Expression for the EMPLOYEES table that excludes columns with sensitive employee data (i.e. does not include columns: SSN, B_DATE, SEX, ADDRESS, SALARY)
SELECT * 
FROM (SELECT Emp_ID, F_Name, L_name, Dep_ID FROM EMPLOYEES) EMP4ALL;
WHERE