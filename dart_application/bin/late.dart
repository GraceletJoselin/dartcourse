void main(List<String> args) {
  final hname = Person(name: 'frank');
  final wname = Person(name: 'jose');
  final family = RightImplementation(
    members: [
      hname,
      wname,
    ],
  );
  print(family);
  print(family.membersCount);
}

class Person {
  final String name;

  Person({
    required this.name,
  });
}

class RightImplementation {
  final Iterable<Person> members;
  late int membersCount = getMembersCount();

  RightImplementation({required this.members});

  int getMembersCount() {
    print('members length');
    return members.length;
  }
}
