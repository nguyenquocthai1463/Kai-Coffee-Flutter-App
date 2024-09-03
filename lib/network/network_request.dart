import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kahi_coffee/model/personal.dart';
import 'package:kahi_coffee/model/respose_data.dart';

class NetWorkRequest {
  static const String url = "http://192.168.1.18:8080/api";

  static Future<ResposeData> login(String phonenumber, String password) async {
    final response = await http.post(Uri.parse("$url/login"),
        body: {"phonenumber": phonenumber, "password": password});
    String body = response.body;
    Map<String, dynamic> json = jsonDecode(body);
    bool data = json['data'];
    if (response.statusCode == 200) {
      if (data == true) {
        return ResposeData(
            status: response.statusCode, message: "Login Success", data: true);
      } else {
        return ResposeData(
            status: response.statusCode, message: "Login Failed", data: false);
      }
    } else {
      throw Exception('Failed to load login');
    }
  }

  static Future<ResposeData> register(
      String phonenumber, String password) async {
    final response = await http.post(Uri.parse("$url/register"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'phonenumber': phonenumber,
          'password': password,
        }));
    String body = response.body;
    Map<String, dynamic> json = jsonDecode(body);
    bool data = json['data'];
    if (response.statusCode == 200) {
      if (data == true) {
        return ResposeData(
            status: response.statusCode,
            message: "Register Success",
            data: true);
      } else {
        return ResposeData(
            status: response.statusCode,
            message: "Register Failed",
            data: false);
      }
    } else {
      throw Exception('Failed to load register');
    }
  }

  static Future<ResposeData> getIdAccount(String phonenumber) async {
    final response =
        await http.get(Uri.parse("$url/getAccountId/$phonenumber"));
    String body = response.body;
    Map<String, dynamic> json = jsonDecode(body);
    int data = json['data'];
    if (response.statusCode == 200) {
      return ResposeData(
          status: response.statusCode,
          message: "Get Id Account Success",
          data: data);
    } else {
      throw Exception('Failed to load getIdAccount');
    }
  }

  static Future<ResposeData> checkPersonal(int id_account) async {
    final response = await http.get(
      Uri.parse("$url/checkPersonalInfo/$id_account"),
    );
    String body = response.body;
    Map<String, dynamic> json = jsonDecode(body);
    bool data = json['data'];
    if (response.statusCode == 200) {
      if (data == true) {
        return ResposeData(
            status: response.statusCode,
            message: "Check Personal Success",
            data: true);
      } else {
        return ResposeData(
            status: response.statusCode,
            message: "Check Personal Failed",
            data: false);
      }
    } else {
      throw Exception('Failed to load checkPersonal');
    }
  }

  static Future<Personal> getPersonalInfo(int id_account) async {
    final response = await http.get(
      Uri.parse("$url/getPersonalInfo/$id_account"),
    );
    String body = response.body;
    Map<String, dynamic> json = jsonDecode(body);
    if (response.statusCode == 200) {
      return Personal(
          id: json['id'],
          phonenumber: json['account']['phoneNumber'],
          firstname: json['firstName'],
          lastname: json['lastName'],
          birthdate: json['birthDay'],
          address: json['address'],
          city: json['city'],
          gender: json['gender']);
    } else {
      throw Exception('Failed to load getPersonalInfo');
    }
  }

  static Future<ResposeData> createPersonalInfo(
      int id_account,
      String firstname,
      String lastname,
      DateTime birthdate,
      String address,
      String city,
      String gender) async {
    final response = await http.post(Uri.parse("$url/createPersonalInfo"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'id_account': id_account.toString(),
          'firstname': firstname,
          'lastname': lastname,
          'birthdate': birthdate.toString(),
          'address': address,
          'city': city,
          'gender': gender,
        }));
    if (response.statusCode == 200) {
      return ResposeData(
          status: response.statusCode,
          message: "Create Personal Success",
          data: true);
    } else {
      ResposeData(
          status: response.statusCode,
          message: "Create Personal Failed",
          data: false);
      throw Exception('Failed to load createPersonalInfo');
    }
  }

  static Future<Personal> updatePersonalInfo(int id_account, String firstname,
      String lastname, String address, String city, String gender) async {
    final response = await http.put(Uri.parse("$url/updatePersonalInfo"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'id_account': id_account.toString(),
          'firstname': firstname,
          'lastname': lastname,
          'address': address,
          'city': city,
          'gender': gender,
        }));
    String body = response.body;
    Map<String, dynamic> json = jsonDecode(body);
    if (response.statusCode == 200) {
      return Personal(
          id: json['id'],
          phonenumber: json['account']['phoneNumber'],
          firstname: json['firstName'],
          lastname: json['lastName'],
          birthdate: json['birthDay'],
          address: json['address'],
          city: json['city'],
          gender: json['gender']);
    } else {
      throw Exception('Failed to load getPersonalInfo');
    }
  }
}
