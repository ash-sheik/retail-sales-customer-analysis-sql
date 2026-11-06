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
-- 4. SYNTHETIC DEMONSTRATION DATA
-- ============================================================
-- These fictional records make the analysis queries runnable end-to-end.
-- Replace them with appropriately licensed data for a real-world analysis.

INSERT INTO customers
(customer_id, customer_name, gender, age, city, state, country, email, phone)
VALUES
(1, 'Aarav Mehta', 'Male', 29, 'Bengaluru', 'Karnataka', 'India', 'customer1@example.com', '0000000001'),
(2, 'Diya Nair', 'Female', 34, 'Kochi', 'Kerala', 'India', 'customer2@example.com', '0000000002'),
(3, 'Kabir Shah', 'Male', 41, 'Mumbai', 'Maharashtra', 'India', 'customer3@example.com', '0000000003'),
(4, 'Ananya Rao', 'Female', 26, 'Hyderabad', 'Telangana', 'India', 'customer4@example.com', '0000000004'),
(5, 'Ishaan Das', 'Male', 38, 'Kolkata', 'West Bengal', 'India', 'customer5@example.com', '0000000005'),
(6, 'Meera Iyer', 'Female', 31, 'Chennai', 'Tamil Nadu', 'India', 'customer6@example.com', '0000000006'),
(7, 'Rohan Patel', 'Male', 45, 'Ahmedabad', 'Gujarat', 'India', 'customer7@example.com', '0000000007'),
(8, 'Sara Khan', 'Female', 23, 'Pune', 'Maharashtra', 'India', 'customer8@example.com', '0000000008'),
(9, 'Nikhil Bose', 'Male', 36, 'Jaipur', 'Rajasthan', 'India', 'customer9@example.com', '0000000009');

INSERT INTO categories (category_id, category_name)
VALUES
(1, 'Electronics'),
(2, 'Home and Kitchen'),
(3, 'Fashion'),
(4, 'Books');

INSERT INTO products (product_id, category_id, product_name, unit_price, stock_quantity)
VALUES
(101, 1, 'Wireless Mouse', 799.00, 80),
(102, 1, 'Bluetooth Speaker', 2499.00, 35),
(103, 2, 'Mixer Grinder', 3299.00, 20),
(104, 2, 'Water Bottle', 499.00, 100),
(105, 3, 'Backpack', 1499.00, 45),
(106, 3, 'Cotton T-Shirt', 699.00, 120),
(107, 4, 'SQL Fundamentals', 599.00, 60),
(108, 4, 'Python for Analysis', 899.00, 50);

INSERT INTO orders (order_id, customer_id, product_id, order_date, quantity, total_amount)
VALUES
(1001, 1, 101, '2025-01-05', 2, 1598.00),
(1002, 2, 103, '2025-01-12', 1, 3299.00),
(1003, 3, 102, '2025-02-03', 1, 2499.00),
(1004, 4, 106, '2025-02-14', 3, 2097.00),
(1005, 5, 107, '2025-03-08', 2, 1198.00),
(1006, 1, 108, '2025-03-18', 1, 899.00),
(1007, 6, 104, '2025-04-02', 4, 1996.00),
(1008, 7, 105, '2025-04-20', 1, 1499.00),
(1009, 8, 101, '2025-05-11', 1, 799.00),
(1010, 2, 102, '2025-05-23', 2, 4998.00),
(1011, 3, 103, '2025-06-06', 1, 3299.00),
(1012, 4, 107, '2025-06-19', 3, 1797.00),
(1013, 5, 106, '2025-07-04', 2, 1398.00),
(1014, 6, 108, '2025-07-16', 1, 899.00),
(1015, 7, 104, '2025-08-09', 2, 998.00),
(1016, 1, 105, '2025-08-22', 1, 1499.00),
(1017, 2, 101, '2025-09-03', 3, 2397.00),
(1018, 3, 107, '2025-09-18', 1, 599.00),
(1019, 4, 102, '2025-10-07', 1, 2499.00),
(1020, 5, 103, '2025-10-21', 1, 3299.00);

INSERT INTO payments (payment_id, order_id, payment_date, payment_method, payment_status, amount)
VALUES
(5001, 1001, '2025-01-05', 'UPI', 'Paid', 1598.00),
(5002, 1002, '2025-01-12', 'Card', 'Paid', 3299.00),
(5003, 1003, '2025-02-03', 'UPI', 'Paid', 2499.00),
(5004, 1004, '2025-02-14', 'Cash', 'Paid', 2097.00),
(5005, 1005, '2025-03-08', 'Card', 'Paid', 1198.00),
(5006, 1006, '2025-03-18', 'UPI', 'Paid', 899.00),
(5007, 1007, '2025-04-02', 'Cash', 'Paid', 1996.00),
(5008, 1008, '2025-04-20', 'Card', 'Paid', 1499.00),
(5009, 1009, '2025-05-11', 'UPI', 'Paid', 799.00),
(5010, 1010, '2025-05-23', 'Card', 'Paid', 4998.00),
(5011, 1011, '2025-06-06', 'UPI', 'Paid', 3299.00),
(5012, 1012, '2025-06-19', 'Cash', 'Paid', 1797.00),
(5013, 1013, '2025-07-04', 'UPI', 'Paid', 1398.00),
(5014, 1014, '2025-07-16', 'Card', 'Paid', 899.00),
(5015, 1015, '2025-08-09', 'UPI', 'Paid', 998.00),
(5016, 1016, '2025-08-22', 'Cash', 'Paid', 1499.00),
(5017, 1017, '2025-09-03', 'UPI', 'Paid', 2397.00),
(5018, 1018, '2025-09-18', 'Card', 'Paid', 599.00),
(5019, 1019, '2025-10-07', 'UPI', 'Paid', 2499.00),
(5020, 1020, '2025-10-21', 'Card', 'Paid', 3299.00);

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

-- ============================================================
-- 10. PAYMENT PERFORMANCE
-- ============================================================

SELECT
    payment_method,
    COUNT(DISTINCT payment_id) AS total_transactions,
    ROUND(SUM(amount), 2) AS total_payment_amount
FROM payments
GROUP BY payment_method
ORDER BY total_payment_amount DESC;

-- ============================================================
-- 11. INACTIVE CUSTOMERS
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    c.state
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id;

-- ============================================================
-- 12. CUSTOMER SEGMENTATION
-- ============================================================

SELECT
    c.customer_id,
    c.customer_name,
    ROUND(SUM(o.total_amount), 2) AS total_spent,
    CASE
        WHEN SUM(o.total_amount) >= 50000 THEN 'High Value'
        WHEN SUM(o.total_amount) >= 20000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC;
