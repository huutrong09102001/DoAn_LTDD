
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/models/Account.dart';

class BodyTK extends StatelessWidget {
  final List<Account> account;

  const BodyTK({Key? key, required this.account}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Scaffold(
                  appBar: AppBar(
                    title: Text('Thay đổi ảnh đại diện'),
                  ),
                );
              }));
            },
            child: Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/HuChong.jpg',
                      fit: BoxFit.cover,
                      height: 100,
                    ),
                    Text("Chạm để thay đổi"),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Tên"),
                Spacer(),
                Text(account[0].fullname),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Tên đăng nhập"),
                Spacer(),
                Text(account[0].username),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Giới tính"),
                Spacer(),
                Text(account[0].sex),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Số điện thoại"),
                Spacer(),
                Text(account[0].phone),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Email"),
                Spacer(),
                Text(account[0].email),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        SizedBox(height: 40),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Text("Thiết lập mật khẩu"),
                Spacer(),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
