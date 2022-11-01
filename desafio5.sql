SELECT sng.song AS "cancao", COUNT(hst.song_id) AS "reproducoes" 
FROM SpotifyClone.history AS hst
INNER JOIN SpotifyClone.songs AS sng
ON hst.song_id = sng.song_id
GROUP BY sng.song_id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;