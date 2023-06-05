void main(List<String> args) {
  print('Hello, World!'.reversed);
  print([2.2, 3.3, 4.4].sum);
  print([1, 2, 3, 3, 1].dup);
  print(AnimalType.Fish.upperCaseLtr);
}

extension on String {
  String get reversed => split('').reversed.join();
}

extension SumOfIterable<T extends num> on Iterable<T> {
  T get sum => reduce((a, b) => a + b as T);
}

extension on Iterable {
  bool get dup => toSet().length != length;
}

enum AnimalType {
  cat,
  dog,
  Fish,
}

extension on Enum {
  bool get upperCaseLtr => name.contains(
        RegExp(
          r'[A-Z]',
        ),
      );
}
