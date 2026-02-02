
/*
CHALLENGE 062 — Artists with No Albums

Goal:
Return artists who have no albums.

Instructions:
1) Query the table: artist
2) Use a subquery to identify artists that appear in:
   - album.artist_id
3) Filter rows where:
   - artist.artist_id is NOT present in album.artist_id
4) Select exactly these columns (in this order):
   - artist_id
   - name
5) Sort the result by:
   - name ASC

Expected:
A result set with 2 columns:
artist_id, name
Only artists with no albums, ordered by name ascending.
*/
