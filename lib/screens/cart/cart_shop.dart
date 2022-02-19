import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/cart.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Cart.dart';
import 'package:flutter_application_7/screens/pay/pay_screen.dart';
import 'package:provider/provider.dart';

class CartShop extends StatefulWidget {
  final int accountId;
  const CartShop({Key? key, required this.accountId}) : super(key: key);
  @override
  _CartShopState createState() => _CartShopState();
}

class _CartShopState extends State<CartShop> {
  bool Ncc = false;
  @override
  Widget build(BuildContext context) {
    int subtotal = 0;
    Map<String, String> data = {
      '_accountId': widget.accountId.toString(),
    };
    var Cartapi = Provider.of<Cartaccount>(context, listen: false);

    Cartapi.GetListCart(data);
    List<Cart> CartAPI = Cartapi.cart1;
    print(CartAPI);
    for (var item in CartAPI) {
      subtotal = subtotal + (item.price * item.quantity);
    }
    print(widget.accountId.toString());
    print(CartAPI.length);
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Giỏ hàng của tôi ",
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
      ),
      body: FutureBuilder(
          future: Cartapi.GetListCart(data),
          builder: (context, AsyncSnapshot snapshot) {
            return ListView.builder(
              itemCount: CartAPI.length,
              itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 4),
                child: CartItem(
                  cart: CartAPI[index],
                  accountId: widget.accountId,
                ),
              ),
            );
          }),
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
                  children: [
                    Text("Tong cong:"),
                    SizedBox(
                      width: 10,
                    ),
                    Text(subtotal.toString()),
                  ],
                ),
                Row(
                  children: const [
                    Text("Phi van chuyen"),
                    SizedBox(
                      width: 10,
                    ),
                    Text("20000"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PayScreen(
                        accountId: widget.accountId,
                        carts: CartAPI,
                        subtotal: subtotal)),
              ),
              child: Text("Thanh Toan"),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  const CartItem({
    Key? key,
    required this.cart,
    required this.accountId,
  }) : super(key: key);

  final Cart cart;
  final int accountId;
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  bool Ncc = false;
  int count = 0;
  int check = 0;
  @override
  void initState() {
    super.initState();
    count = widget.cart.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightGreen, width: 1),
          color: kBackgroundColor,
        ),
        width: 400,
        height: 87,
        child: Row(
          children: <Widget>[
            Container(
              width: 100,
              child: CachedNetworkImage(
                imageUrl: imageHost + widget.cart.imageUrl,
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => Container(
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  widget.cart.name,
                  style: TextStyle(
                    fontSize: 15,
                    color: kTextColor,
                  ),
                ),
                Text(
                  "Giá: " + widget.cart.price.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromRGBO(255, 0, 0, 0.7),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          setState(() {
                            count = count - 1;
                            print(count);
                          });
                        },
                        icon: const Icon(
                          Icons.remove,
                          size: 15,
                        )),
                    Text(
                      "$count",
                      style: TextStyle(fontSize: 15),
                    ),
                    IconButton(
                        onPressed: () async {
                          setState(() {
                            count++;
                          });
                          Map<String, String> data = {
                            '_accountId': widget.accountId.toString(),
                            '_productId': widget.cart.productId.toString(),
                          };
                          var checkCong = Cartaccount.Updatesanpham(data);
                          /*if (checkCong == true) {
                            var Cartapi = Provider.of<Cartaccount>(context,
                                listen: false);
                            Map<String, String> data = {
                              '_accountId': widget.accountId.toString(),
                            };
                            Cartapi.GetListCart(data);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        CartShop(accountId: widget.accountId)));
                          }*/
                        },
                        icon: const Icon(Icons.add, size: 15)),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
                onPressed: () async {
                  Map<String, String> data = {
                    '_accountId': widget.accountId.toString(),
                    '_productId': widget.cart.productId.toString(),
                  };
                  var checkDelete = await Cartaccount.deletesanpham(data);
                  if (checkDelete = true) {
                    var Cartapi =
                        Provider.of<Cartaccount>(context, listen: false);

                    Cartapi.GetListCart(data);
                    List<Cart> CartAPI = Cartapi.cart1;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CartShop(accountId: widget.accountId)));
                  }
                },
                icon: const Icon(Icons.delete),
                iconSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
