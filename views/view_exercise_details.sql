CREATE OR REPLACE VIEW view_exercise_details AS
SELECT 
    e.id AS exercise_id,
    e.name AS exercise_name,
    e.description,
    e.equipment,
    e.duration,
    e.repetition,
    e.sets,
    e.rest_time,
    e.body_part,
    e.video_url,
    e.image_url,
    e.steps,
    e.contraindications,
    e.safety_tips,
    e.common_mistakes,
    e.indicated_for,
    e.calories_burned_estimate,
    l.name AS level,
    i.name AS instructor,
    GROUP_CONCAT(DISTINCT t.name) AS types,
    GROUP_CONCAT(DISTINCT m.name) AS modalities,
    GROUP_CONCAT(DISTINCT g.name) AS goals
FROM exercise e
LEFT JOIN level l ON e.level_id = l.id
LEFT JOIN instructor i ON e.instructor_id = i.id
LEFT JOIN exercise_has_type eht ON e.id = eht.exercise_id
LEFT JOIN type t ON eht.type_id = t.id
LEFT JOIN exercise_has_modality ehm ON e.id = ehm.exercise_id
LEFT JOIN modality m ON ehm.modality_id = m.id
LEFT JOIN exercise_has_goal ehg ON e.id = ehg.exercise_id
LEFT JOIN goal g ON ehg.goal_id = g.id
GROUP BY e.id;