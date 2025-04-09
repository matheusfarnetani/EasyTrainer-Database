# Main Tables
## user
### Properties
- name *string*  
- email *string*  
- mobile_number *string*  
- birthday *date*  
- weight *float*  
- height *float*  
- gender *char*  
- password *string*
- level_id *int*
- instructor_id *int*

### Relationships
- user (n) -> goal (n)
- user (1) -> level (n)
- user (1) -> instructor (n)
- user (n) -> workout (n)

### Triggers
- trg_log_ai_user *after input*
- trg_log_au_user *after updated*
- trg_log_ad_user *after delete*

---
## instructor
### Properties
- name *string*  
- email  *string*  
- mobile_number *string*  
- birthday *date*  
- gender *char*  
- password *string*

### Relationships
- instructor (n) -> user (1)
- instructor (n) -> workout (1)
- instructor (n) -> routine (1)
- instructor (n) -> exercise (1)

### Triggers
- trg_log_ai_instructor *after input*
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
- trg_log_ai_goal *after input*
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
- trg_log_ai_level *after input*
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
- trg_log_ai_type *after input*
- trg_log_au_type *after updated*
- trg_log_ad_type *after delete*

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
- hashtag (n) -> workout (n)
- hashtag (n) -> routine (n)
- hashtag (n) -> exercises (n)

### Triggers
- trg_log_ai_hashtag *after input*
- trg_log_au_hashtag *after updated*
- trg_log_ad_hashtag *after delete*

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
