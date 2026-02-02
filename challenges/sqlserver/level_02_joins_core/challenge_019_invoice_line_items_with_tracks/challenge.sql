

-- CHALLENGE 019 - INVOICELINES WITH TRACK DETAILS
-- Difficulty: EASY
-- Topic: INNER JOIN
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve invoice line items along with the track information for each line.
-- This challenge focuses on joining InvoiceLine with Track.

-- REQUIREMENTS:
--   1. Select the following columns:
--        - InvoiceLine.InvoiceLineId
--        - InvoiceLine.InvoiceId
--        - Track.Name AS TrackName
--        - Track.UnitPrice
--   2. Join InvoiceLine → Track using TrackId.
--   3. Sort the results by InvoiceId in ascending order.
