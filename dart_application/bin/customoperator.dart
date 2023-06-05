class FM {
  final String name;
  FM({required this.name});
  @override
  String toString() => 'Family Member name =$name';
}

class Family {
  final List<FM> mem;
  Family({required this.mem});
  @override
  String toString() => 'Family Members = $mem';
}

extension fam on FM {
  Family operator +(FM other) => Family(
        mem: [this, other],
      );
}

extension Times<T> on Iterable<T> {
  Iterable<T> operator *(int times) sync* {
    for (var i = 0; i < times; i++) {
      yield* this;
    }
  }
}

int add([int? a, int? b]) {
  return a + b;
}

extension AddNull<T extends num> on T? {
  T operator +(T? other) {
    final val = this;
    if (this != null && other == null) {
      return this as T;
    } else if (this == null && other != null) {
      return other;
    } else if (val != null && other != null) {
      return val + other as T;
    } else {
      return 0 as T;
    }
  }
}

extension Remove on String {
  String operator -(String other) => replaceAll(
        other,
        '',
      );
}

extension Removeit<T> on Iterable<T> {
  Iterable<T> operator -(Iterable<T> other) =>
      where((element) => !other.contains(element));
}

extension MapOper<K, V> on Map<K, V> {
  Map<K, V> operator +(Map<K, V> other) => {
        //spread operator - used for inserting multiple elements in a collection like Lists,Maps....
        ...this,
        ...other,
      };

  Map<K, V> operator -(Map<K, V> other) {
    //...this - copy of left map
    //.. - Cascade notation - allows u to make a sequence of operations on the same object
    return {...this}..removeWhere((key, value) {
        return other.containsKey(key) && other[key] == value;
      });
  }

  Iterable<Map<K, V>> operator *(int times) sync* {
    for (var i = 0; i < times; i++) {
      yield this;
    }
  }
}

class Mem {
  final String name;
  const Mem({
    required this.name,
  });
  @override
  String toString() => 'Member (name = $name)';
}

class Pet {
  final String name;
  const Pet({
    required this.name,
  });
  @override
  String toString() => 'Pet (name = $name)';
}

class Fami {
  final List<Mem> mems;
  final List<Pet> pets;

  const Fami({
    required this.mems,
    required this.pets,
  });

  @override
  String toString() => 'Family (members = $mems, pets = $pets)';
}

extension on Mem {
  // u cant overload operator in dart
  //adding members
  Fami operator +(Mem other) => Fami(
        mems: [this, other],
        pets: [],
      );
  //adding pets
  Fami operator &(Pet other) => Fami(
        mems: [this],
        pets: [other],
      );
}

extension on Fami {
  //adding pets to family
  Fami operator &(Pet other) => Fami(
        mems: mems,
        pets: [
          ...pets,
          other,
        ],
      );

  //adding members to family
  Fami operator +(Mem other) => Fami(
        mems: [
          ...mems,
          other,
        ],
        pets: pets,
      );

  //merging both pets and members

  Fami operator ^(Fami other) => Fami(
        mems: [
          ...mems,
          ...other.mems,
        ],
        pets: [
          ...pets,
          ...other.pets,
        ],
      );
}

class Person {
  final int age;

  Person({
    required this.age,
  });

  Person operator +(int age) => Person(
        age: this.age + age,
      );

  @override
  String toString() => 'Person (age = $age)';
}

void main(List<String> args) {
  final now = Person(age: 30);
  print('Now = $now');
  final nxt = now + 1;
  print('Next Year = $nxt');

  final m = Mem(name: 'frank');
  final d = Mem(name: 'jose');
  final s = Mem(name: 'zack');

  final fish = Pet(name: 'fighter');

  final family = m + d;
  print('Mom + Dad = $family');
  final ws = family + s;
  print('Mom + Dad + Son = $ws');

  final wf = family & fish;
  print('Mom + Dad + Son + Whiskers = $wf');

  print({'name': 'zack'} + {'age': '2'});
  print({'name': 'zack', 'age': '2'} - {'age': '2'});
  print({'name': 'zack'} * 2);

  final dad = FM(name: 'dad');
  final mom = FM(name: 'mon');
  final famil = dad + mom;
  print(famil);

  const num = ['1', '2', '3', '4'];
  final result = num * 10;
  print(result);

  print(add());
  print(add(1, 2));

  print('Lovelin' - 'lin');

  print([1, 2, 3] - [1, 2]);
  print(['1', '2', '3'] - ['3', '2']);
}
