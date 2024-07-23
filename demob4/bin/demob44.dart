// import 'dart:convert';

// import 'package:demob4/User.dart';
// import 'package:demob4/demob4.dart' as demob4;

// void main(List<String> arguments) {
//   Map<String, dynamic> jsonData = {
//     "name": "tran thien nhan",
//     "age": 30,
//   };

//   // tạo 1 đối tượng từ chuỗi json
//   User user = User.fromJson(jsonData);
//   print(user);

//   // tạo đối tượng mới
//   User user1 = new User(
//     name: "people A",
//     age: 25,
//   );

//   User user2 = new User(
//     name: "people B",
//     age: 31,
//   );
//   // chuyển đổi map thanh json

//   Map<String, dynamic> jsonMap1 = user1.toJson();
//   Map<String, dynamic> jsonMap2 = user2.toJson();

//   String jsonString1 = jsonEncode(jsonMap1);
//   String jsonString2 = jsonEncode(jsonMap2);

//   print(jsonString1);
//   print(jsonString2);
// }
