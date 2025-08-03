1. Find Employees with Minimum Salary
Task: Retrieve employees who earn the minimum salary in the company. Tables: employees (columns: id, name, salary)
select * from Employees
where salary = (select min(salary) from Employees)

2. Find Products Above Average Price
Task: Retrieve products priced above the average price. Tables: products (columns: id, product_name, price)
select * from products
where price>(select avg(price) from products)

Level 2: Nested Subqueries with Conditions
3. Find Employees in Sales Department Task: Retrieve employees who work in the "Sales" department. Tables: employees (columns: id, name, department_id), departments (columns: id, department_name)
select * from Employees
select * from Employees
where department_id = (select id from Departments where Department_name = 'SALES')

4. Find Customers with No Orders
Task: Retrieve customers who have not placed any orders. Tables: customers (columns: customer_id, name), orders (columns: order_id, customer_id)

select * from Customers
where customer_id not in (select customer_id from orders)



Level 3: Aggregation and Grouping in Subqueries
5. Find Products with Max Price in Each Category
Task: Retrieve products with the highest price in each category. Tables: products (columns: id, product_name, price, category_id)
select * from products e
where price = (select max(price) from products where e.category_id=category_id)

6. Find Employees in Department with Highest Average Salary
Task: Retrieve employees working in the department with the highest average salary. Tables: employees (columns: id, name, salary, department_id), departments (columns: id, department_name)
select * from Employees
where department_id= (select department_id from employees group by department_id having avg(salary)=(select top 1 avg(salary) from employees group by department_id order by avg(salary) desc) )
Level 4: Correlated Subqueries
7. Find Employees Earning Above Department Average
Task: Retrieve employees earning more than the average salary in their department. Tables: employees (columns: id, name, salary, department_id)
select * from Employees e
where salary>(select avg(salary) from Employees where e.department_id=department_id)
8. Find Students with Highest Grade per Course
Task: Retrieve students who received the highest grade in each course. Tables: students (columns: student_id, name), grades (columns: student_id, course_id, grade)
select (select name from students where student_id=e.student_id) as NAME,* from grades e
where grade = (select max(grade) from grades where e.course_id=course_id)

Level 5: Subqueries with Ranking and Complex Conditions
9. Find Third-Highest Price per Category Task: Retrieve products with the third-highest price in each category. Tables: products (columns: id, product_name, price, category_id)
select * from products e
where price=(select max(price) from products where e.category_id=category_id)
10. Find Employees whose Salary Between Company Average and Department Max Salary
Task: Retrieve employees with salaries above the company average but below the maximum in their department. Tables: employees (columns: id, name, salary, department_id)
select * from employees e
where salary > (select avg(salary) from employees) and salary < (select max(salary) from employees where e.department_id=department_id)