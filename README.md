# EasyTrainer Database Documentation (MySQL)
This repository documents the structured MySQL database for the **EasyTrainer** platform — a system for managing fitness training, users, instructors, routines, and personalized programs.
**Key features:**
- Modular schema with normalized main and relationship tables
- Full logging/audit system for traceability and revision history
- Predefined views for reporting and dashboards
- Role-based access with four distinct user types (`admin`, `instructor`, `user`, `system`)
- Designed for data integrity and extensibility in both educational and production settings

## Documentation Structure
- [Main Tables](./docs/main_table.md)
- [Relationship Tables](./docs/relationship_tables.md)
- [Views](./docs/views.md)
- [Logs](./docs/logs.md)
- [Security & User Roles](./docs/security.md)
- [Populate / Example Data](./docs/populate.md)
    
---
## Database Overview
### Entity & Category Tables
Below are the core categorization tables used for tagging and filtering workouts, routines, and exercises:

```mermaid
erDiagram
    GOAL      ||--o{  WORKOUT    : categorized_by
    LEVEL     ||--o{  WORKOUT    : for
    TYPE      ||--o{  WORKOUT    : has_type
    MODALITY  ||--o{  WORKOUT    : has_modality
    HASHTAG   ||--o{  WORKOUT    : tagged_with
    GOAL      {
        string name
        string description
    }
    LEVEL     {
        string name
        string description
    }
    TYPE      {
        string name
        string description
    }
    MODALITY  {
        string name
        string description
    }
    HASHTAG   {
        string hashtag
    }
```

---
### Logging & Audit Tables
All main tables are paired with logging tables for full auditability:

```mermaid
erDiagram
    USER          ||--o{ LOG_USER_MAIN    : logs
    LOG_USER_MAIN ||--o{ LOG_USER_CONTENT : contains
    USER {
        int id PK
        string name
    }
    LOG_USER_MAIN {
        int id PK
        int user_id FK
        datetime change_date
    }
    LOG_USER_CONTENT {
        int id PK
        int log_main_id FK
        string changed_field
        string old_value
        string new_value
    }
```

---
### Human Entities
Your database includes both "user" and "instructor" as human actors:

```mermaid
erDiagram
    USER        ||--o{ USER_HAS_INSTRUCTOR : follows
    INSTRUCTOR  ||--o{ USER_HAS_INSTRUCTOR : has
    USER {
        int id PK
        string name
    }
    INSTRUCTOR {
        int id PK
        string name
    }
    USER_HAS_INSTRUCTOR {
        int user_id FK
        int instructor_id FK
    }
```

---
### Workout, Routine, Exercise Relationships
These structures allow for deep customization and granularity:

```mermaid
erDiagram
    WORKOUT  ||--o{ WORKOUT_HAS_ROUTINE  : contains
    ROUTINE  ||--o{ ROUTINE_HAS_EXERCISE : includes
    WORKOUT  {
        int id PK
        string name
    }
    ROUTINE  {
        int id PK
        string name
    }
    EXERCISE {
        int id PK
        string name
    }
    WORKOUT_HAS_ROUTINE {
        int workout_id FK
        int routine_id FK
    }
    ROUTINE_HAS_EXERCISE {
        int routine_id FK
        int exercise_id FK
        int order
        int sets
        int reps
    }
```

---
## Security Model
- **Four roles:**  
    `easytrainer_admin`, `easytrainer_instructor`, `easytrainer_user`, `easytrainer_system`
- [See detailed security & grants table here](./docs/security.md)

---
## Related Repositories
- [Backend (C#)](https://github.com/matheusfarnetani/EasyTrainer-Backend)
- [Python Microservice](https://github.com/matheusfarnetani/EasyTrainer-Holistic-Processor)
- [Frontend (Flutter)](https://github.com/matheusfarnetani/EasyTrainer)
