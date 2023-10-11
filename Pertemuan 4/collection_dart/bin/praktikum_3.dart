void main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };

  print(gifts);
  print(nobleGases);

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  gifts['third'] = 'Hans';
  gifts['fourth'] = '2141720082';

  nobleGases[21] = 'Hans';
  nobleGases[22] = '2141720082';

  //add key-value nama-hans and nim-2141720082 to map mhs1
  mhs1['nama'] = 'Hans';
  mhs1['nim'] = '2141720082';

  mhs2[1] = 'Hans';
  mhs2[2] = '2141720082';

  print(gifts);
  print(nobleGases);
  
  print(mhs1);
  print(mhs2);
}
