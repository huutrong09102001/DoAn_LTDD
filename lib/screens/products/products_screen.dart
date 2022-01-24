import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/screens/home/home_screen.dart';
import 'package:flutter_application_7/screens/products/components/body.dart'; 
class ProductsScreen extends StatelessWidget{
  final int  providerId;
  final String Categories;
  final int selected;
  final List<Account> account;
  const ProductsScreen({Key? key , required this.providerId , required this.Categories , required this.selected , required this.account}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: buildAppBar(context),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: kDefaultPaddin),
                  width:  double.infinity,
                  height: 200,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: kDefaultPaddin/2) ,
                        height: 70,
                        decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo_store.png"),
                          fit: BoxFit.cover,
    
                        ),
                        ),
                      ),
                      Text(
                        "Danh mục sản phẩm",
                        style: TextStyle(
                          color: kTextColor,
                          fontSize : 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Body(Id:providerId , categories: Categories,selected: selected,account: account,),
      ),
    ) ;
  }
 AppBar buildAppBar(BuildContext context){
  return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
             Icons.arrow_back,
                  color: kTextColor,
                  size: 20.0,
          ),
          onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomeScreen(account: account,)), (route) => false),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
             Icons.search,
                  color: kTextColor,
                  size: 20.0,
          ),
          onPressed: (){},
          ),
          IconButton(
            icon: Icon(
             Icons.add_shopping_cart,
                  color: kTextColor,
                  size: 20.0,
          ),
          onPressed: (){},
          ),
          SizedBox(width: kDefaultPaddin/ 2)
        ],

  );
}

}
