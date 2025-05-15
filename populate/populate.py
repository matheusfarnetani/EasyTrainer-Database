import os
import json
import mysql.connector
from dotenv import load_dotenv

load_dotenv()

DB_CONFIG = {
    "host": os.getenv("DB_HOST"),
    "port": int(os.getenv("DB_PORT", 3306)),
    "user": os.getenv("DB_USER"),
    "password": os.getenv("DB_PASSWORD"),
    "database": os.getenv("DB_NAME"),
    "auth_plugin": os.getenv("DB_AUTH_PLUGIN", "mysql_native_password")
}

INSERT_ORDER = [
    "goal.json",
    "level.json",
    "type.json",
    "modality.json",
    "hashtag.json",
    "instructor.json",
    "user.json",
    "user_has_instructor.json",
    "exercise.json",
    "routine.json",
    "workout.json",
    "user_has_goal.json",
    "exercise_has_goal.json",
    "exercise_has_type.json",
    "exercise_has_modality.json",
    "exercise_has_hashtag.json",
    "routine_has_goal.json",
    "routine_has_type.json",
    "routine_has_modality.json",
    "routine_has_hashtag.json",
    "routine_has_exercise.json",
    "workout_has_goal.json",
    "workout_has_type.json",
    "workout_has_modality.json",
    "workout_has_hashtag.json",
    "workout_has_user.json",
    "workout_has_routine.json",
    "workout_has_exercise.json"
]

def main():
    conn = connect_to_db()
    cursor = conn.cursor()
    base_path = os.path.dirname(os.path.abspath(__file__))

    cursor.execute("SET @user_id = -1;")

    for file_name in INSERT_ORDER:
        table_name = file_name.replace(".json", "")
        file_path = os.path.join(base_path, file_name)

        if not os.path.exists(file_path):
            print(f"File not found: {file_name}")
            continue

        print(f"Inserting data into: {table_name}")
        try:
            data = load_json(file_path)
            insert_data(cursor, table_name, data)
            conn.commit()
            print(f"Success: {len(data)} records inserted into '{table_name}'")
        except Exception as e:
            print(f"Error inserting into {table_name}: {e}")
            conn.rollback()

    cursor.close()
    conn.close()
    print("Done!")

def connect_to_db():
    return mysql.connector.connect(**DB_CONFIG)

def load_json(file_path):
    with open(file_path, "r", encoding="utf-8") as f:
        return json.load(f)

def insert_data(cursor, table_name, data):
    if not data:
        return

    if isinstance(data, dict):
        data = [data]

    columns = data[0].keys()
    placeholders = ", ".join(["%s"] * len(columns))
    query = f"INSERT INTO {table_name} ({', '.join(f'`{col}`' for col in columns)}) VALUES ({placeholders})"

    values = [tuple(item[col] for col in columns) for item in data]

    cursor.executemany(query, values)

if __name__ == "__main__":
    main()
