
/*
CHALLENGE 013 — Find Tracks by Name Pattern

Goal:
Return tracks whose name contains a specific keyword.

Instructions:
1) Query the table: track
2) Select exactly these columns (in this order):
   - track_id
   - name
   - unit_price
3) Filter rows where:
   - name ILIKE '%love%'
4) Sort the result by:
   - name ASC

Expected:
A result set with 3 columns:
track_id, name, unit_price
Only tracks whose name contains the word "love", ordered by name ascending.
*/
