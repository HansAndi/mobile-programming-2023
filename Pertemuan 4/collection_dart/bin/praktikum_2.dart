void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);

  var names1 = <String>{};
  Set<String> names2 = {};
  var names3 = {};

  names1.add('Hans');
  names1.add('2141720082');
  names2.addAll({'Hans', '2141720082'});

  print(names1);
  print(names2);
  print(names3);
}
