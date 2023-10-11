import 'dart:io';

class Mahasiswa {
  String nama;
  String nim;

  Mahasiswa(this.nama, this.nim);
}

class Nilai {
  String nim, nama;
  var kehadiran;
  var uts;
  var uas;
  var tugas;
  var nilaiAkhir;

  Nilai(this.nim, this.nama,
      {this.kehadiran = 0,
      this.tugas = 0,
      this.uts = 0,
      this.uas = 0,
      this.nilaiAkhir = 0});
}

var again;

class MahasiswaManagementSystem {
  List<Mahasiswa> mahasiswas = [];
  List<Nilai> nilais = [];

  void addMhs(String nama, String nim) {
    if (mahasiswas.any((mahasiswas) => mahasiswas.nim == nim)) {
      print("NIM sudah terdaftar.");
      print("");
    } else {
      mahasiswas.add(Mahasiswa(nama, nim));
      print("Mahasiswa ditambahkan.");
      print("");
    }
  }

  void updateMhs(String nim) {
    stdout.write("Nama Mahasiswa : ");
    String newName = stdin.readLineSync()!;
    stdout.write("NIM : ");
    String newNIM = stdin.readLineSync()!;

    mahasiswas[mahasiswas.indexWhere((mahasiswas) => mahasiswas.nim == nim)] =
        Mahasiswa(newName, newNIM);
    print("Mahasiswa diperbaharui.");
    print("");

    stdout.write("Update data lagi? (y/n) : ");
    again = stdin.readLineSync()!;

    print("");
  }

  void inputNilai(String nim) {
    if (nilais.any((nilais) => nilais.nim == nim)) {
      print("Mahasiswa sudah memiliki nilai.");
      print("");
    } else {
      String tmpNama =
          mahasiswas.firstWhere((mahasiswas) => mahasiswas.nim == nim).nama;
      String tmpNim =
          mahasiswas.firstWhere((mahasiswas) => mahasiswas.nim == nim).nim;
      stdout.write("Kehadiran : ");
      var kehadiran = int.parse(stdin.readLineSync()!);
      stdout.write("Nilai Tugas : ");
      var tugas = int.parse(stdin.readLineSync()!);
      stdout.write("Nilai UTS : ");
      var uts = int.parse(stdin.readLineSync()!);
      stdout.write("Nilai UAS : ");
      var uas = int.parse(stdin.readLineSync()!);
      var nilaiAkhir = (kehadiran * 0.05 + tugas * 0.25 + uts * 0.3 + uas * 0.3)
          .toStringAsFixed(2);
      nilais.add(Nilai(tmpNim, tmpNama,
          kehadiran: kehadiran,
          tugas: tugas,
          uts: uts,
          uas: uas,
          nilaiAkhir: nilaiAkhir));

      print("Nilai ditambahkan.");
      print("");

      stdout.write("Input nilai lagi? (y/n) : ");
      again = stdin.readLineSync()!;

      print("");
    }
  }

  void updateNilai(String nim) {
    String tmpNama =
        mahasiswas.firstWhere((mahasiswas) => mahasiswas.nim == nim).nama;
    String tmpNim =
        mahasiswas.firstWhere((mahasiswas) => mahasiswas.nim == nim).nim;
    stdout.write("Kehadiran : ");
    var kehadiran = int.parse(stdin.readLineSync()!);
    stdout.write("Nilai Tugas : ");
    var tugas = int.parse(stdin.readLineSync()!);
    stdout.write("Nilai UTS : ");
    var uts = int.parse(stdin.readLineSync()!);
    stdout.write("Nilai UAS : ");
    var uas = int.parse(stdin.readLineSync()!);
    var nilaiAkhir = (kehadiran * 0.05 + tugas * 0.25 + uts * 0.3 + uas * 0.3)
        .toStringAsFixed(2);

    nilais[nilais.indexWhere((nilais) => nilais.nim == nim)] = Nilai(
        tmpNim, tmpNama,
        kehadiran: kehadiran,
        tugas: tugas,
        uts: uts,
        uas: uas,
        nilaiAkhir: nilaiAkhir);

    print("Nilai diperbaharui.");
    print("");

    stdout.write("Update nilai lagi? (y/n) : ");
    again = stdin.readLineSync()!;

    print("");
  }

  void showNilai() {
    if (nilais.isNotEmpty) {
      print("Data Nilai");
      int no = 1;
      for (var i = 0; i < nilais.length; i++) {
        print(
            "$no. Nama : ${nilais[i].nama}, NIM : ${nilais[i].nim}, Nilai Akhir : ${nilais[i].nilaiAkhir}");
        no++;
      }
      print("");
    } else {
      print("Data nilai kosong. Silahkan tambahkan dahulu.");
      print("");
    }
  }

  void showMhs() {
    if (mahasiswas.isNotEmpty) {
      print("Data Mahasiswa");
      int no = 1;
      for (var i = 0; i < mahasiswas.length; i++) {
        print("$no. Nama : ${mahasiswas[i].nama}, NIM : ${mahasiswas[i].nim}");
        no++;
      }
      print("");
    } else {
      print("Data mahasiswa kosong. Silahkan tambahkan dahulu.");
      print("");
    }
  }

  void searchNilai(String nim) {
    final nilai = nilais.firstWhere((nilai) => nilai.nim == nim);
    if (nilai != null) {
      print(
          "Nama : ${nilai.nama}, NIM : ${nilai.nim}, Nilai Akhir : ${nilai.nilaiAkhir}");

      print("");
    } else {
      print("Data tidak ditemukan");
      print("");
    }
  }

  void rankNilai() {
    nilais.sort((a, b) => b.nilaiAkhir.compareTo(a.nilaiAkhir));
    var i = 1;
    nilais.forEach((element) {
      print("$i Nama : ${element.nama}, Nilai Akhir : ${element.nilaiAkhir}");
      i++;
    });
    nilais.sort((a, b) => a.nilaiAkhir.compareTo(b.nilaiAkhir));
    print("");
  }
}

void main() {
  final mhs = MahasiswaManagementSystem();

  int? option;
  String? nama, nim;

  // mhs.addMhs("hans", "21");
  // mhs.addMhs("andi", "22");
  // mhs.addMhs("wijaya", "23");

  do {
    print("1. Input Mahasiswa");
    print("2. Update Mahasiswa");
    print("3. Tampil Mahasiswa");
    print("4. Input Nilai");
    print("5. Update Nilai");
    print("6. Tampil Nilai");
    print("7. Mencari Nilai Mahasiswa");
    print("8. Urut Data Nilai");
    print("9. Keluar");

    stdout.write("Pilih Menu : ");

    try {
      final input = stdin.readLineSync();
      option = int.tryParse(input!);
      // option = int.parse(stdin.readLineSync()!);
      if (option == null || option < 1 || option > 8) {
        throw Exception("Pilihan tidak valid. Silakan pilih menu yang sesuai.");
      }
    } catch (e) {
      print("Terjadi kesalahan: $e");
      continue;
    }

    print("");

    switch (option) {
      case 1:
        try {
          do {
            print("Masukkan Data Mahasiswa");
            stdout.write("Nama Mahasiswa : ");
            nama = stdin.readLineSync()!;
            stdout.write("NIM : ");
            nim = stdin.readLineSync()!;

            mhs.addMhs(nama, nim);

            stdout.write("Input data lagi? (y/n) : ");
            again = stdin.readLineSync()!;

            print("");
          } while (again != 'n');
        } catch (e) {
          print("Terjadi kesalahan: $e");
        }

        break;
      case 2:
        try {
          do {
            mhs.showMhs();
            stdout.write("Pilih Mahasiswa : ");
            nim = stdin.readLineSync()!;
            if (mhs.mahasiswas.any((mahasiswas) => mahasiswas.nim == nim)) {
              mhs.updateMhs(nim);
            } else {
              // print("\x1B[2J\x1B[0;0H");
              print("Mahasiswa tidak ditemukan.");
              print("");
            }
          } while (again != 'n');
        } catch (e) {
          print("Terjadi kesalahan: $e");
        }
        // do {
        // } while (again != 'n');

        print("");
        break;
      case 3:
        mhs.showMhs();
        break;
      case 4:
        try {
          do {
            if (mhs.mahasiswas.every((mahasiswas) =>
                    mhs.nilais.any((nilais) => nilais.nim == mahasiswas.nim)) ==
                false) {
              mhs.showMhs();
              stdout.write("Pilih Mahasiswa : ");
              nim = stdin.readLineSync()!;
              if (mhs.mahasiswas.any((mahasiswas) => mahasiswas.nim == nim)) {
                mhs.inputNilai(nim);
                mhs.showNilai();
              } else {
                // print("\x1B[2J\x1B[0;0H");
                print("Mahasiswa tidak ditemukan.");
                print("");
              }
            } else {
              print("Mahasiswa sudah memiliki nilai semua");
              break;
            }
          } while (again != 'n');
          break;
        } catch (e) {
          print("Terjadi kesalahan: $e");
        }

        print("");
        break;
      case 5:
        if (mhs.nilais.isNotEmpty) {
          try {
            do {
              mhs.showNilai();
              stdout.write("Pilih Mahasiswa : ");
              nim = stdin.readLineSync()!;
              if (mhs.mahasiswas.any((mahasiswas) => mahasiswas.nim == nim)) {
                mhs.updateNilai(nim);
              } else {
                // print("\x1B[2J\x1B[0;0H");
                print("Mahasiswa tidak ditemukan.");
                print("");
              }
            } while (again != 'n');
          } catch (e) {
            print("Terjadi kesalahan: $e");
            break;
          }
        } else {
          print("Data nilai kosong. Silahkan tambahkan dahulu.");
          print("");
        }
        break;
      case 6:
        mhs.showNilai();
        break;
      case 7:
        do {
          try {
            stdout.write("Pilih Mahasiswa : ");
            nim = stdin.readLineSync()!;
            if (mhs.nilais.any((nilais) => nilais.nim == nim)) {
              mhs.searchNilai(nim);
              break;
            } else {
              // print("\x1B[2J\x1B[0;0H");
              print("Mahasiswa tidak ditemukan.");
              print("");
            }
          } catch (e) {
            print("Terjadi kesalahan: $e");
          }
        } while (true);

        break;
      case 8:
        mhs.rankNilai();
        break;
    }
  } while (option != 9);
}
