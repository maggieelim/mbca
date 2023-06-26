import 'package:hive_flutter/hive_flutter.dart';

class UserDataBase {
  List<List<dynamic>> users = [];

  final _myBox = Hive.box('mybox');

  void createInitialData() {
    users = [
      ['Maggie Lim', 5000000, '123456789', 'test', '123456'],
      ['ANDHIKA PUTRA', '987654321'],
      ['FARHAN ADITHYA', '112233445'],
      ['AURELIA', '223344556'],
      ['LEVINA OLIVIA', '334455667'],
    ];
  }

  void loadData() {
    users = _myBox.get("USERS");
  }

  void updateDataBase() {
    _myBox.put("USERS", users);
  }

  void updateBalance(int amount) {
    final currentUser = users[0];
    final currentBalance = currentUser[1];
    final newBalance = currentBalance - amount;
    currentUser[1] = newBalance;
    updateDataBase();
  }
}
