# Task 3: Safe API configuration parsing

# Configuration dictionary obtained from the initialization service
db_config = {
"connection": {
    "host": "production-db.internal",
    "port": 5432,
    "user": "postgres"
    }
}

# 1. Extract host and port from the nested 'connection' dictionary
connection = db_config.get("connection", {})
host = connection.get("host")
port = connection.get("port")

# 2. Safely check for ssl_settings key and nested ssl_mode.
ssl_settings = connection.get("ssl_settings", {})
ssl_mode = ssl_settings.get("ssl_mode", "verify-full")

# 3. Change the user value to admin
connection["user"] = "admin"

# 4. Add a new parameter max_connections with value 100
connection["max_connections"] = 100

print("Connection parameters:")

for k, v in connection.items():
    print(f"*{k}:{v}")