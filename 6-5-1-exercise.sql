-- Return database to a known state
\i databases_creates.sql
\i databases_inserts.sql


-- a) Using two INSERT statements, store in the database the fact that PC model 1100 is made by manufacturer C, has speed 3.2, RAM 1024, hard disk 180, and sells for $2499.
insert into product values ('C', 1100, 'pc');
insert into pc values (1100, 3.2, 1024, 180, 2499);

-- ! b) Insert the facts that for every PC there is a laptop with the same manufacturer, speed, RAM, and hard disk, a 17-inch screen, a model number 1100 greater, and a price $500 more.
insert into product
select product.maker, pc.model+1100, 'laptop' 
from pc 
inner join product on pc.model = product.model;

insert into laptop
select pc.model + 1100, speed, ram, hd, 17, price::decimal + 500 
from pc;


-- c) Delete all PC's with less than 100 gigabytes of hard disk. 
delete from pc 
where hd < 100;


-- d) Delete all laptops made by a manufacturer that doesn't make printers.
delete from laptop
where laptop.model in
	(select laptop.model
	 from laptop 
	 inner join product on laptop.model = product.model
	 where product.maker not in
		(select distinct product.maker 
		 from printer 
		 inner join product on printer.model = product.model));


-- e) Manufacturer A buys manufacturer B. Change all products made by B so they are now made by A.
update product
set maker = 'A'
where maker = 'B';


-- f) For each PC, double the amount of RAM and add 60 gigabytes to the amount of hard disk. (Remember that several attributes can be changed by one UPDATE statement.)
update pc
set ram = ram * 2, hd = hd + 60;


-- ! g) For each laptop made by manufacturer B, add one inch to the screen size and subtract $100 from the price.
update laptop
set screen = screen + 1, price = price::decimal - 100
where laptop.model in
	(select laptop.model 
	 from laptop 
	 inner join product on product.model = laptop.model 
	 where product.maker = 'B');	 
-- Method 2 for (g)
update laptop
set screen = screen + 1, price = price::decimal - 100
where model in
	(select model
	 from product
	 where maker = 'B');
