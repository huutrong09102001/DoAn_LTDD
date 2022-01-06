import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  get child => null;
  bool showPass = true;
  bool showConfigpass = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Center(
                child: Text(
                  "Đăng ký tài khoản",
                  style: TextStyle(
                    color: kTextColor,
                  ),
                ),
              ),
              const Divider(
                height: 10,
                color: (Colors.black),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'WELCOME TO TPT STORE',
                  style: TextStyle(
                    color: kTextColor,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Tên đăng nhập"),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Email"),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                obscureText: showPass,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showPass = !showPass;
                            print('$showPass');
                          });
                        },
                        icon: const Icon(Icons.visibility)),
                    border: const OutlineInputBorder(),
                    labelText: "Mật khẩu"),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: showConfigpass,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            showConfigpass = !showConfigpass;
                            print('$showConfigpass');
                          });
                        },
                        icon: const Icon(Icons.visibility)),
                    border: const OutlineInputBorder(),
                    labelText: "Nhập lại mật khẩu"),
              ),
              Padding(
                padding: const EdgeInsets.only(top : kDefaultPaddin),
                child: SizedBox(
                  height: 50,
                  width: 400,

                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen.withOpacity(0.7))
                    ),
                      onPressed: () {}, child: const Text('Đăng ký')),
                ),
              )
            ],

            //viettiepoday
          ),
        ),
      ),
    );
  }
}
