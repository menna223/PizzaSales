-- q1 number of pizza that people ordered
use PizzaSales
select count(order_id)
from orders


--q2 total revenue of sales of pizza

select sum(o.quantity *p.price)as totalRevenue
from pizzas p
inner join order_details o on p.pizza_id=o.pizza_id

--q3 total quantity along every category

select  sum(d.quantity) as totalquantityoverCAT,t.category
from order_details d
inner join pizzas p on d.pizza_id=p.pizza_id
inner join pizza_types t on p.pizza_type_id=t.pizza_type_id
group by t.category
order by sum(d.quantity) desc

--q4 most price ordered pizza

select distinct( price),pizza_type_id
from pizzas p
inner join order_details d on p.pizza_id=d.pizza_id
where price=(select max(price) from pizzas )

--another method
select top 1 price,pizza_type_id
from pizzas p
inner join order_details d on p.pizza_id=d.pizza_id
order by price desc

-- q5 the top 5 of pizza along quantites

select top 5 t.name, sum(o.quantity)as TotalOfQuantity
from pizza_types t
inner join pizzas p on t.pizza_type_id=p.pizza_type_id
inner join order_details o on o.pizza_id=p.pizza_id
group by t.name
order by TotalOfQuantity desc

-- q6 find most pizza ordered
select t.name,count(distinct order_id) as NumOFItsOrders
from pizza_types t
inner join pizzas p on t.pizza_type_id=p.pizza_type_id
inner join order_details o on o.pizza_id=p.pizza_id
group by t.name
order by NumOFItsOrders desc


-- q7 find top 5 pizza along their revenue and total orders
select top 5  t.name ,sum(d.quantity*p.price)as TotalRevenue ,count( distinct d.order_id) as totalOrders ,category
from pizza_types t
inner join pizzas p on t.pizza_type_id=p.pizza_type_id
inner join order_details d on p.pizza_id=d.pizza_id
group by t.name,category
order by TotalRevenue desc ,totalOrders desc

--q8 most total revenue of category pizza ordered

select  top 1 t.category,sum(d.quantity*p.price)as TotalRevenue
from pizza_types t
inner join pizzas p on t.pizza_type_id=p.pizza_type_id
inner join order_details d on p.pizza_id=d.pizza_id
group by t.category
order by TotalRevenue desc

--q9 the most category sold   pizza (classic)
select top 1 t.category, sum(quantity)as TotalQuantity ,count(distinct d.order_id) as total
from order_details d
inner join pizzas p on d.pizza_id=p.pizza_id
inner join pizza_types t on p.pizza_type_id=t.pizza_type_id
group by t.category 
order by TotalQuantity desc ,total desc



--q10 the most month pizza ordered in it (july)
select top 1 count(distinct o.order_id)as TotalOrders , datename(MONTH,date) as month 
from orders o
inner join order_details d on o.order_id=d.order_id
group by datename(MONTH,date)  
order by TotalOrders desc

--q11 the least month pizza ordered in it (october)
select top 1 count(distinct o.order_id)as TotalOrders , datename(MONTH,date) as month 
from orders o
inner join order_details d on o.order_id=d.order_id
group by datename(MONTH,date)  
order by TotalOrders asc 

--q12 the least day pizza ordered in it (sunday)
select top 1 count(distinct o.order_id)as TotalOrders , datename(DW,date) as daay 
from orders o
inner join order_details d on o.order_id=d.order_id
group by datename(DW,date)  
order by TotalOrders asc 

--q13 the most day pizza sold in it (friday)
select top 1 count(o.order_id)as TotalOrders ,datename(dw,date) as daa
from orders o
inner join order_details d on o.order_id=d.order_id
group by datename(dw,date)
order by TotalOrders Desc

--q14 the total renvue monthly of pizza
select sum(d.quantity*p.price) as TotalRenvue,datename(month,date) as month 
from order_details d
inner join orders o on d.order_id=o.order_id
inner join pizzas p on d.pizza_id=p.pizza_id
group by datename(month,date)
order by TotalRenvue desc

--q14 the total renvue daily of pizza
select sum(d.quantity*p.price) as TotalRenvue,datename(dw,date) as day 
from order_details d
inner join orders o on d.order_id=o.order_id
inner join pizzas p on d.pizza_id=p.pizza_id
group by datename(dw,date)
order by TotalRenvue desc


