SELECT 
  songs.songs_name AS 'cancao',
  COUNT(hist.id_songs) AS 'reproducoes'
FROM
  SpotifyClone.user_history AS hist
    INNER JOIN
  SpotifyClone.songs AS songs ON hist.id_songs = songs.songs_id
GROUP BY id_songs
ORDER BY reproducoes DESC , cancao
LIMIT 2;