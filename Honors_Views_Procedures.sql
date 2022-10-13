--Write and execute a SQL query to list the school names, community names and average attendance for communities with a hardship index of 98.
SELECT CPS.NAME_OF_SCHOOL, CPS.average_student_attendance, CPS.COMMUNITY_AREA_NAME
FROM CHICAGO_PUBLIC_SCHOOLS CPS
JOIN CENSUS_DATA CD ON CPS.COMMUNITY_AREA_NUMBER = CD.COMMUNITY_AREA_NUMBER 
WHERE CD.HARDSHIP_INDEX = 98;
--Write and execute a SQL query to list all crimes that took place at a school. Include case number, crime type and community name.
SELECT CASE_NUMBER, PRIMARY_TYPE, COMMUNITY_AREA_NAME
FROM CHICAGO_CRIME_DATA CCD
LEFT JOIN CENSUS_DATA CD ON CCD.COMMUNITY_AREA_NUMBER = CD.COMMUNITY_AREA_NUMBER
WHERE LOCATION_DESCRIPTION LIKE '%SCHOOL%';
--Write and execute a SQL statement to create a view showing the columns listed in the following table, with new column names as shown in the second column.
	--Column name in CHICAGO_PUBLIC_SCHOOLS	Column name in view
	--NAME_OF_SCHOOL	School_Name
	--Safety_Icon	Safety_Rating
	--Family_Involvement_Icon	Family_Rating
	--Environment_Icon	Environment_Rating
	--Instruction_Icon	Instruction_Rating
	--Leaders_Icon	Leaders_Rating
	--Teachers_Icon	Teachers_Rating
CREATE VIEW Data_Subset(School_Name, Safety_Rating, Family_Rating, Environment_Rating, Instruction_Rating, Leaders_Rating, Teachers_Rating)
AS SELECT NAME_OF_SCHOOL, Safety_Icon, Family_Involvement_Icon, Environment_Icon, Instruction_Icon, Leaders_Icon, Teachers_Icon
FROM CHICAGO_PUBLIC_SCHOOLS;

--Write and execute a SQL statement that returns all of the columns from the view.
SELECT * FROM Data_Subset;

--Write and execute a SQL statement that returns just the school name and leaders rating from the view.
SELECT SCHOOL_NAME, LEADERS_RATING FROM Data_Subset;

--Write the structure of a query to create or replace a stored procedure called UPDATE_LEADERS_SCORE that takes a in_School_ID parameter as an integer and a in_Leader_Score parameter as an integer. Don't forget to use the #SET TERMINATOR statement to use the @ for the CREATE statement terminator.

--#SET TERMINATOR @
CREATE PROCEDURE UPDATE_LEADERS_SCORE (IN in_SCHOOL_ID INTEGER, IN in_LEADER_SCORE INTEGER)

LANGUAGE SQL 
MODIFIES SQL DATA
BEGIN 
END 

@


--Inside your stored procedure, write a SQL statement to update the Leaders_Score field in the CHICAGO_PUBLIC_SCHOOLS table for the school identified by in_School_ID to the value in the in_Leader_Score parameter.
--#SET TERMINATOR @
CREATE PROCEDURE UPDATE_LEADERS_SCORE (IN in_SCHOOL_ID INTEGER, IN in_LEADER_SCORE INTEGER)

LANGUAGE SQL 
MODIFIES SQL DATA

BEGIN 
	UPDATE CHICAGO_PUBLIC_SCHOOLS 
	SET LEADERS_SCORE = in_LEADERS_SCORE
	WHERE SCHOOL_ID = in_SCHOOL_ID
	
END 
@

--Inside your stored procedure, write a SQL IF statement to update the Leaders_Icon field in the CHICAGO_PUBLIC_SCHOOLS 
--#SET TERMINATOR @
CREATE PROCEDURE UPDATE_LEADERS_SCORE (IN in_SCHOOL_ID INTEGER, IN in_LEADER_SCORE INTEGER)

LANGUAGE SQL 
MODIFIES SQL DATA

BEGIN

	IF in_LEADER_SCORE> 0 AND in_LEADER_SCORE< 19 THEN
		UPDATE CHICAGO_PUBLIC_SCHOOLS 
		SET LEADERS_ICON = 'Very Weak'
		WHERE SCHOOL_ID = in_SCHOOL_ID;	
	
	ELSEIF in_LEADER_SCORE >20 AND in_LEADER_SCORE <39 THEN 
		UPDATE CHICAGO_PUBLIC_SCHOOLS 
		SET LEADERS_ICON = 'Weak'
		WHERE SCHOOL_ID = in_SCHOOL_ID;
	
	ELSEIF in_LEADER_SCORE >40 AND in_LEADER_SCORE <59 THEN 
		UPDATE CHICAGO_PUBLIC_SCHOOLS 
		SET LEADERS_ICON = 'Average'
		WHERE SCHOOL_ID = in_SCHOOL_ID;
	
	ELSEIF in_LEADER_SCORE >60 AND in_LEADER_SCORE <79 THEN 
		UPDATE CHICAGO_PUBLIC_SCHOOLS 
		SET LEADERS_ICON = 'Strong'
		WHERE SCHOOL_ID = in_SCHOOL_ID;
	
	ELSEIF in_LEADER_SCORE >80 AND in_LEADER_SCORE <99 THEN 
		UPDATE CHICAGO_PUBLIC_SCHOOLS 
		SET LEADERS_ICON = 'Very Strong'
		WHERE SCHOOL_ID = in_SCHOOL_ID;
	ELSE 
		UPDATE CHICAGO_PUBLIC_SCHOOLS 
		SET LEADERS_ICON = 'NA'
		WHERE SCHOOL_ID = in_SCHOOL_ID;
		
	END IF;
END 
@

--Run your code to create the stored procedure 
--Write a query to call the stored procedure, passing a valid school ID and a leader score of 50, to check that the procedure works as expected.

ALTER TABLE CHICAGO_PUBLIC_SCHOOLS 
ALTER COLUMN LEADERS_ICON VARCHAR(10);

CALL UPDATE_LEADERS_SCORE (400018, 50);
--Update your stored procedure definition. Add a generic ELSE clause to the IF statement that rolls back the current work if the score did not fit any of the preceding categories.
--Update your stored procedure definition again. Add a statement to commit the current unit of work at the end of the procedure.
--Run your code to replace the stored procedure.
--Write and run one query to check that the updated stored procedure works as expected when you use a valid score of 38.
--Write and run another query to check that the updated stored procedure works as expected when you use an invalid score of 101.