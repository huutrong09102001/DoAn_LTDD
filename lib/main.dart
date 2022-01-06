
import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/sanpham.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Cart.dart';
import 'package:flutter_application_7/screens/cart/cart_shop.dart';
import 'package:flutter_application_7/screens/home/home_screen.dart';
import 'package:flutter_application_7/screens/pay/pay_screen.dart';
import 'package:flutter_application_7/screens/products/products_screen.dart';
import 'package:flutter_application_7/screens/login_register/login/login_screen.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(providers:[
    ChangeNotifierProvider(create: (context) => NetWorkReQuest())
  ],
  child:  const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}


