SELECT 
  usr.user AS usuario, 
  COUNT(hst.user_id) AS qt_de_musicas_ouvidas,
  ROUND(SUM(sng.length_seconds) / 60, 2) AS total_minutos
FROM SpotifyClone.users AS usr
  INNER JOIN SpotifyClone.songs AS sng
  INNER JOIN SpotifyClone.history AS hst
  ON sng.song_id = hst.song_id 
  ON usr.user_id = hst.user_id
  GROUP BY user
  ORDER BY user ASC;