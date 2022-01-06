import 'package:flutter/material.dart';
import 'package:flutter_application_7/models/Cart.dart';
import 'package:flutter_application_7/screens/pay/components/body.dart';
import '../../constants.dart';

class PayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          color: kBackgroundColor.withOpacity(1),
          border: Border.all(color: Colors.lightGreen, width: 1),
        ),
        child: Row(
          children: [
            Column(
              children:  <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10, left: kDefaultPaddin,
                          ),
                      child: Text.rich(
                        TextSpan(
                          text: "Thành tiền: ",
                          children: [
                            TextSpan(
                              text: "15.490.000đ",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 0, 0, 0.7),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10, left: kDefaultPaddin,
                          ),
                      child: Text.rich(
                        TextSpan(
                          text: "Phí giao hàng: ",
                          children: [
                            TextSpan(
                              text: "24.000đ",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 0, 0, 0.7),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10, left: kDefaultPaddin,
                          ),
                      child: Text.rich(
                        TextSpan(
                          text: "Tổng thanh toán: ",
                          children: [
                            TextSpan(
                              text: "15.514.000đ",
                              style: TextStyle(
                                color: Color.fromRGBO(255, 0, 0, 0.7),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    width: 150,
                    height: 40,
                    
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(kDetailColor)
                        ),
                        onPressed: (){},
                        child: Row(
                          children: [
                            Text(
                              "Đặt hàng",
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Icon(
                                Icons.shopping_cart,
                                size: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                
          ],
        ),
        ),
      );
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Center(
      child: Text(
        "Thanh toán",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: kTextColor,
          fontSize: 20,
        ),
      ),
    ),
    backgroundColor: kBackgroundColor,
    elevation: 0,
    leading: IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: kTextColor,
        size: 20.0,
      ),
      onPressed: () => Navigator.pop(context),
    ),
  );
}
