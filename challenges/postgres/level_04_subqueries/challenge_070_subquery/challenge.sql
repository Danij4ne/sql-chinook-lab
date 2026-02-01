
/*
CHALLENGE 070 — Albums with Tracks Priced Above 0.99

Goal:
Return albums that contain at least one track priced above 0.99.

Instructions:
1) Query the tables:
   - album
   - track
2) Use a subquery to identify album_ids where:
   - track.unit_price > 0.99
3) Filter rows where:
   - album.album_id is IN (album_ids from step 2)
4) Select exactly these columns (in this order):
   - album.album_id
   - album.title
5) Remove duplicate albums using DISTINCT.
6) Sort the result by:
   - album.title ASC

Expected:
A result set with 2 columns:
album_id, title
Only albums that have at least one track priced above 0.99, ordered by title ascending.
*/
