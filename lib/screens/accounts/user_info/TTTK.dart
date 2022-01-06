import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/bodytk.dart';
import 'package:flutter_application_7/constants.dart';

class TTTKScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(),
      body: BodyTK(),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: Colors.lightGreen,
    centerTitle: true,
    title: Text('Sửa hồ sơ'),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {},
        child: Icon(
          Icons.done,
          color: Colors.white,
        ),
      ),
    ],
  );
}
