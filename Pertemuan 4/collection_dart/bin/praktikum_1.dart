void main() {
  final list = [1, 'Hans', 2141720082, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);
  print(list.length);
  print(list[1]);

  list[1] = 1;
  assert(list[1] == 1);
  print(list[1]);

  // List<int> list2 = [1, 2, 3];

  // for (var i = 0; i < list2.length; i++) {
  //   print(list2[i]);
  // }
  
}
