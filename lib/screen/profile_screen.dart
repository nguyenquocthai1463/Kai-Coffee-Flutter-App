import 'package:flutter/material.dart';
import 'package:kahi_coffee/screen/setting_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black87,
          scrolledUnderElevation: 7,
          elevation: 7,
          toolbarHeight: 90,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Padding(
              padding: EdgeInsets.only(left: 20, bottom: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Profile',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
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
        body: ListView(
          children: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Account Transaction History',
                      style: TextStyle(fontSize: 18),
                    ),
                    Image.asset('assets/images/icon_list.png',
                        width: 40, height: 40),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 204, 204, 204),
              height: 1,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'KAI Coffee Rewards',
                      style: TextStyle(fontSize: 18),
                    ),
                    Image.asset('assets/images/icon_rewards.png',
                        width: 40, height: 40),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 204, 204, 204),
              height: 1,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Personal',
                      style: TextStyle(fontSize: 18),
                    ),
                    Image.asset('assets/images/icon_personal.png',
                        width: 40, height: 40),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 204, 204, 204),
              height: 1,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Settings',
                      style: TextStyle(fontSize: 18),
                    ),
                    Image.asset('assets/images/icon_setting.png',
                        width: 40, height: 40),
                  ],
                ),
              ),
            ),
            const Divider(
              color: Color.fromARGB(255, 204, 204, 204),
              height: 1,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 15),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 50, 132, 148),
                              width: 1),
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
                  padding: EdgeInsets.only(right: 10, top: 15),
                  child: Text('App version 1.1',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color.fromARGB(255, 184, 184, 184),
                      )),
                ),
              ],
            ),
          ],
        ));
  }
}
