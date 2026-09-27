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
