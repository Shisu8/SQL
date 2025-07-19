--Easy-Level Tasks (7)
--Return: OrderID, CustomerName, OrderDate
--Task: Show all orders placed after 2022 along with the names of the customers who placed them.
--Tables Used: Orders, Customers
select OrderID, Customers.FirstName, OrderDate from Orders
left join Customers on 
Customers.CustomerID=Orders.CustomerID
where Orders.OrderDate>'2022-12-31'

--Return: EmployeeName, DepartmentName
--Task: Display the names of employees who work in either the Sales or Marketing department.
--Tables Used: Employees, Departments

select Name, Departments.DepartmentName from Employees
join Departments on 
Departments.DepartmentID= Employees.DepartmentID
where DepartmentName in ('Sales','Marketing')

--Return: DepartmentName, MaxSalary
--Task: Show the highest salary for each department.
--Tables Used: Departments, Employees
select Departments.DepartmentName, Max (Salary) as MaxSalary from Employees
left join Departments on 
Departments.DepartmentID= Employees.DepartmentID
group by Departments.DepartmentName

--Return: CustomerName, OrderID, OrderDate
--Task: List all customers from the USA who placed orders in the year 2023.
--Tables Used: Customers, Orders
select Customers.FirstName, OrderID,  OrderDate from Orders
left join Customers on 
Customers.CustomerID=Orders.CustomerID
where Orders.OrderDate>'2022-12-31' and Orders.OrderDate<'2024-01-01' and Country = 'USA'
--Return: CustomerName, TotalOrders
--Task: Show how many orders each customer has placed.
--Tables Used: Orders , Customers
select FirstName, count (Orders.OrderID) as TotalOrders from Customers
left join Orders on
Customers.CustomerID= Orders.CustomerID
group by FirstName
--Return: ProductName, SupplierName
--Task: Display the names of products that are supplied by either Gadget Supplies or Clothing Mart.
--Tables Used: Products, Suppliers
select ProductName, Suppliers.SupplierName from Products
left join Suppliers on
Products.SupplierID = Suppliers.SupplierID
where Suppliers.SupplierName in ('Gadget Supplies','Clothing Mart')
--Return: CustomerName, MostRecentOrderDate
--Task: For each customer, show their most recent order. Include customers who havent placed any orders.
--Tables Used: Customers, Orders
select FirstName, MAX (Orders.OrderDate) as MostRecentOrderDate from Customers
join Orders on
Orders.CustomerID=Customers.CustomerID
group by FirstName
--🟠 Medium-Level Tasks (6)
--Return: CustomerName, OrderTotal
--Task: Show the customers who have placed an order where the total amount is greater than 500.
--Tables Used: Orders, Customers
select FirstName, sum(Orders.TotalAmount) as OrderTotal from Customers
join Orders on
Orders.CustomerID=Customers.CustomerID
group by Customers.FirstName
having sum(Orders.TotalAmount)>500
--Return: ProductName, SaleDate, SaleAmount
--Task: List product sales where the sale was made in 2022 or the sale amount exceeded 400.
--Tables Used: Products, Sales
select ProductName,Sales.SaleDate, Sales.SaleAmount from Products
join Sales on
Sales.ProductID= Products.ProductID
where SaleAmount>400 or (Sales.SaleDate>'2021-12-31' and Sales.SaleDate <'2023-01-01')
--Return: ProductName, TotalSalesAmount
--Task: Display each product along with the total amount it has been sold for.
--Tables Used: Sales, Products
select ProductName, sum(isnull(sales.SaleAmount,0)) as TotalSalesAmount  from Products
left join Sales on 
Products.ProductID=Sales.ProductID
group by Products.ProductName
order by TotalSalesAmount desc
--Return: EmployeeName, DepartmentName, Salary
--Task: Show the employees who work in the HR department and earn a salary greater than 60000.
--Tables Used: Employees, Departments
select Name, Departments.DepartmentName from Employees
join Departments on
Employees.DepartmentID=Departments.DepartmentID
where Departments.DepartmentName = 'Human Resources' 
and Salary>60000

--Return: ProductName, SaleDate, StockQuantity
--Task: List the products that were sold in 2023 and had more than 100 units in stock at the time.
--Tables Used: Products, Sales
select  ProductName, Sales.SaleDate, StockQuantity from Products
join Sales on
Sales.ProductID=Products.ProductID
where StockQuantity>100
group by ProductName, Sales.SaleDate, StockQuantity 
having YEAR(Sales.SaleDate) = 2023




--Return: EmployeeName, DepartmentName, HireDate
--Task: Show employees who either work in the Sales department or were hired after 2020.
--Tables Used: Employees, Departments
select Name, Departments.DepartmentName, HireDate from Employees 
join Departments on
Employees.DepartmentID=Departments.DepartmentID
where Departments.DepartmentName='Sales' or HireDate>'2020-12-31'
--🔴 Hard-Level Tasks (7)
--Return: CustomerName, OrderID, Address, OrderDate
--Task: List all orders made by customers in the USA whose address starts with 4 digits.
--Tables Used: Customers, Orders
select concat(FirstName, ' ', LastName) CustomerName, Orders.OrderID, Address, Orders.OrderDate from Customers
join Orders on 
Customers.CustomerID=Orders.CustomerID
where Country = 'USA' and Address like '____ %'
--Return: ProductName, Category, SaleAmount
--Task: Display product sales for items in the Electronics category or where the sale amount exceeded 350.
--Tables Used: Products, Sales
select  ProductName, Category, Sales.SaleAmount from Products
left join Sales on
Sales.ProductID=Products.ProductID
where Category='Electronics' or Sales.SaleAmount >350

--Return: CategoryName, ProductCount
--Task: Show the number of products available in each category.
--Tables Used: Products, Categories
select CategoryName, count(Products.ProductID) ProductCount from Categories
left join Products on
Products.Category = Categories.CategoryName
group by CategoryName

--Return: CustomerName, City, OrderID, Amount
--Task: List orders where the customer is from Los Angeles and the order amount is greater than 300.
--Tables Used: Customers, Orders

select concat(FirstName, ' ', LastName) CustomerName, Orders.OrderID, Orders.TotalAmount from Customers
join Orders on 
Customers.CustomerID=Orders.CustomerID
where City = 'Los Angeles' and orders.TotalAmount > 300

--Return: EmployeeName, DepartmentName
--Task: Display employees who are in the HR or Finance department, or whose name contains at least 4 vowels.
--Tables Used: Employees, Departments
select Name, Departments.DepartmentName from Employees 
join Departments on
Employees.DepartmentID=Departments.DepartmentID
where Departments.DepartmentName in ('Human resources','Finance') or name like '%[aeiou]%{4}'
--Return: EmployeeName, DepartmentName, Salary
--Task: Show employees who are in the Sales or Marketing department and have a salary above 60000.
--Tables Used: Employees, Departments
select Name, Departments.DepartmentName, Salary from Employees 
join Departments on
Employees.DepartmentID=Departments.DepartmentID
where Departments.DepartmentName in ('Sales','Marketing') or Salary> 60000
order by Salary desc