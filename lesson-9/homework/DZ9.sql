--Easy (10 puzzles)

--Using Products, Suppliers table List all combinations of product names and supplier names.
select * from Products,suppliers
select* from Suppliers
select Products.ProductName, suppliers.SupplierName
from Products
cross join Suppliers

--Using Departments, Employees table Get all combinations of departments and employees.
select * from employees
select Employees.Name, Departments.DepartmentName
from Employees
cross join  DEpartments
--Using Products, Suppliers table List only the combinations where the supplier actually supplies the product. Return supplier name and product name
select Products.ProductName, Suppliers.SupplierName
from Products
right join Suppliers on
Suppliers.SupplierID = Products.SupplierID
--Using Orders, Customers table List customer names and their orders ID.
select Customers.FirstName, Orders.orderID
from Customers
join Orders on
Customers.CustomerID=Orders.CustomerID
--Using Courses, Students table Get all combinations of students and courses.
select Students.Name, Courses.CourseName
from Students
cross join  Courses
--Using Products, Orders table Get product names and orders where product IDs match.
select Products.ProductName, Orders.ProductID
from Products
join Orders on
Products.ProductID=Orders.ProductID
--Using Departments, Employees table List employees whose DepartmentID matches the department.
select employees.name
from employees
inner join departments on 
employees.departmentID=departments.DepartmentID
select * from employees
--Using Students, Enrollments table List student names and their enrolled course IDs.
select Name, enrollments.courseID from Students
join Enrollments on 
Students.StudentID= enrollments.StudentID
--select * from Students,Enrollments
--Using Payments, Orders table List all orders that have matching payments.
--select * from Orders,Payments
select Orders.orderID from Orders
join payments on 
Orders.orderID = Payments.OrderID
--Using Orders, Products table Show orders where product price is more than 100.
select Orders.ProductID from Orders
join products on 
Orders.productID = products.ProductID
where Products.price>300
--🟡 Medium (10 puzzles)
--Using Employees, Departments table List employee names and department names where department IDs are not equal. It means: Show all mismatched employee-department combinations.
select Name, Departments.departmentName from employees
join departments on 
employees.departmentID <> departments.DepartmentID
select * from PRoducts
--Using Orders, Products table Show orders where ordered quantity is greater than stock quantity.
select OrderID
from orders
join products
on Products.productID=Orders.productID
where Products.Stockquantity<orders.quantity

select * from sales
--Using Customers, Sales table List customer names and product IDs where sale amount is 500 or more.
select firstname, sales.productid from customers
join sales on
customers.CustomerID = Sales.CustomerID
where sales.Saleamount >=500
--Using Courses, Enrollments, Students table List student names and course names they’re enrolled in.
select name, courses.coursename from students
left join enrollments on 
Students.StudentID = Enrollments.StudentID
left join Courses on
Enrollments.CourseID = Courses.CourseID;
-- i use left join to show that there are some nulls so do not judge me for that, that is for accuracy
--Using Products, Suppliers table List product and supplier names where supplier name contains “Tech”.
select * from Products,Suppliers
Select Productname, SupplierName from Products
join Suppliers on 
Products.SupplierID = Suppliers.SupplierID
where suppliers.suppliername like '%Tech%';
--Using Orders, Payments table Show orders where payment amount is less than total amount.
select orders.orderID from Orders
join Payments on 
orders.OrderID=Payments.OrderID
where Orders.Totalamount>Payments.Amount;

--Using Employees and Departments tables, get the Department Name for each employee.
select Employees.name,Departments.DepartmentName from employees
join departments
on Departments.DepartmentID=Employees.departmentID

--Using Products, Categories table Show products where category is either 'Electronics' or 'Furniture'.
select ProductName from Products
join Categories on 
Products.Category=Categories.CategoryID
where Categories.Categoryname in('Electronics','Furniture')
--Using Sales, Customers table Show all sales from customers who are from 'USA'.
select saleID from sales
join customers on
Sales.CustomerID = Customers.CustomerID
where customers.Country = 'Usa'
--Using Orders, Customers table List orders made by customers from 'Germany' and order total > 100.
select OrderID from Orders
join customers on
Orders.CustomerID = Customers.CustomerID
where customers.Country = 'Germany' and orders.Totalamount>100

--🔴 Hard (5 puzzles)(Do some research for the tasks below)
--Using Employees table List all pairs of employees from different departments.
select * from Payments
cross join Departments
--Using Payments, Orders, Products table List payment details where the paid amount is not equal to (Quantity × Product Price).
select paymentID from payments
left join orders on
orders.orderid=payments.orderID
left join  Products on
Products.ProductID=Orders.ProductID
where isnull(Products.Price*Orders.Quantity,0) <> Payments.Amount;


--Using Students, Enrollments, Courses table Find students who are not enrolled in any course.
Select name from Students
left join Enrollments on 
Enrollments.StudentID=Students.StudentID
left join Courses on
Enrollments.CourseID=Courses.CourseID
where CourseName is null


--Using Employees table List employees who are managers of someone, but their salary is less than or equal to the person they manage.
select* from Employees
select a.Name from Employees a
inner join Employees b
on a.EmployeeID =b.ManagerID
where b.Salary>=a.Salary

--Using Orders, Payments, Customers table List customers who have made an order, but no payment has been recorded for it.
select Customers.FirstName from customers
left join Orders on 
orders.CustomerID=Customers.CustomerID
left join Payments on
Orders.OrderID=Payments.OrderID
where PaymentID is null and orders.orderID is not null

select * from Payments

