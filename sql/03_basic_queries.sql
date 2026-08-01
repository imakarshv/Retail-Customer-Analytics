-- ============================================
-- Basic SQL Queries
-- ============================================

-- Preview first 10 rows
SELECT *
FROM online_retail
LIMIT 10;

------------------------------------------------

-- Total number of records
SELECT COUNT(*) AS total_records
FROM online_retail;

------------------------------------------------

-- Total unique customers
SELECT COUNT(DISTINCT CustomerID) AS total_customers
FROM online_retail;

------------------------------------------------

-- Total unique products
SELECT COUNT(DISTINCT StockCode) AS total_products
FROM online_retail;

------------------------------------------------

-- List all countries
SELECT DISTINCT Country
FROM online_retail
ORDER BY Country;

------------------------------------------------

-- Earliest and latest transaction dates
SELECT
    MIN(InvoiceDate) AS first_order,
    MAX(InvoiceDate) AS last_order
FROM online_retail;

------------------------------------------------

-- Average unit price
SELECT ROUND(AVG(UnitPrice),2) AS average_price
FROM online_retail;

------------------------------------------------

-- Top 10 most expensive products
SELECT
    Description,
    UnitPrice
FROM online_retail
ORDER BY UnitPrice DESC
LIMIT 10;