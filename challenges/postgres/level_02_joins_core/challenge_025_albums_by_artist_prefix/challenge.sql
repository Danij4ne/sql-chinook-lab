
/*
CHALLENGE 025 — Albums with Artist Names

Goal:
Return albums along with their artist names.

Instructions:
1) Query the tables:
   - album
   - artist
2) Join album to artist using:
   - album.artist_id = artist.artist_id
3) Select exactly these columns (in this order):
   - album.album_id
   - album.title
   - artist.name AS artist_name
4) Filter rows where:
   - artist.name LIKE 'A%'
5) Sort the result by:
   - artist.name ASC
   - album.title ASC

Expected:
A result set with 3 columns:
album_id, title, artist_name
Only albums where the artist name starts with 'A', ordered by artist_name ascending and album title ascending.
*/
