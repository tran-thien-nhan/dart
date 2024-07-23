import 'dart:io';
import 'dart:convert';

class Bank {
  int id;
  String name;
  int age;
  double balance;
  String gender;

  Bank(
      {required this.id,
      required this.name,
      required this.age,
      required this.balance,
      required this.gender});

// chuyển đối tượng Bank từ map
  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name, 'age': age, 'gender': gender};
  }

  // tạo đối tượng bank từ chuỗi json
  factory Bank.fromMap(Map<String, dynamic> map) {
    return Bank(
        id: map['id'],
        name: map['name'],
        age: map['age'],
        balance: map['balance'],
        gender: map['gender']);
  }

  //chuyển đối tượng bank thành chuỗi json
  String toJson() => json.encode(toMap());

  // tạo đối tượng bank từ json
  factory Bank.fromJson(String source) => Bank.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ID: $id, Name: $name, Age: $age, Gender: $gender';
  }
}
