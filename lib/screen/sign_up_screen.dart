import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kahi_coffee/model/account.dart';
import 'package:kahi_coffee/network/network_request.dart';
import 'package:kahi_coffee/screen/login_screen.dart';
import 'package:kahi_coffee/utils/config_color.dart';
import 'package:http/http.dart' as http;
import 'package:kahi_coffee/widgets/showdialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late Account account;
  final phonenumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'New password',
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
                          controller: passwordController,
                          obscureText: true,
                          focusNode: FocusNode(),
                          decoration: InputDecoration(
                            hintText: 'your password',
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
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Confirm new password',
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
                          controller: confirmPasswordController,
                          obscureText: true,
                          focusNode: FocusNode(),
                          decoration: InputDecoration(
                            hintText: 'confirm password',
                            alignLabelWithHint: true,
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: StyleConfig.grey,
                              fontSize: 12,
                              fontFamily: 'Roboto-Light',
                            ),
                            hintMaxLines: 1,
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
                      if (phonenumberController.text.isEmpty) {
                        Showdialog.showAlertDialog(
                            context, 'Error', 'Phone number is empty');
                      }
                      if (phonenumberController.text.length > 11 &&
                          phonenumberController.text.length < 9) {
                        Showdialog.showAlertDialog(
                            context, 'Error', 'Phone number is invalid');
                      }
                      if (passwordController.text !=
                          confirmPasswordController.text) {
                        Showdialog.showAlertDialog(
                            context, 'Error', 'Password does not match');
                      }
                      NetWorkRequest.register(phonenumberController.text,
                              confirmPasswordController.text)
                          .then((value) {
                        if (value.data == true) {
                          Showdialog.showAlertDialog(
                              context, 'Success', 'Register Success');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        } else {
                          Showdialog.showAlertDialog(
                              context, 'Error', 'Register Failed');
                        }
                      });
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

class MyAlertDialog extends StatelessWidget {
  const MyAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Success'),
      content: const Text('Your personal information has been saved.'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
