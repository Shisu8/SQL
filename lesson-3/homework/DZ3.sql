 Easy-Level Tasks (10)
--Define and explain the purpose of BULK INSERT in SQL Server.
--BULK INSERT Imports a data file into a database table or view in a user-specified format in SQL Server or simply we use the BULK INSERT statement to import data from a file into a table.
--we can use BULK with format like .csv, .txt, .tsv,.dat where field terminator and row terminator is defined unlike in excel which cannot be 
--List four file formats that can be imported into SQL Server.
--.csv, .txt, .tsv,.dat
--Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
create table Products (ProductID int primary key, ProductName varchar(50), Price Decimal(10,2))
Select * from Products
--Insert three records into the Products table using INSERT INTO.
Explain the difference between NULL and NOT NULL.
Create table Inventory (ProductID int primary key, ProductName varchar(50), Category varchar(50), Price decimal(10,2))
Insert into Products
from inventory

--Select * from Inventory
--insert into 
--Inventory values 
--(1,'Chocolate','Sweets',5),
--(2,'Keyboard','PC parts',200),
--(3,'Towel','Utensils',4),
--(4,'RDR2','Video-game',30),
--(5,'Pepsi','Beverages',2)
Add a UNIQUE constraint to the ProductName column in the Products table.
Write a comment in a SQL query explaining its purpose.
Add CategoryID column to the Products table.
Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
Explain the purpose of the IDENTITY column in SQL Server.
🟠 Medium-Level Tasks (10)
Use BULK INSERT to import data from a text file into the Products table.
Create a FOREIGN KEY in the Products table that references the Categories table.
Explain the differences between PRIMARY KEY and UNIQUE KEY.
Add a CHECK constraint to the Products table ensuring Price > 0.
Modify the Products table to add a column Stock (INT, NOT NULL).
Use the ISNULL function to replace NULL values in Price column with a 0.
Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
🔴 Hard-Level Tasks (10)
Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.
Create a table with an IDENTITY column starting at 100 and incrementing by 10.
Write a query to create a composite PRIMARY KEY in a new table OrderDetails.
Explain the use of COALESCE and ISNULL functions for handling NULL values.
Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.