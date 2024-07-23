import 'dart:convert';
import 'dart:io';

import 'employee.dart';

class EmployeeRepository {
  List<Employee> _employees = [];

  List<Employee> getAllEmployees() => _employees;

  Employee? getEmployeeById(String id) {
    for (Employee employee in _employees) {
      if (employee.id == id) {
        return employee;
      }
    }
    return null;
  }

  void addEmployee(Employee employee) {
    if (_employees.any((e) => e.id == employee.id)) {
      throw Exception('ID đã tồn tại');
    }
    _employees.add(employee);
  }

  void deleteEmployee(String id) {
    _employees.removeWhere((employee) => employee.id == id);
  }

  void updateEmployee(String id, Employee newEmployee) {
    final index = _employees.indexWhere(
        (employee) => employee.id.toLowerCase() == id.toLowerCase());
    if (index == -1) {
      throw Exception('Nhân viên không tồn tại');
    }
    _employees[index] = newEmployee;
  }

  Future<void> saveToFile() async {
    final String fileName = "employees.txt";
    List<String> employeeStrings =
        _employees.map((e) => jsonEncode(e.toJson())).toList();
    String content = employeeStrings.join('\n');

    File file = File(fileName);
    try {
      await file.writeAsString(content);
      print("Dữ liệu nhân viên đã được lưu vào $fileName");
    } catch (e) {
      print("Lỗi khi lưu dữ liệu vào $fileName: $e");
    }
  }

  Future<void> readFromFile() async {
    final String fileName = "employees.txt";
    File file = File(fileName);
    try {
      String content = await file.readAsString();
      List<String> employeeStrings = content.split('\n');
      _employees = employeeStrings
          .map((str) => Employee.fromJson(jsonDecode(str)))
          .toList();
      print("Dữ liệu nhân viên đã được đọc từ $fileName");
    } catch (e) {
      print("Lỗi khi đọc dữ liệu từ $fileName: $e");
    }
  }

  Future<void> openFile() async {
    final String fileName = "employees.txt";
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
      print("Đã mở $fileName thành công.");
    } else {
      print("Lỗi khi mở $fileName: ${result.stderr}");
    }
  }

  void increaseSalaryForEmployees(
      int startYear, int endYear, double percentage) {
    final currentYear = DateTime.now().year;
    _employees
        .where((employee) =>
            currentYear - employee.joinYear >= startYear &&
            currentYear - employee.joinYear < endYear)
        .forEach((employee) {
      final salary = double.parse(employee.salary);
      employee.salary = (salary + salary * percentage).toString();
    });
  }

  void decreaseSalaryForEmployees(int minYears, double percentage) {
    final currentYear = DateTime.now().year;
    _employees
        .where((employee) => currentYear - employee.joinYear > minYears)
        .forEach((employee) {
      final salary = double.parse(employee.salary);
      employee.salary = (salary - salary * percentage).toString();
    });
  }
}
