
/*
CHALLENGE 072 — Rank Tracks by Total Quantity Sold

Goal:
Rank tracks by total quantity sold using a window function.

Instructions:
1) Query the tables:
   - invoice_line
   - track
2) Join invoice_line to track using:
   - invoice_line.track_id = track.track_id
3) Compute total quantity sold per track as:
   - SUM(invoice_line.quantity) grouped by track_id and track.name
4) In the final result, add a window function column:
   - DENSE_RANK() OVER (ORDER BY total_quantity_sold DESC) AS sales_rank
5) Select exactly these columns (in this order):
   - track_id
   - track_name
   - total_quantity_sold
   - sales_rank
6) Sort the final result by:
   - sales_rank ASC
   - track_id ASC

Expected:
A result set with 4 columns:
track_id, track_name, total_quantity_sold, sales_rank
Tracks ranked by total_quantity_sold (highest first), ordered by sales_rank ascending and track_id ascending.
*/
