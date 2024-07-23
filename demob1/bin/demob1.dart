import 'package:demob1/demob1.dart' as demob1;
import 'Person.dart';
import 'Student.dart';

//tạo list rỗng chứa các person
List<Person> persons = [];
List<Student> students = [];
void main(List<String> arguments) {
  var p1 = Person("Nhan", 22);
  var p2 = Person("Hoa", 23);
  var p3 = Person("Hai", 24);
  persons.add(p1);
  persons.add(p2);
  persons.add(p3);

  for (var p in persons) {
    p.infoDetail();
  }

  print("----------------");

  var s1 = Student(p1.name, p1.age, "HUST", 1000, "S01");
  var s2 = Student(p2.name, p2.age, "HUST", 2000, "S02");
  var s3 = Student(p3.name, p3.age, "HUST", 3000, "S03");

  students.add(s1);
  students.add(s2);
  students.add(s3);

  printListStudents(students);

  // update code
  s1.setCode = "S001";
  s2.setCode = "S002";
  s3.setCode = "S003";
}

//print list students
void printListStudents(List<Student> students) {
  for (var s in students) {
    s.study();
    s.infoDetail();
    s.showSalary();
    print("====");
  }
}
