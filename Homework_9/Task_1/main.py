# Trainee Performance Tracking Module (Trainee LMS)

class Trainee:
    def __init__(self, name: str, surname: str, score: int = 0, passing_grade: int = 10) -> None:
        """
            Initialization of an intern.

            Args:
                name: The intern’s first name.
                surname: The intern’s last name.
                score: Initial score (default is 0).
                passing_grade: Passing score (default is 10).
            """
        self.name = name
        self.surname = surname
        self.__score = score
        self.passing_grade = passing_grade

    @property
    def score(self) -> int:
        # Getter for the private attribute __score.
        return self.__score

    @score.setter
    def score(self, value: int) -> None:
        """
            Setter for __score with validation.

            Args:
                value: New score value.

            Raises:
                ValueError: If the type is not int or the value is negative.
        """
        # The isinstance() function returns True if the object being checked is an instance.
        if not isinstance(value, int):
            raise ValueError(f"Expected value of type int, got {type(value)}")
        if value < 0:
            raise ValueError("The score shouldn't be less than 0!")
        self.__score = value

    def do_homework(self) -> None:
            # Increases score by 1
            self.score += 1

    def miss_homework(self) -> None:
            # Decreases score by 1
            self.score -= 1

    def visit_lecture(self) -> None:
            # Increases score by 1
            self.score += 1

    def miss_lecture(self) -> None:
            # Decreases score by 1
            self.score -= 1

    def is_passing(self) -> bool:
        """
        Checks whether the intern meets the passing score.

        Returns:
            True if the current score >= passing_grade, otherwise False.
        """
        return self.score >= self.passing_grade

    def __repr__(self) -> str:
        return f"{self.__class__.__name__}(name={self.name!r}, surname={self.surname!r}, score={self.score}, passing_grade={self.passing_grade})"

class HardworkingTrainee(Trainee):
    """
    A hardworking trainee is a descendant of Trainee..
    Receives more points for completing homework..
    """

    def do_homework(self) -> None:
        """Increases score by 2"""
        self.score += 2

class AuditTrainee(Trainee):
    """
    Audit trainee is a descendant of Trainee..
    Attends lectures for their own benefit; there is no passing score..
    """

    def is_passing(self) -> bool:
        """
        Audit trainees are always considered to have successfully completed the course..

        Returns:
            Always True..
        """
        return True

class Cohort:
    #A training group for managing the flow of trainees.

    def __init__(self, title: str, trainees: List[Trainee] = None) -> None:
        """
        Initializes a training group.

        Args:
            title: The name of the group.
            trainees: A list of trainees (empty by default).
        """
        self.title: str = title
        self.trainees: List[Trainee] = trainees if trainees is not None else []

    def add_trainee(self, trainee: Trainee) -> None:
        """Adds a trainee to the group."""
        self.trainees.append(trainee)

    def conduct_lecture(self) -> None:
        """
        Simulates conducting a lecture.
        Calls visit_lecture() for each student (polymorphism).
        """
        for trainee in self.trainees:
            trainee.visit_lecture()

    def get_passing_students(self) -> List[Trainee]:
        """
        Returns a list of students who are passing the course.

        Returns:
            A list of Trainee objects for which is_passing() == True.
        return [trainee for trainee in self.trainees if trainee.is_passing()]
        """
        return [trainee for trainee in self.trainees if trainee.is_passing()]

print("======= ПРОВЕРКА УСПЕВАЕМОСТИ СТАЖЕРА =======")
# 1. Creating an intern with an initial score of 9 and a passing score of 10
trainee = Trainee(name="Иван", surname="Иванов", score=9, passing_grade=10)
# 2. Completing homework and checking the status
trainee.do_homework()
print(f"Баллы: {trainee.score}, Прошел курс: {trainee.is_passing()}")
# 3. Skipping a lecture and checking the status
trainee.miss_lecture()
print(f"Баллы: {trainee.score}, Прошел курс: {trainee.is_passing()}")
# 4. Validation check (attempt to set an incorrect type or a negative value)
try:
    trainee.score = -5
except ValueError as e:
    print(f"Ошибка: {e}")
