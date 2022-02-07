class Invoice {
  int id , accountId, subtotal, status, productId, quantity , price , total;
   String imageUrl , name;

  Invoice(
      {
     required this.id,
     required this.accountId,
     required this.subtotal,
     required  this.price,
     required this.quantity,
     required this.status,
     required this.total,
     required this.productId,
     required this.imageUrl,
     required this.name,
     });

  Invoice.fromJson(Map<String, dynamic> json) : 
    id = json['id'],
    accountId = json['accountId'],
    subtotal = json['subtotal'],
    price = json['price'],
    quantity = json['quantity'],
    status = json['status'],
    total = json['total'],
    productId = json['productId'],
    name = json['name'],
    imageUrl = json['imageUrl'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['accountId'] = this.accountId;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    data['total'] = this.total;
    data['subtotal'] = this.subtotal;
    data['imageUrl'] = this.imageUrl;
    data['productId'] = this.productId;
    return data;
  }
}