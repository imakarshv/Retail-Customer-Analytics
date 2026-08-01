-- ==========================================
-- INNER JOIN Example 1
-- Transactions with Product Descriptions
-- ==========================================

SELECT
    t.InvoiceNo,
    p.Description,
    t.Revenue
FROM transactions t
JOIN products p
    ON t.ProductID = p.ProductID;


-- ==========================================
-- INNER JOIN Example 2
-- Transactions with Customer Country
-- ==========================================

SELECT
    t.InvoiceNo,
    c.Country,
    t.Revenue
FROM transactions t
JOIN customers c
    ON t.CustomerID = c.CustomerID;


-- ==========================================
-- INNER JOIN Example 3
-- Customer Spending Segmentation
-- ==========================================

SELECT
    c.CustomerID,
    c.Country,
    SUM(t.Revenue) AS TotalSpent,
    CASE
        WHEN SUM(t.Revenue) >= 10000 THEN 'VIP'
        WHEN SUM(t.Revenue) >= 5000 THEN 'Gold'
        WHEN SUM(t.Revenue) >= 1000 THEN 'Silver'
        ELSE 'Bronze'
    END AS CustomerCategory
FROM customers c
JOIN transactions t
    ON c.CustomerID = t.CustomerID
WHERE c.CustomerID IS NOT NULL
GROUP BY
    c.CustomerID,
    c.Country
HAVING SUM(t.Revenue) > 5000
ORDER BY TotalSpent DESC;

-- ==========================================================
-- LEFT JOIN Example 1
-- Business Question:
-- Find products that have never been sold.
-- ==========================================================

SELECT
    p.ProductID,
    p.Description
FROM products p
LEFT JOIN transactions t
    ON p.ProductID = t.ProductID
WHERE t.InvoiceNo IS NULL;

-- ==========================================================
-- LEFT JOIN Example 2
-- Business Question:
-- Find customers who have never made a purchase.
-- ==========================================================

SELECT
    c.CustomerID,
    c.Country
FROM customers c
LEFT JOIN transactions t
    ON c.CustomerID = t.CustomerID
WHERE t.InvoiceNo IS NULL;

-- ==========================================================
-- RIGHT JOIN Example
-- Business Question:
-- Show every transaction, even if customer information
-- is missing.
-- ==========================================================

SELECT
    t.InvoiceNo,
    t.Revenue,
    c.CustomerID,
    c.Country
FROM customers c
RIGHT JOIN transactions t
    ON c.CustomerID = t.CustomerID;

-- ==========================================================
-- FULL OUTER JOIN Example
-- Business Question:
-- Show all customers and all transactions,
-- including unmatched records from both tables.
-- ==========================================================

SELECT
    c.CustomerID,
    c.Country,
    t.InvoiceNo,
    t.Revenue
FROM customers c
FULL OUTER JOIN transactions t
    ON c.CustomerID = t.CustomerID;