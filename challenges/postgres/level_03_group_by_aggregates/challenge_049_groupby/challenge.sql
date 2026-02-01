
/*
CHALLENGE 049 — Average Track Price by Genre

Goal:
Calculate the average track unit price for each genre.

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
   - AVG(track.unit_price) AS avg_unit_price
5) Select exactly these columns (in this order):
   - genre.name AS genre_name
   - avg_unit_price
6) Filter groups where:
   - AVG(track.unit_price) >= 1.00
7) Sort the result by:
   - avg_unit_price DESC
   - genre.name ASC

Expected:
A result set with 2 columns:
genre_name, avg_unit_price
Only genres with avg_unit_price >= 1.00, ordered by avg_unit_price descending and genre_name ascending.
*/
