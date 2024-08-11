// import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kahi_coffee/SQLite/sqlite.dart';
import 'package:kahi_coffee/model/account.dart';
import 'package:kahi_coffee/screen/home_screen.dart';
import 'package:kahi_coffee/screen/personal_new_info_screen.dart';
import 'package:kahi_coffee/screen/sign_up_screen.dart';
import 'package:kahi_coffee/utils/config_color.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phonenumber = TextEditingController();
  final password = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final db = DatabaseHelper();
  String checkPersonalInfo = '';
  int id = 1;
  late DatabaseHelper handler;
  late Future<List<Account>> accounts;
  List<Map<String, dynamic>> list = [];

  @override
  void initState() {
    super.initState();
    handler = db;
  }

  getIdAccount() async {
    var response = await db.getIdAccount(phonenumber.text);
    if (response != null) {
      checkPersonalInfo = response.id.toString();
      context.read<IdProvider>().setId(id);
    }
  }

  getPersonal() async {
    var response = await db.getPersonal(context.read<IdProvider>().di);
    if (response != null) {
      checkPersonalInfo = response.firstname;
    }
  }

  login() async {
    var response = await db
        .login(Account(phonenumber: phonenumber.text, password: password.text));
    if (response == true) {
      if (!mounted) return;
      if (checkPersonalInfo != '') {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const PersonalNewInfoScreen(),
        //   ),
        // );
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Error'),
              content: Text(checkPersonalInfo),
              contentPadding: const EdgeInsets.all(20),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('The phone number or password is incorrect!'),
            contentPadding: const EdgeInsets.all(20),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: const Color.fromARGB(255, 245, 245, 245),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
            child: Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                      text: 'WELCOME\n',
                      style: TextStyle(
                        color: StyleConfig.colormain,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'KAI COFFEE REWARDS',
                          style: TextStyle(
                            color: StyleConfig.colormain,
                            fontSize: 23,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: const Text(
                      'Enjoy special offers and rewards only for members by logging in with your phone number. Easy to earn Start, easy to recevie Rewards.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 69, 69, 69),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto-Thin',
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone number',
                          style: TextStyle(
                            color: StyleConfig.black,
                            fontSize: 14,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                        Container(
                          height: 34,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 7),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: StyleConfig.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color.fromARGB(255, 238, 238, 238),
                              width: 1,
                            ),
                          ),
                          child: TextFormField(
                            controller: phonenumber,
                            decoration: InputDecoration(
                              hintText: 'your phone number',
                              // alignLabelWithHint: true,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: StyleConfig.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Roboto-Light',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            color: StyleConfig.black,
                            fontSize: 14,
                            fontFamily: 'Roboto-Regular',
                          ),
                        ),
                        Container(
                          height: 34,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 7),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: StyleConfig.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: const Color.fromARGB(255, 238, 238, 238),
                              width: 1,
                            ),
                          ),
                          child: TextFormField(
                            controller: password,
                            obscureText: true,
                            focusNode: FocusNode(),
                            decoration: InputDecoration(
                              hintText: 'your password',
                              alignLabelWithHint: true,
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: StyleConfig.grey,
                                fontSize: 12,
                                fontFamily: 'Roboto-Light',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 27),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: 'Don\'t have an account yet? ',
                        style: TextStyle(
                          color: StyleConfig.black,
                          fontSize: 14,
                          fontFamily: 'Roboto-Regular',
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign up here',
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpScreen(),
                                  ),
                                );
                              },
                            style: TextStyle(
                              color: StyleConfig.colormain,
                              fontSize: 14,
                              fontFamily: 'Roboto-Regular',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: StyleConfig.colormain,
                        fontSize: 14,
                        fontFamily: 'Roboto-Regular',
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        if (phonenumber.text.isNotEmpty &&
                            password.text.isNotEmpty) {
                          if (phonenumber.text.length >= 9 &&
                              phonenumber.text.length <= 11 &&
                              int.tryParse(phonenumber.text) != null) {
                            if (password.text.length >= 6) {
                              getIdAccount();
                              login();
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('Error'),
                                    content: const Text(
                                        'The password is invalid, the password must be at least 6 characters long!'),
                                    contentPadding: const EdgeInsets.all(20),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('Close'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Error'),
                                  content: const Text(
                                      'The phone number is invalid, the phone number must be an integer string and have between 9 and 11 numbers!'),
                                  contentPadding: const EdgeInsets.all(20),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Close'),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Error'),
                                content: const Text(
                                    'Please enter your phone number and password'),
                                contentPadding: const EdgeInsets.all(20),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Ok'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: StyleConfig.colormain,
                        minimumSize: const Size(130, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: StyleConfig.white,
                          fontSize: 14,
                          fontFamily: 'Roboto-Regular',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class IdProvider with ChangeNotifier {
  int _id = 0;
  int get di => _id;

  void setId(int test) {
    _id = test;
    notifyListeners();
  }
}
