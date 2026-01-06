create database ecommerce;
use ecommerce;
-- t1-customers
create table customers (
	id int auto_increment primary key,
    name varchar(100),
    email varchar(100),
    address varchar(250)
); 
INSERT INTO customers (name, email, address) VALUES
('Radhi Dev', 'radhi123@gmail.com', 'No:42A, Doctor Street, Hospital Nagar, Chennai-002'),
('Reena Vijay', 'reenavj25@gmail.com', 'No:85C, Jio Street, Boss Nagar, Mumbai-05'),
('Anitha Ravi', 'anitharv67@gmail.com', 'No:75D, Pandian Street, Ayyanar Nagar, Hyderabad-08'),
('Teju Naveen', 'tejuvenn99@gmail.com', 'No:36P, Durai Street, SP Nagar, Bangalore-04'),
('Nila Chozhan', 'nizhan13@gmail.com', 'No:89A, Park Street, Divya Nagar, Coimbatore-12'),
('Chanda Cheran', 'chanche246@gmail.com', 'No:2C, Airtel Street, Subhiksha Nagar, Ahmedabad-01'),
('Vanathi Pandi', 'vanapan567@gmail.com', 'No:5D, Pencil Street, West Nagar, New Delhi-16'),
('Thanga Mayil Saravanan', 'mayilan789@gmail.com', 'No:6P, Ambal Street, Vadivel Nagar, Pune-14'),
('Meena Senthil', 'meenasen4139@gmail.com', 'No:852P, Margazhi Street, Mani Nagar, Kochi-78'),
('Raaji kathir', 'raajikr45669@gmail.com', 'No:23S, Gemini Street, Vivek Nagar, Erode-32'),
('Araisi Kumaravel', 'araisikumar198@gmail.com', 'No:2H, Media Street, Yogi Babu Nagar, Guntur-98'),
('Meenatchi Saravanan', 'meenasravan36@gmail.com', 'No:606K, Coding Street, Kandhan Nagar, Kanchipuram-85'),
('Janani Shakthi', 'janashak87@gmail.com', 'No:20Z, Raju Street, Murugan Nagar, Salem-075'),
('Nandhini Kathiravan', 'nandhikathir56@gmail.com', 'No:752N, Umair Street, Pillayar Nagar, Trichy-007'),
('Renuka Nyanavel', 'renuvel3456@gmail.com', 'No:82G, Soundarya Street, Lakshmi Nagar, Madurai-28'),
('Easwari Gunasekaran', 'easwariguna7889@gmail.com', 'No:451T, Sunitha Street, Parvathy Nagar, Tiruppur-67');
select * from customers;
-- t2-orders
create table orders (
	id int auto_increment primary key,
    customer_id int,
    order_date date,
    total_amount decimal(10,2), -- total-10 decimal point-2
    foreign key (customer_id) references customers(id)
);
-- t3-products
create table products (
	id int auto_increment primary key,
    name varchar(100),
    price decimal(10,2),
    description varchar(255)
); 
insert into products (name, price, description) VALUES
('Product A - Milk Frother', 399.00,'Kitchen Item'),
('Product B - Smart Watch', 7999.54,'Electronics accessory'),
('Product C - Neem Toothpaste', 126.00,'Daily use item'),
('Product D - Detergent Liquid',1085.99,'Basic Household product'),
('Product E - Indoor cycle',12899.99,'Fitness accessory'),
('Product F - Baby Diapers',899.50,'Baby care product'),
('Product G - Pencil Box with Kit',99.00,'Stationery Item'),
('Product H - Kurta Pyjama',2999.50,'Mens Ethic wear'),
('Product I - Combo Lipstick - 12 shades',1745.49,'Women cosmetic item'),
('Product J - A4 Sheet Bundle Pack 500pgs',450.50,'Office utility product');
select * from products;
-- inserting datas into t2 
insert into orders (customer_id, order_date, total_amount) values
(2, '2025-11-04', 1610.99), -- det. liq + neem tp + m.frother 
(11, '2025-11-07', 8098.54), -- pencil box + smart watch 
(14, '2025-11-10', 1025.50), -- baby diaper + neem tp
(9, '2025-11-13', 20899.53), -- smart watch + indoor cycle
(3, '2025-12-17', 2999.50), -- kurta pyjama
(15, '2025-12-19', 1745.49), -- Combo lipstick 12 shade
(1, '2025-12-20', 549.50),  -- A4 sheets + pencil box
(13, '2025-12-24', 4744.99), -- kurta pyjama + lipstick
(7, '2025-12-26', 13350.49), -- indoor cycle + A4 bundle
(5, '2025-12-28', 998.50), -- pencil box + baby diaper 
(10,'2025-12-28', 7999.54), -- smart watch
(4, '2025-12-29', 1085.99), -- det.liq
(16, '2025-12-31', 1298.50), -- m.frother + baby diaper
(6, '2026-01-02', 450.50), -- A4 sheets  
(12, '2026-01-04', 12899.99), -- indoor cycle
(8,'2026-01-05', 126.00); -- neem tp
select * from orders;

-- 1. Retrieve all customers who have placed an order in the last 30 days.
select distinct customers.id, customers.name, customers.email, customers.address
from customers
join orders
on customers.id = orders.customer_id
where orders.order_date >= curdate() - interval 30 day;
-- 2. Get the total amount of all orders placed by each customer.
select 
    customers.id,
    customers.name,
    customers.email,
    customers.address,
    sum(orders.total_amount) as total_spent
from customers 
join orders 
    on customers.id = orders.customer_id
group by customers.id, customers.name, customers.email;
-- 3. Update the price of Product C to 45.00.
update products
set price = 45.00 -- new price of neem tp
where name = 'Product C - Neem Toothpaste';

select id, name, price from products
where name = 'Product C - Neem Toothpaste';
-- 4. Add a new column discount to the products table.
alter table products
add column discount decimal(5,2);

select * from products;
-- 5. Retrieve the top 3 products with the highest price
select id, name, price from products
order by price desc limit 3;
-- 6. Get the names of customers who have ordered Product A.
-- 9.  Normalize the database by creating a separate table for order items and updating the orders table to reference the order_items table.

create table order_items (
    id int auto_increment primary key,
    order_id int,
    product_id int,
    quantity int,
    foreign key (order_id) references orders(id),
    foreign key (product_id) references products(id)
);

insert into order_items (order_id, product_id, quantity) values
(1, 1, 1),  -- Milk Frother
(2, 2, 1),
(3, 4, 1),
(4, 1, 2),  -- Milk Frother
(5, 3, 1),
(6, 1, 1);  -- Milk Frother

select distinct c.name
from customers c
join orders o
    on c.id = o.customer_id
join order_items oi
    on o.id = oi.order_id
join products p
    on oi.product_id = p.id
where p.name = 'Product A - Milk Frother';
-- 7. Join the orders and customers tables to retrieve the customer's name and order date for each order.
select customers.name, orders.order_date
from customers 
join orders 
    on customers.id = orders.customer_id;
-- 8. Retrieve the orders with a total amount greater than 150.00.
select * from orders
where total_amount > 150.00; -- except pencil box kit - 99rs
-- 10. Retrieve the average total of all orders.
select avg(total_amount) as average_order_value
from orders;



 