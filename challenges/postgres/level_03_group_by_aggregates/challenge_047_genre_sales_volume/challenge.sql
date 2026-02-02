
/*
CHALLENGE 047 — Total Quantity Sold by Genre

Goal:
Calculate the total quantity of tracks sold for each genre.

Instructions:
1) Query the tables:
   - invoice_line
   - track
   - genre
2) Join tables using:
   - invoice_line.track_id = track.track_id
   - track.genre_id = genre.genre_id
3) Group rows by:
   - genre.genre_id
   - genre.name
4) Compute:
   - SUM(invoice_line.quantity) AS total_quantity_sold
5) Select exactly these columns (in this order):
   - genre.name AS genre_name
   - total_quantity_sold
6) Filter groups where:
   - SUM(invoice_line.quantity) >= 50
7) Sort the result by:
   - total_quantity_sold DESC
   - genre.name ASC

Expected:
A result set with 2 columns:
genre_name, total_quantity_sold
Only genres with total_quantity_sold >= 50, ordered by total_quantity_sold descending and genre_name ascending.
*/
