Context:
An e-commerce business want to analyzed customer behavior and sales trends .

Objective: 
Do exploratory analysis to see sales trend,customer behavior, to increase revenue and to understand potential areas for sales improvement.

Description: 
![dig](https://github.com/SameerDhumal/SQL_Project/assets/145559776/9c1b9cb7-8344-472b-9713-298a5f3ecf67)

ER diagram  (entity relationship) 

The analysis was divided into four key sets:

1) Customer Table Analysis: Examined customer data to understand their demographics, preferences, and behaviors.
  
2) Customer and Order Analysis: Analyzed the relationship between customers and their orders to identify patterns in purchasing behavior and sales trends.

3) Supplier and Order Analysis: Investigated the interaction between suppliers and orders to assess supplier performance and its impact on sales.

4) Join and Customer/Supplier Analysis: Integrated data from various sources to gain insights into the relationship between customers, suppliers, and orders, uncovering potential areas for improvement.

Key findings and insights from the analysis include:
City-Supplier Disparities: customers that dont have any suppliers in city 
Underperforming Product Purchases: Customers buying product less that 10% of its average sales 
Countries with Low Order Volumes: Top 5 countries with few orders 

Output:
helpd busnisss to understand where we are lacking and what measure can be taken to improve sales.

Tools and technique used :
select statements with clauses, aggregations, Joins, Subqueries, union , rank,  er diagram dml (manipulation) , ddl(definition) 





Below are question that we have solved using mssql
1. List all customers
2. List the first name, last name, and city of all customers
3. List the customers in Sweden. Remember it is "Sweden" and NOT "sweden" because filtering
value is case sensitive in Redshift.
4. Create a copy of Supplier table. Update the city to Sydney for supplier starting with letter P.
5. Create a copy of Products table and Delete all products with unit price higher than $50.
6. List the number of customers in each country
7. List the number of customers in each country sorted high to low
8. List the total amount for items ordered by each customer
9. List the number of customers in each country. Only include countries with more than 10
customers.
10. List the number of customers in each country, except the USA, sorted high to low. Only
include countries with 9 or more customers.
11. List all customers whose first name or last name contains "ill".
12. List all customers whose average of their total order amount is between $1000 and
$1200.Limit your output to 5 results.
13. List all suppliers in the 'USA', 'Japan', and 'Germany', ordered by country from A-Z, and then
by company name in reverse order.
14. Show all orders, sorted by total amount (the largest amount first), within each year.
15. Products with UnitPrice greater than 50 are not selling despite promotions. You are asked to
discontinue products over $25. Write a query to relfelct this. Do this in the copy of the Product
table. DO NOT perform the update operation in the Product table.
16. List top 10 most expensive products
17. Get all but the 10 most expensive products sorted by price
18. Get the 10th to 15th most expensive products sorted by price
19. Write a query to get the number of supplier countries. Do not count duplicate values
20. Find the total sales cost in each month of the year 2013.
21. List all products with names that start with 'Ca'.
22. List all products that start with 'Cha' or 'Chan' and have one more character.
23. Your manager notices there are some suppliers without fax numbers. He seeks your help to
get a list of suppliers with remark as "No fax number" for suppliers who do not have fax
numbers (fax numbers might be null or blank).Also, Fax number should be displayed for
customer with fax numbers.
24. List all orders, their orderDates with product names, quantities, and prices.
25. List all customers who have not placed any Orders.
26. List suppliers that have no customers in their country, and customers that have no suppliers
in their country, and customers and suppliers that are from the same country.
Hint: See sample output for your reference.
27. Match customers that are from the same city and country. That is you are asked to give a list
of customers that are from same country and city. Display firstname, lastname, city and
coutntry of such customers.
Hint See sample output for your reference.
28. List all Suppliers and Customers. Give a Label in a separate column as 'Suppliers' if he is a
supplier and 'Customer' if he is a customer accordingly. Also, do not display firstname and
lastname as twoi fields; Display Full name of customer or supplier.
Hint: See sample output for your reference.
29. Create a copy of orders table. In this copy table, now add a column city of type varchar (40).
Update this city column using the city info in customers table.
30. Suppose you would like to see the last OrderID and the OrderDate for this last order that
was shipped to 'Paris'. Along with that information, say you would also like to see the
OrderDate for the last order shipped regardless of the Shipping City. In addition to this, you
would also like to calculate the difference in days between these two OrderDates that you get.
Write a single query which performs this.
(Hint: make use of max (columnname) function to get the last order date and the output is a
single row output.)
31. Find those customer countries who do not have suppliers. This might help you provide
better delivery time to customers by adding suppliers to these countires. Use SubQueries.
32. Suppose a company would like to do some targeted marketing where it would contact
customers in the country with the fewest number of orders. It is hoped that this targeted
marketing will increase the overall sales in the targeted country. You are asked to write a query
to get all details of such customers from top 5 countries with fewest numbers of orders. Use
Subqueries.
33. Let's say you want report of all distinct "OrderIDs" where the customer did not purchase
more than 10% of the average quantity sold for a given product. This way you could review
these orders, and possibly contact the customers, to help determine if there was a reason for
the low quantity order. Write a query to report such orderIDs.
34. Find Customers whose total orderitem amount is greater than 7500$ for the year 2013. The
total order item amount for 1 order for a customer is calculated using the formula UnitPrice *
Quantity * (1 - Discount). DO NOT consider the total amount column from 'Order' table to
calculate the total orderItem for a customer.
35. Display the top two customers, based on the total dollar amount associated with their
orders, per country. The dollar amount is calculated as OI.unitprice * OI.Quantity * (1 -
OI.Discount). You might want to perform a query like this so you can reward these customers,
since they buy the most per country.
Please note: if you receive the error message for this question "This type of correlated subquery
pattern is not supported yet", that is totally fine.
Sample output is as below for your response
36. Create a View of Products whose unit price is above average Price.
37. Write a store procedure that performs the following action:
Check if Product_copy table (this is a copy of Product table) is present. If table exists, the
procedure should drop this table first and recreated.
Add a column Supplier_name in this copy table. Update this column with that of
'CompanyName' column from Supplier tab
