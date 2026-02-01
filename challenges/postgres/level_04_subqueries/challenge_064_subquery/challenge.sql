
/*
CHALLENGE 064 — Tracks Longer Than Album Average

Goal:
Return tracks whose duration is longer than the average track duration of their album.

Instructions:
1) Query the tables:
   - track
   - album
2) Join track to album using:
   - track.album_id = album.album_id
3) Use a correlated subquery to calculate, for each track:
   - the average value of milliseconds for tracks in the same album
4) Filter rows where:
   - track.milliseconds > (average milliseconds for that album)
5) Select exactly these columns (in this order):
   - track_id
   - track.name
   - album.title AS album_title
   - track.milliseconds
6) Sort the result by:
   - album.title ASC
   - track.milliseconds DESC
   - track.name ASC

Expected:
A result set with 4 columns:
track_id, name, album_title, milliseconds
Only tracks longer than their album average, ordered by album title ascending, then duration descending, then track name ascending.
*/
