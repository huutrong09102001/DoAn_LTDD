
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BodyTK extends StatelessWidget {
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
                Text('Nguyen A'),
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
                Text('nguyena'),
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
                Text('Nam'),
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
                Text('03030303011'),
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
                Text('  nguyena@gmail.com'),
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
