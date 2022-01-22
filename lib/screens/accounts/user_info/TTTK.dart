import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'components/bodytk.dart';
import 'package:flutter_application_7/constants.dart';

class TTTKScreen extends StatelessWidget {
  final List<Account> acccount;

  const TTTKScreen({Key? key,required this.acccount}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(),
      body: BodyTK(account: acccount,),
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
