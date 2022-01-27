SELECT 
  MIN(plan.plan_price) AS 'faturamento_minimo',
  MAX(plan.plan_price) AS 'faturamento_maximo',
  ROUND(AVG(plan.plan_price), 2) AS 'faturamento_medio',
  ROUND(SUM(plan.plan_price), 2) AS 'faturamento_total'
FROM
  SpotifyClone.plan AS plan
    INNER JOIN
  SpotifyClone.users AS users ON users.users_plan = plan.plan_id;