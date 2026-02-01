
/*
CHALLENGE 089 — Customers with At Least 3 Genres Purchased

Goal:
Return customers who have purchased tracks from at least 3 distinct genres.

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
3) Create a CTE named customer_genres that:
   - groups by customer.customer_id, customer.first_name, customer.last_name
   - computes COUNT(DISTINCT genre.genre_id) AS distinct_genres
4) Select exactly these columns (in this order) from the CTE:
   - customer_id
   - first_name
   - last_name
   - distinct_genres
5) Filter rows where:
   - distinct_genres >= 3
6) Sort the result by:
   - distinct_genres DESC
   - customer_id ASC

Expected:
A result set with 4 columns:
customer_id, first_name, last_name, distinct_genres
Only customers with at least 3 distinct genres purchased, ordered by distinct_genres descending and customer_id ascending.
*/
