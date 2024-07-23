import 'package:thi/SinhVien.dart';
import 'package:thi/SinhVienRepository.dart';

class SinhVienService {
  final SinhVienRepository _repository;

  SinhVienService(this._repository);

  void saveAStudent(SinhVien sv) {
    _repository.saveStudent(sv);
  }

  List<SinhVien> findAllStudents() {
    return _repository.findAll();
  }

  void deleteStudent(code) {
    _repository.deleteStudent(code);
  }

  Future<void> saveToFile(fileName) async {
    await _repository.saveToFile(fileName);
  }

  Future<void> readFromFile(fileName) async {
    await _repository.readFromFile(fileName);
  }
}
