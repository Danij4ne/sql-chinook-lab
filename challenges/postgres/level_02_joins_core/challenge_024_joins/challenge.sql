
/*
CHALLENGE 024 — Invoice Lines with Track and Genre

Goal:
Return invoice line items along with track name and genre name.

Instructions:
1) Query the tables:
   - invoice_line
   - track
   - genre
2) Join tables using:
   - invoice_line.track_id = track.track_id
   - track.genre_id = genre.genre_id
3) Select exactly these columns (in this order):
   - invoice_line.invoice_line_id
   - invoice_line.invoice_id
   - track.name AS track_name
   - genre.name AS genre_name
   - invoice_line.unit_price
   - invoice_line.quantity
4) Filter rows where:
   - genre.name = 'Rock'
5) Sort the result by:
   - invoice_line.invoice_id ASC
   - track.name ASC

Expected:
A result set with 6 columns:
invoice_line_id, invoice_id, track_name, genre_name, unit_price, quantity
Only invoice lines for tracks in the 'Rock' genre, ordered by invoice_id ascending and track_name ascending.
*/
