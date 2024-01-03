Used advanced queries to extract important insights,improve data efficiency, and meet various business needs, including customer analysis, product management, order processing,
and supplier coordination.


Set 1: Customer Table Analysis


Set 2: Customer and Order Analysis


Set 3: Supplier and Order Analysis


Set 4: Join and Customer/Supplier Analysis









![dig](https://github.com/SameerDhumal/SQL_Project/assets/145559776/9c1b9cb7-8344-472b-9713-298a5f3ecf67)

Below are question that we have solved using mssql
Set 1:
1. List all customers from Customer table.
2. List the first name, last name, and city of all customers from customer table.
3. List all customers who are from Sweden from the Customer table.
4. Create a copy of Supplier table. Name the copy table as “Supplier_Copy”. Now, Update the city
to ‘Sydney’ for supplier ‘Pavlova, Ltd.’ Do NOT perform update in the Supplier table
5. Create a copy of Product table. Name the copy table as Product_Copy. Now,delete all products
with unit price higher than $50 in this Product_Copy table. Do NOT perform update in the
Product table
6. List the number of customers in each country. Use Customer table.
7. List the number of customers in each country sorted high to low. That is, Country with highest
number of customers should come first in the list.
Set 2:
1. The Order table in the database gives the total amount for orders placed by each customer.
Although this table has CutomerID, it does not have names of the customers. You have been
told to return the CustomerID, FirstName, LastName and the total amount for orders placed by
each customer. Use Join operation between Customer and Order tables to achieve this.
2. List the number of customers in each country. Only include countries with more than 10
customers. This is just an extension of Qn. 6 of Set 1.
3. List the number of customers in each country, except the USA, sorted high to low.
Only include countries with 9 or more customers.
4. Write a single query to list all suppliers in the USA, Japan, and Germany ordered
a. First by Country in ascending order
b. Second by City within each of these Countries in Ascending order
c. Third by Company Name in each of these cities in each countries in Descending order
(Hint: Relax! This is simply a Hierarchical Sorting problem that we looked at in the class)
5. You have found that Products with UnitPrice over 50$ are not selling much and hence it is
resulting in loss costs. So you decide to discontinue those products. Write a query to
Discontinue products over $50. Create a copy of Product table and Name it as Copy_Products.
(Note: You are asked to discontinue the product, not delete the product all together from the
table)
6. List top 10 most expensive products. Use Product table.
7. Get all but the 10 most expensive products sorted by price in descending order.
8. Get the 10th to 15th most expensive products sorted by price in descending order.
Set 3:
1. You want to get a unique list of countries where there are Suppliers from the Supplier table.
Write a query to get this unique list of countries.
2. Find the largest order placed in 2014. That is you need to display the highest TotalAmount
among orders placed by all customers in year 2014. Use Order table.
3. List all products with names that start with 'Ca'. Use Product table.
4. List all products that start with 'Cha' or 'Chan' and have one more character. Use Product table.
5. List all suppliers that do have a fax number.
6. In the previous question, you identified those suppliers have a fax number. In this question,
make use of the ISNULL property to display the fax number if there is one otherwise label it as
‘No fax Number’. Please see below sample output is as below for your reference
Set 4:
1. Let’s start with a simple join. You have been asked to write a query to display orderID,
ProductName, Quantity and UnitPrice for each orderID. Use Product table and OrderItem table.
2. Let us take previous question one step ahead. Now you may want to display orderNumber, date
of order, ProductName, Quantity and UnitPrice for each orderID. Write a query to display this.
Note that you have three tables: Order, OrderItem and Product. Write a query to display this.
3. Your manager wants the names of customers, their city and country that have not placed any
orders. This will help them to reach out to such customers and understand what challenges they
might be facing for not ordering anything. Use Customer table and Order table.
4. a. Let us start with finding all suppliers that have no customers in the country.
b. Now let us find Customers that have no Supplier in the country.
c. Now let us find customers and suppliers that are from the same country.
5. Now tie all sub questions of Qn. 4 and come up with one query that does the same job (Hint:
use one type of Join that gives the combined output of 4a, 4b and 4c)
6. Now tie all sub questions of Qn. 4 and come up with a query using Set based operators to derive
the combined output of 4a, 4b and 4c.
7. Get a list of all Suppliers from Supplier table and Customers from Customer table. Label them as
Suppliers and Customers accordingly. A sample output is shown below for reference. As seen
below, “Type” is a derived column which tells whether the person is Supplier or Customer.

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
