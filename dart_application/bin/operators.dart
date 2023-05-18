void main(List<String> args) {
  int a = 15;
  int b = 3;
  int c = 2;
  print(a + b);
  print(a + b * c);
  //calculates from left to right
  print((a + b) * c);

  print(a / b);
  print(a ~/ b);

  print(a);
  print(a++);
  print(++a);

  const a1 = 20;
  print(a1 + 10);
  print(a1 * 10);
  print(a1 ~/ 10);
  print(a1 - 10);

  const a11 = 1;
  const a12 = 1.1;
  const res11 = a11 + a12;
  //const int res12 = a11 + a12; double cant be assigned to int
  const double res13 = a11 + a12;
  print(res11);
  //print(res12);
  print(res13);

  var a111 = 10;
  print(a111);
  print(a111 = 20);
  print(a111 ~/= 2);
  print(a111 *= 2);
  print(a111 ^= 2);
  print(a111 -= 2);
  print(a111 &= 2);
  print(a111 |= 2);
}
