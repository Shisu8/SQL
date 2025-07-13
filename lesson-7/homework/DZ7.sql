--Lesson 7 Homework Tasks
--These homework tasks cover the following topics:

--Aggregate Functions (MIN, MAX, COUNT, AVG, SUM)
--Filtering Aggregated Data with HAVING
--Notes before doing the tasks:

--🟢 Easy-Level Tasks (10)
--Write a query to find the minimum (MIN) price of a product in the Products table.
select min(price) from Products as MinPrice

--Write a query to find the maximum (MAX) Salary from the Employees table.
select max(salary) from Employees as Maxsalary
--Write a query to count the number of rows in the Customers table.
select count(*) from Customers
--Write a query to count the number of unique product categories from the Products table.
select count (distinct category) from Products

--Write a query to find the total sales amount for the product with id 7 in the Sales table.
select * from Sales
select Sum(saleamount) from Sales
where ProductID = 7
--Write a query to calculate the average age of employees in the Employees table.
select avg(age) from Employees
--Write a query to count the number of employees in each department.
select count(employeeID) Emperdep from Employees 
group by DepartmentName
--Write a query to show the minimum and maximum Price of products grouped by Category. Use products table.
select Category ,min(price) Min ,max(price) Max from Products
group by Category
--Write a query to calculate the total sales per Customer in the Sales table.
select customerID, sum (SaleAmount) Total from Sales
group by CustomerID
--Write a query to filter departments having more than 5 employees from the Employees table.(DeptID is enough, if you dont have DeptName).
select departmentName, count(employeeID) Number from Employees
group by DepartmentName
having count(employeeID)>5
--🟠 Medium-Level Tasks (9)

--Write a query to calculate the total sales and average sales for each product category from the Sales table.
select ProductID, AVG (SaleAmount) AVG, sum(SaleAmount) SUM from Sales
group by ProductID
--Write a query to count the number of employees from the Department HR.
select count(employeeID) NUM from Employees
where DepartmentName='HR'
--Write a query that finds the highest and lowest Salary by department in the Employees table.(DeptID is enough, if you don't have DeptName).
select DepartmentName,max(salary) MAX, min(salary)MIN from Employees
group by DepartmentName
--Write a query to calculate the average salary per Department.(DeptID is enough, if you don't have DeptName).
select DepartmentName,avg(salary) Average_salary from Employees
group by DepartmentName
--Write a query to show the AVG salary and COUNT(*) of employees working in each department.(DeptID is enough, if you don't have DeptName).
select DepartmentName,AVG(salary) Average, count(*) Number from Employees
group by DepartmentName
--Write a query to filter product categories with an average price greater than 400.
select Category, avg(price) Averageprice from Products
group by Category
having avg(price)>400 
--Write a query that calculates the total sales for each year in the Sales table.
select year(Saledate) year, sum(saleamount) total from sales
group by year(Saledate)

--Write a query to show the list of customers who placed at least 3 orders.
select  CustomerID, count(orderID) Numorder FROM Orders
group by customerID
having count(orderID)>=3
--Write a query to filter out Departments with average salary expenses greater than 60000.(DeptID is enough, if you dont have DeptName).
--🔴 Hard-Level Tasks (6)
select DepartmentName, avg(salary) AVGS from Employees
group by DepartmentName
having avg(salary) >60000
--Write a query that shows the average price for each product category, and then filter categories with an average price greater than 150.
select Category, avg(price) Averageprice from Products
group by Category
having avg(price)>150 
--Write a query to calculate the total sales for each Customer, then filter the results to include only Customers with total sales over 1500.
select  CustomerID, sum(SaleAmount) Amounttt FROM Sales
group by customerID
having sum(SaleAmount)>1500
--Write a query to find the total and average salary of employees in each department, and filter the output to include only departments with an average salary greater than 65000.
select DepartmentName, sum(Salary) SUMS,avg(salary) AVGS from Employees
group by DepartmentName
having avg(salary) >65000
--Write a query to find total amount for the orders which weights more than $50 for each customer along with their least purchases.(least amount might be lower than 50, use tsql2012.sales.orders table,freight col, ask ur assistant to give the TSQL2012 database).
select sum(TotalAmount) Summa, Min(TotalAmount) Least from orders
group by CustomerID
having sum(TotalAmount)>50
--Write a query that calculates the total sales and counts unique products sold in each month of each year, and then filter the months with at least 2 products sold.(Orders)
select distinct MONTH(OrderDate), count(ProductID) from Orders
group by MONTH(OrderDate)
having count(ProductID)>=2
--Write a query to find the MIN and MAX order quantity per Year. From orders table. Necessary tables:
select YEAR(OrderDate) YEarling, Min(Quantity)min , MAX(Quantity) max from Orders
group by YEAR(OrderDate)