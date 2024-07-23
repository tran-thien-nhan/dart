import 'dart:io';

Future<void> writeReadOpenAndWriteAgain() async {
  final String fileName = "demo.txt";
  // final String content = "Hello World!";
  // await writeFile(fileName, content);
  await readFile(fileName);
  await openFile(fileName);
  // await appendToFile(fileName, "\nAdditional Content");
}

Future<void> writeFile(String fileName, String content) async {
  File file = File(fileName);
  try {
    await file.writeAsString(content);
    print("Wrote $fileName");
  } catch (e) {
    print("Failed to write $fileName: $e");
  }
}

Future<void> appendToFile(String fileName, String content) async {
  File file = File(fileName);
  try {
    await file.writeAsString(content, mode: FileMode.append);
    print("Appended to $fileName");
  } catch (e) {
    print("Failed to append to $fileName: $e");
  }
}

Future<void> readFile(String fileName) async {
  File file = File(fileName);
  try {
    String content = await file.readAsString();
    print("Read from $fileName: $content");
  } catch (e) {
    print("Failed to read $fileName: $e");
  }
}

Future<void> openFile(String fileName) async {
  ProcessResult result;
  if (Platform.isWindows) {
    result = await Process.run('notepad.exe', [fileName]);
  } else if (Platform.isLinux) {
    result = await Process.run('xdg-open', [fileName]);
  } else if (Platform.isMacOS) {
    result = await Process.run('open', [fileName]);
  } else {
    print("Unsupported platform");
    return;
  }
  if (result.exitCode == 0) {
    print("Opened $fileName successfully.");
  } else {
    print("Failed to open $fileName: ${result.stderr}");
  }
}

Future<void> main(List<String> arguments) async {
  print("Bắt đầu chương trình");
  await writeReadOpenAndWriteAgain();
  print("Chương trình kết thúc");
}
