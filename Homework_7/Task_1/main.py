# Task 1: User record normalization and assembly
# Raw unprocessed string
raw_user_record = " 10827 ; aLeXanDer_vLaDimiRov ; mInSk ; ACTIVE "
# 1. Split the string into individual elements using ';' as a delimiter
user_elements = raw_user_record.split(';')
# 2. Clean each element from leading and trailing whitespace
user_id = user_elements[0].strip()
user_name = user_elements[1].strip()
city = user_elements[2].strip()
status = user_elements[3].strip()
# 3. Apply UID- prefix to the identifier using an f-string
formatted_id = f"UID-{user_id}"
# 4. Transform the name: replace '_' with a space and convert to proper case
formatted_name = user_name.replace("_", " ").title()
# 5. Convert the city name to upper case
formatted_city = city.upper()
# 6. Convert the user status to lower case
formatted_status = status.lower()
# 7. Join the processed elements into a single string with '|' delimiter
result_line = " | ".join([formatted_id, formatted_name, formatted_city, formatted_status])
print(f"Нормализованная запись: {result_line}")