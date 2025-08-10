--Easy Tasks
--Create a numbers table using a recursive query from 1 to 1000.
with numbers as (Select
1 as Natural
Union all 
select 
Natural +1
from numbers
where Natural <1000
)
select * from numbers
use lesson_16

--Write a query to find the total sales per employee using a derived table.(Sales, Employees)
SELECT * FROM SALES
SELECT * FROM Employees


 

SELECT CONCAT (Employees.FirstName,Employees.LastName)AS EMPLOYEENAME, TOTSALES FROM
( 
SELECT EMPLOYEEID, SUM(SalesAmount) AS TOTSALES FROM SALES
GROUP BY EmployeeID
) AS DER
LEFT JOIN Employees ON DER.EmployeeID=Employees.EmployeeID

--Create a CTE to find the average salary of employees.(Employees)
WITH CTE AS (SELECT 
AVG(Salary) AS Avgsalary FROM Employees
)
Select * from CTE
--Write a query using a derived table to find the highest sales for each product.(Sales, Products)
SELECT * FROM SALES
select Products.ProductName, MAXsales from
(
select ProductID ,max(SalesAmount) as MAXsales from Sales
group by ProductID
) as DIT
join Products on DIT.ProductID=Products.ProductID
select * from Products
--Beginning at 1, write a statement to double the number for each record, the max value you get should be less than 1000000.
with num as (select
1 as Number
union all
select 
Number*2 from num
where Number*2 < 1000000
)
Select * from num
--Use a CTE to get the names of employees who have made more than 5 sales.(Sales, Employees)
WITH CTE AS (SELECT 
employeeID, count(*) AS Sale FROM Sales
group by EmployeeID
)
Select CONCAT (Employees.FirstName,' ', Employees.LastName) as FullName, Sale  from CTE join Employees on
employees.EmployeeID=cte.employeeID
where sale > 5

--Write a query using a CTE to find all products with sales greater than $500.(Sales, Products)
-- First
WITH CTE AS (SELECT 
ProductID, sum(Salesamount) AS Sale FROM Sales
group by ProductID
)
Select ProductName, Sale  from CTE join Products on
Products.ProductID=cte.ProductID
where sale > 500;
-- Second as you can see two entirely different methods but same result because of the initial input
WITH CTE AS (SELECT 
ProductID, sum(Salesamount) AS Sale FROM Sales
where Salesamount>500
group by ProductID

)
Select ProductName, Sale  from cte join Products on
Products.ProductID=cte.ProductID


--Create a CTE to find employees with salaries above the average salary.(Employees)
with cte as (select * from employees
where salary> (select AVG(Salary) from Employees)
)
select * from cte
--EASY approach
select * from employees
where salary> (select AVG(Salary) from Employees)

--Medium Tasks

--Write a query using a derived table to find the top 5 employees by the number of orders made.(Employees, Sales)
select  *  from ( 
select  top 5 CONCAT (FirstName,' ', LastName) as FullName, count(*) as ordN from Employees join
Sales on employees.employeeID=sales.employeeID
 group by CONCAT (FirstName,' ', LastName)
order by ordN
 ) as asta


--Write a query using a derived table to find the sales per product category.(Sales, Products)
select Products.ProductName, asss from
(
select ProductID, Sum(SalesAmount) asss from sales
group by ProductID

) as dera
join Products on 
dera.ProductID=Products.ProductID 
--Write a script to return the factorial of each value next to it.(Numbers1)
WITH FactorialCTE AS (
        SELECT 0 AS Number, CAST(1 AS BIGINT) AS FactorialValue
        UNION ALL
        SELECT Number + 1, FactorialValue * (Number + 1)
        FROM FactorialCTE
        WHERE Number < 20 -- Adjust as needed for maximum factorial
    )
    select *, (SELECT FactorialValue
    FROM FactorialCTE
    WHERE Number = (select number from Numbers1 where e.Number=Numbers1.Number)) As Factorial from Numbers1 e
    
--This script uses recursion to split a string into rows of substrings for each character in the string.(Example)
select * from Example

with  cte as (

select 1 as Position, substring (string,1,1) as LetterbyLetter, string as bb from Example
UNion all
select Position+1, substring(bb,position+1,1), bb from cte
where position<len(bb)
)
select * from cte


--Use a CTE to calculate the sales difference    between the current month and the previous month.(Sales)
with cte as (select month(SaleDate) as Month,sum(SalesAmount) as Salessss,  LAG(sum(SalesAmount), 1, Null) OVER (order by month(SaleDate)) AS PreviousDaySales from Sales
group by month(SaleDate))
select month, Salessss-PreviousDaySales as Difference from cte


--Create a derived table to find employees with sales over $45000 in each quarter.(Sales, Employees)
select * from Sales
select * from Employees

select concat (Employees.FirstName,' ',Employees.LastName) as Fullname from (
select EmployeeID, DATEPART(QUARTER,SaleDate) as Quarter, sum(SalesAmount) as totalSUM from Sales
group by EmployeeID, DATEPART(Q,SaleDate)
having sum(SalesAmount)>4500
) as Turtle
join Employees on
turtle.EmployeeID=Employees.DepartmentID
group by Employees.FirstName,Employees.LastName
having count (FirstName) =4

--Difficult Tasks

--This script uses recursion to calculate Fibonacci numbers

with cte as (
select 0 as first, 1 as second

union all

select first=second, second+first from cte
where first<2000

)
select first from cte




--Find a string where all characters are the same and the length is greater than 1.(FindSameCharacters)

select *  from FindSameCharacters
where len(Vals)>1 and REPLICATE(left(Vals,1),len(vals))=Vals

--Create a numbers table that shows all numbers 1 through n and their order gradually increasing by the next number in the sequence.(Example:n=5 | 1, 12, 123, 1234, 12345)
with cte as
(
select 2 as Number, cast(1 as nvarchar(4000)) as String
union all
select Number+1,concat(string,cast(number as nvarchar(4000))) from cte
where number<=20
)
select * from cte
--Write a query using a derived table to find the employees who have made the most sales in the last 6 months.(Employees,Sales)

--Write a T-SQL query to remove the duplicate integer values present in the string column. Additionally, remove the single integer character that appears in the string.(RemoveDuplicateIntsFromNames)


select replace (Pawan_slug_name, Numbers,'') as REP from (select
Pawan_slug_name, substring(Pawan_slug_name,PATINDEX('%[1-9]%',Pawan_slug_name),len(Pawan_slug_name)) as Numbers from RemoveDuplicateIntsFromNames
)as Wing
where len(Numbers)=1 or REPLICATE(left(Numbers,1),len(Numbers))=Numbers


select * from RemoveDuplicateIntsFromNames

