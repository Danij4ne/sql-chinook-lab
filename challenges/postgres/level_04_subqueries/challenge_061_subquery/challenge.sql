
/*
CHALLENGE 061 — Albums with Above Average Track Count

Goal:
Return albums that have more tracks than the average number of tracks per album.

Instructions:
1) Query the tables:
   - album
   - track
2) Join track to album using:
   - track.album_id = album.album_id
3) Group rows by:
   - album.album_id
   - album.title
4) Compute:
   - COUNT(track.track_id) AS track_count
5) Use a subquery to calculate:
   - the average track count per album
6) Filter rows where:
   - track_count > (average track count)
7) Select exactly these columns (in this order):
   - album_id
   - album_title
   - track_count
8) Sort the result by:
   - track_count DESC
   - album_title ASC

Expected:
A result set with 3 columns:
album_id, album_title, track_count
Only albums with more tracks than the average album, ordered by track_count descending and album_title ascending.
*/
