# Task 4: Access rights audit and deduplication
# The list of roles passed in the authorization request (contains duplicates)
requested_roles = ["guest", "developer", "guest", "admin", "developer", "guest"]
# A set of mandatory roles for performing administrative functions
required_admin_roles = {"admin", "security_officer", "audit_manager"}

# 1. Convert the requested roles list to a set for instant duplicate removal
unique_requested = set(requested_roles)
print(f"Уникальные запрошенные роли: {unique_requested}")
# 2. Determine roles present in both sets (set intersection)
result_of_the_intersection = required_admin_roles & unique_requested
print(f"Общие административные роли: {result_of_the_intersection}")
# 3. Calculate missing administrative roles (set difference)
set_difference = required_admin_roles - unique_requested
print(f"Недостающие административные роли: {set_difference}")
# 4. Check for the security_officer role using the high-performance 'in' operator
has_security_officer = "security_officer" in unique_requested
print(f"Наличие роли security_officer в запросе: {has_security_officer}")