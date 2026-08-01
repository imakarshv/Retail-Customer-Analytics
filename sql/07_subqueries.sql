-- ==========================================================
-- Subquery Example 1
-- Business Question:
-- Find transactions whose revenue is greater than the average
-- transaction revenue.
-- ==========================================================

SELECT *
FROM retail_transactions
WHERE Revenue >
(
    SELECT AVG(Revenue)
    FROM retail_transactions
);

