import 'package:flutter/material.dart';
class Cart{
final int quantity , price;
final String name , imageUrl;
Cart({
  required this.quantity,
  required this.name,
  required this.imageUrl,
  required this.price,
});
}
final List<Cart> carts= [
  Cart(
    name: "Điện thoại iPhone 12 64GB",
    quantity: 3,
    imageUrl: 'assets/images/IP12.jpg',
    price: 20490000,
  ),
  Cart(
    name: "Samsung Galaxy Z Fold3",
    quantity: 2,
    imageUrl: 'assets/images/SSFold3.jpg',
    price: 20490000,
  ),
  Cart(
    name: "Xiaomi 11T 5G 256GB",
    quantity: 1,
    imageUrl: 'assets/images/XM11.jpg',
    price: 20490000,
  ),
];