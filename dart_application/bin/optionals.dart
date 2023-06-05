void main(List<String> args) {
  int? age = 20;
  age = null;
  print(age);
  var result = (age == null) ? 'Age is null' : 'Age is not null';
  print(result);

  String? name;
  // name = 'jose';
  name ??= 'joselin';
  print(name);
}
