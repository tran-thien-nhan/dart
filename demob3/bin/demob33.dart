// // import 'package:demob3/demob3.dart' as demob3;

// Future<void> main(List<String> arguments) async {
//   print("Bắt đầu chương trình");

//   Future<int> calculateSum() async {
//     int sum = 0;
//     for (var i = 1; i <= 5; i++) {
//       await Future.delayed(Duration(seconds: 1));
//       sum += i;
//     }
//     return sum;
//   }

//   // Future đại diện cho việc tính toán
//   Future<int> future = calculateSum();
//   await future.then((result) {
//     print("Sum: $result");
//   }).catchError((error) {
//     print("Error: $error");
//   });
// }
