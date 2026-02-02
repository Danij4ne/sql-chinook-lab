
/*
CHALLENGE 068 — Tracks in the Most Expensive Invoice

Goal:
Return the tracks that appear in the invoice with the highest total amount.

Instructions:
1) Query the tables:
   - invoice
   - invoice_line
   - track
2) Use a subquery to identify the invoice_id where:
   - invoice.total = (maximum invoice total)
3) Join tables using:
   - invoice_line.invoice_id = invoice.invoice_id
   - invoice_line.track_id = track.track_id
4) Filter rows where:
   - invoice.invoice_id = (invoice_id from step 2)
5) Select exactly these columns (in this order):
   - invoice.invoice_id
   - invoice.total
   - invoice_line.invoice_line_id
   - track.track_id
   - track.name AS track_name
   - invoice_line.unit_price
   - invoice_line.quantity
6) Sort the result by:
   - invoice_line.invoice_line_id ASC

Expected:
A result set with 7 columns:
invoice_id, total, invoice_line_id, track_id, track_name, unit_price, quantity
Only line items from the invoice with the highest total, ordered by invoice_line_id ascending.
*/
