
/*
CHALLENGE 076 — Rank Artists by Total Revenue

Goal:
Rank artists by total revenue using a window function.

Instructions:
1) Query the tables:
   - invoice_line
   - track
   - album
   - artist
2) Join tables using:
   - invoice_line.track_id = track.track_id
   - track.album_id = album.album_id
   - album.artist_id = artist.artist_id
3) Compute total revenue per artist as:
   - SUM(invoice_line.unit_price * invoice_line.quantity) grouped by artist_id and artist.name
4) In the final result, add a window function column:
   - DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
5) Select exactly these columns (in this order):
   - artist_id
   - artist_name
   - total_revenue
   - revenue_rank
6) Sort the final result by:
   - revenue_rank ASC
   - artist_id ASC

Expected:
A result set with 4 columns:
artist_id, artist_name, total_revenue, revenue_rank
Artists ranked by total_revenue (highest first), ordered by revenue_rank ascending and artist_id ascending.
*/
