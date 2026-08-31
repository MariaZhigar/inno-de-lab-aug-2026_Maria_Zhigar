# Task 2: Payment gateway transaction filtering
# List of transactions received from the payment gateway
raw_transactions = ["SUCCESS:100", "FAILED:50", "SUCCESS:-10", "SUCCESS:0", "SUCCESS:250", "ERROR:200"]
# Implementing filtering in a single line using List Comprehension

cleaned_transactions = [
    int(t.split(':')[1])               # Extract amount and cast to int
    for t in raw_transactions          # Iterate over each transaction
    if t.startswith('SUCCESS')         # Keep only SUCCESS status
    and int(t.split(':')[1]) > 0       # Exclude non-positive amounts
]
print(f"Очищенные транзакции: {cleaned_transactions}")