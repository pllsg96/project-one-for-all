SELECT 
  usr.user AS "usuario",
  IF(MAX(YEAR(hty.played_date)) >= 2021, "Usuário ativo", "Usuário inativo") AS "status_usuario"
FROM SpotifyClone.users AS usr
INNER JOIN SpotifyClone.history AS hty
ON usr.user_id = hty.user_id
GROUP BY user
ORDER BY user;