SELECT
  TO_CHAR(series.date, 'YYYY-MM') AS MONTH,
  COUNT(t.id) AS tasks_created_count,
  COUNT(t.id) filter (
    WHERE
      t.status = 'finished'
  ) AS tasks_finished_count
FROM
  generate_series(
    DATE_TRUNC('month', CURRENT_DATE - INTERVAL '5 MONTH'),
    DATE_TRUNC('month', CURRENT_DATE),
    '1 month'
  ) AS series(date)
  LEFT JOIN tasks t ON DATE_TRUNC('month', t.created_at) = series.date
  AND CASE
    :user_role
    WHEN 'admin' THEN 1 = 1
    ELSE t.user_id = :user_id
  END
GROUP BY
  TO_CHAR(series.date, 'YYYY-MM')
ORDER BY
  TO_CHAR(series.date, 'YYYY-MM');