import os
import json

def remove_id_field_from_json(folder_path):
    for file_name in os.listdir(folder_path):
        if file_name.endswith(".json"):
            file_path = os.path.join(folder_path, file_name)

            with open(file_path, "r", encoding="utf-8") as f:
                try:
                    data = json.load(f)
                except json.JSONDecodeError as e:
                    print(f"[ERROR] Failed to read {file_name}: {e}")
                    continue

            if isinstance(data, dict):
                data.pop("id", None)
            elif isinstance(data, list):
                for item in data:
                    if isinstance(item, dict):
                        item.pop("id", None)

            with open(file_path, "w", encoding="utf-8") as f:
                json.dump(data, f, indent=2)

            print(f"[OK] Updated: {file_name}")

# Use "." se quiser aplicar na pasta atual onde estão os .json
remove_id_field_from_json("./")
