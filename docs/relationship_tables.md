# Relationship tables
## user_has_goal
### Properties
- user_id *int*  
- goal_id *int*

### Relationships
- user_has_goal (n) -> user (n)
- user_has_goal (n) -> goal (n)

### Triggers
- trg_log_ai_user_has_goal *after input*
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
- trg_log_ai_workout_has_goal *after input*
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
- trg_log_ai_workout_has_hashtag *after input*
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
- trg_log_ai_workout_has_user *after input*
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
- trg_log_ai_workout_has_routine *after input*
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
- trg_log_ai_workout_has_exercise *after input*
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
- trg_log_ai_routine_has_type *after input*
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
- hashtag_id *int*

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
- trg_log_ai_exercise_has_type *after input*
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
- trg_log_ai_exercise_has_modality *after input*
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
- trg_log_ai_exercise_has_goal *after input*
- trg_log_ad_exercise_has_goal *after delete*

---
## exercise_has_hashtag
### Properties
- exercise_id *int*  
- hashtag_id *int*

### Relationships
- exercise_has_hashtag (n) -> exercise (n)
- exercise_has_hashtag (n) -> hashtag (n)

### Triggers
- trg_log_ai_exercise_has_hashtag *after input*
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
- trg_log_ai_exercise_has_variation *after input*
- trg_log_ad_exercise_has_variation *after delete*
