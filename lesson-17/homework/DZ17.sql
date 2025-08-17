You must provide a report of all distributors and their sales by region. If a distributor did not have any sales for a region, rovide a zero-dollar value for that day. Assume there is at least one sale for each region
SQL Setup:
Input:


select * from #RegionSales
select distinct e.region, b.distributor,isnull(c.sales,0) as Sales from #RegionSales e
cross join #RegionSales b
left join #RegionSales c on e.region=c.region and b.distributor=c.distributor
order by b.distributor


|Region       |Distributor    | Sales |
|-------------|---------------|--------
|North        |ACE            |   10  |
|South        |ACE            |   67  |
|East         |ACE            |   54  |
|North        |Direct Parts   |   8   |
|South        |Direct Parts   |   7   |
|West         |Direct Parts   |   12  |
|North        |ACME           |   65  |
|South        |ACME           |   9   |
|East         |ACME           |   1   |
|West         |ACME           |   7   |
Expected Output:

|Region |Distributor   | Sales |
|-------|--------------|-------|
|North  |ACE           | 10    |
|South  |ACE           | 67    |
|East   |ACE           | 54    |
|West   |ACE           | 0     |
|North  |Direct Parts  | 8     |
|South  |Direct Parts  | 7     |
|East   |Direct Parts  | 0     |
|West   |Direct Parts  | 12    |
|North  |ACME          | 65    |
|South  |ACME          | 9     |
|East   |ACME          | 1     |
|West   |ACME          | 7     |
2. Find managers with at least five direct reports
SQL Setup:
select * from employee



Input:

| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
Expected Output:

+------+
| name |
+------+
| John |
+------+
select a.name from employee as a
join employee as b on
a.id=b.managerid
group by a.name
having count(a.id)>=5

3. Write a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount.
SQL Setup:
select * from products
select * from orders
select products.product_name, sum(orders.unit) as unit from products
join orders on
products.product_id=orders.product_id
where orders.order_date between '2020-02-01' and '2020-02-28'
group by products.product_name
having sum(orders.unit) >= 100

| product_name       | unit  |
+--------------------+-------+
| Leetcode Solutions | 130   |
| Leetcode Kit       | 100   |
4. Write an SQL statement that returns the vendor from which each customer has placed the most orders
SQL Setup:

with cte as(
select customerID, Vendor, sum(count) as COUNT from  orders e
group by customerID, Vendor)
select customerID, Vendor from cte a
where count=(select max(Count) from cte where a.customerid=customerid)


5. You will be given a number as a variable called @Check_Prime check if this number is prime then return 'This number is prime' else eturn 'This number is not prime'
Example Input:

DECLARE @Check_Prime INT = 921;

WHILE ( @Check_Prime%2=1 or @Check_Prime%2=0)
BEGIN

IF @Check_Prime%2=0
  BEGIN
  PRINT 'This number is not prime ' + CONVERT(VARCHAR,@Check_Prime)
  
  END
  else begin
  PRINT 'This number is prime ' + CONVERT(VARCHAR,@Check_Prime)
  
  end
  break
END

This number is not prime(or "This number is prime")
6. Write an SQL query to return the number of locations,in which location most signals sent, and total number of signal for each device from the given table.
SQL Setup:
select * from device
with cte as(
select device_id, count(distinct locations) as no_of_location, locations,(select count(*) from device where device_id=e.device_id) as no_of_signals, count(*) as numbers from device e
group by device_id, locations)
select device_id,no_of_location,locations as max_signal_locations,no_of_signals from cte e
where numbers = (select max (numbers) from cte where device_id=e.device_id)



with cte as(
select device_id, (select count(distinct locations) from device where device_id=e.device_id) as no_of_location, locations,(select count(*) from device where device_id=e.device_id) as no_of_signals, count(*) as numbers from device e
group by device_id, locations)
select device_id,no_of_location,locations as max_signal_locations,no_of_signals from cte e
where numbers = (select max (numbers) from cte where device_id=e.device_id)
Expected Output:

| Device_id | no_of_location | max_signal_location | no_of_signals |
|-----------|----------------|---------------------|---------------|
| 12        | 2              | Bangalore           | 6             |
| 13        | 2              | Secunderabad        | 5             |
7. Write a SQL to find all Employees who earn more than the average salary in their corresponding department. Return EmpID, EmpName,Salary in your output
SQL Setup:
Expected Output:

| EmpID | EmpName | Salary |
|-------|---------|--------|
| 1001  | Mark    | 60000  |
| 1004  | Peter   | 35000  |
| 1005  | John    | 55000  |
| 1007  | Donald  | 35000  |
select EMPID,EmpName,Salary from employee a

where salary >=(select avg(salary) from employee where a.deptid=deptid )
8. You are part of an office lottery pool where you keep a table of the winning lottery numbers along with a table of each ticket’s chosen numbers. If a ticket has some but not all the winning numbers, you win $10. If a ticket has all the winning numbers, you win $100. Calculate the total winnings for today’s drawing.
Winning Numbers:

|Number|
--------
|  25  |
|  45  |
|  78  |

Tickets:

| Ticket ID | Number |
|-----------|--------|
| A23423    | 25     |
| A23423    | 45     |
| A23423    | 78     |
| B35643    | 25     |
| B35643    | 45     |
| B35643    | 98     |
| C98787    | 67     |
| C98787    | 86     |
| C98787    | 91     |

-- Step 1: Create the table
with cte as (select TicketID, count(number) as completeness from tickets
where Number in (select* from numbers)
group by TicketID)
select sum(case 
when completeness = 3 then 100
when completeness between 1 and 2 then 10
else 0
end) as total
from cte
Expected Output would be $110, as you have one winning ticket, and one ticket that has some but not all the winning numbers.

9. The Spending table keeps the logs of the spendings history of users that make purchases from an online shopping website which has a desktop and a mobile devices.
Write an SQL query to find the total number of users and the total amount spent using mobile only, desktop only and both mobile and desktop together for each date.

select * from Spending
group by
Expected Output:

| Row | Spend_date | Platform | Total_Amount | Total_users |
|-----|------------|----------|--------------|-------------|
| 1   | 2019-07-01 | Mobile   | 100          | 1           |
| 2   | 2019-07-01 | Desktop  | 100          | 1           |
| 3   | 2019-07-01 | Both     | 200          | 1           |
| 4   | 2019-07-02 | Mobile   | 100          | 1           |
| 5   | 2019-07-02 | Desktop  | 100          | 1           |
| 6   | 2019-07-02 | Both     | 0            | 0           |
10. Write an SQL Statement to de-group the following data.
Input Table: 'Grouped'

|Product  |Quantity|
--------------------
|Pencil   |   3    |
|Eraser   |   4    |
|Notebook |   2    |
Expected Output:

|Product  |Quantity|
--------------------
|Pencil   |   1    |
|Pencil   |   1    |
|Pencil   |   1    |
|Eraser   |   1    |
|Eraser   |   1    |
|Eraser   |   1    |
|Eraser   |   1    |
|Notebook |   1    |
|Notebook |   1    |
SQL Setup:

with numbers as (
select 1 as Number, Product, quantity from grouped e
union all
select number+1, Product, quantity from numbers
where number<quantity
)
select Product, 1 as Quantity from numbers

order by product
