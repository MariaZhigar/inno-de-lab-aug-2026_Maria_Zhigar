# TASK 2. Analytics Performance Monitoring
import time
from typing import Any, Callable
# CONSTANTS
# A prefix for performance logs to make them easy to find in the output.
PERFORMANCE_LOG_PREFIX = "[PERF_LOG]"
# The number of decimal places when rounding the execution time.
TIME_DECIMALS = 8
# The decorator function
def performance_logger(func: Callable) -> Callable:
    """
    A decorator for measuring the execution time of a function.

    Args:
        func (Callable): The target function whose execution time
            needs to be measured.

    Returns:
        Callable: The wrapped function that outputs the execution time
            before returning the result.
    """
    def wrapper(*args: Any, **kwargs: Any) -> Any:
        start_time = time.perf_counter()
        # Calls the original function with the passed arguments and stores the result.
        result = func(*args, **kwargs)
        # Calls the original function with the passed arguments and stores the result.
        execution_time = time.perf_counter() - start_time
        execution_time_rounded = round(execution_time, TIME_DECIMALS)
        print(
            f"{PERFORMANCE_LOG_PREFIX} Функция '{func.__name__}' "
            f"выполнена за {execution_time_rounded} сек."
        )
        return result
    return wrapper
@performance_logger
def get_sorted_report(
    data: list[dict[str, str | float]]
) -> list[dict[str, str | float]]:
    """
    Returns a report sorted by revenue in descending order by genre.

    Args:
        data (list[dict[str, str | float]]): A list of dictionaries with keys
            'category' (str) and 'total_sales' (float).

        Returns:
            list[dict[str, str | float]]: A new list sorted by
                the 'total_sales' key in descending order.
    """
    return sorted(data, key=lambda item: item["total_sales"], reverse=True)

print("=============== ТЕСТИРОВАНИЕ ПРОИЗВОДИТЕЛЬНОСТИ ===============")
test_data_1 = [
    {"category": "Action", "total_sales": 4311.85},
    {"category": "Animation", "total_sales": 4656.30},
    {"category": "Children", "total_sales": 3655.55},
]
test_data_2 = [
    {"category": "Classics", "total_sales": 1200.10},
    {"category": "Comedy", "total_sales": 4000.00},
    {"category": "Documentary", "total_sales": 4000.00},
]
test_data_3 = [
    {"category": "Drama", "total_sales": 500.00},
]

datasets = [test_data_1, test_data_2, test_data_3]

for idx, dataset in enumerate(datasets, 1):
        print(f"\n--- ТЕСТ {idx} ---")
        sorted_report = get_sorted_report(dataset)

        print("Топ категорий по выручке:")
        for i, item in enumerate(sorted_report, 1):
            print(f"{i}. {item['category']}: {item['total_sales']}")
