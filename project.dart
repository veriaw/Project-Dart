import 'dart:io';
void main(){
  print("=============================");
  print("Hitung Jumlah Angka");
  print("=============================");
  stdout.write("Input Number :");
  String? input = stdin.readLineSync();
  int angka = int.parse(input ?? '0'); // Konversi ke int
  countNumber(angka);
}

void countNumber(int number){
  // Mengonversi angka ke string dan memisahkannya menjadi daftar digit
  List<int> digits = number.toString().padLeft(5, '0').split('').map(int.parse).toList();

  //total jumlah angka
  int totalNumber = digits.length;

  // Map untuk menyimpan jumlah kemunculan angka
  Map<int, int> countMap = {};

  // Menghitung jumlah setiap angka
  for (int eachNumber in digits) {
    countMap[eachNumber] = (countMap[eachNumber] ?? 0) + 1;
  }
  print("Summary :");
  // Menampilkan hasil
  countMap.forEach((key, value) {
    print('Angka $key muncul sebanyak $value kali');
  });
  
  print("Jumlah Angka Keseluruhan : $totalNumber");
  print("=============================");
}