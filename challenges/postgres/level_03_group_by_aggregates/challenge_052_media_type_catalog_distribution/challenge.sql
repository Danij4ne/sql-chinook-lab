
/*
CHALLENGE 052 — Track Count by Media Type

Goal:
Calculate how many tracks exist for each media type.

Instructions:
1) Query the tables:
   - track
   - media_type
2) Join track to media_type using:
   - track.media_type_id = media_type.media_type_id
3) Group rows by:
   - media_type.media_type_id
   - media_type.name
4) Compute:
   - COUNT(track.track_id) AS track_count
5) Select exactly these columns (in this order):
   - media_type.name AS media_type_name
   - track_count
6) Filter groups where:
   - COUNT(track.track_id) >= 100
7) Sort the result by:
   - track_count DESC
   - media_type.name ASC

Expected:
A result set with 2 columns:
media_type_name, track_count
Only media types with at least 100 tracks, ordered by track_count descending and media_type_name ascending.
*/
