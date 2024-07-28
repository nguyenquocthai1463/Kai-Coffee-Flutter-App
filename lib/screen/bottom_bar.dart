import 'package:flutter/material.dart';
import 'package:kahi_coffee/screen/home_screen.dart';
import 'package:kahi_coffee/screen/membership_screen.dart';
import 'package:kahi_coffee/screen/store_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const MembershipScreen(),
    const StoreScreen(),
  ];
  void itemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color.fromRGBO(25, 110, 130, 1),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize: 10,
        elevation: 10,
        unselectedFontSize: 10,
        onTap: itemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/Kai-coffee-logo.png',
                width: 25, height: 25),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/membership.png',
                width: 25, height: 25),
            label: 'Membership',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/store.png', width: 25, height: 25),
            label: 'Stores',
          ),
        ],
      ),
    );
  }
}
