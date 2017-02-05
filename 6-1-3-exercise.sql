-- a) Find the model number, speed, and hard-disk size for all PC's whose price is under $1000
SELECT model, speed, hd
FROM pc
WHERE price < 1000;

-- b) Do the same as (a), but rename the speed column gigahertz and the hd column gigabytes
SELECT model, speed AS gigahertz, hd AS gigabytes
FROM pc
WHERE price < 1000;

-- c) Find the manufacturers of printers
SELECT product.maker
FROM product, printer
WHERE product.model = printer.model;

-- ########## Another way to do it:
-- SELECT distinct maker
-- FROM product
-- WHERE type = 'printer';

-- d) Find the model number, memory size, and screen size for laptops costing more than $1500
SELECT model, ram, screen
FROM laptop
WHERE price > 1500;

-- e) Find all the tuples in the Printer relation for color printers. Remember that color is a boolean-valued attribute
SELECT * 
FROM printer
WHERE color = TRUE;

-- SELECT * 
-- FROM printer
-- WHERE NOT color;

-- f) Find the model number and hard-disk size for those PC's that have a speed of 3.2 and a price less than $2000
SELECT model, hd
FROM pc 
WHERE speed = 3.2 AND price < 2000;

