
/*
CHALLENGE 030 — Invoice Lines with Track and Album

Goal:
Return invoice line items along with track and album information.

Instructions:
1) Query the tables:
   - invoice_line
   - track
   - album
2) Join tables using:
   - invoice_line.track_id = track.track_id
   - track.album_id = album.album_id
3) Select exactly these columns (in this order):
   - invoice_line.invoice_line_id
   - invoice_line.invoice_id
   - track.name AS track_name
   - album.title AS album_title
   - invoice_line.unit_price
   - invoice_line.quantity
4) Filter rows where:
   - invoice_line.quantity >= 2
5) Sort the result by:
   - invoice_line.invoice_id ASC
   - track.name ASC

Expected:
A result set with 6 columns:
invoice_line_id, invoice_id, track_name, album_title, unit_price, quantity
Only invoice lines with quantity greater than or equal to 2, ordered by invoice_id ascending and track name ascending.
*/
