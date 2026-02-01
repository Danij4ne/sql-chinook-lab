
/*
CHALLENGE 012 — Filter Tracks by Bytes

Goal:
Return tracks whose file size exceeds a specific number of bytes.

Instructions:
1) Query the table: track
2) Select exactly these columns (in this order):
   - track_id
   - name
   - bytes
3) Filter rows where:
   - bytes > 100000000
4) Sort the result by:
   - bytes DESC

Expected:
A result set with 3 columns:
track_id, name, bytes
Only tracks with more than 100,000,000 bytes, ordered by bytes descending.
*/
