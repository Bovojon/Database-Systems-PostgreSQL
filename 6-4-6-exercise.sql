-- a) Find the average speed of PC's.
select avg(speed) 
from pc;
-- If asked to find the average speed by manufacturer:
select maker, pc.model, avg(speed)
from product, pc
where product.model = pc.model
group by maker, pc.model;


-- b) Find the average speed of laptops costing over $1000.
-- Method 1 - promote price to numeric
select avg(speed) 
from laptop 
where price::numeric > 1000;
-- Method 2 - promote 1000 to money
select avg(speed) 
from laptop 
where price > 1000::money;


-- c) Find the average price of PC's made by manufacturer "A"
select avg(pc.price::decimal) 
from pc, product 
where pc.model = product.model 
and product.maker = 'A';


-- d) Find the average price of PC's and laptops made by manufacturer "D"
select avg(A.price::decimal)
from
	(( select pc.price 
	   from pc, product 
	   where pc.model = product.model and product.maker = 'D'
	  )
	UNION
	 ( select laptop.price 
	   from laptop, product
	   where laptop.model = product.model and product.maker = 'D')) 
as A;


-- e) Find, for each different speed, the average price of a PC.
select speed, avg(price::decimal) 
from pc 
group by speed;


-- f) Find for each manufacturer, the average screen size of its laptops.
select product.maker, avg(laptop.screen)
from laptop, product
where product.model = laptop.model
group by product.maker;


-- g) Find the manufacturers that make at least three different models of PC.
select product.maker
from pc,product
where pc.model = product.model
group by maker 
having count(maker) >= 3;


-- h) Find for each manufacturer who sells PC's the maximum price of a PC.
select product.maker
from pc,product
where pc.model = product.model 
and pc.price >= ALL(select pc.price from pc);


-- i) Find, for each speed of PC above 2.0, the average price.
select speed, avg(pc.price::decimal)
from pc 
where speed > 2.0 
group by speed;


-- !! j) Find the average hard disk size of a PC for all those manufacturers that make printers.
-- Method 1
select avg(B.hd)
from (
	(select product.maker 
	 from printer, product 
	 where printer.model = product.model)
INTERSECT
	(select product.maker 
	 from pc,product 
	 where pc.model = product.model)) as A,
	(select product.maker, pc.hd 
	 from product, pc  
	 where product.model = pc.model) as B
where A.maker = B.maker;

-- Method 2
select avg(hd), product.maker
from product, (select maker
			   from product
			   where product.type = 'printer'
			   group by maker)
as query, pc
where product.maker = query.maker
and product.model = pc.model
group by product.maker;



