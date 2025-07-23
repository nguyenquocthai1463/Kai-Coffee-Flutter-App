import 'package:flutter/material.dart';
import 'package:kahi_coffee/screen/benefits_screen.dart';
import 'package:kahi_coffee/screen/profile_screen.dart';
import 'package:kahi_coffee/screen/setting_screen.dart';
import 'package:kahi_coffee/utils/config_color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConfig.bgColor,
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                floating: true,
                forceElevated: innerBoxIsScrolled,
                pinned: true,
                snap: false,
                toolbarHeight: 100,
                backgroundColor: StyleConfig.white,
                shadowColor: StyleConfig.black,
                automaticallyImplyLeading: false,
                expandedHeight: 150,
                title: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Good Evening,',
                              style: TextStyle(
                                fontSize: 25,
                                color: StyleConfig.black,
                                fontFamily: 'Lato-Bold',
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              'Nguyen Quoc Thai',
                              style: TextStyle(
                                fontSize: 25,
                                color: StyleConfig.black,
                                fontFamily: 'Lato-Bold',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image(
                        image: AssetImage('assets/images/sun.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(42),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ProfileScreen()),
                                  );
                                },
                                child: Row(
                                  children: [
                                    const Image(
                                      image:
                                          AssetImage('assets/images/card.png'),
                                      width: 25,
                                      height: 25,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      'Profile',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: StyleConfig.black),
                                    )
                                  ],
                                )),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    const Image(
                                      image:
                                          AssetImage('assets/images/email.png'),
                                      width: 25,
                                      height: 25,
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      'Inbox',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: StyleConfig.black),
                                    )
                                  ],
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SettingScreen()),
                              );
                            },
                            child: const Image(
                              image: AssetImage('assets/images/setting.png'),
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 15),
                        child: Text(
                          '154.8',
                          style: TextStyle(
                            fontSize: 32,
                            color: StyleConfig.black,
                            fontFamily: 'Lato-Bold',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Icon(Icons.star, color: StyleConfig.colormain),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: Text(
                      'KAI COFFEE REWARDS',
                      style: TextStyle(
                        fontSize: 13,
                        color: StyleConfig.grey,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  'Star Points',
                  style: TextStyle(
                    fontSize: 13,
                    color: StyleConfig.grey,
                    fontFamily: 'Lato-Bold',
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: StyleConfig.colormain,
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side:
                                const BorderSide(color: Colors.black, width: 1),
                          ),
                          minimumSize: const Size(90, 35),
                        ),
                        child: Text('Details',
                            style: TextStyle(
                              fontSize: 13,
                              color: StyleConfig.black,
                              fontFamily: 'Lato-Bold',
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const BenefitsScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: StyleConfig.colormain,
                          minimumSize: const Size(90, 35),
                        ),
                        child: Text('Rewards',
                            style: TextStyle(
                              fontSize: 13,
                              color: StyleConfig.white,
                              fontFamily: 'Lato-Bold',
                            ))),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 173,
                    width: 350,
                    decoration: BoxDecoration(
                      color: StyleConfig.white,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                          color: StyleConfig.grey,
                          spreadRadius: 0.1,
                          blurRadius: 3,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: 'YOUR F',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  color: StyleConfig.colormain,
                                )),
                            const TextSpan(
                                text: 'EED BACK \n',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(225, 230, 230, 230),
                                )),
                            const TextSpan(
                                text:
                                    'We are looking forward to receving feedback',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Color.fromARGB(255, 230, 230, 230),
                                ))
                          ]),
                        ),
                        Image.asset(
                          'assets/images/reward.jpg',
                          fit: BoxFit.contain,
                          width: 290,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: Container(
                  height: 170,
                  width: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          const AssetImage('assets/images/background_36st.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        // ignore: deprecated_member_use
                        Colors.black.withOpacity(0.5),
                        BlendMode.srcATop,
                      ),
                    ),
                    color: StyleConfig.white,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: StyleConfig.grey,
                        spreadRadius: 0.1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 45),
                          child: Text(
                            'NEW STORE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato-Bold',
                              fontSize: 20,
                              color: StyleConfig.white,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 73),
                          child: Container(
                            width: 30,
                            height: 1,
                            color: StyleConfig.white,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child:
                              Text('117 ĐƯỜNG SỐ 7, BÌNH TRỊ ĐÔNG B, BÌNH TÂN',
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: StyleConfig.white,
                                  )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 15),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: BorderSide(
                                    color: StyleConfig.colormain, width: 1),
                              ),
                              backgroundColor: Colors.white,
                              minimumSize: const Size(45, 25),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 13, horizontal: 15),
                            ),
                            child: Text(
                              'Read More',
                              style: TextStyle(
                                fontSize: 12,
                                color: StyleConfig.colormain,
                                fontFamily: 'Lato-Bold',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Container(
                  height: 170,
                  width: 350,
                  decoration: BoxDecoration(
                    color: StyleConfig.white,
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: StyleConfig.grey,
                        spreadRadius: 0.1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          // ignore: deprecated_member_use
                          Colors.black.withOpacity(
                              0.5), // Màu và độ mờ bạn muốn áp dụng
                          BlendMode.srcATop,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            'assets/images/background_288vankiep.jpg',
                            fit: BoxFit.cover,
                            width: 350,
                            height: 170,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 45),
                          child: Text(
                            'NEW STORE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Lato-Bold',
                              fontSize: 20,
                              color: StyleConfig.white,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 63),
                          child: Divider(
                            color: StyleConfig.white, // Màu của đường kẻ
                            height: 20,
                            thickness: 2,
                            indent: 150,
                            endIndent: 150,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text('18 ĐƯỜNG SỐ 36, TAN QUY, QUẬN 7',
                              style: TextStyle(
                                fontSize: 12,
                                color: StyleConfig.white,
                              )),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 5),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                      color: StyleConfig.colormain, width: 1),
                                ),
                                backgroundColor: StyleConfig.white,
                                minimumSize: const Size(45, 25),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                              ),
                              child: Text('Read More',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: StyleConfig.colormain,
                                    fontFamily: 'Lato-Bold',
                                  ))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 170,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all( Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: StyleConfig.grey,
                        spreadRadius: 0.1,
                        blurRadius: 3,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          // ignore: deprecated_member_use
                          Colors.black.withOpacity(
                              0.1), // Màu và độ mờ bạn muốn áp dụng
                          BlendMode.srcATop,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            'assets/images/background_camon.jpg',
                            fit: BoxFit.cover,
                            width: 350,
                            height: 170,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 5),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                      color: StyleConfig.colormain, width: 1),
                                ),
                                backgroundColor: StyleConfig.white,
                                minimumSize: const Size(45, 25),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                              ),
                              child: Text('Read More',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: StyleConfig.colormain,
                                    fontFamily: 'Lato-Bold',
                                  ))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20, bottom: 5),
                          child: Text(
                            'Cảm ơn bạn !',
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontFamily: 'Lato-Regular',
                              fontSize: 35,
                              color: StyleConfig.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 170,
                  width: 350,
                  decoration: BoxDecoration(
                    color: StyleConfig.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                        color: StyleConfig.grey,
                        spreadRadius: 0.1,
                        blurRadius: 3,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: Image.asset(
                            'assets/images/background_danhgia.jpg',
                            fit: BoxFit.fill,
                            width: 300,
                            height: 150,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, bottom: 5),
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                      color: StyleConfig.colormain, width: 1),
                                ),
                                backgroundColor: StyleConfig.white,
                                minimumSize: const Size(45, 25),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 15),
                              ),
                              child: Text('Read More',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: StyleConfig.colormain,
                                    fontFamily: 'Lato-Bold',
                                  ))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, bottom: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: 'REWARDS\n',
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: StyleConfig.black,
                                    )),
                                TextSpan(
                                    text: 'Đánh Giá Dịch Vụ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: StyleConfig.black,
                                    )),
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
