
/*
CHALLENGE 065 — Genres with Above Average Track Count

Goal:
Return genres that have more tracks than the average number of tracks per genre.

Instructions:
1) Query the tables:
   - genre
   - track
2) Join track to genre using:
   - track.genre_id = genre.genre_id
3) Group rows by:
   - genre.genre_id
   - genre.name
4) Compute:
   - COUNT(track.track_id) AS track_count
5) Use a subquery to calculate:
   - the average track count per genre
6) Filter rows where:
   - track_count > (average track count)
7) Select exactly these columns (in this order):
   - genre_id
   - genre_name
   - track_count
8) Sort the result by:
   - track_count DESC
   - genre_name ASC

Expected:
A result set with 3 columns:
genre_id, genre_name, track_count
Only genres with more tracks than the average genre, ordered by track_count descending and genre_name ascending.
*/
