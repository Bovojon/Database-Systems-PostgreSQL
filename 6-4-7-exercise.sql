-- a) Find the number of battleship classes.
select count(*) 
from classes 
where stype = 'bb';


-- b) Find the average number of guns of battleship classes.
select avg(numGuns) 
from classes 
where stype = 'bb';


-- ! c) Find the average number of guns of battleships. Note the difference between (b) and (c); do we weight a class by the number of ships of that class or not?
select avg(numGuns) 
from ships 
left join classes on ships.class = classes.class 
where stype = 'bb';


-- ! d) Find for each class the year in which the first ship of that class was launched.
select ships.class, min(launched) 
from ships 
inner join classes on ships.class = classes.class 
group by ships.class;


-- ! e) Find for each class the number of ships of that class sunk in battle.
select ships.class, count(ships.class)
from ships 
inner join classes on ships.class = classes.class 
inner join outcomes on ships.name = outcomes.ship
where outcomes.result = 'sunk' 
group by ships.class;


-- !! f) Find for each class with at least three ships the number of ships of that class sunk in battle.
select ships.class, count(ships.class)
from
	(select ships.class, count(ships.class)
	 from classes, ships 
	 where ships.class = classes.class
	 group by ships.class 
	 having count(ships.name) >= 3) 
as A
inner join ships on ships.class = A.class
inner join outcomes on ships.name = outcomes.ship
where outcomes.result = 'sunk' 
group by ships.class;

