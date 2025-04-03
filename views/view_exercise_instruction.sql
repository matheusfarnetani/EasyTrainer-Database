CREATE OR REPLACE VIEW view_exercise_instruction AS
SELECT 
    id AS exercise_id,
    name,
    steps,
    contraindications,
    safety_tips,
    common_mistakes,
    indicated_for,
    video_url,
    image_url
FROM exercise;