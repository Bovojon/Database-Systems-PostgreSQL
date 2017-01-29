CREATE TABLE Product(
   maker CHAR(30),
   model CHAR(30) PRIMARY KEY,
   type CHAR(15)
);

CREATE TABLE PC(
   model CHAR(30),
   speed DECIMAL(4,2),
   ram INTEGER,
   hd INTEGER,
   price DECIMAL(7,2)
);

CREATE TABLE Laptop(
   model CHAR(30),
   speed DECIMAL(7,2),
   ram INTEGER,
   hd INTEGER,
   screen DECIMAL(3,1)
   price DECIMAL(7,2)
);

CREATE TABLE Printer(
   model CHAR(30),
   color BOOLEAN,
   type CHAR(10),
   price DECIMAL(7,2)
);
