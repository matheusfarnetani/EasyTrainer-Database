CREATE OR REPLACE VIEW view_instructor_workout AS
SELECT 
    i.id AS instructor_id,
    i.name AS instructor_name,
    w.id AS workout_id,
    w.name AS workout_name,
    w.description,
    w.number_of_days,
    w.duration
FROM instructor i
JOIN workout w ON i.id = w.instructor_id
ORDER BY i.id, w.id;