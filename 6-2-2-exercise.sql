-- a) Give the manufacturer and speed of laptops with a hard disk of at least thirty gigabytes.
select product.maker, laptop.speed
from product, laptop
where product.model = laptop.model and laptop.hd >= 30
order by maker, speed;


-- b) Find the model number and price of all products (of any type) made by manufacturer B.
SELECT model, price
FROM product, pc, laptop, printer
WHERE product.maker = 'B';
----------------------------
--Using unions:
	(select product.model, pc.price 
	from product, pc
	where product.maker = 'B' and product.model = pc.model)
UNION
	(select product.model, laptop.price
	from product, laptop
	where product.maker = 'B' and product.model = laptop.model)
UNION
	(select product.model, printer.price 
	from product, printer
	where product.maker = 'B' and product.model = printer.model);
	

-- c) Find those manufacturers that sell Laptops, but not PC's.
	(SELECT distinct maker 
	 FROM product, laptop
	 WHERE product.model = laptop.model)
EXCEPT
	(select maker
	 from product, pc
	 WHERE product.model = pc.model)
order by maker;
----------------------------
-- Shorter way: 
	(select distinct maker
	 from product
	 where type = 'laptop')
except 
	(select distinct maker
	 from product
	 where type='pc');


--d) Find those hard-disk sizes that occur in two or more PC's.
select distinct hd
from pc
group by hd
order by hd
having count(*) >= 2;
----------------------------
-- Another way: 
select distinct hd
from (
	(select hd from pc)
except all 
	(select distinct hd from pc)
) 
as P;


-- e) Find those pairs of PC models that have both the same speed and RAM. A pair should be listed only once.
select pc1.model, pc2.model
from pc pc1, pc pc2
where pc1.speed = pc2.speed and pc1.ram = pc2.ram and pc1.model < pc2.model;


-- f) Find those manufacturers of at least two different computers (PC's or laptops) with speeds of at least 3.0.
select distinct maker
from (
		((select product.maker 
		 from pc, product
		 where product.model = pc.model and pc.speed >= 3.0)
	union all 
		(select product.maker
		 from laptop, product
		  where product.model = laptop.model and laptop.speed >= 3.0))
	except all 
		(select distinct maker
		 from product)
	)
	as P;
----------------------------
-- Another way to do f:
select distinct p.maker
from product p, product p1
where p.maker = p1.maker and p.model != p1.model and p.model in 
		(select pc.model 
		 from pc
		 where pc.speed >= 3
	union
		 select laptop.model
		 from laptop
		 where laptop.speed >= 3)
and p1.model in 
		(select pc.model
		 from pc
		 where.speed >= 3
	union
		 select laptop.model
		 from laptop
		 where laptop.speed >= 3);
	
	
		












