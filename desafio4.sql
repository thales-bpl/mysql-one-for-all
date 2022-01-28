SELECT 
  users.users_name AS 'usuario',
  IF(MAX(YEAR(hist.play_date) = 2021),
    'Usuário ativo',
    'Usuário inativo') AS 'condicao_usuario'
FROM
  SpotifyClone.users AS users
    INNER JOIN
  SpotifyClone.user_history AS hist ON hist.id_user = users.users_id
GROUP BY usuario
ORDER BY usuario;