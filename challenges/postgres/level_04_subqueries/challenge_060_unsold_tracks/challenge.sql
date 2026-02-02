
/*
CHALLENGE 060 — Tracks Never Purchased

Goal:
Return tracks that have never been purchased (no invoice lines).

Instructions:
1) Query the table: track
2) Use a subquery to identify tracks that appear in:
   - invoice_line.track_id
3) Filter rows where:
   - track.track_id is NOT present in invoice_line.track_id
4) Select exactly these columns (in this order):
   - track_id
   - name
   - unit_price
5) Sort the result by:
   - unit_price DESC
   - name ASC

Expected:
A result set with 3 columns:
track_id, name, unit_price
Only tracks with no invoice lines, ordered by unit_price descending and name ascending.
*/
