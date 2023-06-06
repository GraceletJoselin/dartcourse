import 'package:collection/collection.dart';

void main(List<String> args) {
  //list
  final names = ['grace', 'frank', 'zack'];

  for (final name in names) {
    print(name);
  }

  for (final name in names.reversed) {
    print(name);
  }
// it is case sensitive
  if (names.contains('zack')) {
    print('its n d list');
  }
  //return bool
  for (final name in names.where((String name) => name.startsWith('z'))) {
    print(name);
  }
//passing function to a function foreach print
//sub list(start and end like substring in string)
  names.sublist(1).forEach(print);
  names.sublist(1, 3).forEach(print);

  names.add('joselin');
  print(names);
//map iterates d list and also allows to convert every item in the list to another value of same on another type
  names.map((str) => str.toUpperCase()).forEach(print);
  names.map((str) => str.length).forEach(print);
// reduce an entire list to a single value
  final num = [1, 2, 3];
  // fold - first datatype ll b considered, valie and function
  final sum = num.fold(
    0,
    (
      int pv,
      int tv,
    ) =>
        pv + tv,
  );
  print(sum);

  final len = names.fold(
    0,
    (
      len,
      str,
    ) =>
        len + str.length,
  );
  print(len);

  final result = names.fold(
    '',
    (
      result,
      str,
    ) =>
        '$result ${str.toUpperCase()}',
  );
  print(result);

//eg2
//sets
//spread - extract every value within a collection and put those values in another collections
  final listnames = ['frank', 'grace', 'frank', 'zack'];
  //... also remove duplicates
  final setnames = {...listnames};
  print(setnames);

// hashcode returns integer. hashcode with eqality determines whether a value can appear in a set 2 or not

  final a = 'zack';
  final b = 'Zack';
  print(a.hashCode);
  print(b.hashCode);

//list
  final la1 = [20, 30, 40];
  final la2 = [20, 30, 40];
  if (la1 == la2) {
    print('Ages are equal');
  } else {
    print('Ages are not equal');
  }
  const cla1 = [20, 30, 40];
  const cla2 = [20, 30, 40];
  if (cla1 == cla2) {
    print('Ages are equal');
  } else {
    print('Ages are not equal');
  }
  const sla1 = ['20', '30', '40'];
  const sla2 = ['20', '30', '40'];
  if (sla1 == sla2) {
    print('Ages are equal');
  } else {
    print('Ages are not equal');
  }
  //set

  final a1 = {20, 30, 40};
  final a2 = {20, 30, 40};
  if (a1 == a2) {
    print('Ages are equal');
  } else {
    print('Ages are not equal');
  }
  if (SetEquality().equals(a1, a2)) {
    print('Ages are equal');
  } else {
    print('Ages are not equal');
  }

  final p1 = Personwohashcode(
    age: 2,
    name: 'zack',
  );
  final p2 = Personwohashcode(
    age: 2,
    name: 'zack',
  );

  print(p1.hashCode);
  print(p2.hashCode);

  final p1h = Person(
    age: 2,
    name: 'zack',
  );
  final p2h = Person(
    age: 2,
    name: 'zack',
  );

  print(p1h.hashCode);
  print(p2h.hashCode);

  final info = {
    'name': 'zack',
    'age': 10,
  };

  print(info);
  print(info['name']);
  print(info['age']);
  print(info.keys);
  print(info.values);
// insert
  info.putIfAbsent(
    'height',
    () => 85,
  );
  print(info);
  //change value
  info['name'] = 'zackwin';
  print(info);
//.entries
  for (final entry in info.entries) {
    print(entry.key);
    print(entry.value);
  }

  if (info.containsKey('height')) {
    print('Height is ${info['height']}');
  } else {
    print('Height is not found');
  }

  final mapint = {
    10: 20,
    30: 40,
  };
  print(mapint);
  print(mapint[10]);

  final iterable = Iterable.generate(
    5,
    (i) => getName(i),
  );
  //lazily evaluate
  //take grabs only the mentioned times
  //function is not called till its used
  for (final name in iterable.take(2)) {
    print(name);
  }

  const itnames = ['John', 'Jane', 'Jill'];
  final uc = itnames.map((name) {
    print('called');
    return name.toUpperCase();
  });
  for (final name in uc.take(2)) {
    print(name);
  }

  print("unmodifiable");

  // itnames.add('Jack');
  // print(itnames);
  try {
    final uml = UnmodifiableListView(itnames);
    uml.add('Jill');
  } catch (e) {
    print(e);
  }

  final minfo = {
    'name': 'John',
    'age': 30,
    'address': {
      'street': 'Main Street',
      'city': 'New York',
    },
  };

  final minfo1 = UnmodifiableMapView(minfo);

  minfo.addAll(
    {
      'phone': '123-456-7890',
    },
  );
  print(minfo);

  try {
    minfo1.addAll(
      {
        'phone': '123-456-7890',
      },
    );
  } catch (e) {
    print(e);
  }
}

String getName(int i) {
  print('called');
  return 'zack $i';
}

class Personwohashcode {
  final String name;
  final int age;

  Personwohashcode({
    required this.name,
    required this.age,
  });
}

class Person {
  final String name;
  final int age;

  Person({
    required this.name,
    required this.age,
  });

  @override
  String toString() => 'Person: $name, $age';
//getter kind of like function
  @override
  int get hashCode => Object.hash(
        name,
        age,
      );
//operator kind of like function
//to check equality we need to compare instances of 2 sets
  @override
  bool operator ==(Object other) =>
      //objecta R IDENTICAL
      identical(this, other) ||
      //instances r equal
      other is Person && name == other.name && age == other.age;
}
