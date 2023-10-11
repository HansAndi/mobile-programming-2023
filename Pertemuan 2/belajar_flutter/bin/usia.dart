import 'dart:io';

void main() {
  stdout.write("Nama Anda : ");
  String name = stdin.readLineSync()!;
  stdout.write("Usia Anda : ");
  int age = int.parse(stdin.readLineSync()!);
  print("Hello $name, usia Anda $age tahun");
}
