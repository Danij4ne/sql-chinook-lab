
-- CHALLENGE 080 - SALES RANKING PER BILLING COUNTRY
-- Difficulty: MEDIUM
-- Topic: RANK() WITH PARTITION BY
-- Database: Chinook

-- DESCRIPTION:
-- Rank invoices by total sales within each billing country.

-- REQUIREMENTS:
--   1. Select InvoiceId, BillingCountry, Total.
--   2. Use RANK() OVER (PARTITION BY BillingCountry ORDER BY Total DESC).
--   3. Order results by BillingCountry, then Rank.
