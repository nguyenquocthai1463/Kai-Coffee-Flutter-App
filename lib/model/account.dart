import 'package:flutter/material.dart';
import 'dart:convert';

Account accountFromJson(String str) {
  final jsonData = json.decode(str);
  return Account.fromJson(jsonData);
}

String accountToJson(Account data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class Account {
  String phonenumber;
  String password;

  Account({required this.phonenumber, required this.password});

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      phonenumber: json['phonenumber'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phonenumber': phonenumber,
      'password': password,
    };
  }

  String get getPhonenumber => phonenumber;
  String get getPassword => password;
}
