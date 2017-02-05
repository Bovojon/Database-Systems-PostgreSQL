-- a) Find the makers of PC's with a speed of at least 3.0
select distinct product.maker 
from product, pc 
where product.model = pc.model and pc.speed >= 3.0;

/* 
Another way to do a:
select distinct product.maker 
from product
natural join pc 
where pc.speed > 3.0;
*/

-- b) Find the printers with the highest price.
select printer.model 
from printer 
where printer.price >= ALL (select price from printer);

/*
Using MAX:
select p1.model 
from printer p1
where p1.price in (select MAX(p2.price) from printer p2);
*/

-- c) Find the laptops whose speed is slower than that of any PC
select laptop.model 
from laptop 
where laptop.speed <= ALL (select speed from pc);

/*
Doing (c);
select L.model 
from laptop L
where not exists (select P.speed from pc P where P.speed < L.speed);
*/


-- d) Find the model number of the item (PC, laptop, or printer) with the highest price.
select A.model
from 
	((select model, price from laptop) 
UNION 
	 (select model, price from pc) 
UNION 
	 (select model,price from printer)) 
as A 
where A.price >= ALL (select price from pc union select price from laptop union select price from printer);


-- e) Find the maker of the color printer with the lowest price.

-- Method 1
select maker
from product, printer
where product.model = printer.model 
and color 
and price in (select min(price) from printer);

-- Method 2
select maker
from product, (
        select model
        from printer
        where color and price <= all (select price from printer)
		)
as p1
where product.model = p1.model;


-- f) Find the maker(s) of the PC(s) with the fastest processor among all those PC's that have the smallest amount of RAM.

-- Method 1
select distinct maker
from product, (
	select model, speed
	from pc
	where ram <= ALL (select ram from pc)
	) 
as pc1 
where product model = pc1.model and speed >= ALL (
	select speed from pc
	where ram <= ALL (select ram from pc));

-- Method 2
select P1.maker 
from product P1, pc P2
where P1.model = P2.model
and P2.ram in (select min(ram) from PC)
and P2.speed >= all(
	select P2.speed
	from product P1, pc P2
	where P1.model=P2.model
	and P2.ram in (select min(ram) from pc));

-- Method 3
select P1.maker 
from product P1, pc P2
where P1.model = P2.model
and P2.ram in (select min(ram) from PC)
and P2.speed in (
	select max(P2.speed)
	from product P1, pc P2
	where P1.model=P2.model
	and P2.ram in (select min(ram) from pc));











