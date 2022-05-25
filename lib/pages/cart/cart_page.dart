// import 'dart:ffi';

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:main/API/api_services.dart';
import 'package:main/models/cart.dart';
import 'package:main/pages/cart/cart_item.dart';
import 'package:main/pages/product/catalog_page.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/utils/colors.dart';
import 'package:main/widgets/product_text.dart';
import 'package:main/widgets/small_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int id_user = 0;
  bool _isLoading = true;
  List<Cart> carts = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getID();
      fetchData();
    });
  }

  // ambil id_user
  void getID() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      id_user = preferences.getInt('id_user');
    });
    // print(id_user);
  }

  Future getData() async {
    var res =
        await http.get("http://192.168.1.2/coba_api/public/carts/$id_user");
    var jsonData = jsonDecode(res.body);
    List<Cart> carts = [];

    for (var json in jsonData) {
      Cart cart = Cart(
          id: json['id'],
          idUser: json['id_user'],
          idProduct: json['id_product'],
          title: json['title'],
          image: json['image'],
          price: json['price'],
          qty: json['qty'],
          subtotal: json['subtotal']);
      carts.add(cart);
    }
    return carts;
  }

  //ambil data keranjang
  fetchData() async {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return Center(child: CircularProgressIndicator());
    //     },);
    final response = await ApiService().getUserCarts();

    setState(() {
      _isLoading = false;
      carts.addAll(response);
    });
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await ApiService().getAllProducts();
            setState(() {
              carts = [];
            });
            // await ApiService().getUserCarts();
            await fetchData();
          },
          child: Column(
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
                      BigText(text: "$id_user - Keranjang"),
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
                      // horizontal: 12,
                      vertical: 10,
                    ),
                    child: _isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                              backgroundColor: gray,
                              color: primaryColor,
                              strokeWidth: 6,
                            ),
                          )
                        : carts.length > 0
                            ? ListView(
                                scrollDirection: Axis.vertical,
                                children: carts
                                    .map<Widget>((data) => CartItem(
                                          cart: data,
                                          id: data.id,
                                          product_id: data.idProduct,
                                          price: data.price,
                                          images: data.image,
                                          title: data.title,
                                          subtotal: data.subtotal,
                                          qty: data.qty,
                                        ))
                                    .toList(),
                              )
                            : Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/empty_cart.png",
                                      width: MediaQuery.of(context).size.width /
                                          2.1,
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    SmallText(
                                      text:
                                          "Tidak ada apapun\ndi dalam Keranjang",
                                      color: grey40,
                                      align: TextAlign.center,
                                      size: 14,
                                      weight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                                // ElevatedButton(
                                //     style: ElevatedButton.styleFrom(
                                //         padding: EdgeInsets.symmetric(
                                //             horizontal: 16, vertical: 12),
                                //         primary: primaryLight,
                                //         shape: RoundedRectangleBorder(
                                //           borderRadius:
                                //               BorderRadius.circular(12),
                                //         )),
                                //     onPressed: () {
                                //       Navigator.push(
                                //           context,
                                //           MaterialPageRoute(
                                //               builder: (context) =>
                                //                   CatalogPage()));
                                //     },
                                //     child: BigText(
                                //       text: "Mulai Belanja",
                                //       color: white,
                                //     ))
                              )),
              ),
            ],
          ),
        ),
      ),
      // body: SafeArea(
      //     child: Stack(
      //   children: [
      //     Positioned(
      //       top: 0,
      //       left: 0,
      //       right: 0,
      //       child: Container(
      //         width: double.maxFinite,
      //         height: 60,
      //         color: white,
      //         padding: EdgeInsets.symmetric(horizontal: 6),
      //         child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               IconButton(
      //                 onPressed: () {
      //                   Navigator.pop(context);
      //                 },
      //                 icon: Icon(
      //                   Icons.arrow_back_rounded,
      //                   size: 30,
      //                 ),
      //                 color: primaryColor,
      //               ),
      //               BigText(text: "Keranjang"),
      //               Icon(
      //                 Icons.close,
      //                 size: 30,
      //                 color: Colors.transparent,
      //               ),
      //             ]),
      //       ),
      //     ),
      //     Positioned(
      //       top: 60, left: 0, right: 0, bottom: 0,
      //       // height: double.maxFinite,
      //       child: ListView.builder(
      //           scrollDirection: Axis.vertical,
      //           // children:
      //           // carts.map<Widget>((cart) => CartItem(cart: cart)).toList(),
      //           itemCount: 5,
      //           itemBuilder: (context, index) {
      //             // return CartItem(cart: data,);
      //             // return cartItem(index);
      //             return listCart();
      //           }),
      //     )
      //   ],
      // )),
    );
  }
}
