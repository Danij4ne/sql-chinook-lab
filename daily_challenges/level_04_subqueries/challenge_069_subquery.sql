
-- CHALLENGE 069 - TRACKS FROM TOP-SELLING ARTIST
-- Difficulty: MEDIUM
-- Topic: SUBQUERY WITH ORDER BY + LIMIT/TOP
-- Database: Chinook

-- DESCRIPTION:
-- Retrieve all tracks that belong to the artist with the highest total sales.
-- This challenge focuses on using a subquery to identify the top-selling artist.

-- REQUIREMENTS:
--   1. In a subquery:
--        - Join Artist → Album → Track → InvoiceLine.
--        - Calculate total sales per artist using:
--             SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity).
--        - Order by total sales in descending order.
--        - Return only the top 1 ArtistId.
--   2. In the main query:
--        - Select TrackId and Name from the Track table.
--        - Return only tracks whose Album belongs to that artist.
--   3. Sort results alphabetically by Track.Name.
