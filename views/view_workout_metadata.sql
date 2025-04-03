CREATE OR REPLACE VIEW view_workout_metadata AS
SELECT 
    w.id AS workout_id,
    w.name AS workout_name,
    w.description,
    w.number_of_days,
    w.image_url,
    w.duration,
    w.indoor,
    l.name AS level,
    GROUP_CONCAT(DISTINCT t.name) AS types,
    GROUP_CONCAT(DISTINCT m.name) AS modalities,
    GROUP_CONCAT(DISTINCT g.name) AS goals
FROM workout w
LEFT JOIN level l ON w.level_id = l.id
LEFT JOIN workout_has_type wht ON w.id = wht.workout_id
LEFT JOIN type t ON wht.type_id = t.id
LEFT JOIN workout_has_modality whm ON w.id = whm.workout_id
LEFT JOIN modality m ON whm.modality_id = m.id
LEFT JOIN workout_has_goal whg ON w.id = whg.workout_id
LEFT JOIN goal g ON whg.goal_id = g.id
GROUP BY w.id;