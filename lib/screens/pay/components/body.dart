import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/invoice.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/models/Cart.dart';
import 'package:flutter_application_7/screens/accounts/address/DCCT.dart';

class Body extends StatelessWidget {
  final int subToTal ;
  final int accountId;
  const Body({Key? key, required this.subToTal , required this.accountId}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      children: <Widget>[
        buildAddressContainer(size , context),
        SizedBox(height: 10),
        Container(
          width:  size.width,
          height: 40,
          decoration: BoxDecoration(
            color: kBackgroundColor,
            border: Border.all(color: Colors.lightGreen.withOpacity(0.7) , width: 2),
          ),
          child: Center(
            child: Text(
              "Chi tiết đơn hàng",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: kTextColor,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
          SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: carts.length,
              itemBuilder: (context , index ) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                child: DetailOrderItem(cart: carts[index]),
              ),

            ),
          ),   
      ],
    );
  }

  Container buildAddressContainer(Size size , BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightGreen, width: 2 ),
        
      ),
        width: size.width,
        height: 70,    
        child: Row(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: kDefaultPaddin / 2),
                  child: Row(
                    children: [
                      Icon(
                        Icons.maps_home_work,
                        size: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: kDefaultPaddin / 2),
                        child: Text(
                          "Địa chỉ nhận hàng",
                          style: TextStyle(
                            fontSize: 15,
                            color: kTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: kDefaultPaddin/2),
                  child: Text(
                    'Mai Chi Tho . Q2 , TPHCm',
                    style: TextStyle(
                      fontSize: 15,
                      color: kTextColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: kDefaultPaddin/2),
                  child: Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.account_circle,
                            size: 15,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: kDefaultPaddin / 2),
                            child: Text(
                              'Lê Hữu Trọng' + "  |",
                              style: TextStyle(
                                fontSize: 15,
                                color: kTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefaultPaddin),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.phone,
                              size: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: kDefaultPaddin / 2),
                              child: Text(
                                "0345643567",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: kTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left:5),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(kDetailColor),
                  ),
                onPressed: () => Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => DCCTScreen(),
                    ),
                    ) ,
                 child: Row(
                   children: [
                     Text(
                       "Thay đổi"
                     ),
                     Icon(
                       Icons.navigate_next,
                     )
                   ],
                 ),
                 ),
            ),
          ],
        ),
      );
  }

  
}
class DetailOrderItem extends StatelessWidget {
  const DetailOrderItem({
    Key? key,
    required this.cart,
  }) : super(key: key);

 
  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/4),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightGreen , width: 1),
          color: kBackgroundColor,
        ),
        width: 300,
        height: 70,
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              decoration:BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(cart.imageUrl),
                  fit: BoxFit.cover,
                ),
              ) ,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin/4),
              child: Column(
                children: [
                  Text(
                    cart.name,
                    style: TextStyle(
                      fontSize: 15,
                      color: kTextColor,
                    ),
                  ),
                  Text(
                    "Giá: " +cart.price.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(255, 0, 0, 0.7),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                  padding: const EdgeInsets.only(left:5),
                  child: Text(
                   "Số lượng: "+cart.quantity.toString(),
                    style: TextStyle(
                      fontSize: 15,
                      color: kTextColor,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }

  
}
