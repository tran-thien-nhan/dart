import 'dart:io';

import 'package:demotest/BankRepository.dart';
import 'package:demotest/BankService.dart';
import 'package:demotest/demotest.dart' as demotest;
import 'package:test/test.dart';

void main(List<String> arguments) async {
  final repository = BankRepository(filePath: "bank.txt");
  await repository.readFromFile();
  BankService service = BankService(repository: repository);
  while (true) {
    print("+++++++BANK MANAGER+++++++");
    print("1.Create a bank");
    print("2.Show all bank");
    print("3.Save all bank to file");
    print("4.Exit program");
    print("Enter your choice: ");
    String choice = stdin.readLineSync()!;
    switch (choice) {
      case "1":
        service.createAccount();
      case "2":
        service.readAllAccounts();
      case "3":
        await service.saveAccountsToFile();
      case "4":
        print("Bye bye");
        return;
      default:
    }
  }
}
