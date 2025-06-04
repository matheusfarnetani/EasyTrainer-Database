# Security
## User Roles and Database Access
The EasyTrainer system defines **four distinct database user roles** to ensure robust access control, security, and proper separation of responsibilities:

---
### `easytrainer_admin`
- **Role:** System Administrator
- **Permissions:**
    - Full access (`ALL PRIVILEGES`) to all tables and operations in the main `easytrainer` database.
    - Read-only (`SELECT`) access to the `easytrainer_log` database for monitoring logs and revisions.
- **Usage:**
    - Manages users, instructors, and the entire system.
    - Can perform any action, including structure changes (CREATE/DROP/ALTER).
    - Can view system logs and history.
- **Access to Logs:** Read-only.

---
### `easytrainer_instructor`
- **Role:** Certified Instructor or Personal Trainer
- **Permissions:**
    - `SELECT`, `INSERT`, `UPDATE`, and `DELETE` access on the main `easytrainer` database.
    - **Cannot** alter the database schema or access logs.
- **Usage:**
    - Manages workouts, routines, exercises, and their relationships.
    - Manages assigned clients (users).
    - Can insert or update data but cannot modify database structure.
- **Restrictions:**
    - No access to the log database (`easytrainer_log`).
    - No permissions for DDL (CREATE/DROP/ALTER).

---
### `easytrainer_user`
- **Role:** End User / App Client
- **Permissions:**
    - `SELECT` access to all tables in the main `easytrainer` database.
    - Controlled `UPDATE` and `DELETE` on their own personal data (`user`), and on specific join tables relevant to their account (`user_has_goal`, `user_has_instructor`, `workout_has_user`).
    - `SELECT`, `INSERT`, `UPDATE` on their own video uploads (`user_videos` table).
- **Usage:**
    - Can view workouts, routines, and exercises.
    - Can update/delete their own profile, goals, instructors, and associations.
    - Can upload and update videos for analysis.
- **Restrictions:**
    - Cannot modify data of other users.
    - No write access to exercises or routines.
    - No access to logs.
    - No DDL permissions.

---
### `easytrainer_system` 
- **Role:** System Process User (used by backend services, workers, and automated integrations)
- **Permissions:**
    - `SELECT` and `UPDATE` access on all tables in the main `easytrainer` database.
- **Usage:**
    - Used by backend jobs, microservices, or background workers (e.g., video processing pipeline, automated status updates).
    - Suitable for tasks requiring controlled modification of data but no schema changes or log access.
- **Restrictions:**
    - Cannot create, drop, or alter tables.
    - No insert or delete permissions.
    - No access to logs.
    - No DDL permissions.