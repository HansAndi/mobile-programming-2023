import 'dart:io';

int factorial(int n) {
  if (n == 0) {
    return 1;
  }

  return n * factorial(n - 1);
}

int sum(int n) {
  if (n == 0) {
    return 0;
  }

  return n + sum(n - 1);
}

void main() {
  print(factorial(9));
  print(sum(9));

  var greetings = "Hello World\$";
  print(greetings);

  int n = 10;
  int hasil = 0;
  for (var i = 0; i < n; i++) {
    hasil += i;
  }
  print(hasil);

  int a = 10 ^ 2;
}
