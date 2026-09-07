# TASK 1. Calculating the cost of wholesale film rentals
# CONSTANTS
MAX_RENTAL_BATCH_LIMIT = 150.0

def calculate_rental_batch(
    quantity: int,
    rental_rate: float,
    discount: float = 0.0
) -> tuple[float, bool]:
    """
    This function calculates the cost of a batch of discs,
    taking into account the genre‑based discount.

    Args:
        quantity (int): The number of discs in the batch.
        rental_rate (float): The rental cost per disc.
        discount (float): The discount amount (a fraction from 0.0 to 1.0). Default: 0.0 (no discount).

    Returns:
        tuple[float, bool]: A tuple containing:
            final_sum (float): The final rental amount, rounded to 2 decimal places.
            is_over_limit (bool): True if the amount exceeds MAX_RENTAL_BATCH_LIMIT.
    """
    final_sum = quantity * rental_rate * (1 - discount)     # Calculation of the final amount
    final_sum = round(final_sum, 2)                         # Rounding
    is_over_limit = final_sum > MAX_RENTAL_BATCH_LIMIT
    return final_sum, is_over_limit

print("===================== ОТЧЕТ ПО ПАРТИЯМ АРЕНДЫ =====================")
# Positional arguments
sum1, over1 = calculate_rental_batch(30, 2.99)
print(f"Партия 1 (Academy Dinosaur): Сумма {sum1}$. Превышение лимита: {over1}")
# Named arguments
sum2, over2 = calculate_rental_batch(quantity=40, rental_rate=4.99, discount=0.10)
print(f"Партия 2 (Affair Prejudice): Сумма {sum2}$. Превышение лимита: {over2}")
# Positional arguments
sum3, over3 = calculate_rental_batch(10, 1.99)
print(f"Партия 3 (Agent Truman): Сумма {sum3}$. Превышение лимита: {over3}")
# Named arguments (different order of arguments)
sum4, over4 = calculate_rental_batch(discount=0.20, quantity=50, rental_rate=3.50)
print(f"Партия 4 (African Egg): Сумма {sum4}$. Превышение лимита: {over4}")
