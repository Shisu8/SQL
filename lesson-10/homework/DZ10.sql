----Easy-Level Tasks (10)
--Using the Employees and Departments tables, write a query to return the names and salaries of employees whose salary is greater than 50000, along with their department names.
----🔁 Expected Columns: EmployeeName, Salary, DepartmentName
select Name, Salary, Departments.DepartmentName from Employees
join Departments on 
Employees.DepartmentID=Departments.DepartmentID
where Salary > 50000
--Using the Customers and Orders tables, write a query to display customer names and order dates for orders placed in the year 2023.
--🔁 Expected Columns: FirstName, LastName, OrderDate
select FirstName, LastName, Orders.OrderDate from Customers
join Orders on 
Orders.CustomerID=Customers.CustomerID
where OrderDate between '2023-01-01' and '2023-12-31'

--Using the Employees and Departments tables, write a query to show all employees along with their department names. Include employees who do not belong to any department.
--🔁 Expected Columns: EmployeeName, DepartmentName
select Name, Salary, Departments.DepartmentName from Employees
left join Departments on 
Employees.DepartmentID=Departments.DepartmentID

--Using the Products and Suppliers tables, write a query to list all suppliers and the products they supply. Show suppliers even if they don’t supply any product.
--🔁 Expected Columns: SupplierName, ProductName
select SupplierName, Products.ProductName from Suppliers
left join Products on 
Products.SupplierID=Suppliers.SupplierID

--Using the Orders and Payments tables, write a query to return all orders and their corresponding payments. Include orders without payments and payments not linked to any order.
--🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount
select orders.OrderID, OrderDate, Payments.PaymentDate, Payments.Amount from Orders
full join Payments on 
Orders.OrderID=Payments.OrderID
--Using the Employees table, write a query to show each employees name along with the name of their manager.
--🔁 Expected Columns: EmployeeName, ManagerName
select b.name as Employee, a.name as Manager from Employees a
left join Employees b on 
a.EmployeeID=b.ManagerID
--select * from Employees
--Using the Students, Courses, and Enrollments tables, write a query to list the names of students who are enrolled in the course named 'Math 101'.
--🔁 Expected Columns: StudentName, CourseName
select Name, Courses.CourseName from Students
join Enrollments on
Students.StudentID=Enrollments.StudentID
join Courses on
Enrollments.CourseID=Courses.CourseID
where Courses.CourseName='Math 101'
--Using the Customers and Orders tables, write a query to find customers who have placed an order with more than 3 items. Return their name and the quantity they ordered.
--🔁 Expected Columns: FirstName, LastName, Quantity
select FirstName, LastName, orders.Quantity from Customers
join Orders on 
Customers.CustomerID = Orders.CustomerID
where Orders.Quantity>3
--Using the Employees and Departments tables, write a query to list employees working in the 'Human Resources' department.
--🔁 Expected Columns: EmployeeName, DepartmentName
select Name, Departments.DepartmentName from Employees
join Departments on 
Employees.DepartmentID=Departments.DepartmentID
WHERE  Departments.DepartmentName= 'Human Resources' 

--🟠 Medium-Level Tasks (9)
--Using the Employees and Departments tables, write a query to return department names that have more than 5 employees.
--🔁 Expected Columns: DepartmentName, EmployeeCount
select DepartmentName, count(Employees.EmployeeID) as EmployeeCount from  Departments
join Employees on 
Employees.DepartmentID=Departments.DepartmentID
group by DepartmentName
having count (Employees.EmployeeID)>5

--Using the Products and Sales tables, write a query to find products that have never been sold.
--🔁 Expected Columns: ProductID, ProductName
select Products.ProductID, ProductName from Products
left join Sales on
Products.ProductID=Sales.ProductID
where Sales.ProductID is null



--Using the Customers and Orders tables, write a query to return customer names who have placed at least one order.
--🔁 Expected Columns: FirstName, LastName, TotalOrders
select FirstName, LastName, count(Orders.OrderID) from Customers
left join Orders on
Customers.CustomerID = Orders.CustomerID
group by FirstName, LastName
having count(Orders.OrderID)>=1

--Using the Employees and Departments tables, write a query to show only those records where both employee and department exist (no NULLs).
--🔁 Expected Columns: EmployeeName, DepartmentName
select  Name, Departments.DepartmentName from Employees
join Departments
on Employees.DepartmentID=Departments.DepartmentID

--Using the Employees table, write a query to find pairs of employees who report to the same manager.
--🔁 Expected Columns: Employee1, Employee2, ManagerID
select t1.Name, t2.Name, t1.ManagerID from Employees t1
join Employees t2 on
t1.ManagerID=t2.ManagerID and t1.EmployeeID>t2.EmployeeID
where t1.Name<>t2.Name

order by t1.ManagerID 
select * from Employees
order by ManagerID
--nothing about uniqeness of employees

--Using the Orders and Customers tables, write a query to list all orders placed in 2022 along with the customer name.
--🔁 Expected Columns: OrderID, OrderDate, FirstName, LastName

select OrderID, OrderDate, Customers.FirstName, Customers.LastName from Orders
full join Customers on 
Orders.CustomerID=Customers.CustomerID
where Orders.OrderDate between '2022-01-01' and '2022-12-31'

--Using the Employees and Departments tables, write a query to return employees from the 'Sales' department whose salary is above 60000.
--🔁 Expected Columns: EmployeeName, Salary, DepartmentName
select Name, Salary, Departments.DepartmentName from Employees
join Departments on 
Employees.DepartmentID=Departments.DepartmentID
where Salary > 60000 and Departments.DepartmentName = 'Sales'


--Using the Orders and Payments tables, write a query to return only those orders that have a corresponding payment.
--🔁 Expected Columns: OrderID, OrderDate, PaymentDate, Amount
select Orders.OrderID, OrderDate, Payments.PaymentDate,Payments.Amount from Orders
join Payments on
Orders.OrderID = Payments.OrderID
--Using the Products and Orders tables, write a query to find products that were never ordered.
--🔁 Expected Columns: ProductID, ProductName
select Products.ProductID, ProductName from Products
left join Orders
on Products.ProductID = Orders. ProductID
where Orders.OrderID is null

--🔴 Hard-Level Tasks (9)
--Using the Employees table, write a query to find employees whose salary is greater than the average salary in their own departments.
--🔁 Expected Columns: EmployeeName, Salary


select * from Employees e
join Employees d on
e.DepartmentID=d.DepartmentID
order by e.Name
--Using the Orders and Payments tables, write a query to list all orders placed before 2020 that have no corresponding payment.

--🔁 Expected Columns: OrderID, OrderDate

select Orders.OrderID, OrderDate from Orders
left join Payments
on Orders.OrderID=Payments.OrderID
where Orders.OrderDate < '2020-01-01' and Payments.PaymentID is null
--Using the Products and Categories tables, write a query to return products that do not have a matching category.

--🔁 Expected Columns: ProductID, ProductName
select ProductID, ProductName from Products
left join Categories on
Products.Category = Categories.CategoryID
where Categories.CategoryID is null
--Using the Employees table, write a query to find employees who report to the same manager and earn more than 60000.
--🔁 Expected Columns: Employee1, Employee2, ManagerID, Salary
select t1.Name, t2.Name, t1.ManagerID, t1.Salary s1,t2.Salary s2 from Employees t1
join Employees t2 on
t1.ManagerID=t2.ManagerID and t1.EmployeeID>t2.EmployeeID
where t1.Name<>t2.Name and t1.Salary>60000 and t2.Salary>60000

order by t1.ManagerID 

--Using the Employees and Departments tables, write a query to return employees who work in departments which name starts with the letter 'M'.
--🔁 Expected Columns: EmployeeName, DepartmentName
select Name, Departments.DepartmentName from Employees
join Departments on 
Employees.DepartmentID = Departments.DepartmentID
where Departments.DepartmentName like 'M%'

--Using the Products and Sales tables, write a query to list sales where the amount is greater than 500, including product names.
--🔁 Expected Columns: SaleID, ProductName, SaleAmount
select SaleID, Products.ProductName, SaleAmount from Sales
left join Products on
Sales.ProductID=Products.ProductID
where SaleAmount > 500
--Using the Students, Courses, and Enrollments tables, write a query to find students who have not enrolled in the course 'Math 101'.
--🔁 Expected Columns: StudentID, StudentName
select Students.StudentID, Name from Students
join Enrollments on
Students.StudentID=Enrollments.StudentID
join Courses on
Enrollments.CourseID=Courses.CourseID
where Courses.CourseName <>'Math 101'
--Using the Orders and Payments tables, write a query to return orders that are missing payment details.
--🔁 Expected Columns: OrderID, OrderDate, PaymentID
select Orders.OrderID, OrderDate, Payments.PaymentID from Orders
left join Payments
on Orders.OrderID=Payments.OrderID
where Payments.PaymentID is null
--Using the Products and Categories tables, write a query to list products that belong to either the 'Electronics' or 'Furniture' category.
--🔁 Expected Columns: ProductID, ProductName, CategoryName
select ProductID, ProductName, Categories.CategoryName from Products
left join Categories on
Products.Category = Categories.CategoryID
where Categories.CategoryName in ('Electronics','Furniture')
