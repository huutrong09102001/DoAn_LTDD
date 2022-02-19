import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_7/models/Cart.dart';
import 'package:flutter_application_7/constants.dart';
import 'package:http/http.dart' as http;

class Cartaccount extends ChangeNotifier {
  static List<Cart> parseCart(String response) {
    var parsed = json.decode(response) as List<dynamic>;
    return parsed.map<Cart>((json) => Cart.fromJson(json)).toList();
  }

  static String host = "http://192.168.102.23:8000/api/";
  List<Cart> cart1 = [];
  Future<void> GetListCart(var data) async {
    List<Cart> cart = [];
    String url = host + "cart/layGioHang";
    var response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    if (response.statusCode == 200) {
      dynamic jsondata = json.decode(response.body);
      dynamic data = jsondata["accountID"];

      data.forEach((i) {
        cart.add(Cart.fromJson(i));
      });

      cart1 = cart;
      notifyListeners();
    } else {
      print(response.statusCode);
      throw Exception("Fail");
    }
  }
  static Future deletesanpham(var data) async {
    String url = host + "cart/deleteCartItem";
    var response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    if (response.statusCode == 200) {
      print('thanh cong');
      return true;
    } else {
      throw Exception("Fail");
    }
  }
  static Future Updatesanpham(var data) async {
    String url = host + "cart/updateQuantity";
    var response = await http.post(Uri.parse(url),
        headers: _setHeader(), body: jsonEncode(data));
    if (response.statusCode == 200) {
      print('thanh cong');
      return true;
    } else {
      throw Exception("Fail");
    }
  }

  static _setHeader() => {
        'Content-type': 'application/json; charset=utf-8',
        'Accept': 'application/json'
      };
}

Future NewCartItem(var data) async {
  String url = host + "cart/Themgiohang";
  var response = await http.post(Uri.parse(url),
      headers: _setHeader(), body: jsonEncode(data));
  if (response.statusCode == 200) {
    return true;
  } else {
    throw Exception("Fail");
  }
}

_setHeader() => {
      'Content-type': 'application/json; charset=utf-8',
      'Accept': 'application/json'
    };
