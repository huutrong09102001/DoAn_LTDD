import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/sanpham.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Product.dart';
import 'package:flutter_application_7/screens/details/details_screen.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Product> datalist = [];
  @override
  Widget build(BuildContext context) {
    var productapi = Provider.of<NetWorkReQuest>(context, listen: false);
    return ListView(
      children: <Widget>[
        Categories(),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 10.0, vertical: kDefaultPaddin),
          child: SizedBox(
            width: 260,
            height: 1000,
            child: FutureBuilder(
              future: productapi.fetchProducts(),
              builder: (context, AsyncSnapshot snapshot) {
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: productapi.products.length,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(kDefaultPaddin),
            height: 180,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(product!.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              product!.name,
              style: TextStyle(
                color: kTextColor.withOpacity(0.7),
                fontSize: 15.0,
              ),
            ),
          ),
          Text(
            "Giá : " + product!.price.toString() + "đ",
            style: TextStyle(
              color: kTextColor,
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Tất cả" ,"Samsung", "Iphone", "Oppo", "Xiaomi"];
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
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin/4 ),
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
                  color: selectedIndex == index ? Colors.black : Colors.transparent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
