
/*
CHALLENGE 040 — Number of Tracks per Genre

Goal:
Calculate the number of tracks available for each genre.

Instructions:
1) Query the tables:
   - track
   - genre
2) Join track to genre using:
   - track.genre_id = genre.genre_id
3) Group rows by:
   - genre.genre_id
   - genre.name
4) Compute:
   - COUNT(track.track_id) AS track_count
5) Select exactly these columns (in this order):
   - genre.name AS genre_name
   - track_count
6) Filter groups where:
   - COUNT(track.track_id) >= 20
7) Sort the result by:
   - track_count DESC
   - genre.name ASC

Expected:
A result set with 2 columns:
genre_name, track_count
Only genres with at least 20 tracks, ordered by track_count descending and genre_name ascending.
*/
