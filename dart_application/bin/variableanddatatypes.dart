void main(List<String> args) {
  const id = [1, 2, 3];
  print(id);
  // id.removeAt(0);
  // print(id);
  //Constant cant be changed

  final idChk = id;
  print(id);
  print(idChk);

  final age = [20, 23, 34];
  print(age);
  age.removeAt(0);
  age.add(45);
  print(age);
  //final cant be changed

  var name = 'Joselin';
  print(name);
  name = 'Praveena';
  print(name);

  late final val = getvalue();
  print('Main Function');
  print(val);
  //after first initialisation while first usage  this ll not be called again (late)
  print(val);

  const Map<String, String> val1 = {'name': 'Joselin'};
  print(val1['name']);
}

int getvalue() {
  print('Function called');
  return 10;
}
