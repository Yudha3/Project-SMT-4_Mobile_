import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:main/API/api_services.dart';
import 'package:main/models/model_product.dart';
import 'package:main/models/picsum.dart';
import 'package:main/pages/cart/cart_page.dart';
import 'package:main/pages/product/detail_product_page.dart';
import 'package:main/pages/product/product_card.dart';
import 'package:main/utils/colors.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/widgets/small_text.dart';
import '../../models/product.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  List<Picsum> list = [];
  List data = [];
  // late Product product;

  List<ProductInfo> products = [
    ProductInfo(
      imgURL:
          "https://images.unsplash.com/photo-1585155770447-2f66e2a397b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      id: 1,
      price: 25000,
      stock: 25,
      name: "Lorem Ipsum dolor sit amet ajnd ghhd dyhd fhh fff",
      isFavorite: false,
    ),
    ProductInfo(
      imgURL:
          "https://images.unsplash.com/photo-1585155770447-2f66e2a397b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      id: 2,
      price: 2000,
      stock: 29,
      name: "Lorem Ipsum dolor sit amet ",
      isFavorite: true,
    ),
    ProductInfo(
      imgURL:
          "https://yt3.ggpht.com/a/AATXAJxdWb7Z0-ShUl96soVgzy_QUTLpddTbBmcYbQ=s900-c-k-c0xffffffff-no-rj-mo",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      id: 3,
      price: 67000,
      stock: 15,
      name: "Lorem Ipsum dolor sit amet ",
      isFavorite: false,
    ),
    ProductInfo(
      imgURL:
          "https://images.unsplash.com/photo-1585155770447-2f66e2a397b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      id: 4,
      price: 23000,
      stock: 2,
      name: "Lorem Ipsum dolor sit amet ",
      isFavorite: true,
    ),
    ProductInfo(
      imgURL:
          "https://ih1.redbubble.net/image.964483224.4096/flat,1000x1000,075,f.u8.jpg",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      id: 5,
      price: 49000,
      stock: 7,
      name: "Lorem Ipsum dolor sit amet ",
      isFavorite: false,
    ),
    ProductInfo(
      imgURL:
          "https://images.unsplash.com/photo-1585155770447-2f66e2a397b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      id: 6,
      price: 30000,
      stock: 10,
      name: "Lorem Ipsum dolor sit amet ",
      isFavorite: false,
    ),
    ProductInfo(
      imgURL:
          "https://yt3.ggpht.com/-FJXWJ1x1bEQ/AAAAAAAAAAI/AAAAAAAAAAA/ZtyuZ-elFr4/s900-c-k-no-mo-rj-c0xffffff/photo.jpg",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      id: 7,
      price: 19000,
      stock: 18,
      name: "Lorem Ipsum dolor sit amet ",
      isFavorite: false,
    ),
    ProductInfo(
      imgURL:
          "https://is5-ssl.mzstatic.com/image/thumb/Purple60/v4/93/9e/82/939e82b8-81e7-3b2b-2c3c-ce63d4bdec3c/source/512x512bb.jpg",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      id: 8,
      price: 24000,
      stock: 5,
      name: "Lorem Ipsum dolor sit amet ",
      isFavorite: false,
    ),
    ProductInfo(
      imgURL:
          "https://i.pinimg.com/originals/28/8f/ab/288fab24c0f04e41ccd3c134161dcc1c.jpg",
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      id: 9,
      price: 16000,
      stock: 24,
      name: "Lorem Ipsum dolor sit amet ",
      isFavorite: true,
    ),
  ];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      body: SafeArea(child: CatalogBody()),
      // body: SafeArea(
      //   child: Stack(
      //     children: [
      //       Positioned(
      //         top: 0,
      //         left: 0,
      //         right: 0,
      //         child: Container(
      //           width: double.maxFinite,
      //           height: 60,
      //           color: white,
      //           padding: EdgeInsets.symmetric(horizontal: 6),
      //           child: Row(
      //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //               children: [
      //                 IconButton(
      //                   onPressed: () {
      //                     Navigator.pop(context);
      //                   },
      //                   icon: Icon(
      //                     Icons.arrow_back_rounded,
      //                     size: 30,
      //                   ),
      //                   color: primaryColor,
      //                 ),
      //                 BigText(text: "Katalog"),
      //                 IconButton(
      //                   onPressed: () {
      //                     Navigator.push(
      //                       context,
      //                       MaterialPageRoute(
      //                           builder: (context) => CartPage()),
      //                     );
      //                   },
      //                   icon: Icon(
      //                     Icons.shopping_cart_rounded,
      //                     size: 30,
      //                   ),
      //                   color: primaryColor,
      //                 ),
      //               ]),
      //         ),
      //       ),
      //       catalogList2(),
      //     ],
      //   ),
      // )
    );
  }

  fetchData() async {
    final response = await ApiService().get();
    list.addAll(response);
    setState(() {});
  }

  // Widget catalogList() {
  //   Product product;
  //   return Container(
  //     padding: EdgeInsets.only(),
  //     child: GridView.builder(
  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 2,
  //             crossAxisSpacing: 12,
  //             mainAxisSpacing: 12,
  //             childAspectRatio: 0.75),
  //         itemBuilder: (context, index) {
  //           return GestureDetector(
  //             onTap: () {},
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: <Widget>[
  //                 Expanded(
  //                   child: Container(
  //                     padding: EdgeInsets.all(12),
  //                     // For  demo we use fixed height  and width
  //                     // Now we dont need them
  //                     // height: 180,
  //                     // width: 160,
  //                     decoration: BoxDecoration(
  //                       color: white,
  //                       borderRadius: BorderRadius.circular(16),
  //                     ),
  //                     child: Hero(
  //                       tag: "${product.id}",
  //                       child: Image.network(product.image),
  //                     ),
  //                   ),
  //                 ),
  //                 Padding(
  //                   padding: const EdgeInsets.symmetric(vertical: 12),
  //                   child: SmallText(
  //                     // products is out demo list
  //                     text: product.name,
  //                   ),
  //                 ),
  //                 SmallText(
  //                   text: "Rp ${product.price}",
  //                   color: primaryColor,
  //                 )
  //               ],
  //             ),
  //           );
  //         }),
  //   );
  // }

  Widget CatalogBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.maxFinite,
          height: 60,
          color: white,
          padding: EdgeInsets.symmetric(
            horizontal: 6,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
            BigText(text: "Katalog"),
            Icon(
              Icons.close,
              size: 30,
              color: Colors.transparent,
            ),
          ]),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.76),
              children: products
                  .map<Widget>((product) => ProductCard(
                        product: product,
                        id: product.id,
                      ))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}
