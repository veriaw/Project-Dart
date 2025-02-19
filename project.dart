import 'dart:io';

Map<String, Map<String, String>> users = {};
RegExp regex1 = RegExp(r'^[a-zA-Z]+');
RegExp regex2 = RegExp(r'^[0-9]+');
String? currentUser;

void addUser(String nim, String nama, String username, String password) {
  bool checkNim = regex1.hasMatch(nim);
  bool checkNama = regex2.hasMatch(nama);

  if (users.containsKey(nim)) {
    print("User sudah ada !!! ");
  } else if (checkNim) {
    print("Harap isi NIM dengan angka");
  } else if (checkNama) {
    print("Harap isi nama dengan huruf");
  } else {
    users[nim] = {'nama': nama, 'username': username, 'password': password};
  }
}

// Fungsi login user
String loginUser(String username, String password) {
  for (var entry in users.entries) {
    if (entry.value['username'] == username &&
        entry.value['password'] == password) {
      currentUser = entry.key;
      return currentUser!;
    }
  }

  return "";
  //print("nope");
}

void main() {
  while (true) {
    print("=============================");
    print("Start Page");
    print("=============================\n");
    print("1. Login");
    print("2. Sign Up\n");
    print("Option : ");
    String? opt = stdin.readLineSync();

    switch (opt) {
      case '1':
        print("=============================");
        print("Login");
        print("=============================\n");
        print("Username : ");
        // Reading name of the Geek
        var uname = stdin.readLineSync(); // null safety in name string

        print("Password : ");
        var password = stdin.readLineSync(); // null safety in name string

        currentUser = loginUser('$uname', '$password');

        if (currentUser!.isEmpty) {
          print("Maaf, User tidak ditemukan");
        } else {
          bool homeState = true;

          while (homeState == true) {
            print("\n=== MENU ===");
            print("1. Daftar anggota kelompok");
            print("2. Penjumlahan dan pengurangan");
            print("3. Angka ganjil genap");
            print("4. Hitung Angka");
            print("5. Keluar");
            stdout.write("Pilih menu (1-5): ");

            String pilihan = stdin.readLineSync() ?? '';

            switch (pilihan) {
              case '1':
                getDaftarAnggota();
                break;
              case '2':
                penjumlahanPengurangan();
                break;
              case '3':
                angkaGanjilGenap();
                break;
              case '4':
                hitungAngka();
                break;
              case '5':
                print("Terima kasih! Program selesai.");
                homeState = false;
                break;
              default:
                print("Pilihan tidak valid! Silakan pilih 1-5.");
            }
          }
        }

        break;

      case '2':
        print("=============================");
        print("Registrasi Diri");
        print("=============================\n");
        print("NIM : ");
        var nim = stdin.readLineSync();

        print("Nama : ");
        var nama = stdin.readLineSync(); // null safety in name string

        print("Username : ");
        // Reading name of the Geek
        var uname = stdin.readLineSync(); // null safety in name string

        print("Password : ");
        var password = stdin.readLineSync(); // null safety in name string
        // Condition is true

        addUser('$nim', '$nama', '$uname', '$password');
        break;

      default:
    }
  }
}

void getDaftarAnggota() {
  int i = 1;
  users.forEach((nim, details) {
    print('$i. Anggota $i');
    print('NIM : $nim');
    print('Nama : ${details['nama']}');
    print('\n');

    i++;
  });
}

void penjumlahanPengurangan() {
  print("\n=== PENJUMLAHAN DAN PENGURANGAN ===");
  stdout.write("Pilih operasi (a: Penjumlahan, b: Pengurangan): ");
  String operasi = stdin.readLineSync() ?? '';

  if (operasi != 'a' && operasi != 'b') {
    print("Masukkan pilihan yang benar!");
    return;
  }

  stdout.write("Masukkan angka pertama: ");
  int angka1 = int.parse(stdin.readLineSync() ?? '0');

  stdout.write("Masukkan angka kedua: ");
  int angka2 = int.parse(stdin.readLineSync() ?? '0');

  int hasil = (operasi == 'a') ? angka1 + angka2 : angka1 - angka2;
  print("Hasil: $hasil");
}

void angkaGanjilGenap() {
  print("\n=== CEK ANGKA GANJIL/GENAP ===");
  stdout.write("Masukkan angka: ");
  int angka = int.parse(stdin.readLineSync() ?? '0');

  if (angka % 2 == 0) {
    print("$angka adalah angka Genap.");
  } else {
    print("$angka adalah angka Ganjil.");
  }
}

void hitungAngka() {
  print("\n=== HITUNG JUMLAH ANGKA ===");
  stdout.write("Masukkan angka: ");
  String? input = stdin.readLineSync();
  int angka = int.parse(input ?? '0'); // Konversi ke int
  countNumber(angka);
}

void countNumber(int number) {
  List<int> digits =
      number.toString().padLeft(5, '0').split('').map(int.parse).toList();

  int totalNumber = digits.length;
  Map<int, int> countMap = {};

  for (int eachNumber in digits) {
    countMap[eachNumber] = (countMap[eachNumber] ?? 0) + 1;
  }

  print("\n=== SUMMARY ===");
  countMap.forEach((key, value) {
    print('Angka $key muncul sebanyak $value kali');
  });

  print("Jumlah Angka Keseluruhan : $totalNumber");
  print("=============================");
}
