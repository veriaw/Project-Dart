import 'dart:io';

void main() {
  while (true) {
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
        daftarAnggota();
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
        return;
      default:
        print("Pilihan tidak valid! Silakan pilih 1-5.");
    }
  }
}

void daftarAnggota() {
  print("\n=== DAFTAR ANGGOTA KELOMPOK ===");
  print("1. Anggota 1");
  print("2. Anggota 2");
  print("3. Anggota 3");
  print("4. Anggota 4");
  print("5. Anggota 5");
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
  List<int> digits = number.toString().padLeft(5, '0').split('').map(int.parse).toList();

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
