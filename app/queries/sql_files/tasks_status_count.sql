SELECT
  count(t.id) filter (
    WHERE
      t.status = 'to_finish'
  ) AS to_finish,
  count(t.id) filter (
    WHERE
      t.status = 'finished'
  ) AS finished,
  count(t.id) filter (
    WHERE
      t.status = 'to_finish'
      AND t.deadline < NOW()
  ) AS to_finish_deadline_expired,
  count(t.id) filter (
    WHERE
      t.status = 'to_finish'
      AND t.deadline >= NOW()
  ) AS to_finish_deadline_expires_foward
FROM
  tasks t
WHERE
  CASE
    :user_role
    WHEN 'admin' THEN 1 = 1
    ELSE t.user_id = :user_id
  END
  AND t.created_at >= NOW() - INTERVAL '6 MONTH'
GROUP BY
  t.status;