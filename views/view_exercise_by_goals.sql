CREATE OR REPLACE VIEW view_exercise_by_goals AS
SELECT 
    g.id AS goal_id,
    g.name AS goal_name,
    e.id AS exercise_id,
    e.name AS exercise_name,
    e.description,
    e.body_part,
    e.duration,
    e.repetition,
    e.sets
FROM goal g
JOIN exercise_has_goal ehg ON g.id = ehg.goal_id
JOIN exercise e ON ehg.exercise_id = e.id
ORDER BY g.name, e.name;