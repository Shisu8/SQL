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
Insert into Products
select ProductID, Productname,Price from inventory
Explain the difference between NULL and NOT NULL.
--I don't understand in what context you are asking but when creating table we can assign columns as null and not null to indicate if this column can contain null value NOT null is used when we do not want to leave crucial info empty like primary key or unique id
--Create table Inventory (ProductID int primary key, ProductName varchar(50), Category varchar(50), Price decimal(10,2))
--drop table inventory
--Select * from Inventory
--insert into 
--Inventory values 
--(1,'Chocolate','Sweets',5),
--(2,'Keyboard','PC parts',200),
--(3,'Towel','Utensils',4),
--(4,'RDR2','Video-game',30),
--(5,'Pepsi','Beverages',2)
--Add a UNIQUE constraint to the ProductName column in the Products table.
alter table Products 
add constraint win Unique (ProductName)
--Write a comment in a SQL query explaining its purpose.
-- comments are used to store some hints to point out mistakes, directions or simply rumbling of the developers but mainly if we want to exlude some faulty code temporarily
--Add CategoryID column to the Products table.
alter table Products
add  CategoryID int
--Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
create table Categories (CategoryID int primary key, CategoryName varchar(50) unique)
--Explain the purpose of the IDENTITY column in SQL Server.
--IDENTITY COLUMN IS USED FOR UNIQUE IDENTIFIER WITH AUTO INCREMENT, for each row it will create an identifier, sequence of which can be set to 1, 10,2
--For example IDENTITy(1,1) is standart id which start with one and increments by 1, we can play around with that and set is to (1,2) which will increment at the rate 2
🟠 Medium-Level Tasks (10)
--Use BULK INSERT to import data from a text file into the Products table.
select*from products
select*from Categories
bulk insert Products
from 'C:\Users\ASUS\Desktop\2.txt'
with (firstrow = 1,
fieldterminator=',',
rowterminator='\n')
--Create a FOREIGN KEY in the Products table that references the Categories table.
--delete from Products
--where CategoryID is null
insert into Categories 
values 
(1,'Keyboard'),
(2,'Mice'),
(3,'MB'),
(4,'Headphones'),
(5,'Shit'),
(6,'Monitor')
alter table Products
add foreign key (CategoryID) references Categories(CategoryID) on delete cascade
Explain the differences between PRIMARY KEY and UNIQUE KEY.
--A primary key and a unique key both enforce uniqueness of data within a table, but they differ in how they handle NULL values and their impact on the table's structure. A primary key does not allow NULL values and enforces that a table has only one primary key. A unique key, on the other hand, can allow one NULL value and a table can have multiple unique keys
--Add a CHECK constraint to the Products table ensuring Price > 0.
alter table Products 
add check(Price>0)
--Modify the Products table to add a column Stock (INT, NOT NULL).
ALTER table Products 
add Stock int not null DEFAULT '0'
--Use the ISNULL function to replace NULL values in Price column with a 0.
UPDATE PRODUCTS
SET PRICE=0
WHERE PRICE IS NULL
--Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
--wHAT IS THE PURPOSE???
-- FOREIGN KEY IS USED TO REFERNCE ALREADY EXISTING TABLE, IT MAKES SURE VALUES IN FOREIGN KEYS ARE NOT CORSSING THE CONSTRAINTS AND WHETHER VALID DATA ENTRY IS INPUTTED, IT IS DYNAMIC WAY OF ADDING CONSTRAINTS AS IT IS BASED ON RELATIVE TABLES AND EVERY CHANGE IN TABLES AFFECTS RELATIVE TABLES. IF I ADD VALUES IN REFERENCED TABLE I CAN ADD THOSE NEW VALUES IN PRIMARY TABLE AS WELL OTHERWISE THERE WILL BE AN ERROR
🔴 Hard-Level Tasks (10)
--Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.
--Create a table with an IDENTITY column starting at 100 and incrementing by 10.
cREATE TABLE Customers (Customer_name varchar(50),CustomerID int primary key Identity(100,10), Age int, check (age>=18))
--Write a query to create a composite PRIMARY KEY in a new table OrderDetails.
create table OrderDetails (orderID int, transactionID int, Product_name varchar(50), date_1 date, primary key (orderid,transactionid))
select*from orderdetails
--Explain the use of COALESCE and ISNULL functions for handling NULL values.
--Both ISNULL and COALESCE are used to handle NULL values in SQL, but they differ in their syntax and behavior. ISNULL is specific to SQL Server and takes two arguments: an expression and a replacement value. It returns the replacement value if the expression is NULL, otherwise, it returns the expression itself. COALESCE is an ANSI standard function, meaning it's portable across different database systems. It takes a list of expressions and returns the first non-NULL expression in the list. 
--Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
Create table employees (EMPID int primary key, email varchar(50) unique)
select*from employees
--Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
alter table Products
add foreign key (CategoryID) references Categories(CategoryID) on update cascade
