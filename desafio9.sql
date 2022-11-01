SELECT 
  COUNT(hst.song_id) AS "quantidade_musicas_no_historico"
FROM SpotifyClone.history AS hst
INNER JOIN SpotifyClone.users AS usr
ON hst.user_id = usr.user_id
WHERE usr.user = "Barbara Liskov";