CREATE OR REPLACE VIEW view_training_type_statistics AS
SELECT 
    t.name AS type_name,
    COUNT(DISTINCT eht.exercise_id) AS exercise_count,
    COUNT(DISTINCT rht.routine_id) AS routine_count,
    COUNT(DISTINCT wht.workout_id) AS workout_count
FROM type t
LEFT JOIN exercise_has_type eht ON t.id = eht.type_id
LEFT JOIN routine_has_type rht ON t.id = rht.type_id
LEFT JOIN workout_has_type wht ON t.id = wht.type_id
GROUP BY t.id;