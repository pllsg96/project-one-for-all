SELECT 
	COUNT(son.song) AS "cancoes",
  COUNT(DISTINCT art.artist) AS "artistas",
  COUNT(DISTINCT alb.album) AS "albuns"
FROM SpotifyClone.songs AS son
INNER JOIN SpotifyClone.albums AS alb
ON son.album_id = alb.album_id
INNER JOIN SpotifyClone.artists AS art
ON alb.artist_id = art.artist_id;