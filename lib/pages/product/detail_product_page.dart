// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:main/API/api_services.dart';
import 'package:main/models/detail_product.dart';
import 'package:main/models/product.dart';
import 'package:main/pages/cart/cart_page.dart';
import 'package:main/utils/colors.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/widgets/product_text.dart';
import 'package:main/widgets/small_text.dart';

class DetailProductPage extends StatefulWidget {
  int id, price, stock;
  String name, description, image;
  // bool isFavorite;
  DetailProductPage(
      {Key? key,
      required this.id,
      required this.price,
      required this.stock,
      required this.name,
      required this.description,
      // required this.isFavorite,
      this.image =
          "https://thumbs.dreamstime.com/b/flat-isolated-vector-eps-illustration-icon-minimal-design-long-shadow-error-file-not-found-web-118526724.jpg"})
      : super(key: key);

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  // double _height = MediaQuery.of().size.height;
  static int qty = 1;
  List<Product> data = [];
  // String image = DetailProduct.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataProduct(widget.id);
    setState(() {});
  }

  void getDataProduct(int id) async {
    final response = await ApiService().getDetailProduct(id);
    data.addAll(response);
    setState(() {});
  }

  void _decrement() {
    setState(() {
      if (qty == 1) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 3),
          content: Text("Minimum pembelian adalah 1 !"),
          backgroundColor: Colors.red,
        ));
      } else {
        qty--;
      }
    });
  }

  void _increment() {
    setState(() {
      if (qty == widget.stock) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 3),
          content: Text("Batas maximum pembelian terpenuhi!"),
          backgroundColor: Colors.red,
        ));
      } else {
        qty++;
      }
    });
  }

  void addToCart() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 3),
      content: Text("Berhasil menambahkan $qty ke keranjang"),
      backgroundColor: Colors.red,
    ));
  }

  @override
  Widget build(BuildContext context) {
    // Product data;
    return Scaffold(
        backgroundColor: bgWhite,
        body: SafeArea(
            child: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: double.maxFinite,
                  height: 60,
                  color: white,
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            size: 30,
                          ),
                          color: primaryColor,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: SmallText(
                              text: widget.name,
                              size: 18,
                              weight: FontWeight.w500,
                              align: TextAlign.center,
                            )),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              // DetailPage adalah halaman yang dituju
                              MaterialPageRoute(
                                  builder: (context) => CartPage()),
                            );
                          },
                          icon: Icon(
                            Icons.shopping_cart_rounded,
                            size: 28,
                          ),
                          color: primaryColor,
                        ),
                      ]),
                ),
                // image produk
                Container(
                  width: double.maxFinite,
                  // height: _height / 2.4,
                  height: 350,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(widget.image),
                          fit: BoxFit.cover)),
                ),
                // product name and price
                Container(
                  color: white,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 240,
                            child: ProductText(
                              text: widget.name,
                              size: 16,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ProductText(
                            text: "Rp " + widget.price.toString(),
                            size: 18,
                            weight: FontWeight.w500,
                            color: primaryColor,
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite_border_outlined,
                        ),
                        iconSize: 25,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                // product info
                Container(
                  color: white,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(
                            text: "Bahan",
                            size: 14,
                            weight: FontWeight.w500,
                          ),
                          SmallText(
                            text: "Kayu",
                            size: 14,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(
                            text: "Stok",
                            size: 14,
                            weight: FontWeight.w500,
                          ),
                          SmallText(
                            text: "12",
                            size: 14,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmallText(
                            text: "Berat",
                            size: 14,
                            weight: FontWeight.w500,
                          ),
                          SmallText(
                            text: "800" + " gr",
                            size: 14,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                // product description
                Container(
                    color: white,
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SmallText(
                            text: "Deskripsi Produk",
                            size: 15,
                            weight: FontWeight.w500,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SmallText(
                            text: widget.description,
                            // "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Voluptas ex delectus excepturi! Quidem laudantium sapiente, sit id illum earum itaque nobis! Accusantium corporis in possimus eligendi. Exercitationem minus facilis saepe obcaecati numquam nam recusandae labore blanditiis laudantium at, neque adipisci earum eum molestiae, sapiente accusantium est aspernatur rerum ratione! Autem voluptate mollitia accusamus porro dolores quo, ex, aliquam veritatis nemo aliquid odit vitae molestiae tempora ad ullam iste esse ratione eius totam officiis! Laudantium dignissimos suscipit, quisquam cumque voluptatem cum numquam ducimus magni aliquam excepturi inventore ipsum, modi quis ratione laboriosam nulla voluptates optio exercitationem tempora accusamus iure doloremque. Nobis culpa quidem unde ducimus eaque cum illo quo saepe placeat voluptatum qui cupiditate ad laborum velit nemo, doloribus iste voluptas voluptatem numquam. Explicabo harum porro voluptatibus tenetur assumenda eligendi suscipit labore et! Suscipit assumenda, maxime ullam quibusdam eligendi unde, facere laboriosam impedit iste cumque minima fugit a nemo blanditiis in sit reiciendis. Modi, soluta consequatur in et eum pariatur suscipit asperiores. Voluptate consequatur doloremque suscipit qui quia aut, quisquam dolores unde esse totam alias similique labore sint fugiat eius vero sit ut corrupti porro earum aliquid pariatur magnam! Repudiandae, ipsa possimus! Veritatis asperiores molestiae quasi et ratione vel natus soluta?",
                            color: Color(0xFF404040),
                            wrap: true,
                            align: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 8,
                          )
                        ])),
                SizedBox(
                  height: 12,
                )
              ],
            )
          ],
        )),
        bottomNavigationBar: (Container(
          height: 75,
          width: double.maxFinite,
          decoration: BoxDecoration(color: white, boxShadow: [
            BoxShadow(color: grey81, offset: Offset(0, 8), blurRadius: 12),
          ]),
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 156,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: gray, borderRadius: BorderRadius.circular(12)),
                      child: IconButton(
                          onPressed: () {
                            _decrement();
                          },
                          icon: Icon(
                            Icons.remove,
                            color: primaryColor,
                            size: 24,
                          )),
                    ),
                    BigText(text: '$qty'),
                    Container(
                      // padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: gray, borderRadius: BorderRadius.circular(12)),
                      child: IconButton(
                          onPressed: () {
                            _increment();
                          },
                          icon: Icon(
                            Icons.add,
                            color: primaryColor,
                            size: 24,
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.3,
                height: 56,
                decoration: BoxDecoration(
                  color: primaryLight,
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [primaryColor, secondaryColor]),
                ),
                child: TextButton(
                    style: TextButton.styleFrom(
                        shadowColor: Color(0xFFd9d9d9),
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                    onPressed: () {
                      addToCart();
                    },
                    child: BigText(
                      text: "Add to Cart",
                      color: white,
                      size: 17,
                    )),
              ),
            ],
          ),
        )));
  }
}

// class DetailProductPage2 extends StatelessWidget {
//   int id, price;
//   String name, description, image;

//   DetailProductPage2(
//       {Key? key,
//       required this.id,
//       required this.price,
//       required this.name,
//       required this.description,
//       this.image =
//           "https://thumbs.dreamstime.com/b/flat-isolated-vector-eps-illustration-icon-minimal-design-long-shadow-error-file-not-found-web-118526724.jpg"})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     double _height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: bgWhite,
//       body: SafeArea(
//           child: Stack(
//         children: [
//           ListView(
//             children: [
//               Column(
//                 children: [
//                   // image produk
//                   Container(
//                     width: double.maxFinite,
//                     height: _height / 2.4,
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: NetworkImage(image), fit: BoxFit.cover)),
//                   ),
//                   // product name and price
//                   Container(
//                     color: white,
//                     width: double.maxFinite,
//                     padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             BigText(
//                               text: name,
//                               size: 16,
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             BigText(
//                               text: "Rp " + price.toString(),
//                               size: 18,
//                               color: primaryColor,
//                             )
//                           ],
//                         ),
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.favorite_border_outlined,
//                           ),
//                           iconSize: 25,
//                           color: primaryColor,
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 14,
//                   ),
//                   // product info
//                   Container(
//                     color: white,
//                     width: double.maxFinite,
//                     padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SmallText(
//                               text: "Bahan",
//                               size: 14,
//                               weight: FontWeight.w500,
//                             ),
//                             SmallText(
//                               text: "Kayu",
//                               size: 14,
//                               weight: FontWeight.w500,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 12,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SmallText(
//                               text: "Stok",
//                               size: 14,
//                               weight: FontWeight.w500,
//                             ),
//                             SmallText(
//                               text: "12",
//                               size: 14,
//                               weight: FontWeight.w500,
//                             ),
//                           ],
//                         ),
//                         SizedBox(
//                           height: 12,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             SmallText(
//                               text: "Berat",
//                               size: 14,
//                               weight: FontWeight.w500,
//                             ),
//                             SmallText(
//                               text: "800" + " gr",
//                               size: 14,
//                               weight: FontWeight.w500,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 14,
//                   ),
//                   // product description
//                   Container(
//                       color: white,
//                       width: double.maxFinite,
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 18, vertical: 14),
//                       child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           children: [
//                             SmallText(
//                               text: "Deskripsi Produk",
//                               size: 15,
//                               weight: FontWeight.w500,
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             SmallText(
//                               text: description,
//                               // "Lorem ipsum dolor sit, amet consectetur adipisicing elit. Voluptas ex delectus excepturi! Quidem laudantium sapiente, sit id illum earum itaque nobis! Accusantium corporis in possimus eligendi. Exercitationem minus facilis saepe obcaecati numquam nam recusandae labore blanditiis laudantium at, neque adipisci earum eum molestiae, sapiente accusantium est aspernatur rerum ratione! Autem voluptate mollitia accusamus porro dolores quo, ex, aliquam veritatis nemo aliquid odit vitae molestiae tempora ad ullam iste esse ratione eius totam officiis! Laudantium dignissimos suscipit, quisquam cumque voluptatem cum numquam ducimus magni aliquam excepturi inventore ipsum, modi quis ratione laboriosam nulla voluptates optio exercitationem tempora accusamus iure doloremque. Nobis culpa quidem unde ducimus eaque cum illo quo saepe placeat voluptatum qui cupiditate ad laborum velit nemo, doloribus iste voluptas voluptatem numquam. Explicabo harum porro voluptatibus tenetur assumenda eligendi suscipit labore et! Suscipit assumenda, maxime ullam quibusdam eligendi unde, facere laboriosam impedit iste cumque minima fugit a nemo blanditiis in sit reiciendis. Modi, soluta consequatur in et eum pariatur suscipit asperiores. Voluptate consequatur doloremque suscipit qui quia aut, quisquam dolores unde esse totam alias similique labore sint fugiat eius vero sit ut corrupti porro earum aliquid pariatur magnam! Repudiandae, ipsa possimus! Veritatis asperiores molestiae quasi et ratione vel natus soluta?",
//                               color: Color(0xFF404040),
//                               wrap: true,
//                               align: TextAlign.justify,
//                             ),
//                             SizedBox(
//                               height: 8,
//                             )
//                           ])),
//                 ],
//               )
//             ],
//           ),
//           //icon button back and cart
//           Positioned(
//               left: 4,
//               right: 4,
//               top: 8,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Icon(
//                       Icons.arrow_back_rounded,
//                       size: 28,
//                       color: primaryColor,
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       elevation: 7,
//                       primary: white,
//                       shape: CircleBorder(),
//                       padding: EdgeInsets.all(10),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         // DetailPage adalah halaman yang dituju
//                         MaterialPageRoute(builder: (context) => CartPage()),
//                       );
//                     },
//                     child: Icon(
//                       Icons.shopping_cart_rounded,
//                       size: 28,
//                       color: primaryColor,
//                     ),
//                     style: ElevatedButton.styleFrom(
//                       elevation: 7,
//                       primary: white,
//                       shape: CircleBorder(),
//                       padding: EdgeInsets.all(8),
//                     ),
//                   ),
//                 ],
//               ))
//         ],
//       )),
//       // bottomNavigationBar: ,
//     );
//   }
// }
