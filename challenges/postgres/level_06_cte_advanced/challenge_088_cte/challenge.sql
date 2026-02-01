
/*
CHALLENGE 088 — Top 5 Artists by Revenue

Goal:
Return the top 5 artists by total revenue using CTEs.

Instructions:
1) Create a CTE named artist_revenue that:
   - queries invoice_line, track, album, artist
   - joins:
     - invoice_line.track_id = track.track_id
     - track.album_id = album.album_id
     - album.artist_id = artist.artist_id
   - groups by:
     - artist.artist_id
     - artist.name
   - computes:
     - SUM(invoice_line.unit_price * invoice_line.quantity) AS total_revenue
2) Select exactly these columns (in this order) from the CTE:
   - artist_id
   - artist_name
   - total_revenue
3) Sort the result by:
   - total_revenue DESC
   - artist_id ASC
4) Limit the result to:
   - 5 rows

Expected:
A result set with 3 columns:
artist_id, artist_name, total_revenue
Only the top 5 artists by total_revenue, ordered by total_revenue descending and artist_id ascending.
*/
