import 'package:flutter/material.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/models/Product.dart';
import 'package:flutter_application_7/screens/details/components/body.dart';
import 'package:flutter_application_7/screens/cart/cart_shop.dart';
import 'package:flutter_application_7/screens/pay/pay_screen.dart';

class DetailsScreen extends StatelessWidget{
  final Product product;
  final int accountId;
  const DetailsScreen({Key? key, required this.product , required this.accountId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: buildAppBar(context),
      body: Body(product: product,) ,
      bottomSheet: buildBottomSheet(context),
    );
  }

  Row buildBottomSheet(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(kDetailColor),
                          ),
                          onPressed: (){},
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin/2),
                             child: Row(
                               children: <Widget>[
                                 Text(
                                   "Thêm vào giỏ",
                                   style: TextStyle(
                                     color: Colors.white,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: kDefaultPaddin/2),
                                   child: Icon(
                                     Icons.shopping_cart,
                                     size: 24,
                                     color: Colors.white,
                                   ),
                                 ),
                               ],
                             ),
                           ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(kDetailColor),
                          ),
                          onPressed: ()=> Navigator.push(
                            context,
                             MaterialPageRoute(builder: (context) => PayScreen(accountId: accountId,)
                             ),
                             ),
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin/2),
                             child: Row(
                               children: <Widget>[
                                 Text(
                                   "Mua ngay",
                                   style: TextStyle(

                                     color: Colors.white,
                                     fontWeight: FontWeight.bold,
                                   ),
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(left: kDefaultPaddin/2),
                                   child: Icon(
                                     Icons.shopping_cart,
                                     size: 24,
                                     color: Colors.white,
                                   ),
                                 ),
                               ],
                             ),
                           ),
          ),
        ),
      ],
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundColor,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
        color: kTextColor,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Center(
        child: Text(
          product.name,
          style: TextStyle(
            color:  Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
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
        //SizedBox(width: kDefaultPaddin/ 2)
      ],
    );
  }
}