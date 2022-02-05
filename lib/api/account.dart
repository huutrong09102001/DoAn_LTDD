import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../models/Account.dart';
class AccountReQuest extends ChangeNotifier{
static List<Account> parseProducts(String response) { 
   var  parsed = json.decode(response) as List<dynamic>;
   return parsed.map<Account>((json) => Account.fromJson(json)).toList(); 
}
static String host = "http://192.168.1.7:8000/api/";
 
 static Future<List<Account>>   login (var data  ) async {
  List<Account> acc = [];
  String url = host + "account/login";
   var response = await http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   if(response.statusCode == 200)
   {
     dynamic jsondata = json.decode(response.body);
     dynamic data = jsondata["data"];

     data.forEach((i){
       acc.add(Account.fromJson(i));
     });
    
     return acc;
   }
   else
   {
     print(response.body);
     throw Exception("Fail");
   }
  
}


static Future SingUp (var data ) async {
  String url = host + "account/signup";
 var response = await http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   if(response.statusCode == 200)
   {
     return 'Success';
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
static Future<String> getListUsername (var data) async {
  String username ;
  var url = host + "account/getListUsername";
   http.Response response = await  http.post(Uri.parse(url),
   headers: _setHeader(),
   body: jsonEncode(data));
   if (response.statusCode == 200) { 
     dynamic jsondata = json.decode(response.body);
     dynamic data = jsondata["data"];
     username = data;
     print(username);
     return username;
   } else { 
      throw Exception('Unable to fetch products from the REST API');
   } 
  
}
}