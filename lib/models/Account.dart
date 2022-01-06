import 'package:flutter/material.dart';
class Account {
  final String address , fullname , phone;
  Account({
    required this.address,
    required this.fullname,
    required this.phone,
  });
}
final List<Account> accounts = [
  Account(
    fullname: "Nguyễn Văn A",
   address: "62 Mai Chí Thọ , Q2 , TPHCM",
   phone: "0353445566",
  ),
  Account(
    fullname: "Nguyễn Văn B",
   address: "42 Huỳnh Thúc Kháng , Q1, TPHCM",
   phone: "0353445566",
  ),
  Account(
    fullname: "Nguyễn Văn C",
   address: "Q.Hoàn Kiếm, Hà Nội",
   phone: "0353445566",
  ),
  Account(
    fullname: "Nguyễn Văn D",
   address: "62 Đại Phước , Nhơn Trạch , Đồng Nai",
   phone: "0353445566",
  ),
];