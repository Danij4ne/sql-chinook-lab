
/*
CHALLENGE 020 — Tracks with Artist Names

Goal:
Return tracks along with their artist names.

Instructions:
1) Query the tables:
   - track
   - album
   - artist
2) Join tables using:
   - track.album_id = album.album_id
   - album.artist_id = artist.artist_id
3) Select exactly these columns (in this order):
   - track.track_id
   - track.name
   - artist.name AS artist_name
   - track.unit_price
4) Filter rows where:
   - track.unit_price > 0.99
5) Sort the result by:
   - artist.name ASC
   - track.name ASC

Expected:
A result set with 4 columns:
track_id, name, artist_name, unit_price
Only tracks with unit_price greater than 0.99, ordered by artist name ascending and track name ascending.
*/
