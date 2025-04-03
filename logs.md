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

