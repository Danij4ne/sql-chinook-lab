
SELECT
    al.album_id,
    al.title,
    ar.name AS artist_name
FROM album al
JOIN artist ar
    ON al.artist_id = ar.artist_id
WHERE ar.name LIKE 'A%'
ORDER BY ar.name ASC, al.title ASC;
