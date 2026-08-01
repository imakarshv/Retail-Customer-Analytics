-- ============================================
-- Import Cleaned Dataset
-- ============================================

COPY online_retail (
    InvoiceNo,
    StockCode,
    Description,
    Quantity,
    InvoiceDate,
    UnitPrice,
    CustomerID,
    Country
)
FROM 'data/processed/online_retail_cleaned.csv'
DELIMITER ','
CSV HEADER;