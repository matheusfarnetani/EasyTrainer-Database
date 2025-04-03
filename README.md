# Database Documentation (MySQL)

This repository contains the structured documentation and implementation of a database designed for the **EasyTrainer** system — a platform for managing fitness training programs, users, instructors, and personalized workout routines.

The database is built with **MySQL** and is focused on **data integrity**, **traceability**, and **role-based access control**, making it suitable for both educational and production use cases in health and fitness applications.

It includes:
- Modular design with normalized **main** and **relationship tables**
- A **logging system** that ensures all changes are auditable with revision history
- Predefined **views** for optimized querying and dashboard integration
- A **user access model** with three distinct roles (`admin`, `instructor`, `user`), each with scoped permissions and clear responsibilities

## Documentation Files

- [Main Tables](./main_tables.md)  
- [Relationship Tables](./relationship_tables.md)  
- [Views](./views.md)  
- [Logs](./logs.md)  
- [Security](./security.md)  
