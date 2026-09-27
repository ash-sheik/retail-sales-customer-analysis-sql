-- ============================================================
-- RETAIL SALES PERFORMANCE & CUSTOMER ANALYSIS
-- ============================================================
-- Author: Ashiba B
-- Tool: MySQL
-- Project Type: Data Analysis / SQL Portfolio Project
--
-- Objective:
-- Analyze retail sales data to understand revenue performance,
-- customer purchasing behavior, product performance, and
-- geographical sales trends using SQL.
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
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2) NOT NULL
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
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
