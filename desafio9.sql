SELECT 
  COUNT(hist.id_user) AS 'quantidade_musicas_no_historico'
FROM
  SpotifyClone.user_history AS hist
    INNER JOIN
  SpotifyClone.users AS users ON users.users_id = hist.id_user
WHERE
  users.users_name = 'Bill';