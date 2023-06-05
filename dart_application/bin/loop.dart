import 'dart:io';

void main(List<String> args) {
  do {
    stdout.write('Enter your name or "exit": ');
    final inval = stdin.readLineSync();
    if (inval == 'exit') {
      break;
    } else if ((inval?.length ?? 0) == 0 || inval == null) {
      stdout.writeln('Invalid name. Try again!');
      continue;
    }

    switch (inval.toLowerCase()) {
      case 'zack':
        stdout.writeln('Hello $inval.How r u??');
        break;
      default:
        stdout.writeln('Hello $inval');
        break;
    }
  } while (true);
}
