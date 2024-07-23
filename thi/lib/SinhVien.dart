class SinhVien {
  int code;
  String name;
  String batch;
  double java_mark;
  double dart_mark;
  double average;

  SinhVien({
    required this.code,
    required this.name,
    required this.batch,
    required this.java_mark,
    required this.dart_mark,
    required this.average,
  });

  factory SinhVien.fromJson(Map<String, dynamic> json) {
    return SinhVien(
      code: json['code'] as int,
      name: json['name'] as String,
      batch: json['batch'] as String,
      java_mark: json['java_mark'] as double,
      dart_mark: json['dart_mark'] as double,
      average: json['average'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
      'batch': batch,
      'java_mark': java_mark,
      'dart_mark': dart_mark,
      'average': average,
    };
  }

  double calculateAverage() {
    return (java_mark + dart_mark) / 2;
  }

  @override
  String toString() {
    return 'SinhVien{code: $code, name: $name, batch: $batch, java_mark: $java_mark, dart_mark: $dart_mark, average: $average}';
  }
}
