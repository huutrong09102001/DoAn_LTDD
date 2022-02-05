import 'package:flutter/material.dart';
class Cart{
final int accountId , productId , quantity , price , total;
final String name , imageUrl ;
Cart({
  required this.quantity,
  required this.name,
  required this.imageUrl,
  required this.price,
  required this.accountId,
  required this.productId,
  required this.total,
});
Cart.fromJson(Map<String, dynamic> json) : 
    accountId = json['accountId'],
    name  = json['productName'],
    productId = json['productId'],
    quantity = json['quantity'],
    price = json['price'],
    total = json['total'],
    imageUrl = json['imageUrl'];
    
    
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accountId'] = this.accountId;
    data['productId'] = this.productId;
    data['productName'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    data['total'] = this.total;
    
    return data;
  }
}
final List<Cart> carts= [
  Cart(
    name: "Điện thoại iPhone 12 64GB",
    quantity: 3,
    imageUrl: 'assets/images/IP12.jpg',
    price: 20490000,
    accountId:  2 ,
    productId:  2,
    total: 61470000

  ),
  Cart(
    name: "Samsung Galaxy Z Fold3",
    quantity: 2,
    imageUrl: 'assets/images/SSFold3.jpg',
    price: 20490000,
    accountId: 2,
    productId: 3,
    total:  61470000,
  ),
  Cart(
    name: "Xiaomi 11T 5G 256GB",
    quantity: 1,
    imageUrl: 'assets/images/XM11.jpg',
    price: 20490000,
    accountId: 2,
    productId: 4,
    total:  61470000,

  ),
];