import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/Product.dart';
class NetWorkReQuest extends ChangeNotifier{
static List<Product> parseProducts(String response) { 
   var  parsed = json.decode(response) as List<dynamic>;
   return parsed.map<Product>((json) => Product.fromJson(json)).toList(); 
} 
static String host = "http://192.168.1.9:8000/api/";
  List<Product> products = [];
  List<Product> productByDate = [];
  
 Future<void> fetchProducts() async { 
  
  List<Product> product2 = [];
  var url = host + "product/danhsach";
   http.Response response = await  http.get(Uri.parse(url)); 
   if (response.statusCode == 200) { 
     dynamic jsondata = json.decode(response.body);
     dynamic data = jsondata["data"];
     data.forEach((i){
       product2.add(Product.fromJson(i));
     });
   } else { 
      throw Exception('Unable to fetch products from the REST API');
   } 
   products = product2;
   print(products.length);
   notifyListeners();
}
Future<void> ProductByDate() async { 
  
  List<Product> productByDate2= [];
  var url = host + "product/productbydate";
   http.Response response = await  http.get(Uri.parse(url)); 
   if (response.statusCode == 200) { 
     dynamic jsondata = json.decode(response.body);
     dynamic data = jsondata["data"];
     data.forEach((i){
       productByDate2.add(Product.fromJson(i));
     });
   } else { 
      throw Exception('Unable to fetch products from the REST API');
   } 
   productByDate = productByDate2;
   notifyListeners();
} 
}
