import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/sanpham.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Product.dart';
import 'package:flutter_application_7/screens/cart/cart_shop.dart';
import 'package:flutter_application_7/screens/details/details_screen.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  final int Id;

   const Body({Key? key, required this.Id}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    var productapi = Provider.of<NetWorkReQuest>(context, listen: false);
    List<Product> productByProviderId = [];
    if(Id == 0)
    {
      productByProviderId = productapi.products;
    }
    else if(Id == 1)
    {
      for(var item in productapi.products)
      {
        if(item.providerId ==1)
        productByProviderId.add(item);
      }
    }
    if(Id == 4)
    {
      for(var item in productapi.products)
      {
        if(item.providerId ==4)
        productByProviderId.add(item);
      }
    }
    if(Id == 2)
    {
      for(var item in productapi.products)
      {
        if(item.providerId ==2)
        productByProviderId.add(item);
      }
    }
    if(Id == 3)
    {
      for(var item in productapi.products)
      {
        if(item.providerId ==3)
        productByProviderId.add(item);
      }
    }
    
    return ListView(
      children: <Widget>[
        //Categories(),
        SizedBox(
          width: 260,
          height: 600,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10.0, vertical: kDefaultPaddin),
            child: FutureBuilder(
              future: productapi.fetchProducts(),
              builder: (context, AsyncSnapshot snapshot) {
                return GridView.builder(
                  shrinkWrap: true,
                  itemCount: productByProviderId.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin / 2,
                    crossAxisSpacing: kDefaultPaddin / 2,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                    product: productByProviderId[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                                product: productByProviderId[index],
                              )),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class ItemCard extends StatelessWidget {
  final Product? product;
  final Function()? press;
  const ItemCard({
    Key? key,
    this.product,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: kTextColor, width: 2),
            borderRadius: BorderRadius.circular(12)),
            //color: Color.fromRGBO(200, 226, 177, 0.8) ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 218,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(kDefaultPaddin/4),
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                            
                            borderRadius: BorderRadius.circular(16),
                            image: DecorationImage(
                              image: NetworkImage("http://192.168.1.7:8000/storage/"+product!.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
                    child: Text(
                      product!.name,
                      style: TextStyle(
                        color: kTextColor.withOpacity(0.7),
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                      ],
                    ),
                  ),
                  
                  Text(
                    "Giá : " + product!.price.toString() + "đ",
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 160,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(kDetailColor),
                  ),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartShop(),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4),
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
                          padding: const EdgeInsets.only(left: kDefaultPaddin / 4),
                          child: Icon(
                            Icons.shopping_cart,
                            size: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
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

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Tất cả", "Samsung", "Iphone", "Oppo", "Xiaomi"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategories(index),
      ),
    );
  }

  Widget buildCategories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 4),
        child: SingleChildScrollView(
          child: Container(
            width: 70,
            height: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  categories[index],
                  style: TextStyle(
                    color: selectedIndex == index ? Colors.black : kTextColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: kDefaultPaddin / 4),
                  height: 2,
                  width: 35,
                  color: selectedIndex == index
                      ? Colors.black
                      : Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
