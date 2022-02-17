
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_7/api/sanpham.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:flutter_application_7/models/Account.dart';
import 'package:flutter_application_7/models/Product.dart';
import 'package:flutter_application_7/screens/cart/cart_shop.dart';
import 'package:flutter_application_7/screens/details/details_screen.dart';
import 'package:flutter_application_7/screens/products/products_screen.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  final int Id;
  final String categories;
  final int selected;
  final List<Account> account;
  final List<Product> product;
   const Body({Key? key, required this.Id , required this.categories, required this.selected, required this.account , required this.product}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}
class _BodyState extends State<Body>{
  var isDescending = false;
  @override
  Widget build(BuildContext context) {
    
   
    var productapi = Provider.of<NetWorkReQuest>(context, listen: false);
    productapi.fetchProducts();
    List<Product> productByProviderId = [];
    if(widget.Id == 0)
    {
      productByProviderId = widget.product;
    }
    else if(widget.Id == 1)
    {
      for(var item in widget.product)
      {
        if(item.providerId ==1)
        productByProviderId.add(item);
      }
    }
    if(widget.Id == 4)
    {
      for(var item in widget.product)
      {
        if(item.providerId ==4)
        productByProviderId.add(item);
      }
    }
    if(widget.Id == 2)
    {
      for(var item in widget.product)
      {
        if(item.providerId ==2)
        productByProviderId.add(item);
      }
    }
    if(widget.Id == 3)
    {
      for(var item in widget.product)
      {
        if(item.providerId ==3)
        productByProviderId.add(item);
      }
    }
    
  
    
    return ListView(
      children: <Widget>[
        Categories(selected: widget.selected, account:widget.account, product: widget.product,),
        Container(
          width: 50,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.lightGreen,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 5 , left : 170),
            child: Text(
              widget.categories,
              style: TextStyle(
                fontSize: 20,
                color : Colors.yellow,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin/4),
          child: Row(
            children: [
              Container(
                width:  50,
                height: 30,
                child: Icon(Icons.filter_list_outlined),
              ),
              ElevatedButton(
                onPressed: (){
                  setState(() {
                    isDescending = !isDescending;
                  });
                  print(isDescending);              
                },
                 child: Row(
                  children: [
                    Text(
                      isDescending ? "Giá thấp dần" : "Giá tăng dần",
                    ),
                    Icon(Icons.compare_arrows)
                  ],
                 ), 
              ),
                   
            ],
          ),
        ),
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
                  itemCount:  productByProviderId.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultPaddin / 4,
                    crossAxisSpacing: kDefaultPaddin / 4,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final sortItem = isDescending ? productByProviderId.reversed.toList() : productByProviderId;
                    return ItemCard(
                    product: sortItem[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            accountId: widget.account[0].id,
                                product: sortItem[index],
                              )),
                    ),
                    accountId: widget.account[0].id,
                  );
                  }
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
  final int  accountId;
  const ItemCard({
    Key? key,
    this.product,
    this.press,
     required this.accountId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        height: 150,
        
        decoration: BoxDecoration(
            border: Border.all(color: kTextColor, width: 2),
            borderRadius: BorderRadius.circular(12)),
            //color: Color.fromRGBO(200, 226, 177, 0.8) ,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 200,
              child: Column(
                children: [
                  SizedBox(
                    height: 166,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(kDefaultPaddin/4),
                          height: 120,
                          width: 300,
                          decoration: BoxDecoration(                        
                            borderRadius: BorderRadius.circular(16),
                            
                          ),
                          child: CachedNetworkImage(
                            imageUrl: imageHost + product!.imageUrl,
                            fit: BoxFit.fill,
                            placeholder: (context , url ) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context , url , error) => Container(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical:5),
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
                      builder: (context) => CartShop(accountId: accountId,),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 3),
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
   final int selected;
   final List<Account> account;
   final List<Product> product;
  const Categories({Key? key, required this.selected , required this.account , required this.product}) : super(key: key);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Tất cả", "Iphone", "Samsung", "Xiaomi", "oppo"];

  @override
  Widget build(BuildContext context) {
    int selectedIndex = widget.selected;
    return SizedBox(
      height: 30,
      width : 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => buildCategories(index,selectedIndex , context  ,widget.account ,widget.product ),
      ),
    );
  }

  Widget buildCategories(int index , int selectedIndex ,BuildContext context , var account , var product) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        var categories ="";
        if(index == 0)
        {
          categories = "Tất cả";
        }
        else if (index ==1)
        {
          categories = "Iphone";
        }
        else if (index ==2)
        {
          categories = "Samsung";
        }
        else if (index ==3)
        {
          categories = "Xiaomi";
        }
        else if (index ==4)
        {
          categories = "Oppo";
        }
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context )=> ProductsScreen(providerId: index, Categories:categories ,selected: selectedIndex, account:account, product: product ,)),
          
           );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin / 4),
        child: SingleChildScrollView(
          child: Container(
            width: 70,
            height: 50,
            decoration: BoxDecoration(
              border: Border.symmetric(vertical: BorderSide(color: kTextColor , width: 1))
            ),
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
