Easy-Level Tasks
--Using Products table, find the total number of products available in each category.
select category, Sum(stockquantity) as available from products
group by category
select * from Products
--Using Products table, get the average price of products in the 'Electronics' category.
select Category, AVG(Price) from Products
--where category='Electronics'
group by Category
--Group by ProductName This task does not make nay sense products are already numbered what average am i supposed to find
--Using Customers table, list all customers from cities that start with 'L'.
select * from Customers
where city like 'L%'
--Using Products table, get all product names that end with 'er'.
select * from Products
where ProductName like '%er'
--Using Customers table, list all customers from countries ending in 'A'.
select * from Customers
where country like '%A'
--Using Products table, show the highest price among all products.
select top 1* from Products
order by Price desc
--Using Products table, label stock as 'Low Stock' if quantity < 30, else 'Sufficient'.
select *,
case when StockQuantity <30 then 'Low stock' else 'Sufficient' end as Stock
from Products
--Using Customers table, find the total number of customers in each country.
select country, count(CustomerID) as customer_per_country from Customers
group by country
--Using Orders table, find the minimum and maximum quantity ordered.
select* from Orders

Medium-Level Tasks
Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.
Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.
Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
Using Orders table, find the average order amount by year.
Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.
Using City_Population table, use Pivot to show values of Year column in seperate columns ([2012], [2013]) and copy results to a new Population_Each_Year table.
Using Sales table, find total sales per product Id.
Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.
Using City_Population table, use Pivot to show values of City column in seperate columns (Bektemir, Chilonzor, Yakkasaroy) and copy results to a new Population_Each_City table.
Hard-Level Tasks
Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent.
Transform Population_Each_Year table to its original format (City_Population).
Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)
Transform Population_Each_City table to its original format (City_Population).
