
 SELECT
    pt.PlaylistId,
    t.TrackId,
    t.Name AS TrackName
FROM PlaylistTrack pt
INNER JOIN Track t
    ON pt.TrackId = t.TrackId
ORDER BY
    pt.PlaylistId,
    TrackName;