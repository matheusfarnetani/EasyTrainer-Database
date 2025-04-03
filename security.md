# Security
## User Roles and Database Access
The EasyTrainer system defines three distinct user roles to ensure proper access control, security, and separation of responsibilities within the database:

### `easytrainer_admin`
- **Role**: System administrator
- **Permissions**: Full access to all tables and operations (`ALL PRIVILEGES`) within the main database.
  Additionally has `SELECT` access to the `easytrainer_log` database for monitoring logs and revisions.
- **Usage**: Responsible for managing users, instructors, and maintaining the entire system.
- **Access to logs**: read-only access to `easytrainer_log`.

### `easytrainer_instructor`
- **Role**: Certified instructor or personal trainer
- **Permissions**: Limited to `SELECT`, `INSERT`, and `UPDATE` statements on the main database.
- **Usage**: Can create and manage workouts, routines, and exercises. Can also manage clients (users) under their guidance.
- **Restrictions**: Cannot drop tables or alter structure; no access to the log database.

### `easytrainer_user`
- **Role**: Regular user or app client
- **Permissions**: Read-only access (`SELECT`) to most tables, with controlled `UPDATE` permission on their own personal data (e.g., profile information).
- **Usage**: Can view and follow assigned workouts and routines. Can update basic personal details if authorized.
- **Restrictions**: Cannot view or modify others' data. No write access to exercises or routines. No access to logs.