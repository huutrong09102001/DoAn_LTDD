
import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/invoice.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/models/Product.dart';
import 'package:flutter_application_7/api/sanpham.dart';
import 'package:flutter_application_7/screens/details/details_screen.dart';
import 'package:flutter_application_7/screens/products/products_screen.dart';
import 'package:flutter_application_7/screens/products/components/body.dart';
import 'package:provider/provider.dart';


class Body extends StatefulWidget {
  final List<Account> account;

  const Body({Key? key,required this.account}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}
  class _BodyState extends State<Body> {
    
    @override
  Widget build(BuildContext context) {
    var productapi = Provider.of<NetWorkReQuest> (context ,
     listen: false );
     List<Product> productbyAPI = productapi.products;
     productapi.fetchProducts();
     productapi.ProductByDate();

     var invoiceapi = Provider.of<InvoiceReQuest>(context, listen: false);
    Map<String, String> data = {
      '_accountId': widget.account[0].id.toString(),
    };
    invoiceapi.getInvoiceListByAccountId(data);
    
    Size size = MediaQuery.of(context).size;
    return ListView(
    
      children: <Widget>[
        Container(
          height: size.height * 0.2,
          child: Stack(
            children: <Widget>[
              Container(
                height: size.height * 0.2 - 27,
                color: kBackgroundColor,
                child: Center(
                  child: Container(
                      width: 220,
                      height: 120,  
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo_store.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ),
              ),
              
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin/2),
          child: Container(
            
            child: Row(
              children: <Widget>[
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPaddin/4),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: ()=>Navigator.push(
                        context,
                         MaterialPageRoute(
                           builder: (context) => ProductsScreen(providerId: 1 , Categories: "Iphone",selected: 1,account: widget.account,product:productbyAPI,)
                           ),
                           ),
                      child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icons/icon_iphone.png"),
                          ),
                        ),
                      ),
                      ),
                      ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPaddin /4),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: ()=>Navigator.push(
                        context,
                         MaterialPageRoute(
                           builder: (context) =>ProductsScreen(providerId: 3 ,Categories: "Xiaomi",selected: 3,account: widget.account , product: productbyAPI,)
                         ),
                           
                           ),
      
                      child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icons/icon_xiaomi.png"),
                          ),
                        ),
                      ),
                      ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 4),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: ()=>Navigator.push(
                        context,
                         MaterialPageRoute(
                           builder: (context) => ProductsScreen(providerId: 2 ,Categories: "Samsung",selected: 2,account: widget.account,product: productbyAPI,)
                           ),
                           ),
                      child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icons/icon_samsung.png"),
                          ),
                        ),
                      ),
                      ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 4),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: ()=>Navigator.push(
                        context,
                         MaterialPageRoute(
                           builder: (context) => ProductsScreen(providerId: 4,Categories: "Oppo",selected: 2,account: widget.account, product: productbyAPI,)
                           ),
                           ),
                      child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icons/icon_oppo.png"),
                          ),
                        ),
                      ),
                      ),
                ),
              ],
            ),
          ),
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPaddin, horizontal: kDefaultPaddin),
              child: Text(
                'Sản phẩm  mới nhất',
                style: TextStyle(
                  color: kTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Container(
                  height: 20,
                  child: ElevatedButton(
                    style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                       MaterialPageRoute(
                         builder: (context) => ProductsScreen(providerId: 0 , Categories: "Tất cả sản phẩm",selected: 0,account: widget.account,product: productbyAPI,)
                         ),
                       ),
                    child: Text(
                      "Xem tất cả",
                      style: TextStyle(
                        color: kTextColor,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 300,
          width: 300,
          child: FutureBuilder(
              future: productapi.ProductByDate(),
              builder: (context, AsyncSnapshot snapshot) { 
                return GridView.builder(
              shrinkWrap: true,
              itemCount: productapi.productByDate.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin/4,
                crossAxisSpacing: kDefaultPaddin/4,
                childAspectRatio: 0.83,
              ),
              itemBuilder: (context, index) =>  ItemCard(
                      product: productapi.productByDate[index],
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              accountId: widget.account[0].id,
                                  product: productapi.productByDate[index],
                                )),
                      ),
                      accountId: widget.account[0].id,
                    ),
                  );
                  
              }
          ),
        ),
        /* Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: kDefaultPaddin, horizontal: kDefaultPaddin),
              child: Text(
                'Sản phẩm bán chạy',
                style: TextStyle(
                  color: kTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Container(
                  height: 20,
                  child: ElevatedButton(
                    style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductsScreen(providerId: 0)),
                    ),
                    child: Text(
                      "Xem tất cả",
                      style: TextStyle(
                        color: kTextColor,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ), */
        /* SizedBox(
          height: 260,
          width: 500,
          child: GridView.builder(
              shrinkWrap: true,
              itemCount:productapi.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPaddin/2,
                crossAxisSpacing: kDefaultPaddin/2,
                childAspectRatio: 0.75,
              ),
              itemBuilder: (context, index) =>  ItemCard(
                      product: productapi.products[index],
                      press: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                                  product: productapi.products[index],
                                ),
                                ),
                      ),
                    ),
                  )), */
      ],
    );
  }
}




