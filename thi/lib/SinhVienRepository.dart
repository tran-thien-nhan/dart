import 'dart:convert';
import 'dart:io';

import 'package:thi/SinhVien.dart';

class SinhVienRepository {
  List<SinhVien> students = [];

  void saveStudent(SinhVien sv) {
    if (students.any((sv) => sv.code == sv.code)) {
      print("student with code ${sv.code} already exists");
      return;
    }
    students.add(sv);
  }

  List<SinhVien> findAll() {
    if (students.length == 0) {
      print("no student to display");
    }
    return students;
  }

  void deleteStudent(int code) {
    if (!students.any((sv) => sv.code == code)) {
      print("student with code $code not found");
      return;
    }
    students.removeWhere((sv) => sv.code == code);
  }

  Future<void> saveToFile(fileName) async {
    List<String> employeeStrings =
        students.map((e) => jsonEncode(e.toJson())).toList();
    String content = employeeStrings.join('\n');

    File file = File(fileName);
    try {
      await file.writeAsString(content);
      print("data is added $fileName");
    } catch (e) {
      print("error adding $fileName: $e");
    }
  }

  Future<void> readFromFile(fileName) async {
    File file = File(fileName);
    try {
      String content = await file.readAsString();
      List<String> employeeStrings = content.split('\n');
      students = employeeStrings
          .map((str) => SinhVien.fromJson(jsonDecode(str)))
          .toList();
      print("data is read from $fileName");
    } catch (e) {
      print("error $fileName: $e");
    }
  }

  Future<void> openFile(fileName) async {
    // final String fileName = "academy.csv";
    ProcessResult result;
    if (Platform.isWindows) {
      result = await Process.run('notepad.exe', [fileName]);
    } else if (Platform.isLinux) {
      result = await Process.run('xdg-open', [fileName]);
    } else if (Platform.isMacOS) {
      result = await Process.run('open', [fileName]);
    } else {
      print("Unsupported platform");
      return;
    }
    if (result.exitCode == 0) {
      print("open file $fileName successfully !");
    } else {
      print("error $fileName: ${result.stderr}");
    }
  }
}
