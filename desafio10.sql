SELECT 
  songs.songs_name AS 'nome',
  COUNT(hist.id_songs) AS 'reproducoes'
FROM
  SpotifyClone.user_history AS hist
    INNER JOIN
  SpotifyClone.users AS users ON users.users_id = hist.id_user
    INNER JOIN
  SpotifyClone.songs AS songs ON songs.songs_id = hist.id_songs
WHERE
  users.users_plan = 1
    OR users.users_plan = 3
GROUP BY songs.songs_name
ORDER BY songs.songs_name