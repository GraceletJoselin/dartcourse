void main(List<String> args) {
  try {
    addPerson(age: 36);
    addPerson(age: -36);
    addPerson(age: 136);
  } catch (error, stackTrace) {
    print(error);
    print(stackTrace);
  } finally {
    print("finally is executed");
  }
}

void addPerson({int age = 0}) {
  try {
    print(Person(age: age).age);
  } on InvalidAgeException {
    rethrow;
  }
}

class InvalidAgeException implements Exception {
  final int age;
  final String message;

  InvalidAgeException(this.age, this.message);

  @override
  String toString() => 'InvalidAgeException, $message, $age';
}

class Person {
  final int age;

  Person({
    required this.age,
  }) {
    if (age < 0) {
      throw InvalidAgeException(
        age,
        'Age cant be -ve',
      );
    } else if (age > 140) {
      throw InvalidAgeException(
        age,
        'Age cant be > 140',
      );
    }
  }
}
