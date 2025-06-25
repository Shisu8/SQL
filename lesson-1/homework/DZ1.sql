--lesson 1
--Task 1
-- 1.Define the following terms: data, database, relational database, and table.
-- Data is the information contained inside the table which in turn consist of number of rows and columns
-- top of columns defines column name and most of the time data type is based on columns and rows contain all data entries
-- Table - collection of rows and columns containing certain type of data in certain type of datatypes or just nulls
--Database is a structured systemized collection of data in the form of tables or simply put set of tables containing data in row-column format
-- A relational database defines database relationships in the form of tables. The tables are related to each other - based on data common to each. fro example is one sales department there can be different type of data overall sales, sales per quota, sales per staff, staff list, employee list which are directly correlated with each other, for instance data about employees in sales per persona is directly related to employee list or staff list etc

--Task 2
-- 2.List five key features of SQL Server.
--1) comprehensive tool for data query, data modifications, data filter and data analytics
--2) Userfriendly UI, 
--3) Simple syntax of coding
--4) is Data definition lenguage (DDL)
--5) is data manipulation language (DML)
--6) Pletora of functions related to data modifications and query, import and export, supports relational databases 
--Task 3 What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
--1) Windows authentification
--2)Sql server authentification
--3)Microsoft entra
--Medium
--4.Create a new database in SSMS named SchoolDB.
Create database SchoolDB
Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
create table Students 
(StudentID int,
Name varchar(50),
age int,
Primary key(StudentID))

--5.Describe the differences between SQL Server, SSMS, and SQL.
-- Sql server is where all of out databases, tables, data entries, relations are stored, can be in pyhsical(logical) or virtual memory
-- SSMS is the UI fro SQL server, central management systems with the help of which user can control or manage the SQL server as well as create and delete one
-- SQL (Structered Query Language) is standart language for storing, manupulating, retrieving data in databases
--Hard
--Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples. 
----DDL – Data Definition Language - CREATE, DROP, ALTER, ADD,Truncate, Comment, Rename. Used for manupulating and defining table and databases
--DQL – Data Query Language - SELECT. Used for displaying and retrieving data, main function of SQL
--DML – Data Manipulation Language - Insert, Update, Delete, Lock, CALL, Explain plan. Used for data manipulation, adding deleting, renaming, 
--DCL – Data Control Language - GRANT, REVOKE, For granting and revoking access
--TCL - Transaction Control Language - Begin transaction, Commit, rollback, Savepoint. Used for testing purposes and fail checks before actually commiting changes
--6.Write a query to insert three records into the Students table.
Insert into Students values 
(1,'Alex',15),
(2,'MIKE',15),
(3,'Shukurullo',15)
--Restore AdventureWorksDW2022.bak file to your server. (write its steps to submit) You can find the database from this link
--Restored
