SELECT 
  arts.artists_name AS 'artista',
  albs.albums_name AS 'album',
  COUNT(fans.artist_follows) AS 'seguidores'
FROM
  SpotifyClone.artists AS arts
    INNER JOIN
  SpotifyClone.albums AS albs ON arts.artists_id = albs.id_author
    INNER JOIN
  SpotifyClone.`follows` AS fans ON arts.artists_id = fans.artist_follows
GROUP BY artista , album
ORDER BY seguidores DESC , artista , album;