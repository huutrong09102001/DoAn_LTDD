
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/screens/accounts/user_info/TTTK.dart';
import 'package:flutter_application_7/screens/accounts/orders/DHCT.dart';
import 'package:flutter_application_7/screens/accounts/address/DCCT.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final List<Account> account;

  const Body({Key? key,required this.account}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(),
                  Text(account[0].fullname),
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
                  builder: (context) => TTTKScreen(acccount: account,),
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
                  builder: (context) => DHCTScreen(account:account ,),
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
