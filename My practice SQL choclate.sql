-- To see all the table in the data Base
show tables;
-- To know the discription or structure of the table
desc geo;

-- Naming a field with AS in SQL
Select SaleDate, Amount, Boxes, Amount / boxes as 'Amount per box'  from sales;


-- Using year() function to select all data in a specific year

select SaleDate, Amount from sales where amount > 10000 and year(SaleDate) = 2022
order by amount desc;

-- Using weekday() function in SQL

select SaleDate, Amount, Boxes, weekday(SaleDate) as 'Day of week'
from sales where weekday(SaleDate) = 4;


-- IN operator in SQL

select * from people
where team in ('Delish','Jucies');

-- LIKE operator in SQL
-- Sales person name starts with B
select * from people
where salesperson like 'B%';

-- Sales person name any where B
select * from people
where salesperson like '%B%';

-- GROUP BY in SQL
select team, count(*) from people
group by team;

-- Using CASE command to create branching logic in SQL

select 	SaleDate, Amount,
		case 	when amount < 1000 then 'Under 1k'
				when amount < 5000 then 'Under 5k'
                when amount < 10000 then 'Under 10k'
			else '10k or more'
		end as 'Amount category'
from sales;

-- Print details of shipments (sales) where amounts are > 2,000 and boxes are <100
select * from sales where Amount > 2000 and Boxes < 100;

-- How many shipments (sales) each of the sales persons had in the month of January 2022

select S.SaleDate, p.Salesperson, count(*) as 'Shipment count'
from sales s
join people p on p.SPID = s.SPID
where year(SaleDate) = 2022 and month(SaleDate) =01
group by s.SPID;


select  p.Salesperson, count(*) as 'Shipment count'
from sales s
join people p on p.SPID = s.SPID
where year(SaleDate) = 2022 and month(SaleDate) =01
group by p.Salesperson;

Select * from sales;
Select * from products;

--  Which product sells more boxes? Milk Bars or Eclairs
select  pr.Product, sum(Boxes)
from sales s
join products pr on pr.PID = s.PID
where pr.Product in ('Milk Bars', 'Eclairs')
group by pr.Product;

-- Which product sold more boxes in the first 7 days of February 2022? Milk Bars or Eclairs
select  pr.Product, sum(Boxes) as TotalBoxes, SaleDate
from sales s
join products pr on pr.PID = s.PID
where pr.Product in ('Milk Bars', 'Eclairs') and  
s.SaleDate between '2022-2-1' and '2022-2-7'
group by pr.Product;

-- Which shipments had under 100 customers & under 100 boxes? Did any of them occur on Wednesday?
select  SPID, Amount, Boxes, Customers, SaleDate, weekday(SaleDate) as 'Day of week' from sales 
where customers < 100 and boxes < 100
 and weekday(SaleDate) = 4;

