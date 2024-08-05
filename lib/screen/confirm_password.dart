import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kahi_coffee/screen/sign_up_screen.dart';
import 'package:kahi_coffee/utils/config_color.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({super.key});

  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}

class _ConfirmPasswordState extends State<ConfirmPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Color.fromARGB(255, 245, 245, 245),
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
                    onPressed: () {},
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
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 27),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'Already have an account?',
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
