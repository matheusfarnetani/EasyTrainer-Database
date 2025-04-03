CREATE OR REPLACE VIEW view_routine_weekly_schedule AS
SELECT 
    r.id AS routine_id,
    r.name AS routine_name,
    rhe.day,
    rhe.week,
    e.id AS exercise_id,
    e.name AS exercise_name,
    rhe.order,
    rhe.sets,
    rhe.reps,
    rhe.rest_time,
    rhe.is_optional
FROM routine r
JOIN routine_has_exercise rhe ON r.id = rhe.routine_id
JOIN exercise e ON rhe.exercise_id = e.id
ORDER BY r.id, rhe.week, rhe.day, rhe.order;