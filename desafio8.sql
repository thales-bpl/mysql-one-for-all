SELECT 
  arts.artists_name AS 'artista', albs.albums_name AS 'album'
FROM
  SpotifyClone.artists AS arts
    INNER JOIN
  SpotifyClone.albums AS albs ON arts.artists_id = albs.id_author
WHERE
  arts.artists_name = 'Walter Phoenix'
ORDER BY album;