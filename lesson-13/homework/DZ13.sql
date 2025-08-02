--Lesson 13 ----Practice: String Functions, Mathematical Functions

--Easy Tasks
--You need to write a query that outputs "100-Steven King", meaning emp_id + first_name + last_name in that format using employees table.
select * from Employees
select CONCAT(employee_ID, '-', FIRST_NAME,' ',Last_Name) as Concatname from Employees
--Update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'
select * from  Employees
Update Employees
set Phone_number = REPLACE(Phone_number,'.124.','.999.')
--That displays the first name and the length of the first name for all employees whose name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees first names.(Employees)
select First_name, LEN(First_name) as FirstLength  from Employees
where First_name like '[AJK]%'

--Write an SQL query to find the total salary for each manager ID.(Employees table)
select Manager_ID, sum(salary) as TS from Employees
group by manager_ID
--Write a query to retrieve the year and the highest value from the columns Max1, Max2, and Max3 for each row in the TestMax table
select year1, GREATEST(Max1,Max2,Max3) as Greatest from TestMAX
--Find me odd numbered movies and description is not boring.(cinema)
select * from Cinema
where id%2>0 and description <> 'boring'
--You have to sort data based on the Id but Id with 0 should always be the last row. Now the question is can you do that with a single order by column.(SingleOrder)
select * from singleorder
order by case when id=0 then 1 else 0 end, id asc

--Write an SQL query to select the first non-null value from a set of columns. If the first column is null, move to the next, and so on. If all columns are null, return null.(person)
select id, COALESCE(ssn,passportid,itin) as Firstnonnull from Person
use lesson13
--Medium Tasks
--Split column FullName into 3 part ( Firstname, Middlename, and Lastname).(Students Table)
select SUBSTRING(FullName,1,CHARINDEX(' ',FullName,1)) as first_name,
SUBSTRING(FullName, Len(SUBSTRING(FullName,1,CHARINDEX(' ',FullName,1)))+2,CHARINDEX(' ',fullname,CHARINDEX(' ',fullname,1)+2) - CHARINDEX(' ',fullname,1)) as Middle_name, REPLACE(FullName,CONCAT(SUBSTRING(FullName,1,CHARINDEX(' ',FullName,1)),
SUBSTRING(FullName, Len(SUBSTRING(FullName,1,CHARINDEX(' ',FullName,1)))+2,CHARINDEX(' ',fullname,CHARINDEX(' ',fullname,1)+2) - CHARINDEX(' ',fullname,1))),'') as Last_name from Students
select * from Students
--select FullName - SUBSTRING(FullName,1,CHARINDEX(' ',FullName,1)) from Students
--select SUBSTRING(FullName, Len(SUBSTRING(FullName,1,CHARINDEX(' ',FullName,1)))+2,CHARINDEX(' ',fullname,CHARINDEX(' ',fullname,1)+2) - CHARINDEX(' ',fullname,1)) from Students

--For every customer that had a delivery to California, provide a result set of the customer orders that were delivered to Texas. (Orders Table)
-- Not comprehensible enought you should work harder to make comprehensive tasks

--Write an SQL statement that can group concatenate the following values.(DMLTable)
select  STRING_AGG(String, ' ') from DMLTable

--Find all employees whose names (concatenated first and last) contain the letter "a" at least 3 times.
select *, CONCAT(FIRST_NAME,' ',LAST_NAME) as full_name from Employees
where CONCAT(FIRST_NAME,' ',LAST_NAME) like '%a%a%a%'
--The total number of employees in each department and the percentage of those employees who have been with the company for more than 3 years(Employees)
select DEPARTMENT_ID,count (*),(select count(EMPLOYEE_ID) from Employees where DATEDIFF(YEAR,HIRE_DATE,GETDATE())>3 and e.DEPARTMENT_ID=DEPARTMENT_ID)/(select count(EMPLOYEE_ID)from Employees where e.DEPARTMENT_ID=DEPARTMENT_ID)*100 from Employees as e
group by DEPARTMENT_ID
select * from Employees
--Write an SQL statement that determines the most and least experienced Spaceman ID by their job description.(Personal)
select * from Personal as e
where MissionCount=(select MAX(missioncount) from Personal where e.JobDescription=JobDescription) or MissionCount=(select min(missioncount) from Personal where e.JobDescription=JobDescription)

--Write an SQL query that separates the uppercase letters, lowercase letters, numbers, and other characters from the given string 'tf56sd#%OqH' into separate columns.

select replace('tf56sd#%OqH','[A-Z]','')
select 'tf56sd#%OqH'

--Write an SQL query that replaces each row with the sum of its value and the previous rows value. (Students table)

--You are given the following table, which contains a VARCHAR column that contains mathematical equations. Sum the equations and provide the answers in the output.(Equations)
select * from Equations

select len(Equation) from Equations
select convert(int,concat('=',Equation)) from Equations
--Given the following dataset, find the students that share the same birthday.(Student Table)
 select distinct e.StudentName, e.Birthday from Student e
join Student b on
e.Birthday=b.Birthday and e.StudentName<>b.StudentName
order by e.Birthday
--You have a table with two players (Player A and Player B) and their scores. If a pair of players have multiple entries, aggregate their scores into a single row for each unique pair of players. Write an SQL query to calculate the total score for each unique player pair(PlayerScores)
select  PlayerA+PlayerB as EEntry, SUM(Score) as totalscore  from PlayerScores
group by PlayerA + PlayerB

