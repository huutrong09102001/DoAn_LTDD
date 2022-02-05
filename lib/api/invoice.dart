import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/Cart.dart';
class InvoiceReQuest extends ChangeNotifier{
static List<Cart> parseProducts(String response) { 
   var  parsed = json.decode(response) as List<dynamic>;
   return parsed.map<Cart>((json) => Cart.fromJson(json)).toList(); 
}
static String host = "http://192.168.1.7:8000/api/";
 
 static Future<List<Cart>> getCartList (var data  ) async {
  List<Cart> acc = [];
  String url = host + "account/login";
   var response = await http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   if(response.statusCode == 200)
   {
     dynamic jsondata = json.decode(response.body);
     dynamic data = jsondata["data"];

     data.forEach((i){
       acc.add(Cart.fromJson(i));
     });
    
     return acc;
   }
   else
   {
     print(response.body);
     throw Exception("Fail");
   }
  
}



static _setHeader() => {
  'Content-type' : 'application/json; charset=utf-8',
  'Accept' : 'application/json'
};
static Future createInvoice (var data) async {
  
  var url = host + "invoice/newInvoice";
   http.Response response = await  http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   if (response.statusCode == 200) { 
     return true;
   } else {
     throw Exception('khong thanh cong');
    
   } 
  
}
static Future AddInvoiceDetail (var data) async {
  
  var url = host + "invoice/newInvoiceDetail";
   http.Response response = await  http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   if (response.statusCode == 200) { 
     return true;
   } else {
     throw Exception('khong thanh cong');
    
   } 
  
}
}