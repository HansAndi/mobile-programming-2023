import 'package:belajar_flutter/belajar_flutter.dart' as belajar_flutter;

void main(List<String> arguments) {
  print('Hello world: ${belajar_flutter.calculate()}!');
  print(factorial(9));
}

int factorial(int n) {
  if (n == 0) {
    return 1;
  }

  return n * factorial(n - 1);
}
