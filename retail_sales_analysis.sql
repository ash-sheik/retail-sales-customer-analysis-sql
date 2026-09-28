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
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    category_id INT NOT NULL,
    product_name VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    stock_quantity INT
);
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE NOT NULL,
    quantity INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL
);
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date DATE,
    payment_method VARCHAR(50),
    payment_status VARCHAR(20),
    amount DECIMAL(10,2) NOT NULL
);
-- ============================================================
-- 3. TABLE RELATIONSHIPS
-- ============================================================

ALTER TABLE products
ADD CONSTRAINT fk_products_category
FOREIGN KEY (category_id) REFERENCES categories(category_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_customer
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders_product
FOREIGN KEY (product_id) REFERENCES products(product_id);

ALTER TABLE payments
ADD CONSTRAINT fk_payments_order
FOREIGN KEY (order_id) REFERENCES orders(order_id);

-- ============================================================
-- 4. SALES OVERVIEW
-- ============================================================

-- Total Revenue
SELECT 
    ROUND(SUM(total_amount), 2) AS total_revenue
FROM orders;

-- Total Orders
SELECT 
    COUNT(DISTINCT order_id) AS total_orders
FROM orders;

-- Total Customers
SELECT 
    COUNT(*) AS total_customers
FROM customers;

-- Average Order Value
SELECT 
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM orders;

-- ============================================================
-- 5. MONTHLY SALES TREND
-- ============================================================

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS sales_month,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(total_amount), 2) AS monthly_revenue
FROM orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY sales_month;

-- ============================================================
-- 6. PRODUCT PERFORMANCE
-- ============================================================

SELECT
    p.product_name,
    SUM(o.quantity) AS total_units_sold,
    ROUND(SUM(o.total_amount), 2) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC;

-- ============================================================
-- 7. CATEGORY PERFORMANCE
-- ============================================================

SELECT
    c.category_name,
    SUM(o.quantity) AS total_units_sold,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(SUM(o.total_amount), 2) AS total_revenue
FROM orders o
JOIN products p
    ON o.product_id = p.product_id
JOIN categories c
    ON p.category_id = c.category_id
GROUP BY c.category_id, c.category_name
ORDER BY total_revenue DESC;

-- ============================================================
-- 8. CUSTOMER PURCHASING BEHAVIOR
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.quantity) AS total_items_purchased,
    ROUND(SUM(o.total_amount), 2) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;

-- ============================================================
-- 9. STATE-WISE SALES PERFORMANCE
-- ============================================================

SELECT
    c.state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT c.customer_id) AS total_customers,
    ROUND(SUM(o.total_amount), 2) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.state
ORDER BY total_revenue DESC;
