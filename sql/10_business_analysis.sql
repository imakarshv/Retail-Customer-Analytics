-- ==========================================================
-- Business Analysis 1
-- Business Question:
-- Which countries generate the highest revenue?
-- ==========================================================

SELECT
    Country,
    SUM(Revenue) AS TotalRevenue
FROM retail_transactions
GROUP BY Country
ORDER BY TotalRevenue DESC;

-- ==========================================================
-- Business Analysis 2
-- Business Question:
-- Who are the Top 10 customers by total spending?
-- ==========================================================

SELECT
    CustomerID,
    SUM(Revenue) AS TotalSpent
FROM retail_transactions
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalSpent DESC
LIMIT 10;

-- ==========================================================
-- Business Analysis 3
-- Business Question:
-- Which products generated the highest revenue?
-- ==========================================================

SELECT
    Description,
    SUM(Revenue) AS TotalRevenue
FROM retail_transactions
WHERE Description IS NOT NULL
GROUP BY Description
ORDER BY TotalRevenue DESC;

-- ==========================================================
-- Business Analysis 4
-- Business Question:
-- Which products sold the highest quantity?
-- ==========================================================

SELECT
    Description,
    SUM(Quantity) AS TotalQuantitySold
FROM retail_transactions
WHERE Description IS NOT NULL
GROUP BY Description
ORDER BY TotalQuantitySold DESC;

-- ==========================================================
-- Business Analysis 5
-- Business Question:
-- Classify customers into spending categories.
-- ==========================================================

SELECT
    CustomerID,
    SUM(Revenue) AS TotalSpent,
    CASE
        WHEN SUM(Revenue) >= 10000 THEN 'VIP'
        WHEN SUM(Revenue) >= 5000 THEN 'Gold'
        WHEN SUM(Revenue) >= 1000 THEN 'Silver'
        ELSE 'Bronze'
    END AS CustomerCategory
FROM retail_transactions
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

-- ==========================================================
-- Business Analysis 6
-- Business Question:
-- Rank customers based on total spending.
-- ==========================================================

WITH CustomerTotal AS
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
    RANK() OVER (
        ORDER BY TotalSpent DESC
    ) AS CustomerRank
FROM CustomerTotal;

-- ==========================================================
-- Business Analysis 7
-- Business Question:
-- Find customers whose total spending is greater than the
-- average customer spending.
-- ==========================================================

WITH CustomerSpending AS
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
    TotalSpent
FROM CustomerSpending
WHERE TotalSpent >
(
    SELECT AVG(TotalSpent)
    FROM CustomerSpending
);