# Database Population Script
This script is responsible for populating the EasyTrainer MySQL database using multiple `.json` files.

Each `.json` file must have the same name as the corresponding table to be populated.

---
## Requirements
- Python 3.8+
- A virtual environment (`venv`) recommended
- `mysql-connector-python` installed

---
## Step-by-Step Instructions
### 1. Clone the Repository

```
git clone https://github.com/matheusfarnetani/EasyTrainer-Database/.git
cd "EasyTrainer Database"
```

---
### 2. Create and Activate a Virtual Environment

```
python -m venv venv
source venv/bin/activate
```

---
### 3. Install Required Dependencies

```
pip install -r requirements.txt
```

---
### 4. Configure the Database Connection
Edit the `DB_CONFIG` dictionary inside `populate.py` to match your MySQL settings:

```
DB_CONFIG = {
    "host": "localhost",
    "user": "easytrainer_admin",
    "password": "yourPasswordHere",
    "database": "easytrainer",
    "auth_plugin": "mysql_native_password",
}
```

---
### 5. Place Your JSON Files
Make sure all the `.json` files are located in the **same folder** as the `populate.py` script, with names matching the corresponding database tables.

Example:

```
EasyTrainer Database/populate/
├── goal.json
├── level.json
├── type.json
├── modality.json
├── instructor.json
├── user.json
├── exercise.json
├── routine.json
├── workout.json
├── ...
├── populate.py
└── requirements.txt
```

---
### 6. Run the Script

```
python populate.py
```

---
## Important Notes
- The script will automatically set `@user_id = -1` at the beginning of the connection.
- It processes the insertion **in a specific order** to respect foreign key constraints.
- If any error occurs during insertion, the script will rollback that transaction and continue to the next file.
- Make sure your `.json` files are valid and correctly formatted!