# Retail Sales Performance & Customer Analysis

A MySQL project exploring retail sales performance, customer purchasing behaviour, product and category performance, geographic patterns and payment activity.

## Business Questions

- What are total revenue, order volume and average order value?
- How does revenue change month by month?
- Which products and categories contribute the most sales?
- Which customers spend the most?
- How does sales performance vary by state?
- Which payment methods account for the most transactions?
- Which customers have not placed an order?
- How can customers be segmented by total spend?

## Data Model

The SQL script creates a relational database with five tables:

| Table | Purpose |
|---|---|
| `customers` | Customer profile and location |
| `categories` | Product category lookup |
| `products` | Product and price information |
| `orders` | Customer purchases and order amounts |
| `payments` | Payment dates, methods, status and amounts |

Primary and foreign key constraints connect products to categories, orders to customers and products, and payments to orders.

## SQL Concepts Demonstrated

- Database and table creation
- Primary and foreign keys
- Multi-table `JOIN` operations
- Aggregations with `SUM`, `COUNT` and `AVG`
- `GROUP BY` and `ORDER BY`
- Date grouping with `DATE_FORMAT`
- `LEFT JOIN` for inactive-customer identification
- `CASE` expressions for customer segmentation
- Revenue, order and customer KPIs

## Repository Contents

- `retail_sales_analysis.sql` — database schema and analysis queries.

## Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Open `retail_sales_analysis.sql` in MySQL Workbench.
3. Execute the script from the beginning to create the database, tables, relationships and queries.
4. Review the result sets for each business question.

The SQL script includes a small synthetic dataset (fictional customers, products, orders and payments), so the analysis queries can be executed end-to-end immediately. The sample records are for demonstration only and do not represent real customers or business activity.

## Notes

This repository contains the schema, synthetic seed data and analysis queries in one script. The sample figures are illustrative, not real business findings. A next improvement would be adding a data dictionary and query-result screenshots.

## Author

**Ashiba B** · SQL · MySQL · Data Analytics

[LinkedIn](https://www.linkedin.com/in/ashiba-data-analyst) · [GitHub](https://github.com/ash-sheik)
