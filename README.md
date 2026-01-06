# E-commerce Database – MySQL 

## Description
This is a simple e-commerce database using MySQL.  
It includes customers, products, orders, and order_items tables with proper normalization.

## Database Structure
- customers table
- products table
- orders table
- order_items table (for normalization)

## Features Implemented
- Inserted sample data for customers, products, and orders
- Normalized database using order_items table
- Used joins, aggregate functions, and filtering
- Queries included:
  - Retrived customers who ordered in last 30 days.
  - Total total amount of all orders placed by each customer.
  - Updated the price of Product C to 45.00
  - Added a new column discount to the products table.
  - Retrieved top 3 expensive products.
  - Names of customers who have ordered Product A.
  - Joined the orders and customers tables to retrieve the customer's name and order date for each order. 
  - Retrieved the orders with a total amount greater than 150.00.
  - Normalized the database by creating a separate table for order items and updating the orders table to reference the order_items table.
  - Average total of all orders. 
    
## Technologies Used
- MySQL
- MySQL Workbench

## Screenshots
- q1.png – Customers in last 30 days
- q2.png – Total amount by customer
- q3.png – Product price update
- q4.png – Discount column added
- q5.png – Top 3 highest priced products
- q6.png – Customers who ordered Product A & Normalization by creating order_items table
- q7.png - Joined the orders and customers tables to retrieve the customer name and date.
- q8.png  – Orders with amount > 150rs
- q10.png – Average total value of all orders




