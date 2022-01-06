import 'package:flutter_application_7/screens/accounts/user_info/TTTK.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BodyDH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Chờ xác nhận",
                      style: TextStyle(
                          color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'Chờ giao',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'Chờ xác nhận',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 5,
              color: Colors.orange,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    Text(
                      "#DH03062021",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'Chờ xác nhận',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 5,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(1, (index) {
                return Row(
                  children: [
                    Image.network(
                      "https://cdn.tgdd.vn/Files/2020/06/08/1261696/moi-tai-bo-hinh-nen-asus-rog-2020-moi-nhat_800x450.jpg",
                      width: 150,
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 80,
                        child: Column(
                          children: [
                            const Text('Tên sản phẩm:'),
                            const Text('Nhãn hiệu:'),
                            const Text('Giá:'),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            const Divider(
              height: 5,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    Text(
                      'Tổng tiền: 200000d',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 5,
              color: Colors.orange,
            ),
            const SizedBox(
              height: 40,
            ),
            const Divider(
              height: 5,
              color: Colors.orange,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    Text(
                      "#DH03062021",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      'Chờ xác nhận',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 5,
              color: Colors.orange,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(1, (index) {
                return Row(
                  children: [
                    Image.network(
                      "https://cdn.tgdd.vn/Files/2020/06/08/1261696/moi-tai-bo-hinh-nen-asus-rog-2020-moi-nhat_800x450.jpg",
                      width: 150,
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 80,
                        child: Column(
                          children: [
                            const Text('Tên sản phẩm:'),
                            const Text('Nhãn hiệu:'),
                            const Text('Giá:'),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            const Divider(
              height: 5,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: <Widget>[
                    Spacer(),
                    Text(
                      'Tổng tiền: 200000d',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              height: 5,
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}
