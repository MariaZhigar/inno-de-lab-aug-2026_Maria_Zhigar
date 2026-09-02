# TASK 3. Secure refund processing
# CONSTANTS
from typing import Any, Tuple, Optional

DEFAULT_RETURN_INDEX_BASE = 10.0

def calculate_overdue_fine(
    movie_title: str,
    days_overdue: Any,
    fine_rate: float
) -> Optional[Tuple[float, float]]:
    """Calculates the late payment penalty and the technical index of the refund.

        Handles data type errors, inability to convert a string
        into a number and division by zero.

        Args:
            movie_title (str): The name of the movie (for logging).
            days_overdue (Any): The number of days overdue (raw data).
            fine_rate (float): The penalty rate for one day of delay.

        Returns:
            tuple[float, float] | None: A tuple (total_fine, return_index) if the calculation is successful, otherwise None.
        """
    try:
        numeric_days = float(days_overdue)  # Converts to number
        total_fine = numeric_days * fine_rate   # Calculates fine
        return_index = DEFAULT_RETURN_INDEX_BASE / numeric_days
        print(
            f"Фильм: '{movie_title}' | Итоговый штраф: {total_fine}$ | "
            f"Индекс: {return_index}"
        )
        return total_fine, return_index
    except TypeError as e:       # Catches type error
        print(f"[ОШИБКА ТИПА] Некорректный тип данных для {movie_title}: {e}" )
    except ValueError as e:      # Catches value error
        print(f"[ОШИБКА ЗНАЧЕНИЯ] Невозможно преобразовать дни в число для {movie_title}: {e}")
    except ZeroDivisionError as e:       # Catches division by zero
        print(f"[ОШИБКА ДЕЛЕНИЯ НА НОЛЬ] Возврат без просрочки для {movie_title}: {e}")
    finally:        # Always executes
        print("--- Проверка транзакции возврата завершена ---")
    return None     # Returns None on error

print("================================================== ПРОВЕРКА ВОЗВРАТОВ ==================================================")
print()
calculate_overdue_fine("Matrix", 5, 1.5)
print()
calculate_overdue_fine("Inception", "пять", 2.0)
print()
calculate_overdue_fine("Avatar", 0, 2.5)
print()
calculate_overdue_fine("Interstellar", [3], 3.0)
