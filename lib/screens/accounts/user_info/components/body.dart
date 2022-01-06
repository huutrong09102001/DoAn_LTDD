
import 'package:flutter_application_7/screens/accounts/user_info/TTTK.dart';
import 'package:flutter_application_7/screens/accounts/orders/DHCT.dart';
import 'package:flutter_application_7/screens/accounts/address/DCCT.dart';
import 'package:flutter/material.dart';


class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/HuChong.jpg',
                    fit: BoxFit.cover,
                    height: 100,
                  ),
                  Text("Nguyen A"),
                  Text("030003030303"),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TTTKScreen(),
                ));
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Icon(Icons.account_circle, size: 40),
                Text("    Thông tin tài khoản"),
                Spacer(),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DHCTScreen(),
                ));
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Icon(Icons.shopping_cart, size: 40),
                Text("    Đơn hàng của tôi"),
                Spacer(),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DCCTScreen(),
                ));
          },
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Icon(Icons.room, size: 40),
                Text("    Địa chỉ của tôi"),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }
}
