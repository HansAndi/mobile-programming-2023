void main() {
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  (int, int) tukar((int, int) record) {
    var (a, b) = record;
    return (b, a);
  }

  print(tukar((1, 2)));

  // Record type annotation in a variable declaration:
  (String, int) mahasiswa((String, int) record) {
    var (nama, nim) = record;
    return (nama, nim);
  }
  print(mahasiswa(('Hans', 2141720082)));

  var mahasiswa2 = ('first', hans: 2141720082, b: true, 'last');

  print(mahasiswa2.$1); // Prints 'first'
  print(mahasiswa2.hans); // Prints hans
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints 'last'
}