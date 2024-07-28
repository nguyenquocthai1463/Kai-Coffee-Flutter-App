import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:kahi_coffee/screen/blue_member_screen.dart';
import 'package:kahi_coffee/screen/platinum_member_screen.dart';
import 'package:kahi_coffee/screen/gold_member_screen.dart';

class BenefitsScreen extends StatefulWidget {
  const BenefitsScreen({super.key});

  @override
  State<BenefitsScreen> createState() => _BenefitsScreenState();
}

class _BenefitsScreenState extends State<BenefitsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.black87,
          scrolledUnderElevation: 7,
          elevation: 7,
          title: const Text('Benefits',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
              )),
          bottom: const TabBar(
            indicatorColor: Color.fromRGBO(25, 110, 130, 1),
            indicatorWeight: 3,
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(25, 110, 130, 1),
                  width: 5,
                ),
              ),
            ),
            labelPadding: EdgeInsets.all(0),
            labelColor: Colors.black,
            labelStyle: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
              fontWeight: FontWeight.normal,
              fontFamily: 'Roboto',
              fontSize: 13,
            ),
            tabs: [
              Tab(
                text: 'Blue Member',
              ),
              Tab(
                text: 'Gold Member',
              ),
              Tab(
                text: 'Platinum Member',
              ),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            BlueMemberScreen(),
            GoldMemberScreen(),
            PlatinumMemberScreen(),
          ],
        ),
      ),
    );
  }
}
