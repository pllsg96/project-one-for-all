SELECT 
  MIN(pln.price) AS "faturamento_minimo",
  MAX(pln.price) AS "faturamento_maximo",
  ROUND(AVG(pln.price), 2) AS "faturamento_medio",
  ROUND(SUM(pln.price),2) AS "faturamento_total"
FROM SpotifyClone.plans AS pln
INNER JOIN SpotifyClone.users AS usr
ON pln.plan_id = usr.plan_id;