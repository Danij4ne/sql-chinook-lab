
/*
CHALLENGE 027 — Tracks with Genre and Media Type

Goal:
Return tracks along with their genre and media type.

Instructions:
1) Query the tables:
   - track
   - genre
   - media_type
2) Join tables using:
   - track.genre_id = genre.genre_id
   - track.media_type_id = media_type.media_type_id
3) Select exactly these columns (in this order):
   - track.track_id
   - track.name
   - genre.name AS genre_name
   - media_type.name AS media_type_name
4) Filter rows where:
   - genre.name = 'Rock'
5) Sort the result by:
   - track.name ASC

Expected:
A result set with 4 columns:
track_id, name, genre_name, media_type_name
Only tracks in the 'Rock' genre, ordered by track name ascending.
*/
