import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/sanpham.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/models/Product.dart';
import 'package:flutter_application_7/screens/accounts/user_info/TTCN.dart';
import 'package:flutter_application_7/screens/blog/blog.dart';
import 'package:flutter_application_7/screens/details/details_screen.dart';
import 'package:flutter_application_7/screens/home/components/body.dart';
import 'package:flutter_application_7/screens/cart/cart_shop.dart';
import 'package:flutter_application_7/screens/notify/notify.dart';
import 'package:flutter_application_7/screens/accounts/user_info/TTTK.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final List<Account> account;
 
  HomeScreen({Key? key , required this.account}) : super(key: key);

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
      body: Body(account: widget.account,),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );

  }
  AnimatedBuilder buildAnimation(Widget widget , var animation) {
    return AnimatedBuilder(
      child: widget,
      animation:animation ,
      builder: (context , child){
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1, 0),
            end: Offset(0,0),
            ).animate(animation),
            child: child,
          );
      },
      );
  }

  BottomNavigationBar buildBottomNavigationBar(BuildContext context ) {
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
               return buildAnimation(widget, animation);
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
                 return TTCNScreen(account:widget.account,animation: animation,);
               }
               return buildAnimation(widget, animation);

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
        
                IconButton(
                          splashRadius: 20,
                            icon: const Icon(
                              Icons.search,
                              color: kTextColor,
                            ),
                            onPressed: (){
                              showSearch(context: context,
                               delegate: CustomSearch(),
                               );
                            },
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
                      icon: const Icon(
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
                        icon: const Icon(
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

class CustomSearch extends SearchDelegate {
  
  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return [
      IconButton(
        onPressed: (){
          query ="";
        },
         icon: const Icon(Icons.clear),
         ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, null);
      }, 
      icon: const Icon(Icons.arrow_back),
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var productapi = Provider.of<NetWorkReQuest> (context ,
     listen: false );
      
    List<Product> matchQuery = [];
    for(var item in  productapi.products)
    {
      if(item.name.toLowerCase().contains(query.toLowerCase()))
      {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context , index) {
        var result = matchQuery[index];
        return ListTile(
          title :TextButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder:(context)=>DetailsScreen(product: matchQuery[index]),
                ),
              );
            },
            child: Text(
              result.name,
              style: TextStyle(
                fontSize: 17,
                color:  kTextColor,
              ),
              ),
          )
        );
      }
      );
  }
  
  @override
  Widget buildResults(BuildContext context) {
     var productapi = Provider.of<NetWorkReQuest> (context ,
     listen: false );
     List<Product> matchQuery = [];
    for(var item in  productapi.products)
    {
      if(item.name.toLowerCase().contains(query.toLowerCase()))
      {
        matchQuery.add(item);
      }
    }
   return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context , index) {
        var result = matchQuery[index];
        return ListTile(
          title : TextButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder:(context)=>DetailsScreen(product: matchQuery[index]),
                ),
              );
            },
            child: Text(
              result.name,
              style: TextStyle(
                fontSize: 20,
                
              ),
            ),
          )
        );
      }
      );
  }
}
