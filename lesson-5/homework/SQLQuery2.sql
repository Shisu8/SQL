Easy-Level Tasks
--Write a query that uses an alias to rename the ProductName column as Name in the Products table.
select Productname as Name from Products

--Write a query that uses an alias to rename the Customers table as Client for easier reference.
select * from customers as Client

--Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted.
select  ProductName from Products
Union
select productname from Products_discounted
--Write a query to find the intersection of Products and Products_Discounted tables using INTERSECT.
select  ProductName from Products
intersect
select productname from Products_discounted
--Write a query to select distinct customer names and their corresponding Country using SELECT DISTINCT.
select distinct Firstname, country from Customers

--Write a query that uses CASE to create a conditional column that displays 'High' if Price > 1000, and 'Low' if Price <= 1000 from Products table.
select *,
case
when Price> 1000 then 'High'
else 'Low'
end as evaluation
from Products


--Use IIF to create a column that shows 'Yes' if Stock > 100, and 'No' otherwise (Products_Discounted table, StockQuantity column).
Select StockQuantity, iif (StockQuantity>100,'Yes','No') as In_Stock
from Products_Discounted
Medium-Level Tasks
--Use UNION to combine results from two queries that select ProductName from Products and ProductName from Products_Discounted tables.
select  ProductName from Products
Union
select productname from Products_discounted
--Write a query that returns the difference between the Products and Products_Discounted tables using EXCEPT.
select Productname from Products
Except
select Productname from Products_discounted
--Create a conditional column using IIF that shows 'Expensive' if the Price is greater than 1000, and 'Affordable' if less, from Products table.
select *, iif(Price>1000,'Expensive','Affordable') as Affordability
from Products
--Write a query to find employees in the Employees table who have either Age < 25 or Salary > 60000.

Update the salary of an employee based on their department, increase by 10% if they work in 'HR' or EmployeeID = 5
select * from employees
update employees
set salary = salary*1.1
where departmentname='HR' or employeeid=5
Hard-Level Tasks
--Write a query that uses CASE to assign 'Top Tier' if SaleAmount > 500, 'Mid Tier' if SaleAmount BETWEEN 200 AND 500, and 'Low Tier' otherwise. (From Sales table)
select *, 
case
when saleAmount > 500 then 'Top Tier'
when saleAmount between 200 and 500 then 'Mid Tier'
else 'Low Tier'
End as TIER
from sales
--Use EXCEPT to find customers ID who have placed orders but do not have a corresponding record in the Sales table.
select CustomerID from Orders
except
select CustomerID from Sales

--Write a query that uses a CASE statement to determine the discount percentage based on the quantity purchased. Use orders table. Result set should show customerid, quantity and discount percentage. The discount should be applied as follows: 1 item: 3% Between 1 and 3 items : 5% Otherwise: 7%
select CustomerID, Quantity, 
case 
when quantity = 1 then '3%'
when quantity between 1 and 3 then '5%'
else '7%'
end as Discount
from Orders