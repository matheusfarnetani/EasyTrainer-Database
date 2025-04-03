CREATE OR REPLACE VIEW view_exercise_by_modality AS
SELECT 
    m.id AS modality_id,
    m.name AS modality_name,
    l.name AS level_name,
    e.id AS exercise_id,
    e.name AS exercise_name,
    e.body_part,
    e.repetition,
    e.sets,
    e.duration
FROM modality m
JOIN exercise_has_modality ehm ON m.id = ehm.modality_id
JOIN exercise e ON ehm.exercise_id = e.id
LEFT JOIN level l ON e.level_id = l.id
ORDER BY m.name, level_name, e.name;