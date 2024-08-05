import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kahi_coffee/utils/config_color.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        shadowColor: Colors.black87,
        scrolledUnderElevation: 7,
        elevation: 7,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 12),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Settings', style: StyleConfig.textTitle),
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 12, bottom: 12),
              child: Text('PREFERENCES',
                  style: TextStyle(
                    color: Color.fromARGB(255, 136, 136, 136),
                    fontSize: 10,
                  )),
            ),
            const Divider(
              color: Color.fromARGB(255, 228, 228, 228),
              height: 1,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Notifications',
                      style: TextStyle(
                        color: Color.fromARGB(255, 136, 136, 136),
                        fontSize: 14,
                      )),
                  SwitchExample(),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 12, bottom: 12),
              child: Text('ABOUT',
                  style: TextStyle(
                    color: Color.fromARGB(255, 136, 136, 136),
                    fontSize: 10,
                  )),
            ),
            const Divider(
              color: Color.fromARGB(255, 228, 228, 228),
              height: 1,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                    left: 20, top: 6, bottom: 3, right: 20),
              ),
              autofocus: false,
              child: const Text('Program FAQs',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  )),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                    left: 20, top: 3, bottom: 3, right: 20),
              ),
              autofocus: false,
              child: const Text('Terms of use',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  )),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                    left: 20, top: 3, bottom: 3, right: 20),
              ),
              autofocus: false,
              child: const Text('Privacy Policy',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  )),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(
                    left: 20, top: 3, bottom: 3, right: 20),
              ),
              autofocus: false,
              child: const Text('Feedback',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  )),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.only(left: 20, right: 20),
              ),
              autofocus: false,
              child: const Text('Change Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  )),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 50, 132, 148), width: 1),
                      ),
                      backgroundColor: Colors.white,
                      minimumSize: const Size(45, 25),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 15),
                    ),
                    child: const Text('Sign out',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 50, 132, 148),
                          fontFamily: 'Lato-Bold',
                        ))),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text('App version 1.1',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color.fromARGB(255, 184, 184, 184),
                    )),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'CONG TY TNHH KAI COFFEE VIET NAM\n',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 184, 184, 184),
                        ),
                      ),
                      TextSpan(
                        text: '139 Nguyen Thai Binh\n',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 184, 184, 184),
                        ),
                      ),
                      TextSpan(
                        text: 'Phuong Nguyen Thai Binh, Quan 1, TP.HCM\n',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 184, 184, 184),
                        ),
                      ),
                      TextSpan(
                        text: 'Contact: (028) 7109 121 Ext. 116',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 184, 184, 184),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SwitchExample extends StatefulWidget {
  const SwitchExample({super.key});

  @override
  State<SwitchExample> createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    return Switch(
      // This bool value toggles the switch.
      value: light,
      activeTrackColor: const Color.fromARGB(255, 0, 194, 6),
      activeColor: Colors.white,
      inactiveThumbColor: Colors.white,
      inactiveTrackColor: const Color.fromARGB(255, 228, 228, 228),
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}
