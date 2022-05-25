// To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    required this.id,
    required this.idUser,
    required this.date,
    required this.total,
    required this.status,
    required this.image,
  });

  int id;
  int idUser;
  String date;
  int total;
  String status;
  String image;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        idUser: json["id_user"],
        date: json["date"],
        total: json["total"],
        status: json["status"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_user": idUser,
        "date": date,
        "total": total,
        "status": status,
        "image": image,
      };
}
