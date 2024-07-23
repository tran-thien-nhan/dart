import 'Person.dart';

class Student extends Person {
  String school;
  double salary;
  String _code;

  Student(String name, int age, this.school, this.salary, this._code)
      : super(name, age);

  String get getCode => _code;
  set setCode(String code) => _code = code;

  void study() {
    print("Học sinh ${name} đang học tại trường ${school}");
  }

  @override
  void infoDetail() {
    print(
        "Tên: ${name} - Age: ${age} - School: ${school} - Salary: ${salary} - Code: ${getCode}");
  }

  void showSalary() {
    print("Lương của ${name} là: ${salary}");
  }
}
