import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/api/account.dart';
import 'package:flutter_application_7/screens/login_register/login/login_screen.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController confirmpassController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController fullnameController = new TextEditingController();
  TextEditingController gioitinhController = new TextEditingController();
  var _userErr = "Tài khoản không hợp lệ";
  var _passErr = "Mật khẩu phải trên 6 ký tự";
  var _emailErr = "Định dạng email không hợp lệ";
  var _confirmpassErr = "Mật khẩu không trùng khớp";
  var _userInvalid = false;
  var _passInvalid = false;
  var _confirmpassInvalid = false;
  var _emailInvalid = false;

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
               TextField(
                controller: userController,
                decoration: InputDecoration(                
                    border: OutlineInputBorder(),
                     labelText: "Tên đăng nhập",
                     errorText: _userInvalid ? _userErr : null,
                    ),
                    
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller:  emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                     labelText: "Email",
                     errorText: _emailInvalid ? _emailErr : null,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller:  phoneController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                     labelText: "Phone",
                     //errorText: _emailInvalid ? _emailErr : null,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller:  addressController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                     labelText: "Address",
                     //errorText: _emailInvalid ? _emailErr : null,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller:  fullnameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                     labelText: "Fullname",
                     //errorText: _emailInvalid ? _emailErr : null,
                    ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller:  gioitinhController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                     labelText: "Giới tính",
                     //errorText: _emailInvalid ? _emailErr : null,
                    ),
              ),
              
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: passController,
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
                    labelText: "Mật khẩu",
                    errorText: _passInvalid ? _passErr : null,
                    ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: confirmpassController,
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
                    labelText: "Nhập lại mật khẩu",
                    errorText: _confirmpassInvalid ? _confirmpassErr : null,
                    ),
                    
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
                      onPressed: () {
                        SignUpClick();
                        SignUp();
                      }, child: const Text('Đăng ký')),
                ),
              )
            ],

            //viettiepoday
          ),
        ),
      ),
    );
  }
  Future SignUp () async
  {
    Map<String ,String > data ={
      '_username' : userController.text,
      '_password'  : passController.text,
      '_email' : emailController.text,
      '_phone' : phoneController.text,
      '_address' : addressController.text,
      '_gioitinh' : gioitinhController.text,
      '_fullname' : fullnameController.text,
    };
    var res = await AccountReQuest.SingUp(data);
    if(res == 'Success')
    {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));
    }
    else
    {
      print("Khong thanh cong");
    }
  }
  void SignUpClick ()
{
  setState(() {
    if(userController.text.length < 6 )
    {
      _userInvalid = true;
    }
    else
    {
      _userInvalid = false;
    }

    if(passController.text.length < 6 )
    {
      _passInvalid = true;
    }
    else
    {
      _passInvalid = false;
    }

    if(emailController.text.length < 6 || !emailController.text.contains("@"))
    {
      _emailInvalid = true;
    }
    else
    {
      _emailInvalid = false;
    }

    if(confirmpassController.text.length < 6 || confirmpassController.text != passController.text)
    {
      _confirmpassInvalid = true;
    }
    else
    {
      _confirmpassInvalid = false;
    }
  });
}

}
