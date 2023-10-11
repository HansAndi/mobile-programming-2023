// void main(){
//   Function makeCounter() {
//     var count = 0;
//     return () {
//       count++;
//       print(count);
//     };
//   }

//   var counter = makeCounter();
//   counter(); // Output: 1
//   counter(); // Output: 2

// }

(int, String) foo() {
  return (42, "foobar");
}

// void main() {
//   var (a,b) = foo();
//   print("int: ${a}");
//   print("String: ${b}");
// }

int persegi(int sisi) {
  return sisi * sisi;
}

// var hasil = persegi(5);

Function perkalian(int a) {
  return (int b) => a * b;
}

var hasil = perkalian(5)(2);

String sayHello() {
  return "Hello";
}

void greeting(String Function() message, name) {
  print('${message()} $name');
}

void main(List<String> args) {
  greeting(() => sayHello(), 'Hans');
}

  // print(hasil);