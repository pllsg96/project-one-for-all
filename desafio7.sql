SELECT art.artist AS "artista",
    alb.album AS "album",
    COUNT(flw.user_id) AS "seguidores"
FROM SpotifyClone.artists AS art
INNER JOIN SpotifyClone.albums AS alb
ON art.artist_id = alb.artist_id
INNER JOIN SpotifyClone.following AS flw
ON art.artist_id = flw.artist_id
GROUP BY art.artist, alb.album
ORDER BY seguidores DESC, artista, album;