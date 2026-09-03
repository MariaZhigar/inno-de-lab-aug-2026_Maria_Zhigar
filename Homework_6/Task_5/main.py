# Task 5: The "Guess the Number" game
# Importing the random module for generating random numbers
import random

print('================== Игра "УГАДАЙ ЧИСЛО" ==================')
start = 1   # Setting the range for the random number
end = 20
# Generating a random number between start and end
number = random.randint(start, end)
attempts = 5    # Number of attempts the player has
i = 1           # Current attempt counter

print(f"Я загадал число от 1 до 20. Угадай его. У тебя {attempts} попыток\n")
# Main game loop
while attempts > 0:
    # Getting the player's guess
    user_number = int(input(f"Попытка {i} Введите число: "))
    if user_number == number:   # Checking if the guess is correct
        print("Ты угадал! Отличная работа!")
        break
    else:   # If the guess is wrong
        attempts -= 1   # Decrease attempts by 1
        i = i + 1       # Increase attempt counter
        # Giving a hint
        if user_number > number:
            print(f"Слишком много. Осталось попыток {attempts}\n")
        else:
            print(f"Слишком мало. Осталось попыток {attempts}\n")
# This block executes if the loop ends naturally (no break, attempts == 0)
else:
    print(f"Ты не угадал! В следующий раз получится! Я загадал число {number}")

