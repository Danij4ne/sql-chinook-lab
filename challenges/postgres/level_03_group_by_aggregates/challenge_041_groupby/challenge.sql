
/*
CHALLENGE 041 — Total Track Sales by Track

Goal:
Calculate total quantity sold for each track.

Instructions:
1) Query the tables:
   - invoice_line
   - track
2) Join invoice_line to track using:
   - invoice_line.track_id = track.track_id
3) Group rows by:
   - track.track_id
   - track.name
4) Compute:
   - SUM(invoice_line.quantity) AS total_quantity_sold
5) Select exactly these columns (in this order):
   - track.track_id
   - track.name
   - total_quantity_sold
6) Filter groups where:
   - SUM(invoice_line.quantity) >= 5
7) Sort the result by:
   - total_quantity_sold DESC
   - track.name ASC

Expected:
A result set with 3 columns:
track_id, name, total_quantity_sold
Only tracks with total_quantity_sold >= 5, ordered by total_quantity_sold descending and track name ascending.
*/
