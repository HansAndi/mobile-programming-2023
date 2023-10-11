void main(){
  // final person1 = introduce(name: 'Ihsan', age: 18, height: 1.70);
  // print(person1);
  // final person2 = introduce('Ihsan', 18);

  var list = ['apples', 'bananas', 'oranges'];
  list.forEach((item) {
    print('${list.indexOf(item)}: $item');
  });
}

String introduce({String? name, int? age, double? height}) {
    return "Namaku $name. Umurku $age, Tinggiku $height meter";
}

// String introduce(String name, int age, [double? height]) {
//     return "Namaku $name. Umurku $age, Tinggiku $height meter";
// }

int perkalian(int a, int b) {
  return a * b;
}

void foo(int a, {int? b}){
  print(a);
  print(b);
}

void foo2(int a, [int? b]){
  print(a);
  print(b);
}

