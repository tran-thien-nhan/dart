class Employee {
  String id;
  String name;
  String age;
  String salary;
  int joinYear;

  Employee(
      {required this.id,
      required this.name,
      required this.age,
      required this.salary,
      required this.joinYear});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      salary: json['salary'],
      joinYear: json['joinYear'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'salary': salary,
      'joinYear': joinYear,
    };
  }
}
