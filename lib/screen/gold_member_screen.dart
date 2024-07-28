import 'package:flutter/material.dart';

class GoldMemberScreen extends StatefulWidget {
  const GoldMemberScreen({super.key});

  @override
  State<GoldMemberScreen> createState() => _GoldMemberScreenState();
}

class _GoldMemberScreenState extends State<GoldMemberScreen> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text('Blue level',
                style: TextStyle(
                  color: Color.fromRGBO(35, 114, 126, 1),
                  fontSize: 18,
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 40, bottom: 20),
          child: Align(
            alignment: Alignment.topLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('• Voucher giảm giá 30% cho mỗi 25★ tích lũy',
                    style: TextStyle(
                      fontSize: 13,
                    )),
                Text('• 1 phần nước miễn phí cho mỗi 50★ tích lũy',
                    style: TextStyle(
                      fontSize: 13,
                    )),
                Text('• 1 phần nước miễn phí khi thăng hạng',
                    style: TextStyle(
                      fontSize: 13,
                    )),
                Text('• 1 phần bánh cho ngày sinh nhật',
                    style: TextStyle(
                      fontSize: 13,
                    )),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25),
          child: Text(
            ' ✪ Voucher áp dụng cho một phần nước (hoặc bánh) có giá trị cao nhất trong hóa đơn',
            style: TextStyle(fontSize: 13),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 60, top: 10),
          child: Text('For full details see rewards.kaicoffee.vn',
              style: TextStyle(
                fontSize: 13,
              )),
        ),
      ],
    );
  }
}
