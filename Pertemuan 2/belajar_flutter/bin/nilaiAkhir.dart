import 'dart:io';
// import 'dart:collection';

void main() {
  stdout.write("Kehadiran : ");
  num kehadiran = num.parse(stdin.readLineSync()!);
  stdout.write("Nilai Tugas : ");
  num tugas = num.parse(stdin.readLineSync()!);
  stdout.write("Nama Mahasiswa : ");
  String name = stdin.readLineSync()!;
  stdout.write("Nilai UTS : ");
  num uts = num.parse(stdin.readLineSync()!);
  stdout.write("Nilai UAS : ");
  num uas = num.parse(stdin.readLineSync()!);
  var nilaiAkhir = (kehadiran * 0.05 + tugas * 0.25 + uts * 0.3 + uas * 0.3);
  print("Nilai Akhir : ${nilaiAkhir.toStringAsFixed(2)}");
}

//create menu option for option 1 user to input nama, nim, uts, uas, tugas, and calculate nilai akhir, and option 2 exit
// void main() {
//   int option = 0;
//   do {
//     print("1. Input Nilai Akhir");
//     print("2. Keluar");
//     stdout.write("Pilih Menu : ");
//     option = int.parse(stdin.readLineSync()!);
//     switch (option) {
//       case 1:
//         stdout.write("Nama Mahasiswa : ");
//         String name = stdin.readLineSync()!;
//         stdout.write("Nilai UTS : ");
//         num uts = num.parse(stdin.readLineSync()!);
//         stdout.write("Nilai UAS : ");
//         num uas = num.parse(stdin.readLineSync()!);
//         stdout.write("Nilai Tugas : ");
//         num tugas = num.parse(stdin.readLineSync()!);
//         var nilaiAkhir = (uts * 0.3) + (uas * 0.3) + (tugas * 0.4);
//         print("Nilai Akhir : ${nilaiAkhir.toStringAsFixed(2)}");
//         break;
//       case 2:
//         print("Terima kasih");
//         exit(0);
//         // break;
//       default:
//         print("Pilihan tidak tersedia");
//     }
//   } while (option != 2);
// }

//create menu option for option 1 user to input nama, nim, kehadiran, uts, uas, tugas, and calculate nilai akhir, and option 2 exit
// void main() {
//   int option = 0;
//   do {
//     print("1. Input Nilai Akhir");
//     print("2. Keluar");
//     stdout.write("Pilih Menu : ");
//     option = int.parse(stdin.readLineSync()!);
//     switch (option) {
//       case 1:
//         stdout.write("Nama Mahasiswa : ");
//         String name = stdin.readLineSync()!;
//         stdout.write("NIM : ");
//         String nim = stdin.readLineSync()!;
//         stdout.write("Nilai Kehadiran : ");
//         num kehadiran = num.parse(stdin.readLineSync()!);
//         stdout.write("Nilai UTS : ");
//         num uts = num.parse(stdin.readLineSync()!);
//         stdout.write("Nilai UAS : ");
//         num uas = num.parse(stdin.readLineSync()!);
//         stdout.write("Nilai Tugas : ");
//         num tugas = num.parse(stdin.readLineSync()!);
//         var nilaiAkhir = (kehadiran * 0.1) + (uts * 0.3) + (uas * 0.3) + (tugas * 0.4);
//         print("Nilai Akhir : ${nilaiAkhir.toStringAsFixed(2)}");
//         break;
//       case 2:
//         print("Terima kasih");
//         exit(0);
//         // break;
//       default:
//         print("Pilihan tidak tersedia");
//     }
//   } while (option != 2);
// }

//create menu option for option 1 user to input nama and save it using array of object, option 2 pick name from array to input uts, uas, tugas, and calculate nilai akhir and save to array, and option 3 rank the name order by nilai akhir,option 3 exit

// class Mahasiswa{
//   String name;
//   num uts;
//   num uas;
//   num tugas;
//   num nilaiAkhir;

//   Mahasiswa(this.name, {this.uts = 0, this.uas = 0, this.tugas = 0, this.nilaiAkhir = 0});

// }

// void main() {
//   int option = 0;
//   List<Mahasiswa> mahasiswa = [];
//   do {
//     print("1. Input Nilai Akhir");
//     print("2. Tampilkan Nilai Akhir");
//     print("3. Urutkan Nilai Akhir");
//     print("4. Keluar");
//     stdout.write("Pilih Menu : ");
//     option = int.parse(stdin.readLineSync()!);
//     switch (option) {
//       case 1:
//         stdout.write("Nama Mahasiswa : ");
//         String name = stdin.readLineSync()!;
//         mahasiswa.add(Mahasiswa(name));
//         break;
//       case 2:
//         stdout.write("Nama Mahasiswa : ");
//         String name = stdin.readLineSync()!;
//         stdout.write("Nilai UTS : ");
//         num uts = num.parse(stdin.readLineSync()!);
//         stdout.write("Nilai UAS : ");
//         num uas = num.parse(stdin.readLineSync()!);
//         stdout.write("Nilai Tugas : ");
//         num tugas = num.parse(stdin.readLineSync()!);
//         var nilaiAkhir = (uts * 0.3) + (uas * 0.3) + (tugas * 0.4);
//         mahasiswa[mahasiswa.indexWhere((element) => element.name == name)].uts = uts;
//         mahasiswa[mahasiswa.indexWhere((element) => element.name == name)].uas = uas;
//         mahasiswa[mahasiswa.indexWhere((element) => element.name == name)].tugas = tugas;
//         mahasiswa[mahasiswa.indexWhere((element) => element.name == name)].nilaiAkhir = nilaiAkhir;
//         break;
//       case 3:
//         mahasiswa.sort((a, b) => b.nilaiAkhir.compareTo(a.nilaiAkhir));
//         mahasiswa.forEach((element) {
//           print("Nama : ${element.name}, Nilai Akhir : ${element.nilaiAkhir.toStringAsFixed(2)}");
//         });
//         break;
//       case 4:
//         print("Terima kasih");
//         exit(0);
//         // break;
//       default:
//         print("Pilihan tidak tersedia");
//     }
//   } while (option != 4);
// }

// class Mahasiswa {
//   String nama;
//   String nim;

//   Mahasiswa(this.nama, this.nim);
// }

// class Nilai {
//   String nim, nama;
//   num uts;
//   num uas;
//   num tugas;
//   num nilaiAkhir;

//   Nilai(this.nim, this.nama,
//       {this.uts = 0, this.uas = 0, this.tugas = 0, this.nilaiAkhir = 0});
// }

// List<Mahasiswa> mhs = [];
// List<Nilai> nilai = [];

// void showMhs() {
//   print("Data Mahasiswa");
//   int no = 1;
//   if (mhs.isNotEmpty) {
//     for (var i = 0; i < mhs.length; i++) {
//       print("$no. Nama : ${mhs[i].nama}, NIM : ${mhs[i].nim}");
//       no++;
//     }
//   } else {
//     print("Data tidak ditemukan");
//     // home();
//   }
// }

// void showNilai(){
//   print("Data Nilai");
//   int no = 1;
//   if (nilai.isNotEmpty) {
//     for (var i = 0; i < nilai.length; i++) {
//       print("$no. Nama : ${nilai[i].nama}, NIM : ${nilai[i].nim}, Nilai Akhir : ${nilai[i].nilaiAkhir}");
//       no++;
//     }
//   } else {
//     print("Data tidak ditemukan");
//   }
// }

// void main() {
//   int? option, uts, uas, tugas, nilaiAkhir;
//   String nama, nim;

//   do {
//     print("1. Input Mahasiswa");
//     print("2. Update Mahasiswa");
//     print("3. Input Nilai");
//     print("4. Update Nilai");
//     print("5. Tampil Nilai");
//     print("6. Mencari Nilai Mahasiswa");
//     print("7. Urut Data Nilai");
//     print("8. Keluar");

//     stdout.write("Pilih Menu : ");
//     // option = int.parse(stdin.readLineSync()!);

//     try {
//       final input = stdin.readLineSync();
//       option = int.tryParse(input!);
//       // option = int.parse(stdin.readLineSync()!);
//       if (option == null || option < 1 || option > 7) {
//         throw Exception("Pilihan tidak valid. Silakan pilih menu yang sesuai.");
//       }
//     } catch (e) {
//       print("Terjadi kesalahan: $e");
//       continue;
//     }

//     print("");

//     switch (option) {
//       case 1:
//         print("Masukkan Data Mahasiswa");
//         stdout.write("Nama Mahasiswa : ");
//         nama = stdin.readLineSync()!;
//         stdout.write("NIM : ");
//         nim = stdin.readLineSync()!;

//         //check if nim already exist in nl fill again, if not add to mhs
//         while (true) {
//           if (nilai.indexWhere((element) => element.nim == nim) != -1) {
//             print("NIM sudah terdaftar");
//             print("");
//             print("Masukkan Data Mahasiswa");
//             stdout.write("Nama Mahasiswa : ");
//             nama = stdin.readLineSync()!;
//             stdout.write("NIM : ");
//             nim = stdin.readLineSync()!;
//           } else {
//             Mahasiswa mh = Mahasiswa(nama, nim);
//             mhs.add(mh);
//             break;
//           }
//         }

//         // Mahasiswa mh = Mahasiswa(nama, nim);
//         // mhs.add(mh);

//         print("");
//         break;
//       case 2:
//         //update mhs nama and nim based on index
//         showMhs();
//         stdout.write("Pilih Mahasiswa : ");
//         nim = stdin.readLineSync()!;

//         for (var i = 0; i < mhs.length; i++) {
//           if (mhs[i].nim == nim) {
//             stdout.write("Nama Mahasiswa : ");
//             mhs[i].nama = stdin.readLineSync()!;
//             stdout.write("NIM : ");
//             mhs[i].nim = stdin.readLineSync()!;
//           }
//         }

//         print("");
//         break;
//       case 3:
//         showMhs();

//         //pick mhs index based on nim, then save to tmpNim and tmpNama
//         stdout.write("Pilih Mahasiswa : ");
//         nim = stdin.readLineSync()!;

//         //find mhs index based on nim and save to tmpNim and tmpNama using loop
//         String tmpNim = "", tmpNama = "";
//         for (var i = 0; i < mhs.length; i++) {
//           if (mhs[i].nim == nim) {
//             tmpNim = mhs[i].nim;
//             tmpNama = mhs[i].nama;
//             //if pilih equals to mhs index, then input nilai
//             stdout.write("Nilai UTS : ");
//             uts = int.parse(stdin.readLineSync()!);
//             stdout.write("Nilai UAS : ");
//             uas = int.parse(stdin.readLineSync()!);
//             stdout.write("Nilai Tugas : ");
//             tugas = int.parse(stdin.readLineSync()!);

//             nilaiAkhir = (uts * 0.3 + uas * 0.3 + tugas * 0.4).round();
//             // Nilai nl = Nilai(tmpNim, tmpNama,
//             //     uts: uts, uas: uas, tugas: tugas, nilaiAkhir: nilaiAkhir);
//             nilai.add(Nilai(tmpNim, tmpNama,
//                 uts: uts, uas: uas, tugas: tugas, nilaiAkhir: nilaiAkhir));
//             mhs.removeAt(i);
//           }
//         }

//         print("");
//         break;
//       case 4:
//         //update nilai uts, uas, tugas, and nilaiAkhir based on nim
//         showMhs();
//         stdout.write("Pilih Mahasiswa : ");
//         nim = stdin.readLineSync()!;

//         for (var i = 0; i < nilai.length; i++) {
//           if (nilai[i].nim == nim) {
//             stdout.write("Nilai UTS : ");
//             nilai[i].uts = int.parse(stdin.readLineSync()!);
//             stdout.write("Nilai UAS : ");
//             nilai[i].uas = int.parse(stdin.readLineSync()!);
//             stdout.write("Nilai Tugas : ");
//             nilai[i].tugas = int.parse(stdin.readLineSync()!);
//             nilai[i].nilaiAkhir =
//                 (nilai[i].uts * 0.3 + nilai[i].uas * 0.3 + nilai[i].tugas * 0.4)
//                     .round();
//           }
//         }
//         break;
//       case 5:
//         //show nl
//         print("Data Nilai");
//         int no = 1;
//         for (var i = 0; i < nilai.length; i++) {
//           print(
//               "$no. Nama : ${nilai[i].nama}, NIM : ${nilai[i].nim}, Nilai Akhir : ${nilai[i].nilaiAkhir}");
//           no++;
//         }

//         print("");
//         break;
//       case 6:
//         //find nl based on nim
//         print("Masukkan NIM : ");
//         String nim = stdin.readLineSync()!;
//         int index = nilai.indexWhere((element) => element.nim == nim);
//         if (index != -1) {
//           print(
//               "Nama : ${nilai[index].nama}, NIM : ${nilai[index].nim}, Nilai Akhir : ${nilai[index].nilaiAkhir}");
//         } else {
//           print("Data tidak ditemukan");
//         }
//         break;
//       case 7:
//         //rank nl
//         nilai.sort((a, b) => b.nilaiAkhir.compareTo(a.nilaiAkhir));
//         nilai.forEach((element) {
//           print(
//               "Nama : ${element.nama}, Nilai Akhir : ${element.nilaiAkhir.toStringAsFixed(2)}");
//         });

//         print("");
//         break;
//       default:
//         print("Pilihan tidak valid. Silakan pilih menu yang sesuai.");
//     }
//   } while (option != 8);
// }