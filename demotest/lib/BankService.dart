import 'dart:io';

import 'package:demotest/BankRepository.dart';

class BankService {
  final BankRepository repository;
  BankService({required this.repository});
  void createAccount() {
    print("Enter name: ");
    String name = stdin.readLineSync()!;
    print("Enter age: ");
    int age = int.parse(stdin.readLineSync()!);
    print("Enter balance: ");
    double balance = double.parse(stdin.readLineSync()!);
    print("Enter gender: ");
    String gender = stdin.readLineSync()!;
    repository.addBankAccount(name, balance, age, gender);
    print("Create account successfully");
  }

  //readAllAccounts
  void readAllAccounts() {
    final bankAccounts = repository.readAll();
    if (bankAccounts.length == 0) {
      print("empty bank account");
    }

    for (var bankAccount in bankAccounts) {
      print(bankAccount.toString());
    }
  }

  Future<void> saveAccountsToFile() async {
    await repository.saveToFile();
    print("save to file successfully");
  }

  Future<void> loadAccountsFromFile() async {
    await repository.readFromFile();
    print("load from file successfully");
  }
}
