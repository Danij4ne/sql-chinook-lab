
/*
CHALLENGE 026 — Tracks with Media Type Name

Goal:
Return tracks along with their media type name.

Instructions:
1) Query the tables:
   - track
   - media_type
2) Join track to media_type using:
   - track.media_type_id = media_type.media_type_id
3) Select exactly these columns (in this order):
   - track.track_id
   - track.name
   - media_type.name AS media_type_name
   - track.milliseconds
4) Filter rows where:
   - media_type.name = 'MPEG audio file'
5) Sort the result by:
   - track.milliseconds DESC
   - track.name ASC

Expected:
A result set with 4 columns:
track_id, name, media_type_name, milliseconds
Only tracks with media type 'MPEG audio file', ordered by milliseconds descending and track name ascending.
*/
