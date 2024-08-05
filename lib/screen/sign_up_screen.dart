import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kahi_coffee/SQLite/sqlite.dart';
import 'package:kahi_coffee/model/account.dart';
import 'package:kahi_coffee/screen/confirm_password.dart';
import 'package:kahi_coffee/screen/login_screen.dart';
import 'package:kahi_coffee/utils/config_color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late Account account;
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final phonenumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: const Color.fromARGB(255, 245, 245, 245),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 70),
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
                  padding: const EdgeInsets.only(top: 30),
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
                          controller: phonenumberController,
                          decoration: InputDecoration(
                            hintText: 'your phone number',
                            alignLabelWithHint: true,
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
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      if (phonenumberController.text.isNotEmpty) {
                        account = Account(
                          id: 'id',
                          phonenumber: phonenumberController.text,
                          password: 'password',
                        );
                        databaseHelper.insertAccount(account);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ConfirmPassword(),
                          ),
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
                      'NEXT',
                      style: TextStyle(
                        color: StyleConfig.white,
                        fontSize: 14,
                        fontFamily: 'Roboto-Regular',
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 27),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Already have an account? ',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                      style: TextStyle(
                        color: StyleConfig.colormain,
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
    );
  }
}
