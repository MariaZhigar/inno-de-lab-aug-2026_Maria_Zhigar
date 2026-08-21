# Task 6: The "Guess the Number" game

print('================== КАЛЬКУЛЯТОР ==================')
print('Для выхода из калькулятора введите "Выход"')
# Dictionary of operators
operators = {
    "+": 1,
    "-": 2,
    "*": 3,
    "/": 4
}
# Main loop
while True:
    num_1 = input("\nВведите первое число: ")
    if num_1.lower() == "выход":        # Exit check
        print("Завершение работы...")
        break
    num_2 = input("Введите второе число: ")
    if num_2.lower() == "выход":        # Exit check
        print("Завершение работы...")
        break
    operator = input("Выберете оператор (+, -, *, /): ")
    if operator.lower() == "выход":     # Exit check
        print("Завершение работы...")
        break

    # Operator validation
    if operator not in operators:
        print("Ошибка: неизвестный оператор! Используйте +, -, *, /")
        continue
    # Convert to float
    num_1 = float(num_1)
    num_2 = float(num_2)
    # Division by zero check
    if operator == "/" and num_2 == 0:
        print("На ноль делить нельзя! Попробуй еще раз!")
        continue
    # Get operation code
    value = operators[operator]
    # Perform calculation (I did it as a switch in С)
    match value:
        case 1:
            print(f"{num_1} + {num_2} = {num_1 + num_2}")
        case 2:
            print(f"{num_1} - {num_2} = {num_1 - num_2}")
        case 3:
            print(f"{num_1} * {num_2} = {num_1 * num_2}")
        case 4:
            print(f"{num_1} / {num_2} = {num_1 / num_2}")


