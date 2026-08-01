-- ==========================================================
-- 09_window_functions.sql
-- Retail Customer Analytics
-- Window Function Examples
-- ==========================================================


-- ==========================================================
-- Window Function Example 1
-- Business Question:
-- Show every transaction along with each customer's
-- total spending.
-- ==========================================================

SELECT
    CustomerID,
    Revenue,
    SUM(Revenue) OVER
    (
        PARTITION BY CustomerID
    ) AS CustomerTotal
FROM retail_transactions;

-- ==========================================================
-- Window Function Example 2
-- Business Question:
-- Rank customers based on total spending.
-- ==========================================================

WITH CustomerTotals AS
(
    SELECT
        CustomerID,
        SUM(Revenue) AS TotalSpent
    FROM retail_transactions
    WHERE CustomerID IS NOT NULL
    GROUP BY CustomerID
)

SELECT
    CustomerID,
    TotalSpent,
    RANK() OVER
    (
        ORDER BY TotalSpent DESC
    ) AS CustomerRank
FROM CustomerTotals;