import 'dart:async';
import 'dart:io';
import 'package:demotest1/employee.dart';
import 'package:demotest1/employee_repository.dart';
import 'package:demotest1/employee_service.dart';

void main(List<String> arguments) async {
  final repository = EmployeeRepository();
  final service = EmployeeService(repository);

  // Đọc dữ liệu từ file khi bắt đầu
  await service.readFromFile();

  bool running = true;

  while (running) {
    print('''
    1: Add an employee
    2: Show all
    3: Delete by Id
    4: Update by Id
    5: Save file
    6: Tăng lương 10% cho những nhân viên thâm niên từ 3 đến dưới 10 năm
    7: Giảm lương 20% đối với những nhân viên thâm niên >10 năm
    8: Exit
    ''');

    stdout.write('Chọn một tùy chọn: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        await _addEmployee(service);
        break;
      case '2':
        await _showAllEmployees(service);
        break;
      case '3':
        await _deleteEmployee(service);
        break;
      case '4':
        await _updateEmployee(service);
        break;
      case '5':
        await service.saveToFile();
        print('File đã được lưu.');
        await repository.openFile();
        break;
      case '6':
        service.increaseSalaryForEmployees(3, 10);
        print('Tăng lương cho những nhân viên thâm niên từ 3 đến dưới 10 năm.');
        break;
      case '7':
        service.decreaseSalaryForEmployees(10);
        print('Giảm lương cho những nhân viên thâm niên >10 năm.');
        break;
      case '8':
        running = false;
        break;
      default:
        print('Lựa chọn không hợp lệ.');
    }
  }

  // Lưu lại dữ liệu khi kết thúc chương trình
  await service.saveToFile();
}

Future<void> _addEmployee(EmployeeService service) async {
  stdout.write('Nhập ID: ');
  String? id = stdin.readLineSync();
  stdout.write('Nhập tên: ');
  String? name = stdin.readLineSync();
  stdout.write('Nhập tuổi: ');
  String? age = stdin.readLineSync();
  stdout.write('Nhập lương: ');
  String? salary = stdin.readLineSync();
  stdout.write('Nhập năm bắt đầu: ');
  String? joinYearStr = stdin.readLineSync();

  try {
    int joinYear = int.parse(joinYearStr!);
    Employee emp = Employee(
        id: id!, name: name!, age: age!, salary: salary!, joinYear: joinYear);

    service.addEmployee(emp);
    print('Nhân viên mới đã được thêm.');
  } catch (e) {
    print('Lỗi: $e');
  }
}

Future<void> _showAllEmployees(EmployeeService service) async {
  List<Employee> employees = service.getAllEmployees();
  if (employees.isNotEmpty) {
    print('Danh sách nhân viên:');
    employees.forEach((employee) => print(employee.toJson()));
  } else {
    print('Không có nhân viên nào.');
  }
}

Future<void> _deleteEmployee(EmployeeService service) async {
  stdout.write('Nhập ID của nhân viên cần xóa: ');
  String? id = stdin.readLineSync();
  try {
    service.deleteEmployee(id!);
    print('Nhân viên đã được xóa.');
  } catch (e) {
    print(e);
  }
}

Future<void> _updateEmployee(EmployeeService service) async {
  stdout.write('Nhập ID của nhân viên cần cập nhật: ');
  String? id = stdin.readLineSync();
  stdout.write('Nhập tên mới: ');
  String? name = stdin.readLineSync();
  stdout.write('Nhập tuổi mới: ');
  String? age = stdin.readLineSync();
  stdout.write('Nhập lương mới: ');
  String? salary = stdin.readLineSync();
  stdout.write('Nhập năm bắt đầu mới: ');
  String? joinYearStr = stdin.readLineSync();

  try {
    int joinYear = int.parse(joinYearStr!);
    Employee emp = Employee(
        id: id!, name: name!, age: age!, salary: salary!, joinYear: joinYear);

    service.updateEmployee(id, emp);
    print('Nhân viên đã được cập nhật.');
  } catch (e) {
    print('Lỗi: $e');
  }
}
