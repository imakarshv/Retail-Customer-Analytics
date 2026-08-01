-- ==========================================
-- GROUP BY QUERIES
-- Retail Customer Analytics
-- ==========================================

-- Question 1
-- Which countries generated the highest revenue?

SELECT
    Country,
    SUM(Revenue) AS TotalRevenue
FROM retail_transactions
GROUP BY Country
ORDER BY TotalRevenue DESC;

-- Question 2
-- Which products sold the highest quantity?

SELECT
    Description,
    SUM(Quantity) AS TotalQuantitySold
FROM retail_transactions
GROUP BY Description
ORDER BY TotalQuantitySold DESC;

-- Question 3
-- How many orders came from each country?

SELECT
    Country,
    COUNT(DISTINCT InvoiceNo) AS TotalOrders
FROM retail_transactions
GROUP BY Country
ORDER BY TotalOrders DESC;

-- Question 4
-- Which customers spent the most money?

SELECT
    CustomerID,
    SUM(Revenue) AS TotalSpent
FROM retail_transactions
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
ORDER BY TotalSpent DESC;

-- Question 5
-- Which products generated the highest revenue?

SELECT
    Description,
    SUM(Revenue) AS TotalRevenue
FROM retail_transactions
GROUP BY Description
ORDER BY TotalRevenue DESC;

-- Question 6
-- What is the average revenue per country?

SELECT
    Country,
    AVG(Revenue) AS AverageRevenue
FROM retail_transactions
GROUP BY Country
ORDER BY AverageRevenue DESC;

-- Question 7
-- How many unique customers are there in each country?

SELECT
    Country,
    COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM retail_transactions
WHERE CustomerID IS NOT NULL
GROUP BY Country
ORDER BY TotalCustomers DESC;

-- Question 8
-- Show countries with total revenue greater than 100,000

SELECT
    Country,
    SUM(Revenue) AS TotalRevenue
FROM retail_transactions
Group BY Country
HAVING SUM(Revenue) > 100000
ORDER BY TotalRevenue DESC;

-- Question 9
-- Show products that sold more than 10,000 units

SELECT
    Description,
    SUM(Quantity) AS TotalQuantitySold
FROM retail_transactions
GROUP BY Description
HAVING SUM(Quantity) > 10000
ORDER BY TotalQuantitySold DESC;

-- Question 10
-- Show customers who spent more than 5,000

SELECT
    CustomerID,
    SUM(Revenue) AS TotalSpent
FROM retail_transactions
WHERE CustomerID IS NOT NULL
GROUP BY CustomerID
HAVING SUM(Revenue) > 5000
ORDER BY TotalSpent DESC;