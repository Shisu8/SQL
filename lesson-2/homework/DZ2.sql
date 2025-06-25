--Basic-Level Tasks (10)
--Create a table Employees with columns: EmpID INT, Name (VARCHAR(50)), and Salary (DECIMAL(10,2)).
create table Employees (EmpID int, name varchar(50), Salary Decimal(10,2))
--Insert three records into the Employees table using different INSERT INTO approaches (single-row insert and multiple-row insert).
insert into Employees values
(1,'Gabe',6000)
insert into Employees values
(2,'Axel',5000),
(3,'Arde',3000),
(4,'The greatest', 15000000)
--Update the Salary of an employee to 7000 where EmpID = 1.
update Employees
set Salary = 7000
where EmpID=1
select * from Employees
--Delete a record from the Employees table where EmpID = 2.
delete from Employees where EMPID=2
--Give a brief definition for difference between DELETE, TRUNCATE, and DROP.
-- Delete is used for deleting data entries row by row or all raws at once, it does not reset the primary key data
-- truncate wipes all data from the table, affecting table itself as primary key data gets reset
-- Drop is used to delete entire tables, databases, constraints and other types of data storages but not data entries by themselves, we cannot use drop for deleting certain rows or columns in a table but we can delete table or even database itself
--Modify the Name column in the Employees table to VARCHAR(100).
alter table employees 
alter column Name varchar(100)
--Add a new column Department (VARCHAR(50)) to the Employees table.
alter table employees 
add Department Varchar(50)
--Change the data type of the Salary column to FLOAT.
alter table employees alter column Salary float
--Create another table Departments with columns DepartmentID (INT, PRIMARY KEY) and DepartmentName (VARCHAR(50)).
create table Departments (DepartmentID int primary key, DepartmentName varchar(50))
Select * from Employees
--Remove all records from the Employees table without deleting its structure.
delete from Departments	
Intermediate-Level Tasks (6)
--Insert five records into the Departments table using INSERT INTO SELECT method(you can write anything you want as data).
Insert into Departments select 1,'Sales' 
Insert into Departments select 2,'Accounting' 
Insert into Departments select 3,'HR' 
Insert into Departments select 4,'IT' 
Insert into Departments select 5,'Security' 
--Update the Department of all employees where Salary > 5000 to 'Management'.
--
insert into Employees values
(1,'Gabe',6000,'Sales')
insert into Employees values
(2,'Axel',5000,'Accounting'),
(3,'Arde',3000,'Security'),
(4,'The greatest', 15000000,'HR')
--
Update Employees
set Department='Management'
where Salary>5000
--Write a query that removes all employees but keeps the table structure intact.
delete from Employees
--Drop the Department column from the Employees table.
alter table employees
drop column department
--Rename the Employees table to StaffMembers using SQL commands.
exec sp_rename 'employees', 'StaffMembers'
select * from staffmembers
--Write a query to completely remove the Departments table from the database.
drop table Departments
--Advanced-Level Tasks (9)
--Create a table named Products with at least 5 columns, including: ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
Create table Products (ProductID int primary key, ProductName varchar(50), Category varchar(50), Price decimal(10,2))
Select * from Products
--Add a CHECK constraint to ensure Price is always greater than 0.
alter table products
add check (price>0)
--Modify the table to add a StockQuantity column with a DEFAULT value of 50
alter  table Products
add StockQuantity int default 50
--Rename Category to ProductCategory
drop table products
EXEC sp_rename 'Products.Category',  'ProductCategory', 'COLUMN'
--Insert 5 records into the Products table using standard INSERT INTO queries.
insert into 
Products values 
(1,'Chocolate','Sweets',5,2),
(2,'Keyboard','PC parts',200,2),
(3,'Towel','Utensils',4,2),
(4,'RDR2','Video-game',30,2),
(5,'Pepsi','Beverages',2,2)
--Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
Select * into Products_Backup from Products 
--Rename the Products table to Inventory.
EXEC sp_rename 'INventory',  'Products'
EXEC sp_rename 'Products',  'Inventory'
Select * from inventory
drop table Products_Backup
--Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
alter table Inventory
alter column Price float
--Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5 to Inventory table.

alter table inventory
add ProductCode int IDENTITY (1000,5)
