SELECT 
  `user`.users_name AS 'usuario',
  COUNT(hist.id_user) AS 'qtde_musicas_ouvidas',
  ROUND(SUM(song.songs_duration / 60), 2) AS 'total_minutos'
FROM
  SpotifyClone.users AS `user`
    INNER JOIN
  SpotifyClone.user_history AS hist ON hist.id_user = `user`.users_id
    INNER JOIN
  SpotifyClone.songs AS song ON song.songs_id = hist.id_songs
GROUP BY usuario
ORDER BY usuario;