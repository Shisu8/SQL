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
--Using Orders table, find the minimum and maximum quantity ordered.(write this more elaborate next time)
select max(quantity) from Orders
select min(quantity) from Orders

Medium-Level Tasks
--Using Orders and Invoices tables, list customer IDs who placed orders in 2023 January to find those who did not have invoices.
--first solution
select orders.customerID,orders.OrderDate, invoices.invoiceDate from orders
left join invoices on
orders.customerID=invoices.CustomerID and orders.orderdate between '2023-01-01' and'2023-12-31'
group by orders.CustomerID, Orders.orderdate,InvoiceDate
having invoices.invoicedate is not null
order by InvoiceDate desc
--second solution
select customerid from Orders
where OrderDate between '2023-01-01' and '2023-01-31'
--There are no orders placed in january 2023
--Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted including duplicates.
select productname from Products
union all
select productname from Products_Discounted
--Using Products and Products_Discounted table, Combine all product names from Products and Products_Discounted without duplicates.
select productname from Products
union
select productname from Products_Discounted
--Using Orders table, find the average order amount by year.
select year(OrderDate), AVG(TotalAmount) from Orders
group by year(OrderDate)

--Using Products table, group products based on price: 'Low' (<100), 'Mid' (100-500), 'High' (>500). Return productname and pricegroup.
select productname, 
case when price<100 then 'Low'
when price between 100 and 500 then 'Mid'
else 'High'
end as Pricegroup
from Products
order by price desc
--Using City_Population table, use Pivot to show values of Year column in seperate columns ([2012], [2013]) and copy results to a new Population_Each_Year table.
select distinct district_name from city_population
--
SELECT 'Overall population' AS PopulationPerYear,
    [2012], [2013]
FROM (
    SELECT year, population
        
    FROM city_population
) AS SourceTable
PIVOT (
    sum(population) FOR year IN
    ([2012], [2013])
) AS Population_Each_Year

--Using Sales table, find total sales per product Id.
select Productid, sum(saleamount) from Sales
group by Productid
--Using Products table, use wildcard to find products that contain 'oo' in the name. Return productname.
select productname from Products
where ProductName like '%oo%'
--Using City_Population table, use Pivot to show values of City column in seperate columns (Bektemir, Chilonzor, Yakkasaroy) and copy results to a new Population_Each_City table.
SELECT 'Overall population' AS Population_Each_tuman,
    [Bektemir], [Chilonzor],[Yakkasaroy]
FROM (
    SELECT district_name, population
        
    FROM city_population
) AS SourceTable
PIVOT (
    sum(population) FOR district_name IN
    ( [Bektemir], [Chilonzor],[Mirobod],[Yakkasaroy],[Yashnobod])

)As pvt

Hard-Level Tasks
Using Invoices table, show top 3 customers with the highest total invoice amount. Return CustomerID and Totalspent.
select top 3 customerid, sum(totalamount) as Totalspent from Invoices
group by CustomerID
order by Totalspent desc
select * from city_population
--Transform Population_Each_Year table to its original format (City_Population).
SELECT year, population
FROM (
    SELECT  [2012], [2013]
        
    FROM city_population
PIVOT (
    sum(population) FOR year IN
    ([2012], [2013])
) AS pivoted
) as p
unpivot (
population for year in  ([2012], [2013])
) as CityPopulation
--Using Products and Sales tables, list product names and the number of times each has been sold. (Research for Joins)
   select * from Products
   select * from Sales
   select Products.ProductName, count(sales.ProductID)as NumberofSales
   from Products
left join sales on
   Sales.ProductID=Products.ProductID
   Group by Products.ProductName
   order by NumberofSales desc
--Transform Population_Each_City table to its original format (City_Population).

SELECT district_name, population
FROM (
    SELECT  [Bektemir], [Chilonzor],[Yakkasaroy]
        
    FROM city_population
PIVOT (
    sum(population) FOR district_name IN
    ([Bektemir], [Chilonzor],[Yakkasaroy])
) AS pivoted
) as p
unpivot (
population for district_name in  ([Bektemir], [Chilonzor],[Yakkasaroy])
) as CityPopulation