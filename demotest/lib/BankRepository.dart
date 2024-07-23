import 'dart:io';
import 'package:demotest/Bank.dart';

class BankRepository {
  List<Bank> _accounts = [];
  int _currentId = 1;
  final String filePath;

  BankRepository({required this.filePath});

  // Tạo tài khoản ngân hàng mới
  Bank addBankAccount(String name, double balance, int age, String gender) {
    var account = Bank(
        id: _currentId++,
        name: name,
        age: age,
        balance: balance,
        gender: gender);
    _accounts.add(account);
    return account;
  }

  // Cập nhật tài khoản ngân hàng
  bool updateBankAccount(int id, String name, double balance, String gender) {
    for (var account in _accounts) {
      if (account.id == id) {
        account.name = name;
        account.balance = balance;
        account.gender = gender;
        return true;
      }
    }
    return false;
  }

  // Xóa tài khoản ngân hàng
  bool deleteBankAccount(int id) {
    for (var i = 0; i < _accounts.length; i++) {
      if (_accounts[i].id == id) {
        _accounts.removeAt(i);
        return true;
      }
    }
    return false;
  }

  // Hiển thị tất cả các tài khoản
  List<Bank> readAll() {
    return _accounts;
  }

  // Ghi dữ liệu vào file
  Future<void> saveToFile() async {
    // String content = _accounts.map((account) => account.toString()).join('\n');
    // await File(filePath).writeAsString(content);

    final file = File(filePath);
    if (await file.exists()) {
      // chuyen doi doi tuong Bank trong danh sach thanh chuoi json
      final data = _accounts.map((ac) => ac.toJson()).join('\n');
      // ghi chuoi du lieu vao file, su dung await de cho qua trinh ghi hoan thanh truoc khi tiep tuc
      await file.writeAsString(data);
      // mở file đó lên
      await readFile(filePath);
      await openFile(filePath);
    }
  }

  // Đọc dữ liệu từ file
  Future<void> readFromFile() async {
    try {
      final file = File(filePath);
      if (await file.exists()) {
        final data = await file.readAsLines();
        _accounts = data.map((line) => Bank.fromJson(line)).toList();
        _currentId = _accounts.isNotEmpty ? _accounts.last.id + 1 : 1;
      }
    } catch (e) {
      print("Failed to read $filePath: $e");
    }
  }
}

Future<void> openFile(String fileName) async {
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
    print("Opened $fileName successfully.");
  } else {
    print("Failed to open $fileName: ${result.stderr}");
  }
}

Future<void> readFile(String fileName) async {
  File file = File(fileName);
  try {
    String content = await file.readAsString();
    print("Read from $fileName: $content");
  } catch (e) {
    print("Failed to read $fileName: $e");
  }
}
// TODO Implement this library.