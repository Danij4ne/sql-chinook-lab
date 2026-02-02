
/*
CHALLENGE 019 — Tracks with Album Titles

Goal:
Return tracks along with their album titles.

Instructions:
1) Query the tables:
   - track
   - album
2) Join track to album using:
   - track.album_id = album.album_id
3) Select exactly these columns (in this order):
   - track.track_id
   - track.name
   - album.title
   - track.unit_price
4) Filter rows where:
   - track.unit_price >= 0.99
5) Sort the result by:
   - album.title ASC
   - track.name ASC

Expected:
A result set with 4 columns:
track_id, name, title, unit_price
Only tracks with unit_price >= 0.99, ordered by album title ascending and track name ascending.
*/
