--Easy Tasks

--Write a SQL query to split the Name column by a comma into two separate columns: Name and Surname.(TestMultipleColumns)
select SUBSTRING(name,1,charindex(',',name,1)-1) as Name,SUBSTRING(name,charindex(',',name,1)+1,LEN(name)) as Surname  from TestMultiplecolumns
select * from TestMultipleColumns
--Write a SQL query to find strings from a table where the string itself contains the % character.(TestPercent)
Select * from testpercent
where strs like '%/%%' escape '/'
--In this puzzle you will have to split a string based on dot(.).(Splitter)
select *, SUBSTRING(Vals,1,CHARINDEX('.',Vals,1)-1) as dot1,SUBSTRING(Vals,CHARINDEX('.',Vals,1)+1,1) as dot2,SUBSTRING(Vals,CHARINDEX('.',vals,CHARINDEX('.',Vals,1)+2)+1,len((select case when vals like '%.%.%' then vals else '' end as dd from Splitter where e.vals=vals)))  from Splitter e

--Write a SQL query to replace all integers (digits) in the string with 'X'.(1234ABC123456XYZ1234567890ADS)
select translate('1234ABC123456XYZ1234567890ADS', '0123456789','XXXXXXXXXX')
--Write a SQL query to return all rows where the value in the Vals column contains more than two dots (.).(testDots)
select * from testDots
where vals like '%.%.%.%'
--Write a SQL query to count the spaces present in the string.(CountSpaces)
select *, datalength(texts)-len(replace(texts,' ','')) as TrueSpaceLength from Countspaces 

--write a SQL query that finds out employees who earn more than their managers.(Employee)
select * from employee e
where e.salary>(select salary from employee where id=isnull(e.managerId,0))
select * from Employee
--Find the employees who have been with the company for more than 10 years, but less than 15 years. Display their Employee ID, First Name, Last Name, Hire Date, and the Years of Service (calculated as the number of years between the current date and the hire date).(Employees)
select * from Employees
where DATEDIFF(DAYOFYEAR,HIRE_DATE,GetDATE())>10 and DATEDIFF(DAYOFYEAR,HIRE_DATE,GetDATE())<15
--Medium Tasks

--Write a SQL query to separate the integer values and the character values into two different columns.(rtcfvty34redt)
SELECT replace(TRANSLATE('rtcfvty34redt', 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ- ', REPLICATE(' ', 54)),' ','') as Numbers, replace(TRANSLATE('rtcfvty34redt', '0123456789 ', REPLICATE(' ', 11)),' ','') as Characters
--write a SQL query to find all dates' Ids with higher temperature compared to its previous (yesterday's) dates.(weather)
select a.id as Id
from Weather a,weather b
where dateadd(DAY, 1, b.recorddate)=a.recorddate and a.temperature-b.temperature>0
--Write an SQL query that reports the first login date for each player.(Activity)
select player_id, min(event_date) as LOGINdate from activity
group by player_id
--Your task is to return the third item from that list.(fruits)
select SUBSTRING(fruit_list,CHARINDEX(',',(fruit_list),CHARINDEX(',',(fruit_list),1)+1)+1,CHARINDEX(',',(fruit_list),CHARINDEX(',',(fruit_list),CHARINDEX(',',(fruit_list),1)+1)+1)-CHARINDEX(',',(fruit_list),CHARINDEX(',',(fruit_list),1)+1)-1) as ThirdCH from fruits
--2nd solution
select * from fruits
SELECT value
FROM fruits
    CROSS APPLY STRING_SPLIT(fruit_list, ',',1)
    where ordinal =3
--Write a SQL query to create a table where each character from the string will be converted into a row.(sdgfhsdgfhs@121313131)
DECLARE @str NVARCHAR(MAX) = 'sdgfhsdgfhs@121313131';

SELECT 
    SUBSTRING(@str, number, 1) AS Letter
FROM master..spt_values
WHERE type = 'P' 
  AND number BETWEEN 1 AND LEN(@str);
--You are given two tables: p1 and p2. Join these tables on the id column. The catch is: when the value of p1.code is 0, replace it with the value of p2.code.(p1,p2)
select * from p1
cross join p2
select * from p1
union all
select * from p2

select p1.id, iif(p1.code=0,replace(0, p1.code, p2.code),p1.code) as NEW from p1 full join p2
on p1.id=p2.id
--Write an SQL query to determine the Employment Stage for each employee based on their HIRE_DATE. The stages are defined as follows:
select *, 
case when
 DATEDIFF(DAYOFYEAR,HIRE_DATE,GetDATE())>20 then 'Veteran'
 when DATEDIFF(DAYOFYEAR,HIRE_DATE,GetDATE()) between 10 and 20 then 'Senior'
 when DATEDIFF(DAYOFYEAR,HIRE_DATE,GetDATE()) between 5 and 10 then 'Mid_level'
 when DATEDIFF(DAYOFYEAR,HIRE_DATE,GetDATE()) between 1 and 5 then 'Junior'
 when DATEDIFF(DAYOFYEAR,HIRE_DATE,GetDATE()) <1 then 'New Hire'
 end as TITLE
 from Employees
--If the employee has worked for less than 1 year → 'New Hire'

--If the employee has worked for 1 to 5 years → 'Junior'

--If the employee has worked for 5 to 10 years → 'Mid-Level'

--If the employee has worked for 10 to 20 years → 'Senior'

--If the employee has worked for more than 20 years → 'Veteran'(Employees)

--Write a SQL query to extract the integer value that appears at the start of the string in a column named Vals.(GetIntegers)
select * from Getintegers
SELECT
    CAST(SUBSTRING(Vals, 1, PATINDEX('%[^0-9]%', Vals + 'a') - 1) AS INT) AS ExtractedInteger
FROM
    Getintegers;
--Difficult Tasks

--In this puzzle you have to swap the first two letters of the comma separated string.(MultipleVals)
select * from MultipleVals
select replace(vals,SUBSTRING(vals,1,PATINDEX('%,_,%', Vals)+1), REVERSE(SUBSTRING(vals,1,PATINDEX('%,_,%', Vals)+1))) as dotttt from MultipleVals

select reverse (SUBSTRING(vals,1,PATINDEX('%,_,%', Vals)+1)) from MultipleVals
--Write a SQL query that reports the device that is first logged in for each player.(Activity)
select player_id, device_id, min(event_date) as LOGINdate from activity
group by player_id, device_id

select * from Activity
--You are given a sales table. Calculate the week-on-week percentage of sales per area for each financial week. For each week, the total sales will be considered 100%, and the percentage sales for each day of the week should be calculated based on the area sales for that week.(WeekPercentagePuzzle)
select * from WeekPercentagePuzzle
select Date, (salesLocal+SalesRemote)/(select sum(salesLocal+SalesRemote) from WeekPercentagePuzzle where e.date=date)* 100 as SUM from WeekPercentagePuzzle e
Group by Date, salesLocal+SalesRemote
select Sum(salesLocal+SalesRemote) from WeekPercentagePuzzle