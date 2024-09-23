--create database
create database demo;
 
--use database
use demo;
 
--create category table
create table category(
id int primary key identity(1,1),
categoryname nvarchar(10),
);
 
--insert data into category
insert into category (categoryname) values
('leptop'),('mobile'),('keyboard'),('mouse');
 
--view category list
select * from category;

--create product table
create table product(
id int primary key identity(1,1),
productname nvarchar(20),
brand varchar(20),
prise decimal(8,2),
categoryid int,
foreign key (categoryid) references category(id)
ON DELETE CASCADE--or ON DELETE SET NULL or ON DELETE SET DEFAULT
ON UPDATE CASCADE--or ON UPDATE SET NULL or ON UPDATE SET DEFAULT
);
 
--insert data into product
insert into product (productname, brand, prise, categoryid) values
('redmi', 'mi', 8200, 2),
('acer EX-255', 'acer', 42000, 1),
('motorola', 'samsong', 21000, 2),
('lightbulb', 'bajaj', 200, null);
 
--view product list
select * from product;
 
--INNER JOIN - Only matching rows from both tables.
SELECT product.productname, category.categoryname 
FROM product INNER JOIN category
ON category.id = product.categoryid;
 
--LEFT JOIN (LEFT OUTER JOIN) - All rows from the left table, with NULL for non-matching rows from the right table.
SELECT product.productname, category.categoryname
FROM product LEFT JOIN category
ON category.id = product.categoryid;
 
--RIGHT JOIN (RIGHT OUTER JOIN) - All rows from the right table, with NULL for non-matching rows from the left table.
SELECT product.productname, category.categoryname
FROM product RIGHT JOIN category
ON category.id = product.categoryid;
 
--FULL JOIN (FULL OUTER JOIN) - All rows from both tables, with NULL for non-matching rows from either table.
SELECT product.productname, category.categoryname
FROM category FULL OUTER JOIN product
ON category.id = product.categoryid;
 
--CROSS JOIN - Cartesian product of both tables, pairing each row from the first table with all rows of the second.
SELECT product.productname, category.categoryname
FROM category CROSS JOIN product;

--delete record from both tables
delete from category;
delete from product;
 
-- drop both tables
drop table category;
drop table product;