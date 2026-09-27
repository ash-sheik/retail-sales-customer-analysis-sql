-- ============================================================
-- RETAIL SALES PERFORMANCE & CUSTOMER ANALYSIS
-- ============================================================
-- Author: Ashiba B
-- Database: MySQL
-- Tool: MySQL Workbench
-- Project Type: SQL Data Analytics Portfolio Project
--
-- Project Objective:
-- Analyze retail sales, customer behavior, product performance,
-- category performance, and payment data using SQL to generate
-- meaningful business insights.
--
-- Key Areas of Analysis:
-- 1. Overall sales performance
-- 2. Monthly sales trends
-- 3. Product performance
-- 4. Category performance
-- 5. Customer purchasing behavior
-- 6. State-wise sales performance
-- 7. Payment performance
-- 8. Inactive customer identification
-- 9. Customer segmentation
-- 10. Month-over-month sales growth
-- ============================================================
-- ============================================================
-- 1. DATABASE SETUP
-- ============================================================

CREATE DATABASE retail_sales_analysis;

USE retail_sales_analysis;
-- ============================================================
-- 2. CREATE TABLES
-- ============================================================

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT,
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20)
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    category_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    stock_quantity INT
);
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);
-- ============================================================
-- 3. INSERT SAMPLE DATA
-- ============================================================

INSERT INTO customers
(customer_id, customer_name, gender, city, state, signup_date)
VALUES
(1, 'Aarav Sharma', 'Male', 'Bengaluru', 'Karnataka', '2025-01-10'),
(2, 'Ananya Nair', 'Female', 'Kochi', 'Kerala', '2025-02-15'),
(3, 'Rohan Mehta', 'Male', 'Mumbai', 'Maharashtra', '2025-03-05'),
(4, 'Priya Iyer', 'Female', 'Chennai', 'Tamil Nadu', '2025-03-20'),
(5, 'Aditya Rao', 'Male', 'Bengaluru', 'Karnataka', '2025-04-12'),
(6, 'Meera Menon', 'Female', 'Kochi', 'Kerala', '2025-05-08'),
(7, 'Rahul Verma', 'Male', 'Mumbai', 'Maharashtra', '2025-06-18'),
(8, 'Sneha Reddy', 'Female', 'Hyderabad', 'Telangana', '2025-07-02');
INSERT INTO products
(product_id, product_name, category, price)
VALUES
(101, 'Wireless Mouse', 'Electronics', 799.00),
(102, 'Bluetooth Headphones', 'Electronics', 1999.00),
(103, 'Laptop Backpack', 'Accessories', 1499.00),
(104, 'Smart Watch', 'Electronics', 3499.00),
(105, 'Running Shoes', 'Footwear', 2499.00),
(106, 'Casual T-Shirt', 'Clothing', 899.00),
(107, 'Water Bottle', 'Accessories', 599.00),
(108, 'Sports Jacket', 'Clothing', 2999.00);
