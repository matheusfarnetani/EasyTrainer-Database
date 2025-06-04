# Relationship tables
## user_has_instructor
### Properties
| Field         | Type     | Description                           |
| ------------- | -------- | ------------------------------------- |
| user_id       | int (FK) | User ID (FK to `user.id`)             |
| instructor_id | int (FK) | Instructor ID (FK to `instructor.id`) |

### Relationships
- `user_has_instructor.user_id` → FK to `user.id`
- `user_has_instructor.instructor_id` → FK to `instructor.id`

### Triggers
- trg_log_ai_user_has_instructor *after input*
- trg_log_ad_user_has_instructor *after delete*

---
## user_has_goal
### Properties
| Field   | Type     | Description               |
| ------- | -------- | ------------------------- |
| user_id | int (FK) | User ID (FK to `user.id`) |
| goal_id | int (FK) | Goal ID (FK to `goal.id`) |

### Relationships
- `user_has_goal.user_id` → FK to `user.id`
- `user_has_goal.goal_id` → FK to `goal.id`

### Triggers
- trg_log_ai_user_has_goal *after input*
- trg_log_ad_user_has_goal *after delete*

---
## workout_has_type 
### Properties
| Field      | Type     | Description                     |
| ---------- | -------- | ------------------------------- |
| workout_id | int (FK) | Workout ID (FK to `workout.id`) |
| type_id    | int (FK) | Type ID (FK to `type.id`)       |

### Relationships
- `workout_has_type.workout_id` → FK to `workout.id`
- `workout_has_type.type_id` → FK to `type.id`

### Triggers
* trg_log_ai_workout_has_type *after input*
- trg_log_ad_workout_has_type *after delete*

---
## workout_has_modality
### Properties
| Field       | Type     | Description                       |
| ----------- | -------- | --------------------------------- |
| workout_id  | int (FK) | Workout ID (FK to `workout.id`)   |
| modality_id | int (FK) | Modality ID (FK to `modality.id`) |

### Relationships
- `workout_has_modality.workout_id` → FK to `workout.id`
- `workout_has_modality.modality_id` → FK to `modality.id`

### Triggers
* trg_log_ai_workout_has_modality *after input*
- trg_log_ad_workout_has_modality *after delete*

---
## workout_has_goal
### Properties
| Field      | Type     | Description                     |
| ---------- | -------- | ------------------------------- |
| workout_id | int (FK) | Workout ID (FK to `workout.id`) |
| goal_id    | int (FK) | Goal ID (FK to `goal.id`)       |

### Relationships
- `workout_has_goal.workout_id` → FK to `workout.id`
- `workout_has_goal.goal_id` → FK to `goal.id`

### Triggers
- trg_log_ai_workout_has_goal *after input*
- trg_log_ad_workout_has_goal *after delete*

---
## workout_has_hashtag
### Properties
| Field      | Type     | Description                     |
| ---------- | -------- | ------------------------------- |
| workout_id | int (FK) | Workout ID (FK to `workout.id`) |
| hashtag_id | int (FK) | Hashtag ID (FK to `hashtag.id`) |

### Relationships
- `workout_has_hashtag.workout_id` → FK to `workout.id`
- `workout_has_hashtag.hashtag_id` → FK to `hashtag.id`

### Triggers
- trg_log_ai_workout_has_hashtag *after input*
- trg_log_ad_workout_has_hashtag *after delete*

---
## workout_has_user
### Properties
| Field      | Type     | Description                     |
| ---------- | -------- | ------------------------------- |
| workout_id | int (FK) | Workout ID (FK to `workout.id`) |
| user_id    | int (FK) | User ID (FK to `user.id`)       |

### Relationships
- `workout_has_user.workout_id` → FK to `workout.id`
- `workout_has_user.user_id` → FK to `user.id`

### Triggers
- trg_log_ai_workout_has_user *after input*
- trg_log_ad_workout_has_user *after delete*

---
## workout_has_routine
### Properties
| Field      | Type     | Description                     |
| ---------- | -------- | ------------------------------- |
| workout_id | int (FK) | Workout ID (FK to `workout.id`) |
| routine_id | int (FK) | Routine ID (FK to `routine.id`) |

### Relationships
- `workout_has_routine.workout_id` → FK to `workout.id`
- `workout_has_routine.routine_id` → FK to `routine.id`

### Triggers
- trg_log_ai_workout_has_routine *after input*
- trg_log_ad_workout_has_routine *after delete*

---
## workout_has_exercise
### Properties
| Field       | Type     | Description                       |
| ----------- | -------- | --------------------------------- |
| workout_id  | int (FK) | Workout ID (FK to `workout.id`)   |
| exercise_id | int (FK) | Exercise ID (FK to `exercise.id`) |

### Relationships
- `workout_has_exercise.workout_id` → FK to `workout.id`
- `workout_has_exercise.exercise_id` → FK to `exercise.id`

### Triggers
- trg_log_ai_workout_has_exercise *after input*
- trg_log_ad_workout_has_exercise *after delete*

---
## routine_has_type
### Properties
| Field      | Type     | Description                     |
| ---------- | -------- | ------------------------------- |
| routine_id | int (FK) | Routine ID (FK to `routine.id`) |
| type_id    | int (FK) | Type ID (FK to `type.id`)       |

### Relationships
- `routine_has_type.routine_id` → FK to `routine.id`
- `routine_has_type.type_id` → FK to `type.id`

### Triggers
- trg_log_ai_routine_has_type *after input*
- trg_log_ad_routine_has_type *after delete*

---
## routine_has_modality
### Properties
| Field       | Type     | Description                       |
| ----------- | -------- | --------------------------------- |
| routine_id  | int (FK) | Routine ID (FK to `routine.id`)   |
| modality_id | int (FK) | Modality ID (FK to `modality.id`) |

### Relationships
- `routine_has_modality.routine_id` → FK to `routine.id`
- `routine_has_modality.modality_id` → FK to `modality.id`

### Triggers
- trg_log_ai_routine_has_type *after input*
- trg_log_ad_routine_has_type *after delete*

---
## routine_has_goal
### Properties
| Field      | Type     | Description                     |
| ---------- | -------- | ------------------------------- |
| routine_id | int (FK) | Routine ID (FK to `routine.id`) |
| goal_id    | int (FK) | Goal ID (FK to `goal.id`)       |

### Relationships
- `routine_has_goal.routine_id` → FK to `routine.id`
- `routine_has_goal.goal_id` → FK to `goal.id`

### Triggers
- trg_log_ai_routine_has_goal *after input*
- trg_log_ad_routine_has_goal *after delete*

---
## routine_has_exercise
### Properties
| Field       | Type     | Description                       |
| ----------- | -------- | --------------------------------- |
| routine_id  | int (FK) | Routine ID (FK to `routine.id`)   |
| exercise_id | int (FK) | Exercise ID (FK to `exercise.id`) |
| order       | int      | Order of exercise in the routine  |
| sets        | int      | Number of sets                    |
| reps        | int      | Number of repetitions             |
| rest_time   | time     | Rest time                         |
| note        | string   | Notes                             |
| day         | int      | Day (for multi-day routines)      |
| week        | int      | Week (for multi-week routines)    |
| is_optional | bool     | Optional exercise (true/false)    |

### Relationships
- `routine_has_exercise.routine_id` → FK to `routine.id`
- `routine_has_exercise.exercise_id` → FK to `exercise.id`

### Triggers
- trg_log_ai_routine_has_exercise *after input*
- trg_log_au_routine_has_exercise *after update*
- trg_log_ad_routine_has_exercise *after delete*

---
## routine_has_hashtag
### Properties
| Field      | Type     | Description                     |
| ---------- | -------- | ------------------------------- |
| routine_id | int (FK) | Routine ID (FK to `routine.id`) |
| hashtag_id | int (FK) | Hashtag ID (FK to `hashtag.id`) |

### Relationships
- `routine_has_hashtag.routine_id` → FK to `routine.id`
- `routine_has_hashtag.hashtag_id` → FK to `hashtag.id`

### Triggers
- trg_log_ai_routine_has_hashtag *after input*
- trg_log_ad_routine_has_hashtag *after delete*

---
## exercise_has_type
### Properties
| Field       | Type     | Description                       |
| ----------- | -------- | --------------------------------- |
| exercise_id | int (FK) | Exercise ID (FK to `exercise.id`) |
| type_id     | int (FK) | Type ID (FK to `type.id`)         |

### Relationships
- `exercise_has_type.exercise_id` → FK to `exercise.id`
- `exercise_has_type.type_id` → FK to `type.id`

### Triggers
- trg_log_ai_exercise_has_type *after input*
- trg_log_ad_exercise_has_type *after delete*

---
## exercise_has_modality
### Properties
| Field       | Type     | Description                       |
| ----------- | -------- | --------------------------------- |
| exercise_id | int (FK) | Exercise ID (FK to `exercise.id`) |
| modality_id | int (FK) | Modality ID (FK to `modality.id`) |

### Relationships
- `exercise_has_modality.exercise_id` → FK to `exercise.id`
- `exercise_has_modality.modality_id` → FK to `modality.id`

### Triggers
- trg_log_ai_exercise_has_modality *after input*
- trg_log_ad_exercise_has_modality *after delete*

---
## exercise_has_goal
### Properties
| Field       | Type     | Description                       |
| ----------- | -------- | --------------------------------- |
| exercise_id | int (FK) | Exercise ID (FK to `exercise.id`) |
| goal_id     | int (FK) | Goal ID (FK to `goal.id`)         |

### Relationships
- `exercise_has_goal.exercise_id` → FK to `exercise.id`
- `exercise_has_goal.goal_id` → FK to `goal.id`

### Triggers
- trg_log_ai_exercise_has_goal *after input*
- trg_log_ad_exercise_has_goal *after delete*

---
## exercise_has_hashtag
### Properties
| Field       | Type     | Description                       |
| ----------- | -------- | --------------------------------- |
| exercise_id | int (FK) | Exercise ID (FK to `exercise.id`) |
| hashtag_id  | int (FK) | Hashtag ID (FK to `hashtag.id`)   |

### Relationships
- `exercise_has_hashtag.exercise_id` → FK to `exercise.id`
- `exercise_has_hashtag.hashtag_id` → FK to `hashtag.id`

### Triggers
- trg_log_ai_exercise_has_hashtag *after input*
- trg_log_ad_exercise_has_hashtag *after delete*

---
## exercise_has_variation
### Properties
| Field        | Type     | Description                                 |
| ------------ | -------- | ------------------------------------------- |
| exercise_id  | int (FK) | Exercise ID (FK to `exercise.id`)           |
| variation_id | int (FK) | Variation Exercise ID (FK to `exercise.id`) |

### Relationships
- `exercise_has_variation.exercise_id` → FK to `exercise.id`
- `exercise_has_variation.variation_id` → FK to `exercise.id` (the "variation" exercise)

### Triggers
- trg_log_ai_exercise_has_variation *after input*
- trg_log_ad_exercise_has_variation *after delete*
