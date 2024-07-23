import 'employee_repository.dart';
import 'employee.dart';

class EmployeeService {
  final EmployeeRepository _repository;

  EmployeeService(this._repository);

  void addEmployee(Employee employee) {
    _repository.addEmployee(employee);
  }

  List<Employee> getAllEmployees() {
    return _repository.getAllEmployees();
  }

  Employee? getEmployeeById(String id) {
    return _repository.getEmployeeById(id);
  }

  void deleteEmployee(String id) {
    _repository.deleteEmployee(id);
  }

  void updateEmployee(String id, Employee newEmployee) {
    _repository.updateEmployee(id, newEmployee);
  }

  Future<void> saveToFile() async {
    await _repository.saveToFile();
  }

  Future<void> readFromFile() async {
    await _repository.readFromFile();
  }

  void increaseSalaryForEmployees(int startYear, int endYear) {
    _repository.increaseSalaryForEmployees(startYear, endYear, 0.1);
  }

  void decreaseSalaryForEmployees(int minYears) {
    _repository.decreaseSalaryForEmployees(minYears, 0.2);
  }
}
