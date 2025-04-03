# Main Tables
## user
### Properties
- name *string*  
- email *string*  
- mobile_number *string*  
- birthday *date*  
- weight *float*  
- height *float*  
- age *int*  
- gender *char*  
- password *bits*
- level_id *int*
- instructor_id *int*

### Relationships
- user (n) -> goal (n)
- user (1) -> level (n)
- user (1) -> instructor (n)
- user (n) -> workout (n)

### Triggers
* trg_log_ai_user *after input*
- trg_log_au_user *after updated*
- trg_log_ad_user *after delete*

---
## instructor
### Properties
- name *string*  
- email  *string*  
- mobile_number *string*  
- birthday *date*  
- age *int*  
- gender *char*  
- password *bits

### Relationships
- instructor (n) -> user (1)
- instructor (n) -> workout (1)
- instructor (n) -> routine (1)
- instructor (n) -> exercise (1)

### Triggers
* trg_log_ai_instructor *after input*
- trg_log_au_instructor *after updated*
- trg_log_ad_instructor *after delete*

---
## goal
### Properties
- name *string*  
- description *string*

### Relationships
- goal (n) -> user (n)
- goal (n) -> workout (n)
- goal (n) -> routine (n)
- goal (n) -> exercise (n)

### Triggers
* trg_log_ai_goal *after input*
- trg_log_au_goal *after updated*
- trg_log_ad_goal *after delete*

---
## level
### Properties
- name *string*  
- description *string*

### Relationships
- level (n) -> user (1)
- level (n) -> workout (1)
- level (n) -> routine (1)
- level (n) -> exercise (1)

### Triggers
* trg_log_ai_level *after input*
- trg_log_au_level *after updated*
- trg_log_ad_level *after delete*

---
## type
### Properties
- name *string*  
- description *string*

### Relationships
- type (n) -> workout (n)
- type (n) -> routine (n)
- type (n) -> exercises (n)

### Triggers
* trg_log_ai_type *after input*
- trg_log_au_type *after updated*
- trg_log_ad_type *after delete*
- 
---
## modality
### Properties
- name *string*  
- description *string*

### Relationships
- modality (n) -> workout (n)
- modality (n) -> routine (n)
- modality (n) -> exercises (n)

### Triggers
- trg_log_ai_modality *after input*
- trg_log_au_modality *after updated*
- trg_log_ad_modality *after delete*

---
## hashtag
### Properties
- hashtag *string*

### Relationships
- hashtags (n) -> workout (n)
- hashtag (n) -> routine (n)
- hashtag (n) -> exercises (n)

### Triggers
- trg_log_ai_hashtags *after input*
- trg_log_au_hashtags *after updated*
- trg_log_ad_hashtags *after delete*

---
## workout 
### Properties
- name *string*  
- description *string*  
- number_of_days *int*  
- image_url *string*  
- duration *time*  
- indoor *bool*
- instructor_id *int*
- level_id *int*

### Relationships
- workout (n) -> user (n)
- workout (1) -> instructor (n)
- workout (n) -> goal (n)
- workout (1) -> level (n)
- workout (n) -> type (n)
- workout (n) -> modality (n)
- workout (n) -> hashtag (n)
- workout (n) -> routine (n)
- workout (n) -> exercise (n)

### Triggers
- trg_log_ai_workout *after input*
- trg_log_au_workout *after updated*
- trg_log_ad_workout *after delete*

---
## routine
### Properties
- name *string*  
- description *string*  
- duration *time*  
- image_url *string*
- instructor_id *int*
- level_id *int*

### Relationships
- routine (1) -> instructor (n)
- routine (n) -> goal (n)
- routine (1) -> level (n)
- routine (n) -> type (n)
- routine (n) -> modality (n)
- routine (n) -> hashtag (n)
- routine (n) -> workout (n)
- routine (n) -> exercise (n)

### Triggers
- trg_log_ai_routine *after input*
- trg_log_au_routine *after updated*
- trg_log_ad_routine *after delete*

---
## exercise
### Properties
- name *string*  
- description *string*  
- equipment *string*  
- duration *time*  
- repetition *int*  
- sets *int*  
- rest_time *time*  
- duration *time*  
  **classification**   
- body_part *string*  
- video_url *string*  
- image_url *string*  
- steps (instructions) *string*  
- contraindications *string*  
- safety_tips *string*  
- common_mistakes *string*  
- indicated_for *string*  
- calories_burned_estimate *float*
- instructor_id *int*
- level_id *int*

### Relationships
- exercise (1) -> instructor (n)
- exercise (n) -> goal (n)
- exercise (1) -> level (n)
- exercise (n) -> type (n)
- exercise (n) -> modality (n)
- exercise (n) -> hashtag (n)
- exercise (n) -> workout (n)
- exercise (n) -> routine (n)
- exercise (n) -> exercise (n) (variation)

### Triggers
- trg_log_ai_exercise *after input*
- trg_log_au_exercise *after updated*
- trg_log_ad_exercise *after delete*

---
# Relationship tables
## user_has_goal
### Properties
- user_id *int*  
- goal_id *int*

### Relationships
- user_has_goal (n) -> user (n)
- user_has_goal (n) -> goal (n)

### Triggers
* trg_log_ai_user_has_goal *after input*
- trg_log_ad_user_has_goal *after delete*

---
## workout_has_type 
### Properties
- workout_id *int*  
- type_id *int*

### Relationships
- workout_has_type (n) -> workout (n)
- workout_has_type (n) -> type (n)

### Triggers
* trg_log_ai_workout_has_type *after input*
- trg_log_ad_workout_has_type *after delete*

---
## workout_has_modality
### Properties
- workout_id *int*  
- modality_id *int*

### Relationships
- workout_has_modality (n) -> workout (n)
- workout_has_modality (n) -> modality (n)

### Triggers
* trg_log_ai_workout_has_modality *after input*
- trg_log_ad_workout_has_modality *after delete*

---
## workout_has_goal
### Properties
- workout_id *int*  
- goal_id *int*

### Relationships
- workout_has_goal (n) -> workout (n)
- workout_has_goal (n) -> goal (n)

### Triggers
* trg_log_ai_workout_has_goal *after input*
- trg_log_ad_workout_has_goal *after delete*

---
## workout_has_hashtag
### Properties
- workout_id *int*  
- hashtag_id *int*

### Relationships
- workout_has_hashtag (n) -> workout (n)
- workout_has_hashtag (n) -> hashtag (n)

### Triggers
* trg_log_ai_workout_has_hashtag *after input*
- trg_log_ad_workout_has_hashtag *after delete*

---
## workout_has_user
### Properties
- workout_id  *int*
- user_id *int*

### Relationships
- workout_has_user (n) -> workout (n)
- workout_has_user (n) -> user (n)

### Triggers
* trg_log_ai_workout_has_user *after input*
- trg_log_ad_workout_has_user *after delete*

---
## workout_has_routine
### Properties
- workout_id  *int*
- routine_id *int*

### Relationships
- workout_has_routine (n) -> workout (n)
- workout_has_routine (n) -> routine (n)

### Triggers
* trg_log_ai_workout_has_routine *after input*
- trg_log_ad_workout_has_routine *after delete*

---
## workout_has_exercise
### Properties
- workout_id  *int*
- exercise_id *int*

### Relationships
- workout_has_exercise (n) -> workout (n)
- workout_has_exercise (n) -> exercise (n)

### Triggers
* trg_log_ai_workout_has_exercise *after input*
- trg_log_ad_workout_has_exercise *after delete*

---
## routine_has_type
### Properties
- routine_id *int*  
- type_id *int*

### Relationships
- routine_has_type (n) -> routine (n)
- routine_has_type (n) -> type (n)

### Triggers
* trg_log_ai_routine_has_type *after input*
- trg_log_ad_routine_has_type *after delete*

---
## routine_has_modality
### Properties
- routine_id *int*  
- modality_id *int*

### Relationships
- routine_has_modality (n) -> routine (n)
- routine_has_modality (n) -> modality (n)

### Triggers
- trg_log_ai_routine_has_type *after input*
- trg_log_ad_routine_has_type *after delete*

---
## routine_has_goal
### Properties
- routine_id *int*  
- goal_id *int*

### Relationships
- routine_has_goal (n) -> routine (n)
- routine_has_goal (n) -> goal (n)

### Triggers
- trg_log_ai_routine_has_goal *after input*
- trg_log_ad_routine_has_goal *after delete*

---
## routine_has_exercise
### Properties
- routine_id *int*  
- exercise_id *int*  
- order *int*  
- sets *int*  
- reps *int*  
- rest_time *time*  
- note *string*  
- day *int*  
- week *int*  
- is_optional *bool*

### Relationships
- routine_has_exercise (n) -> routine (n)
- routine_has_exercise (n) -> exercise (n)

### Triggers
- trg_log_ai_routine_has_exercise *after input*
- trg_log_au_routine_has_exercise *after update*
- trg_log_ad_routine_has_exercise *after delete*

---
## routine_has_hashtag
### Properties
- routine_id *int*  
- tag_id *int*

### Relationships
- routine_has_hashtag (n) -> routine (n)
- routine_has_hashtag (n) -> hashtag (n)

### Triggers
- trg_log_ai_routine_has_hashtag *after input*
- trg_log_ad_routine_has_hashtag *after delete*

---
## exercise_has_type
### Properties
- exercise_id *int*  
- type_id *int*

### Relationships
- exercise_has_type (n) -> exercise (n)
- exercise_has_type (n) -> type (n)

### Triggers
* trg_log_ai_exercise_has_type *after input*
- trg_log_ad_exercise_has_type *after delete*

---
## exercise_has_modality
### Properties
- exercise_id *int*  
- modality_id *int*

### Relationships
- exercise_has_modality (n) -> exercise (n)
- exercise_has_modality (n) -> modality (n)

### Triggers
* trg_log_ai_exercise_has_modality *after input*
- trg_log_ad_exercise_has_modality *after delete*

---
## exercise_has_goal
### Properties
- exercise_id *int*  
- goal_id *int*

### Relationships
- exercise_has_goal (n) -> exercise (n)
- exercise_has_goal (n) -> goal (n)

### Triggers
* trg_log_ai_exercise_has_goal *after input*
- trg_log_ad_exercise_has_goal *after delete*

---
## exercise_has_hashtag
### Properties
- exercise_id *int*  
- tag_id *int*

### Relationships
- exercise_has_hashtag (n) -> exercise (n)
- exercise_has_hashtag (n) -> hashtag (n)

### Triggers
* trg_log_ai_exercise_has_hashtag *after input*
- trg_log_ad_exercise_has_hashtag *after delete*

---
## exercise_has_variation
### Properties
- exercise_id *int*  
- exercise_id (variation) *int*

### Relationships
- exercise_has_variation (n) -> exercise (n)
- exercise_has_variation (n) -> exercise (n)

### Triggers
* trg_log_ai_exercise_has_variation *after input*
- trg_log_ad_exercise_has_variation *after delete*

---
# Views
## view_exercise_details
- Full exercise details
- Includes name, type, modality, level and goals related to each exercise.

---
## view_routine_structure
- Routine structure with exercises
- View the routine and its exercises, with order, series, repetitions and on which day/week it occurs.

---
## view_workout_metadata
- Workout metadata
- Shows the name of the workouts with their objectives, levels, types and modalities.

---
## view_user_workout
- Workouts assigned to profiled users
- Shows workouts by user with their levels and goals.

---
## view_exercise_instruction
- Complete Exercise Instructions
- Focused on content and guidance.

---
## view_routine_weekly_schedule
- Weekly exercise schedule by routine
- Ideal for creating a calendar or planner based on routines.

---
## view_instructor_workout
- Instructor-created workouts
- Shows which workouts were assigned by which instructors (useful for apps with personal trainers).

---
## view_training_type_statistics
- Statistics by training type
- Useful for admin panels: how many exercises/routines/workouts there are by type.

---
## view_exercise_by_goals
- Recommended exercises for specific goals
- Helps filter by objective (weight loss, hypertrophy, etc.).

---
## view_exercise_by_modality
- Exercises by modality and level
- Example: “Pilates exercises for beginners”.

---
# Logs
## Log Structure Standard
### Main Log Table (`log_<table>_main`)
- Name pattern: `log_<table>_main`
- Contains:
    - `<table>_id` → ID of the tracked table (Primary Key)
    - `current_revision` → revision number (int, starts at 1)
    - `created_by` → ID of the user (`@user_id`) who created the record
    - `created_at` → timestamp of the creation

### Log Content Table (`log_<table>_content`)
- Name pattern: `log_<table>_content`
- Contains:
    - `id` → auto-increment primary key
    - `log_<table>_main_<table>_id` → foreign key referencing the main log table
    - `revision` → revision number (incremented on each update or delete)
    - `status` → 1 = active, 0 = deleted
    - All the fields from the original table
    - `modified_by` → ID of the user (`@user_id`) who made the change
    - `modified_at` → timestamp of the modification

---
### Triggers
#### 1. `trg_log_ai_<table>` → AFTER INSERT
- Inserts a new row into the `log_main` table
- Inserts the first revision into the `log_content` table

#### 2. `trg_log_au_<table>` → AFTER UPDATE
- Increments the `current_revision` in the `log_main` table
- Inserts a new revision into the `log_content` table

#### 3. `trg_log_ad_<table>` → AFTER DELETE
- Inserts a new revision into the `log_content` table with status = 0 (deleted)

---
### Additional Notes
- All triggers use the `@user_id` variable to identify the user responsible for the change
- Naming conventions and relationships are consistent and easy to track
- Comments are included to clarify the purpose of each field (e.g., `status`)

---
## Registered Log Tables
1. `log_user_main`
2. `log_user_content`
3. `log_instructor_main`
4. `log_instructor_content`
5. `log_goal_main`
6. `log_goal_content`
7. `log_level_main`
8. `log_level_content`
9. `log_type_main`
10. `log_type_content`
11. `log_modality_main`
12. `log_modality_content`
13. `log_hashtag_main`
14. `log_hashtag_content`
15. `log_workout_main`
16. `log_workout_content`
17. `log_routine_main`
18. `log_routine_content`
19. `log_exercise_main`
20. `log_exercise_content`
21. `log_user_has_goal_main`
22. `log_user_has_goal_content`
23. `log_workout_has_type_main`
24. `log_workout_has_type_content`
25. `log_workout_has_modality_main`
26. `log_workout_has_modality_content`
27. `log_workout_has_goal_main`
28. `log_workout_has_goal_content`
29. `log_workout_has_hastag_main`
30. `log_workout_has_hastag_content`
31. `log_workout_has_user_main`
32. `log_workout_has_user_content`
33. `log_workout_has_routine_main`
34. `log_workout_has_routine_content`
35. `log_workout_has_exercise_main`
36. `log_workout_has_exercise_content`
37. `log_routine_has_type_main`
38. `log_routine_has_type_content`
39. `log_routine_has_modality_main`
40. `log_routine_has_modality_content`
41. `log_routine_has_goal_main`
42. `log_routine_has_goal_content`
43. `log_routine_has_exercise_main`
44. `log_routine_has_exercise_content`
45. `log_routine_has_hashtag_main`
46. `log_routine_has_hashtag_content`
47. `log_exercise_has_type_main`
48. `log_exercise_has_type_content`
49. `log_exercise_has_modality_main`
50. `log_exercise_has_modality_content`
51. `log_exercise_has_goal_main`
52. `log_exercise_has_goal_content`
53. `log_exercise_has_hashtag_main`
54. `log_exercise_has_hashtag_content`
55. `log_exercise_has_variation_main`
56. `log_exercise_has_variation_content`

