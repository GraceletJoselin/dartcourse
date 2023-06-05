void main(List<String> args) {
  hello('Foo');
  hello('Foo', ln: null);
  hello('Foo', ln: 'zack');

  print(add());
  print(add(10, 6));
  print(add(10));
}

void hello(
  String fn, {
  String? ln = 'zack',
}) {
  print('Hello $fn $ln');
}

int add([int a = 10, int b = 5]) => a + b;
