SELECT 
  `user`.users_name AS 'usuario',
  IF(MAX(YEAR(hist.play_date) = 2021),
    'Usuário Ativo',
    'Usuário Inativo') AS 'condicao_usuario'
FROM
  SpotifyClone.users AS user
    INNER JOIN
  SpotifyClone.user_history AS hist ON hist.id_user = user.users_id
GROUP BY usuario
ORDER BY usuario;