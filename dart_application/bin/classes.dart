void main(List<String> args) {
  const p1 = Personnamed(
    name: 'zack',
    age: 2,
  );
  print("named constructor");
  print(p1.name);
  print(p1.age);
  const p2 = Personpositional('zack', 2);
  print("positional constructor");
  print(p2.name);
  print(p2.age);
  const p3 = Personpositional.jose();
  print("named constructor with initializer list");
  print(p3.name);
  print(p3.age);
  const p4 = Personpositional.frank(36);
  print(p4.name);
  print(p4.age);
  const p5 = Personpositional.other();
  print(p5.name);
  print(p5.age);

  const p6 = Person(
    fn: 'Gavril',
    ln: 'Zackwin',
  );
  print(p6.fullName);

  final car = Car();
  try {
    car.drive(speed: 100);
    car.drive(speed: -1);
  } catch (e) {
    print(e);
  }
  //Constructor can only create instances of their class
  // Factory Constructor can create instances of their subclasses
  print(FacVehicle.car());
  print(FacVehicle.truck());
}

class FacVehicle {
  const FacVehicle();

  factory FacVehicle.car() => FacCar();
  factory FacVehicle.truck() => FacTruck();

  @override
  String toString() => 'Vehicle of type $runtimeType';
}

class FacCar extends FacVehicle {
  const FacCar();
}

class FacTruck extends FacVehicle {
  const FacTruck();
}

class Car {
  int _speed = 0;

  int get speed => _speed;
  set speed(int ns) {
    if (ns < 0) {
      throw Exception('Speed cannot be negative');
    } else {
      _speed = ns;
    }
  }

  void drive({
    required int speed,
  }) {
    this.speed = speed;
    print('Accelerating to $speed km/h');
  }

  void stop() {
    speed = 0;
    print('Stopping...');
    print('Stopped');
  }
}

//positional constructor
class Personpositional {
  final String name;
  final int age;
  const Personpositional(
    this.name,
    this.age,
  );
  //named constructor with initializer list
  const Personpositional.jose()
      : name = 'jose',
        age = 32;
  const Personpositional.frank(
    this.age,
  ) : name = 'frank';

  const Personpositional.other({
    String? name,
    int? age,
  })  : name = name ?? 'grace',
        age = age ?? 33;
}

//named constructor
class Personnamed {
  final String name;
  final int age;
  const Personnamed({
    required this.name,
    required this.age,
  });
}

class Person {
  final String fn;
  final String ln;
  String get fullName => '$fn $ln';

  const Person({
    required this.fn,
    required this.ln,
  });
}
