
/*
CHALLENGE 050 — Total Tracks per Album

Goal:
Calculate how many tracks each album contains.

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
5) Select exactly these columns (in this order):
   - album.title AS album_title
   - track_count
6) Filter groups where:
   - COUNT(track.track_id) >= 10
7) Sort the result by:
   - track_count DESC
   - album.title ASC

Expected:
A result set with 2 columns:
album_title, track_count
Only albums with at least 10 tracks, ordered by track_count descending and album_title ascending.
*/
