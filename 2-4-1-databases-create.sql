Drop table Product;
CREATE TABLE Product (
	maker VARCHAR(1),
	model INT,
	type VARCHAR(10)
);

Drop table PC;
CREATE TABLE PC (
	model INT,
	speed DECIMAL(3,2),
	ram INT,
	hd INT,
	price money
);

Drop Table Laptop;
CREATE TABLE Laptop (
	model INT,
	speed DECIMAL(3,2),
	ram INT,
	hd INT,
	screen DOUBLE PRECISION,
	price money
);

Drop Table Printer;
CREATE TABLE Printer (
	model INT,
	color BOOLEAN,
	type VARCHAR(10),
	price money
);