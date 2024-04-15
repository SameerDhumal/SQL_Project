--1) List all customers
select customer_id
from Customer
	
--2) List the first name, last name, and city of all customers
select distinct FirstName,LastName,City
from Customert

--3) List the customers in Sweden.
select  LastName , FirstName ,Country 
from Customer
where Country ='Sweden'

--4) copy of supplier 
create table supplier_copy 
(
 Id                     int                  identity, 
   CompanyName          nvarchar(40)         not null, 
   ContactName          nvarchar(50)         null, 
   ContactTitle         nvarchar(40)         null, 
   City                 nvarchar(40)         null, 
   Country              nvarchar(40)         null, 
   Phone                nvarchar(30)         null,    
   Fax                  nvarchar(30)         null, 
    primary key (Id) 
) 
create index IndexSupplierName on Supplier_copy
(companyname asc)
create index indexsuppliercountry on supplier_copy
(country asc)

select * from supplier_copy

insert into supplier_copy(CompanyName,ContactName,ContactTitle,City,Country,Phone,Fax)
select CompanyName,ContactName,ContactTitle,City,Country,Phone,Fax
from [dbo].[Supplier]

--answer 
select *
from supplier_copy
where city ='pavlova.ltd'

update supplier_copy
set city ='pavlova.ltd'
where city ='sydney'

--5) copy of product table 
create table Product_copy ( 
   Id                   int                  identity, 
   ProductName          nvarchar(50)         not null, 
   SupplierId           int                  not null, 
   UnitPrice            decimal(12,2)        null default 0, 
   Package              nvarchar(30)         null, 
   IsDiscontinued       bit                  not null default 0,    
    primary key (Id) 
) 
select * from Product_copy

insert into Product_copy (ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)
select ProductName,SupplierId,UnitPrice,Package,IsDiscontinued
from Product

select * from Product_copy

delete from Product_copy
where unitprice > 50

--6) List the number of customers in each country
select Country , COUNT(id) as count_
from Customer
group by Country

--7) . List the number of customers in each country sorted high to low
select Country , COUNT(id) as cnt
from Customer
group by Country
order by cnt desc

                                                    -- set 2 --      
--1) 
select top 1 * from [dbo].[Order]
select top 1 * from Customer

select CustomerId , FirstName,LastName , sum(TotalAmount) as sum_
from [dbo].[Order] as a
join Customer as b on a.Id = b.Id 
group by CustomerId , FirstName,LastName
order by FirstName asc

--2)
select Country , COUNT(id) as count_
from Customer
group by Country
having COUNT(id) > 10

--3)
select Country , COUNT(id) as count_
from Customer
where not Country = 'usa'
group by Country
having COUNT(id) >= 9
order by Country desc

--4) 
select  top 1 * from Customer
select  top 1 * from Supplier

select CompanyName, ContactName , Country, City ,COUNT(id) as cnt
from Supplier
group by ContactName , Country, City , CompanyName
order by Country , City asc , CompanyName desc

--5) 
select  * from Product

select ProductName , UnitPrice 
from Product
where UnitPrice <= 50

--8) top 10 products
select productname , unitprice , rownum_
from 
(
select  ProductName , UnitPrice , row_number() over (order by unitprice desc) as rownum_ 
from Product
) as a 
where rownum_ between 10 and 15
order by unitprice desc 

select * ,row_number() over (order by unitprice desc) as rownum_ 
from Product
order by UnitPrice desc

                                           -- set 3 --
--1) 

select distinct Country 
from Supplier

--2)
select YEAR(orderdate) as year_,  month(orderdate) as mon_ , sum(TotalAmount)
from [dbo].[Order]
where YEAR(orderdate) = 2013
group by YEAR(orderdate) ,  month(orderdate)  
order by YEAR(orderdate)  ,  month(orderdate)


--3)
select *
from Product
where ProductName like 'ca%'

--4)
select *
from Product
where ProductName like 'cha%' 

--5) 
select CompanyName, coalesce (Fax , '') as nullfax
from Supplier
where coalesce (Fax , '') = ''

select * from Supplier
where Fax is null

--6) 
select CompanyName, coalesce (Fax , 'no') as nullfax
from Supplier


                                                 --set 4 --
--1)
select top 1 * from Product 
select top 1 * from OrderItem

select OrderId, ProductName , Quantity , b.UnitPrice 
from Product as a 
join OrderItem as b on a.Id = b.ProductId                   

--2)	
select top 1 * from [dbo].[Order]
select top 1 * from [dbo].[OrderItem]
select top 1 * from [dbo].[Product] 

select OrderNumber,OrderDate,ProductName,Quantity,b.UnitPrice
from [dbo].[Order] as a 
join OrderItem as b on a.Id = b.OrderId 
join Product as c on b.ProductId = c.Id 

--3) 
select  * from Customer
select  * from [dbo].[Order]

select * , CONCAT(firstname , LastName)
from Customer as a
left join [dbo].[Order] as b on a.Id =b.CustomerId 
where OrderNumber is null

select Id 
from Customer 
except 
select CustomerId
from [dbo].[Order]

--4)
--a. 
select FirstName , LastName , a.Country ,b.Country,CompanyName
from   Customer  as a
right join Supplier as b on a.Country = b.Country
where FirstName is null





--b.
select FirstName , LastName , a.Country ,b.Country,CompanyName
from Customer as a
left join Supplier as b on a.Country = b.Country
where CompanyName is null
order by a.Country

--c.
select FirstName , LastName , a.Country ,b.Country,CompanyName
from Customer as a
left join supplier as b on a.Country=b.Country
where a.Country=b.Country
order by  a.Country



---5) 

	select FirstName , LastName , a.Country ,b.Country,CompanyName
	from   Customer  as a
	right join Supplier as b on a.Country = b.Country
	where FirstName is null
	union
	select FirstName , LastName , a.Country ,b.Country,CompanyName
	from Customer as a
	left join Supplier as b on a.Country = b.Country
	where CompanyName is null
	union 
	select FirstName , LastName , a.Country ,b.Country,CompanyName
	from Customer as a
	left join supplier as b on a.Country=b.Country
	where a.Country=b.Country
	order by  a.Country 


---6) using full join 

--7) 

select concat(firstname,' ',LastName) as fullname,
'customer' as type , city ,country,phone
from Customer
union
select ContactName as fullname,
'supplier' as type , city ,country,phone
from Supplier


                                                    -- more questions
--27)

select distinct fullname
from 
(
select  concat (FirstName ,LastName ) as fullname ,  concat (firstname_1,lastname_2) as fullname_2
from (
select    b.FirstName , b.LastName , b.Country as cntry , b.City as cuty ,
          a.FirstName as firstname_1 , a.LastName as lastname_2 , a.Country as cuntry, a.City  as coty
from Customer as a
join Customer as b on a.City = b.City and a.Country =b.Country and a.Id<>b.Id
) as x
where concat (FirstName ,LastName ) <> concat (firstname_1,lastname_2)
)as y





--29) 
select * 
into order_copy
from [dbo].[Order]
--order_copy table has been created 

select * from order_copy
select * from Customer

alter table order_copy
add city nvarchar(40) null

alter table order_copy
alter column city nvarchar(50) null


update order_copy
set order_copy.city = Customer.City
from order_copy
join Customer on order_copy.CustomerId =Customer.Id


--30) 
select * from [dbo].[Order]
select * from [dbo].[Customer]


select max(case when City ='paris' then OrderDate end ) as last_date_in_paris ,
max(case when city = 'paris' then a.Id end ) as max_id , 
max(OrderDate) as max_order_date , 
DATEDIFF(day , max(case when City ='paris' then OrderDate end ) , max(OrderDate) ) as datediff_
from [dbo].[Order] as a
join customer as b on a.CustomerId = b.Id

--31) 

select distinct (a.Country)
from Customer as a
left join supplier_copy as b on a.Country = b.Country
where ContactName is null


--32) 
select top 5 cnt, Country 
from(
select distinct(cnt) , Country 
from (
select CONCAT(firstname,' ',LastName) as fullname , a.Country , count(ordernumber) as cnt 
from Customer as a
left join  [dbo].[Order] as b on a.Id = b.CustomerId
group by CONCAT(firstname,' ',LastName)  , a.Country 
) as x 
) as y
order by cnt

--33)

select distinct  OrderId ,  Quantity ,  x.ProductId ,  avg_qty
from (
select OrderId , Quantity ,ProductId
from [dbo].[Order] as a
join OrderItem as b on a.Id = b.OrderId
) as x 
   join (
          select  ProductId,  avg(Quantity) as avg_qty
          from OrderItem
          group by ProductId 
		  ) as y on x.ProductId = y.ProductId
where Quantity <= 0.1 * avg_qty	

---34) 
select * from [dbo].[Order]
select *, UnitPrice*Quantity*(1-discount) as total_order_item from OrderItem where  UnitPrice*Quantity*(1-discount) >7500


select CustomerId ,total_order_item ,year(OrderDate) as year_
from 
(
select * , UnitPrice*Quantity*(1-discount) as total_order_item
from OrderItem 
) as x
join (
select *
from [dbo].[Order] ) as y on x.OrderId = y.Id
where total_order_item > 7500 and year(OrderDate) = 2013


---35) 
select * from Customer
select * from [dbo].[Order]
select * from OrderItem



select *
from (
select* , rank () over (partition by country   order by total_order_item desc)  as rank_2
from(
select *
from (
select * ,  dense_rank  () over (partition by country , fullname  order by total_order_item desc)  as rank_
from (
select CONCAT( FirstName ,' ', LastName) as fullname  ,  Country , total_order_item           
from 
(
select OrderId , total_order_item ,CustomerId 
from (
select * ,UnitPrice*Quantity*(1-discount) as total_order_item
from OrderItem 
) as x 
join (
select * 
from [dbo].[Order] 
) as y on x.OrderId = y.Id
) as z
 join 
(
select *
from Customer) as m on z.CustomerId = m.Id
) as final 
) as final_rank
where rank_ =1 
) as final_top_2 
) as final_for_rank_2
where rank_2  <= 2


--36) 
 select Id, ProductName , UnitPrice  
 from Product
 where UnitPrice > ( select  sum(unitprice) /count(unitprice) as avg_price from Product)

 


