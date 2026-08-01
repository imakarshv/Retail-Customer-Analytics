-- ==========================================================
-- 08_cte_queries.sql
-- Retail Customer Analytics
-- CTE (Common Table Expression) Examples
-- ==========================================================


-- ==========================================================
-- CTE Example 1
-- Business Question:
-- Calculate the total spending for each customer.
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

SELECT *
FROM CustomerTotals;


-- ==========================================================
-- CTE Example 2
-- Business Question:
-- Find customers whose total spending is greater than the
-- average customer spending.
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

SELECT *
FROM CustomerTotals
WHERE TotalSpent >
(
    SELECT AVG(TotalSpent)
    FROM CustomerTotals
);