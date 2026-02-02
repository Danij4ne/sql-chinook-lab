
/*
CHALLENGE 058 — Tracks Priced Above Genre Average

Goal:
Return tracks whose unit price is higher than the average unit price of their genre.

Instructions:
1) Query the tables:
   - track
   - genre
2) Join track to genre using:
   - track.genre_id = genre.genre_id
3) Use a correlated subquery to calculate, for each track:
   - AVG(unit_price) for tracks with the same genre_id
4) Filter rows where:
   - track.unit_price > (average unit price for that genre)
5) Select exactly these columns (in this order):
   - track_id
   - track.name
   - genre.name AS genre_name
   - track.unit_price
6) Sort the result by:
   - genre.name ASC
   - track.unit_price DESC
   - track.name ASC

Expected:
A result set with 4 columns:
track_id, name, genre_name, unit_price
Only tracks priced above their genre average, ordered by genre name ascending, then unit price descending, then track name ascending.
*/
