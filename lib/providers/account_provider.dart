import 'package:flutter/material.dart';

class AccountProvider with ChangeNotifier {
  String _phonenumber = "";
  int _id = 0;

  void changePhonenumber(String phonenumber) {
    _phonenumber = phonenumber;
    notifyListeners();
  }

  String get phonenumber => _phonenumber;

  void changeId(int id) {
    _id = id;
    notifyListeners();
  }

  int get getId => _id;
}
