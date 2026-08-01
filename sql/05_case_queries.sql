-- Question 1
-- CLassify each transaction as High Value or Low Value
SELECT
    InvoiceNo,
    Revenue,
    CASE
        WHEN Revenue >= 100 THEN 'High Value'
        ELSE 'Low Value'
    END AS TransactionType
FROM retail_transactions;

-- Question 2
-- Classify customers by spending level

SELECT
    CustomerID,
    SUM(Revenue) AS TotalSpent,
    CASE
        WHEN TotalSpent >= 10000 THEN 'Platinum'
        WHEN TotalSpent >= 5000 THEN 'Gold'
        WHEN TotalSpent >= 100 THEN 'Silver'
        ELSE 'Bronze'
    END AS CustomerCatregory
FROM retail_transactions
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

-- Question 3
-- Categorize countries by total revenue

SELECT
    Country,
    SUM(Revenue) AS TotalRevenue,
    CASE
        WHEN SUM(Revenue) >= 100000 THEN 'Major Market'
        WHEN SUM(Revenue) >= 50000 THEN 'Medium Market'
        ELSE 'Small Market'
    END AS MarketSize
FROM retail_transactions
GROUP BY Country
ORDER BY TotalRevenue DESC;