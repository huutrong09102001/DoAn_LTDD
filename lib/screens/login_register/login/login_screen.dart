import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/api/account.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/screens/home/home_screen.dart';
import 'package:flutter_application_7/screens/login_register/register/registerpage.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var _usernameErr = "Tài khoản không hợp lệ";
  var _passErr = "Mật khẩu phải trên 6 ký tự";
  var _usernameInvalid = false;
  var _passwordInvalid = false;

  bool showPass1 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor ,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Text(
                    'WELCOME TO TPTSTORE',
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
                Text(
                  'Login',
                  style: TextStyle(
                    
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: kTextColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/Facebook_logo_36x36.svg/240px-Facebook_logo_36x36.svg.png",
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Facebook')
                      ],
                    ),
                    Column(
                      children: [
                        Image.network(
                          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2048px-Google_%22G%22_Logo.svg.png",
                          width: 50,
                          height: 50,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Google')
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                       TextField(
                        controller: usernameController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                             labelText: "Nhập Email",
                             errorText: _usernameInvalid ? _usernameErr : null,

                             ),
                            
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        obscureText: showPass1,
                        controller: passwordController,
                        decoration: InputDecoration(
                          errorText: _passwordInvalid ? _passErr : null,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    showPass1 = !showPass1;
                                    print('$showPass1');
                                  });
                                },
                                icon: const Icon(Icons.visibility)),
                            border: const OutlineInputBorder(),
                            labelText: "Nhập mật khẩu"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: 400,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.lightGreen.withOpacity(0.7),
                                ),
                                ),
                            onPressed: (){
                              SigninClick();
                              Login();
                            }, /* Navigator.push(
                              context,
                             MaterialPageRoute(builder: (context)=> HomeScreen())), */
                            child: const Text(
                              "Đăng Nhập",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=> RegisterPage()),
                            );
                          },
                          child: const Text(
                            'Tạo tài khoản mới ',
                            style: TextStyle(
                              color: kTextColor,
                            ),
                          ),
                          ),
                      TextButton(
                          onPressed: () {}, child: const Text(
                            'Quên mật khẩu ',
                            style: TextStyle(
                              color: kTextColor,
                            ),
                          ),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future Login() async
  {
    Map<String ,String > data ={
      '_username' : usernameController.text,
      '_password'  : passwordController.text,
      
    };
    List<Account> res = await AccountReQuest.login(data);
    if( res.length == 1)
    {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(account: res,)));
      
    }
    else
    {
      print("Khong thanh cong");
    }
  }
  void SigninClick ()
{
  setState(() {
    if(usernameController.text.length < 6 )
    {
      _usernameInvalid = true;
    }
    else
    {
      _usernameInvalid = false;
    }

    if(passwordController.text.length < 6 )
    {
      _passwordInvalid = true;
    }
    else
    {
      _passwordInvalid = false;
    }
  });
}
 
}
