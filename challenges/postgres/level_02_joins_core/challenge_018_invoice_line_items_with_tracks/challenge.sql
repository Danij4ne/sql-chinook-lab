
/*
CHALLENGE 018 — Invoice Items with Track Names

Goal:
Return invoice line items along with the corresponding track names.

Instructions:
1) Query the tables:
   - invoice_line
   - track
2) Join invoice_line to track using:
   - invoice_line.track_id = track.track_id
3) Select exactly these columns (in this order):
   - invoice_line.invoice_line_id
   - invoice_line.invoice_id
   - track.name
   - invoice_line.unit_price
   - invoice_line.quantity
4) Sort the result by:
   - invoice_line.invoice_id ASC
   - invoice_line.invoice_line_id ASC

Expected:
A result set with 5 columns:
invoice_line_id, invoice_id, name, unit_price, quantity
Each row represents an invoice line with its track name, ordered by invoice and line identifier.
*/
