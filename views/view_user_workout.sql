CREATE OR REPLACE VIEW view_user_workout AS
SELECT 
    u.id AS user_id,
    u.name AS user_name,
    w.id AS workout_id,
    w.name AS workout_name,
    l.name AS level,
    GROUP_CONCAT(DISTINCT g.name) AS goals
FROM user u
JOIN workout_has_user whu ON u.id = whu.user_id
JOIN workout w ON whu.workout_id = w.id
LEFT JOIN level l ON u.level_id = l.id
LEFT JOIN workout_has_goal whg ON w.id = whg.workout_id
LEFT JOIN goal g ON whg.goal_id = g.id
GROUP BY u.id, w.id;