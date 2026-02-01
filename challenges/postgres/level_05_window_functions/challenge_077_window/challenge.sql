
/*
CHALLENGE 077 — Top 5 Tracks per Genre by Unit Price

Goal:
Return the top 5 most expensive tracks within each genre using a window function.

Instructions:
1) Query the tables:
   - track
   - genre
2) Join track to genre using:
   - track.genre_id = genre.genre_id
3) Rank tracks within each genre using:
   - ROW_NUMBER() OVER (PARTITION BY track.genre_id ORDER BY track.unit_price DESC, track.track_id ASC) AS price_rank
4) Keep only rows where:
   - price_rank <= 5
5) Select exactly these columns (in this order):
   - genre.name AS genre_name
   - track.track_id
   - track.name AS track_name
   - track.unit_price
   - price_rank
6) Sort the final result by:
   - genre.name ASC
   - price_rank ASC
   - track.track_id ASC

Expected:
A result set with 5 columns:
genre_name, track_id, track_name, unit_price, price_rank
For each genre, only the top 5 tracks by unit_price, ordered by genre_name ascending, then price_rank ascending, then track_id ascending.
*/
