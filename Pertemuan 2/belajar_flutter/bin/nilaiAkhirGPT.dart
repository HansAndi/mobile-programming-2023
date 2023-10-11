import 'dart:io';

class Mahasiswa {
  String nama;
  String nim;

  Mahasiswa(this.nama, this.nim);
}

class Nilai {
  String nim;
  num uts;
  num uas;
  num tugas;

  Nilai(this.nim, {this.uts = 0, this.uas = 0, this.tugas = 0});

  num calculateNilaiAkhir() {
    return (uts * 0.3 + uas * 0.3 + tugas * 0.4).round();
  }
}

class StudentManagementSystem {
  List<Mahasiswa> students = [];
  List<Nilai> grades = [];

  void addMahasiswa(String nama, String nim) {
    if (students.any((student) => student.nim == nim)) {
      print("NIM sudah terdaftar.");
    } else {
      students.add(Mahasiswa(nama, nim));
      print("Mahasiswa ditambahkan.");
    }
  }

  void updateMahasiswa(String nim, String newNama, String newNim) {
    final student = students.firstWhere((student) => student.nim == nim);
    if (student != null) {
      student.nama = newNama;
      student.nim = newNim;
      print("Data mahasiswa diperbarui.");
    } else {
      print("Mahasiswa tidak ditemukan.");
    }
  }

  void inputNilai(String nim, num uts, num uas, num tugas) {
    final student = students.firstWhere((student) => student.nim == nim);
    if (student != null) {
      grades.add(Nilai(nim, uts: uts, uas: uas, tugas: tugas));
      print("Nilai mahasiswa berhasil dimasukkan.");
    } else {
      print("Mahasiswa tidak ditemukan.");
    }
  }

  void updateNilai(String nim, num uts, num uas, num tugas) {
    final grade = grades.firstWhere((grade) => grade.nim == nim);
    if (grade != null) {
      grade.uts = uts;
      grade.uas = uas;
      grade.tugas = tugas;
      print("Nilai mahasiswa diperbarui.");
    } else {
      print("Mahasiswa tidak ditemukan.");
    }
  }

  void showMahasiswa() {
    print("Data Mahasiswa:");
    int i = 1;
    students.forEach((student) {
      print("$i Nama: ${student.nama}, NIM: ${student.nim}");
      i++;
    });
  }

  void showNilai() {
    print("Data Nilai:");
    grades.forEach((grade) {
      final student =
          students.firstWhere((student) => student.nim == grade.nim);
      final nilaiAkhir = grade.calculateNilaiAkhir();
      print(
          "Nama: ${student.nama}, NIM: ${grade.nim}, Nilai Akhir: $nilaiAkhir");
    });
  }

  void searchNilai(String nim) {
    final grade = grades.firstWhere((grade) => grade.nim == nim);
    if (grade != null) {
      final student =
          students.firstWhere((student) => student.nim == grade.nim);
      final nilaiAkhir = grade.calculateNilaiAkhir();
      print(
          "Nama: ${student.nama}, NIM: ${grade.nim}, Nilai Akhir: $nilaiAkhir");
    } else {
      print("Data tidak ditemukan.");
    }
  }

  void rankNilai() {
    grades.sort((a, b) {
      final nilaiAkhirA = a.calculateNilaiAkhir();
      final nilaiAkhirB = b.calculateNilaiAkhir();
      return nilaiAkhirB.compareTo(nilaiAkhirA);
    });

    print("Peringkat Nilai:");
    for (var i = 0; i < grades.length; i++) {
      final student =
          students.firstWhere((student) => student.nim == grades[i].nim);
      final nilaiAkhir = grades[i].calculateNilaiAkhir();
      print(
          "Peringkat ${i + 1}: Nama: ${student.nama}, Nilai Akhir: $nilaiAkhir");
    }
  }
}

void main() {
  final sms = StudentManagementSystem();
  int? option = 0;

  do {
    print("Menu:");
    print("1. Input Mahasiswa");
    print("2. Update Mahasiswa");
    print("3. Input Nilai");
    print("4. Update Nilai");
    print("5. Tampil Mahasiswa");
    print("6. Tampil Nilai");
    print("7. Cari Nilai Mahasiswa");
    print("8. Urut Data Nilai");
    print("9. Keluar");

    stdout.write("Pilih Menu : ");
    // option = int.parse(stdin.readLineSync()!);

    try {
      final input = stdin.readLineSync();
      option = int.tryParse(input!);
      // option = int.parse(stdin.readLineSync()!);
      if (option == null || option < 1 || option > 9) {
        throw Exception("Pilihan tidak valid. Silakan pilih menu yang sesuai.");
      }
    } catch (e) {
      print("Terjadi kesalahan: $e");
      continue;
    }

    print("");

    switch (option) {
      case 1:
        print("Masukkan Data Mahasiswa");
        stdout.write("Nama Mahasiswa : ");
        final nama = stdin.readLineSync();
        stdout.write("NIM : ");
        final nim = stdin.readLineSync();
        sms.addMahasiswa(nama!, nim!);
        break;
      case 2:
        sms.showMahasiswa();
        stdout.write("Pilih Mahasiswa (NIM) : ");
        final nim = stdin.readLineSync();
        stdout.write("Nama Mahasiswa Baru : ");
        final newNama = stdin.readLineSync();
        stdout.write("NIM Baru : ");
        final newNim = stdin.readLineSync();
        sms.updateMahasiswa(nim!, newNama!, newNim!);
        break;
      case 3:
        sms.showMahasiswa();
        stdout.write("Pilih Mahasiswa (NIM) : ");
        final nim = stdin.readLineSync();
        stdout.write("Nilai UTS : ");
        final uts = num.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        stdout.write("Nilai UAS : ");
        final uas = num.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        stdout.write("Nilai Tugas : ");
        final tugas = num.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        sms.inputNilai(nim!, uts, uas, tugas);
        break;
      case 4:
        sms.showMahasiswa();
        stdout.write("Pilih Mahasiswa (NIM) : ");
        final nim = stdin.readLineSync();
        stdout.write("Nilai UTS Baru : ");
        final uts = num.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        stdout.write("Nilai UAS Baru : ");
        final uas = num.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        stdout.write("Nilai Tugas Baru : ");
        final tugas = num.tryParse(stdin.readLineSync() ?? '0') ?? 0;
        sms.updateNilai(nim!, uts, uas, tugas);
        break;
      case 5:
        sms.showMahasiswa();
        break;
      case 6:
        sms.showNilai();
        break;
      case 7:
        stdout.write("Masukkan NIM : ");
        final nim = stdin.readLineSync();
        sms.searchNilai(nim!);
        break;
      case 8:
        sms.rankNilai();
        break;
      case 9:
        print("Keluar dari program.");
        break;
      default:
        print("Pilihan tidak valid. Silakan pilih menu yang sesuai.");
    }
  } while (option != 9);
}
