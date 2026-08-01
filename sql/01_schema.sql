-- ============================================
-- Retail Customer Analytics
-- Database Schema
-- ============================================

DROP TABLE IF EXISTS online_retail;

CREATE TABLE online_retail (
    InvoiceNo      VARCHAR(20),
    StockCode      VARCHAR(20),
    Description    TEXT,
    Quantity       INTEGER,
    InvoiceDate    TIMESTAMP,
    UnitPrice      NUMERIC(10,2),
    CustomerID     INTEGER,
    Country        VARCHAR(100)
);