import 'package:flutter_application_7/screens/accounts/user_info/TTTK.dart';
import 'package:flutter/material.dart';


class BodyDC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 40),
        const Divider(height: 5, color: Colors.orange),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: <Widget>[
                Spacer(),
                Text(
                  " + Thêm địa chỉ mới",
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 25,
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
        const Divider(height: 5, color: Colors.orange),
        SizedBox(height: 40),
        const Divider(height: 5, color: Colors.black),
        Column(
          children: List.generate(1, (index) {
            return Row(
              children: [
                Icon(Icons.place, size: 60),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    child: Column(
                      children: [
                        const Text(
                          "Nguyen Van A",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const Text('0303030312'),
                        const Text('25, Mai Chí Thọ, Quận 2, TPHCM')
                      ],
                    ),
                  ),
                ),
                Spacer(),
                const Text(
                  "Chỉnh sửa      ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.orange),
                ),
              ],
            );
          }),
        ),
        const Divider(height: 5, color: Colors.black),
      ],
    );
  }
}
