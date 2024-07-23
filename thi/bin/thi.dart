import 'dart:io';
import 'package:thi/SinhVien.dart';
import 'package:thi/SinhVienRepository.dart';
import 'package:thi/SinhVienService.dart';
import 'package:thi/thi.dart';

void main() async {
  final repository = SinhVienRepository();
  final service = SinhVienService(repository);

  // Đọc dữ liệu từ file khi bắt đầu
  // await service.readFromFile(fileName);

  while (true) {
    print('1. create new student');
    print('2. find all students');
    print('3. search and delete student');
    print('4. write to file');
    print('5. exit');
    stdout.write('choose: ');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Code: '); //kieu int
        final code = int.parse(stdin.readLineSync()!);
        stdout.write('Name: ');
        final name = stdin.readLineSync()!;
        stdout.write('batch: ');
        final batch = stdin.readLineSync()!;
        stdout.write('java mark: '); //double
        final java_mark = double.parse(stdin.readLineSync()!);
        stdout.write('dart mark: '); //double
        final dart_mark = double.parse(stdin.readLineSync()!);
        final average = (java_mark + dart_mark) / 2;

        final sv = SinhVien(
          code: code,
          name: name,
          batch: batch,
          java_mark: java_mark,
          dart_mark: dart_mark,
          average: average,
        );

        service.saveAStudent(sv);
        print('added successfully !.\n');
        break;

      case '2':
        final sinhViens = service.findAllStudents();
        sinhViens.forEach((sv) {
          print(
              'code: ${sv.code}, name: ${sv.name}, Batch: ${sv.batch}, Java mark: ${sv.java_mark}, Dart mark: ${sv.dart_mark}, average: ${sv.average}');
        });
        print('');
        break;

      case '3': // xóa sinh viên theo mã
        stdout.write('Enter code to delete: ');
        final code = int.parse(stdin.readLineSync()!);
        service.deleteStudent(code);
        print('deleted student successfully !.\n');
        break;

      case '4':
        stdout.write('Enter file path: ');
        final fileName = stdin.readLineSync()!;
        await service.saveToFile(fileName);
        print('saved to file successfully !.\n');
        await repository.openFile(fileName);

      case '5':
        print("thank you !");
        exit(0);

      default:
        print('wrong option, choose again.\n');
        break;
    }
  }
}
