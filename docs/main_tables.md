# Main Tables
## user
### Properties
| Field         | Type     | Description                           |
| ------------- | -------- | ------------------------------------- |
| id            | int (PK) | User ID                               |
| name          | string   | User's name                           |
| email         | string   | User's email                          |
| mobile_number | string   | User's mobile number                  |
| birthday      | date     | Birthday                              |
| weight        | float    | Weight                                |
| height        | float    | Height                                |
| gender        | char     | Gender (M/F/Other)                    |
| password      | string   | Hashed password                       |
| level_id      | int (FK) | Level ID (FK to `level.id`)           |
| instructor_id | int (FK) | Instructor ID (FK to `instructor.id`) |

### Relationships
- `user.level_id` → FK to `level.id`
- `user.instructor_id` → FK to `instructor.id`
- **Many-to-many:** user ↔ goal (user_has_goal)
- **Many-to-many:** user ↔ workout (workout_has_user)
- **Many-to-many:** user ↔ instructor (user_has_instructor)

### Triggers
- trg_log_ai_user *after input*
- trg_log_au_user *after updated*
- trg_log_ad_user *after delete*

---
## instructor
### Properties
| Field         | Type     | Description     |
| ------------- | -------- | --------------- |
| id            | int (PK) | Instructor ID   |
| name          | string   | Name            |
| email         | string   | Email           |
| mobile_number | string   | Mobile number   |
| birthday      | date     | Birthday        |
| gender        | char     | Gender          |
| password      | string   | Hashed password |

### Relationships
- **Many-to-many:** instructor ↔ user (user_has_instructor)
- **One-to-many:** instructor → workout (`workout.instructor_id`)
- **One-to-many:** instructor → routine (`routine.instructor_id)
- **One-to-many:** instructor → exercise (`exercise.instructor_id`)

### Triggers
- trg_log_ai_instructor *after input*
- trg_log_au_instructor *after updated*
- trg_log_ad_instructor *after delete*

---
## goal
### Properties
| Field       | Type     | Description |
| ----------- | -------- | ----------- |
| id          | int (PK) | Goal ID     |
| name        | string   | Name        |
| description | string   | Description |

### Relationships
- **Many-to-many:** goal ↔ user (user_has_goal)
- **Many-to-many:** goal ↔ workout (workout_has_goal)
- **Many-to-many:** goal ↔ routine (routine_has_goal)
- **Many-to-many:** goal ↔ exercise (exercise_has_goal)

### Triggers
- trg_log_ai_goal *after input*
- trg_log_au_goal *after updated*
- trg_log_ad_goal *after delete*

---
## level
### Properties
| Field       | Type     | Description |
| ----------- | -------- | ----------- |
| id          | int (PK) | Level ID    |
| name        | string   | Name        |
| description | string   | Description |

### Relationships
- **One-to-many:** level → user (`user.level_id`)
- **One-to-many:** level → workout (`workout.level_id`)
- **One-to-many:** level → routine (`routine.level_id`)
- **One-to-many:** level → exercise (`exercise.level_id`)

### Triggers
- trg_log_ai_level *after input*
- trg_log_au_level *after updated*
- trg_log_ad_level *after delete*

---
## type
### Properties
| Field       | Type     | Description |
| ----------- | -------- | ----------- |
| id          | int (PK) | Type ID     |
| name        | string   | Name        |
| description | string   | Description |

### Relationships
- **Many-to-many:** type ↔ workout (workout_has_type)
- **Many-to-many:** type ↔ routine (routine_has_type)
- **Many-to-many:** type ↔ exercise (exercise_has_type)

### Triggers
- trg_log_ai_type *after input*
- trg_log_au_type *after updated*
- trg_log_ad_type *after delete*

---
## modality
### Properties
| Field       | Type     | Description |
| ----------- | -------- | ----------- |
| id          | int (PK) | Modality ID |
| name        | string   | Name        |
| description | string   | Description |

### Relationships
- **Many-to-many:** modality ↔ workout (workout_has_modality)
- **Many-to-many:** modality ↔ routine (routine_has_modality)
- **Many-to-many:** modality ↔ exercise (exercise_has_modality)

### Triggers
- trg_log_ai_modality *after input*
- trg_log_au_modality *after updated*
- trg_log_ad_modality *after delete*

---
## hashtag
### Properties
| Field   | Type     | Description   |
| ------- | -------- | ------------- |
| id      | int (PK) | Hashtag ID    |
| hashtag | string   | Hashtag value |

### Relationships
- **Many-to-many:** hashtag ↔ workout (workout_has_hashtag)
- **Many-to-many:** hashtag ↔ routine (routine_has_hashtag)
- **Many-to-many:** hashtag ↔ exercise (exercise_has_hashtag)

### Triggers
- trg_log_ai_hashtag *after input*
- trg_log_au_hashtag *after updated*
- trg_log_ad_hashtag *after delete*

---
## workout 
### Properties
| Field          | Type     | Description                     |
| -------------- | -------- | ------------------------------- |
| id             | int (PK) | Workout ID                      |
| name           | string   | Name                            |
| description    | string   | Description                     |
| number_of_days | int      | Number of days                  |
| image_url      | string   | Image URL                       |
| duration       | time     | Duration                        |
| indoor         | bool     | Indoor (true/false)             |
| instructor_id  | int (FK) | Instructor ID (`instructor.id`) |
| level_id       | int (FK) | Level ID (`level.id`)           |

### Relationships
- `workout.instructor_id` → FK to `instructor.id`
- `workout.level_id` → FK to `level.id`
- **Many-to-many:** workout ↔ user (workout_has_user)
- **Many-to-many:** workout ↔ goal (workout_has_goal)
- **Many-to-many:** workout ↔ type (workout_has_type)
- **Many-to-many:** workout ↔ modality (workout_has_modality)
- **Many-to-many:** workout ↔ hashtag (workout_has_hashtag)
- **Many-to-many:** workout ↔ routine (workout_has_routine)
- **Many-to-many:** workout ↔ exercise (workout_has_exercise)

### Triggers
- trg_log_ai_workout *after input*
- trg_log_au_workout *after updated*
- trg_log_ad_workout *after delete*

---
## routine
### Properties
| Field         | Type     | Description                     |
| ------------- | -------- | ------------------------------- |
| id            | int (PK) | Routine ID                      |
| name          | string   | Name                            |
| description   | string   | Description                     |
| duration      | time     | Duration                        |
| image_url     | string   | Image URL                       |
| instructor_id | int (FK) | Instructor ID (`instructor.id`) |
| level_id      | int (FK) | Level ID (`level.id`)           |

### Relationships
- `routine.instructor_id` → FK to `instructor.id`
- `routine.level_id` → FK to `level.id`
- **Many-to-many:** routine ↔ goal (routine_has_goal)
- **Many-to-many:** routine ↔ type (routine_has_type)
- **Many-to-many:** routine ↔ modality (routine_has_modality)
- **Many-to-many:** routine ↔ hashtag (routine_has_hashtag)
- **Many-to-many:** routine ↔ workout (workout_has_routine)
- **Many-to-many:** routine ↔ exercise (routine_has_exercise)

### Triggers
- trg_log_ai_routine *after input*
- trg_log_au_routine *after updated*
- trg_log_ad_routine *after delete*

---
## exercise
### Properties
| Field                    | Type     | Description                     |
| ------------------------ | -------- | ------------------------------- |
| id                       | int (PK) | Exercise ID                     |
| name                     | string   | Name                            |
| description              | string   | Description                     |
| equipment                | string   | Equipment                       |
| duration                 | time     | Duration                        |
| repetition               | int      | Repetition count                |
| sets                     | int      | Number of sets                  |
| rest_time                | time     | Rest time                       |
| body_part                | string   | Main body part                  |
| video_url                | string   | Video URL                       |
| image_url                | string   | Image URL                       |
| steps                    | string   | Instructions                    |
| contraindications        | string   | Contraindications               |
| safety_tips              | string   | Safety tips                     |
| common_mistakes          | string   | Common mistakes                 |
| indicated_for            | string   | Indicated for                   |
| calories_burned_estimate | float    | Calories burned (estimated)     |
| instructor_id            | int (FK) | Instructor ID (`instructor.id`) |
| level_id                 | int (FK) | Level ID (`level.id`)           |

### Relationships
- `exercise.instructor_id` → FK to `instructor.id`
- `exercise.level_id` → FK to `level.id`
- **Many-to-many:** exercise ↔ goal (exercise_has_goal)
- **Many-to-many:** exercise ↔ type (exercise_has_type)
- **Many-to-many:** exercise ↔ modality (exercise_has_modality)
- **Many-to-many:** exercise ↔ hashtag (exercise_has_hashtag)
- **Many-to-many:** exercise ↔ workout (workout_has_exercise)
- **Many-to-many:** exercise ↔ routine (routine_has_exercise)
- **Many-to-many (self):** exercise ↔ exercise (exercise_has_variation)

### Triggers
- trg_log_ai_exercise *after input*
- trg_log_au_exercise *after updated*
- trg_log_ad_exercise *after delete*

---
## `user_videos`
### Properties

| Field         | Type     | Description                                           |
| ------------- | -------- | ----------------------------------------------------- |
| id            | int (PK) | Video ID                                              |
| user_id       | int (FK) | User ID (linked to `user`)                            |
| filename      | string   | Original file name                                    |
| file_url      | string   | File URL in Cloudinary                                |
| status        | int      | 0 = pending, 1 = processing, 2 = processed, 3 = error |
| uploaded_at   | datetime | Upload date                                           |
| processed_at  | datetime | Processing date                                       |
| error_message | string   | Error message, if any                                 |

### Relationships
- `user_videos.user_id` → FK to `user.id`

### Triggers
- trg_log_ai_user_videos *after input*
- trg_log_au_user_videos *after updated*
- trg_log_ad_user_videos *after delete*