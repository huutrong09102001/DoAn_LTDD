
import 'package:flutter/material.dart';
import 'package:flutter_application_7/screens/pay/pay_screen.dart';

class CartShop extends StatefulWidget {
  final int accountId;
  const CartShop({Key? key , required this.accountId}) : super(key: key);
  @override
  _CartShopState createState() => _CartShopState();
}

class _CartShopState extends State<CartShop> {
  int count = 1;
  bool Ncc = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  "Giỏ hàng của tôi ",
                  style: TextStyle(),
                ),
              ),
            ),
            const Divider(
              height: 5,
              color: Colors.black,
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(1, (index) {
                return Row(
                  children: [
                    Checkbox(
                        value: Ncc,
                        onChanged: (bool? value) {
                          setState(() {
                            Ncc = !Ncc;
                          });
                        }),
                    Image.network(
                      "https://cdn.tgdd.vn/Files/2020/06/08/1261696/moi-tai-bo-hinh-nen-asus-rog-2020-moi-nhat_800x450.jpg",
                      width: 150,
                      height: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: SizedBox(
                        height: 80,
                        child: Column(
                          children: [
                            const Text('Ten san pham'),
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        count = count - 1;
                                        print(count);
                                      });
                                    },
                                    icon: const Icon(Icons.remove)),
                                Text("$count"),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        count++;
                                        print(count);
                                      });
                                    },
                                    icon: const Icon(Icons.add)),
                              ],
                            ),
                            const Text('2000000'),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.delete))
                      ],
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Row(
          children: [
            Row(
              children: [
                Checkbox(
                    value: Ncc,
                    onChanged: (bool? value) {
                      setState(() {
                        Ncc = !Ncc;
                      });
                    }),
                const Text("Chon tat ca"),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: const [
                    Text("Tong cong:"),
                    SizedBox(
                      width: 10,
                    ),
                    Text("2000000"),
                  ],
                ),
                Row(
                  children: const [
                    Text("Phi van chuyen"),
                    SizedBox(
                      width: 10,
                    ),
                    Text("50000"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(onPressed: ()=> Navigator.push(
              context,
               MaterialPageRoute(builder: (context)=> PayScreen(accountId:  widget.accountId,))
              ), 
            child: const Text("Thanh Toan"),
            ),
          ],
        ),
      ),
    );
  }
}
