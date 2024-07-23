class User {
  String name;
  int age;
  User({required this.name, required this.age});

  //chuyen json thanh doi tuong
  factory User.fromJson(Map<String, dynamic> json) {
    return User(name: json["name"], age: json["age"]);
  }
  //chuyen doi tuong thanh json
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "age": age,
    };
  }

  @override
  String toString() {
    return 'User{name: $name, age: $age}';
  }
}
