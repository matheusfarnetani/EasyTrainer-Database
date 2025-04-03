CREATE OR REPLACE VIEW view_routine_structure AS
SELECT 
    r.id AS routine_id,
    r.name AS routine_name,
    r.description,
    rhe.exercise_id,
    e.name AS exercise_name,
    rhe.order,
    rhe.sets,
    rhe.reps,
    rhe.rest_time,
    rhe.note,
    rhe.day,
    rhe.week,
    rhe.is_optional
FROM routine r
JOIN routine_has_exercise rhe ON r.id = rhe.routine_id
JOIN exercise e ON rhe.exercise_id = e.id
ORDER BY r.id, rhe.week, rhe.day, rhe.order;