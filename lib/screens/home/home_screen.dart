import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Product.dart';
import 'package:flutter_application_7/screens/accounts/user_info/TTCN.dart';
import 'package:flutter_application_7/screens/blog/blog.dart';
import 'package:flutter_application_7/screens/home/components/body.dart';
import 'package:flutter_application_7/screens/cart/cart_shop.dart';
import 'package:flutter_application_7/screens/notify/notify.dart';
import 'package:flutter_application_7/screens/accounts/user_info/TTTK.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
  class _HomeScreenState extends State<HomeScreen> {
  int pageIndex =0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.lightGreen,
      backgroundColor: kBackgroundColor,
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        print(index);
        Navigator.push(
          context,
           PageRouteBuilder(
             pageBuilder: (context ,animation ,second){
               if (index == 0)
               {
               return Body();
               }
               if(index == 1)
               {
               return BlogScreen();
               }
               if(index == 2)
               {
               return NotiFy();
               }
               if(index == 3)
               {
                 return TTCNScreen();
               }
               return Body();

             },
           ),
        );
      },
      
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Trang chủ",
            backgroundColor: kTextColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Tin tức",
            backgroundColor: kTextColor),
        BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Thông báo",
            backgroundColor: kTextColor),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage('assets/images/HuChong.jpg'),
            ),
            label: "Tài khoản"),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor:kBackgroundColor,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.black,
          size: 20.0,
        ),
        onPressed: () {},
      ),
      actions: <Widget>[
        
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 60, right: 50),
                    height: 35,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: kTextColor , width: 1)
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: 'Nhập từ khóa cần tìm ...',
                          hintStyle: TextStyle(
                            color: kTextColor.withOpacity(0.5),
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          suffixIcon: IconButton(
                          splashRadius: 15,
                            icon: Icon(
                              Icons.search,
                              color: kTextColor,
                            ),
                            onPressed: (){},
                          ),
                        ),
                      ),
                    ),
                  ),
                ),  
              Row(
                  children: <Widget>[
                    IconButton(
                      splashRadius: 20,
                      onPressed: () => Navigator.push(
                        context,
                         MaterialPageRoute(
                           builder: (context) => CartShop(),
                           ),
                        ),
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 30.0,
                        color: kTextColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: IconButton(
                        splashRadius: 20,
                        onPressed: () {},
                        icon: Icon(
                          Icons.chat,
                          size: 30.0,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
      ],
    );
  }
}