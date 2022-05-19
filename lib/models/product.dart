import 'package:flutter/material.dart';

class Product {
  final String img, name, description;
  final int price, stok, id;
  final Color color;
  Product({
    required this.id,
    required this.img,
    required this.name,
    required this.price,
    required this.description,
    required this.stok,
    required this.color,
  });
  String dummyText =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley. Voluptas ex delectus excepturi! Quidem laudantium sapiente, sit id illum earum itaque nobis.";
}

List<Product> products = [
  Product(
      id: 1,
      name: "Office Code",
      price: 52900,
      stok: 12,
      description: dummyText,
      img:
          "https://yt3.ggpht.com/-FJXWJ1x1bEQ/AAAAAAAAAAI/AAAAAAAAAAA/ZtyuZ-elFr4/s900-c-k-no-mo-rj-c0xffffff/photo.jpg",
      color: Color(0xFF3D82AE)),
  Product(
      id: 2,
      name: "Belt Bag",
      price: 45650,
      stok: 8,
      description: dummyText,
      img:
          "https://is5-ssl.mzstatic.com/image/thumb/Purple60/v4/93/9e/82/939e82b8-81e7-3b2b-2c3c-ce63d4bdec3c/source/512x512bb.jpg",
      color: Color(0xFFD3A984)),
  Product(
      id: 3,
      name: "Hang Top",
      price: 38900,
      stok: 10,
      description: dummyText,
      img:
          "https://i.pinimg.com/originals/28/8f/ab/288fab24c0f04e41ccd3c134161dcc1c.jpg",
      color: Color(0xFF989493)),
  Product(
      id: 4,
      name: "Old Fashion",
      price: 72900,
      stok: 11,
      description: dummyText,
      img:
          "https://ih1.redbubble.net/image.964483224.4096/flat,1000x1000,075,f.u8.jpg",
      color: Color(0xFFE6B398)),
  Product(
      id: 5,
      name: "Action Figure",
      price: 40000,
      stok: 12,
      description: dummyText,
      img: "https://clipground.com/images/random-things-clipart-1.jpg",
      color: Color(0xFFFB7883)),
  Product(
    id: 6,
    name: "LEGO Toy",
    price: 129000,
    stok: 12,
    description: dummyText,
    img:
        "https://yt3.ggpht.com/a/AATXAJxdWb7Z0-ShUl96soVgzy_QUTLpddTbBmcYbQ=s900-c-k-c0xffffffff-no-rj-mo",
    color: Color(0xFFAEAEAE),
  ),
];
String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley. Voluptas ex delectus excepturi! Quidem laudantium sapiente, sit id illum earum itaque nobis.";
