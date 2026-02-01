
/*
CHALLENGE 069 — Customers Who Bought Rock Tracks

Goal:
Return customers who purchased at least one track in the 'Rock' genre.

Instructions:
1) Query the tables:
   - customer
   - invoice
   - invoice_line
   - track
   - genre
2) Join tables using:
   - customer.customer_id = invoice.customer_id
   - invoice.invoice_id = invoice_line.invoice_id
   - invoice_line.track_id = track.track_id
   - track.genre_id = genre.genre_id
3) Filter rows where:
   - genre.name = 'Rock'
4) Select exactly these columns (in this order):
   - customer.customer_id
   - customer.first_name
   - customer.last_name
   - customer.country
5) Remove duplicate customers using DISTINCT.
6) Sort the result by:
   - customer.country ASC
   - customer.last_name ASC
   - customer.first_name ASC

Expected:
A result set with 4 columns:
customer_id, first_name, last_name, country
Only customers who bought at least one 'Rock' track, ordered by country ascending, then last name and first name ascending.
*/
