import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/API/api_services.dart';
import 'package:main/models/app_banner.dart';
import 'package:main/models/product.dart';
import 'package:main/models/user.dart';
import 'package:main/pages/cart/cart_page.dart';
import 'package:main/pages/orders/my_order_page.dart';
import 'package:main/pages/product/catalog_page.dart';
import 'package:main/pages/product/detail_product_page.dart';
import 'package:main/pages/product/product_card.dart';
import 'package:main/pages/profile/profile_page.dart';
import 'package:main/pages/wishlist/wishlist_page.dart';
import 'package:main/utils/colors.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/widgets/product_text.dart';
import 'package:main/widgets/small_text.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = true;
  int? id;
  List<Product> products = [];
  List<User> user = [];
  String img = "";

  void getID() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      id = (pref.getInt('id_user') ?? 0);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getID();
    fetchDataUser();
    fetchDataProduct();
    setState(() {});
  }

  fetchDataProduct() async {
    var res = await ApiService().getAllProducts();
    setState(() {
      _isLoading = true;
      products.addAll(res);
      _isLoading = false;
    });
  }

  fetchDataUser() async {
    final response = await ApiService().getUserData();
    var body = json.decode(response.body);

    setState(() {
      img = body['image'];
      // _isLoading = true;
      // _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            // var response = await ApiService().getUserData();
            // var res = await ApiService().getAllProducts();
            setState(() {
              products = [];
            });
            fetchDataUser();
            fetchDataProduct();
          },
          child: SingleChildScrollView(
            child: _isLoading
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromARGB(20, 0, 0, 0),
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: gray,
                        color: primaryColor,
                        strokeWidth: 6,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(
                        top: 12, left: 18, right: 18, bottom: 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    // DetailPage adalah halaman yang dituju
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage()),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 20,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(img),
                                    radius: 18,
                                  ),
                                ),
                              ),
                              BigText(text: id.toString() + "- Beranda"),
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
                                    size: 32,
                                    color: primaryColor,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          //seacrh bar
                          TextField(
                            style: GoogleFonts.inter(
                                fontSize: 16,
                                color: grey40,
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10),
                                filled: true,
                                fillColor: Color(0xFFF1f1f1),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: grey81, width: 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusColor: grey81,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        BorderSide(color: grey81, width: 1)),
                                hintText: "Cari",
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: grey81,
                                ),
                                prefixIconColor: grey81,
                                iconColor: grey81),
                          ),
                          SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                // menu utama
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    //button produk
                                    Column(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CatalogPage()),
                                            );
                                          },
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/cib_snapcraft.png"),
                                            width: 30,
                                            height: 30,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: primaryLight,
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(16),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        BigText(
                                          text: "Produk",
                                          size: 14,
                                          weight: FontWeight.w500,
                                          color: primaryColor,
                                        )
                                      ],
                                    ),
                                    // button keranjang
                                    Column(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      CartPage()),
                                            );
                                          },
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/cib_shopping_cart.png"),
                                            width: 30,
                                            height: 30,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: primaryLight,
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(16),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        BigText(
                                          text: "Keranjang",
                                          size: 14,
                                          weight: FontWeight.w500,
                                          color: primaryColor,
                                        )
                                      ],
                                    ),
                                    // button pesanan
                                    Column(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MyOrderPage()),
                                            );
                                          },
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/cib_pesanan.png"),
                                            width: 30,
                                            height: 30,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: primaryLight,
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(16),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        BigText(
                                          text: "Pesanan",
                                          size: 14,
                                          weight: FontWeight.w500,
                                          color: primaryColor,
                                        )
                                      ],
                                    ),
                                    // button favorit
                                    Column(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      WishlistPage()),
                                            );
                                          },
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/cib_favorite.png"),
                                            width: 30,
                                            height: 30,
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            primary: primaryLight,
                                            shape: CircleBorder(),
                                            padding: EdgeInsets.all(16),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        BigText(
                                          text: "Wishlist",
                                          size: 14,
                                          weight: FontWeight.w500,
                                          color: primaryColor,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                // banner utama
                                Container(
                                  height: 180,
                                  width: double.maxFinite,
                                  padding: EdgeInsets.only(left: 24, top: 24),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            primaryColor,
                                            secondaryColor
                                          ]),
                                      borderRadius: BorderRadius.circular(16)),
                                  child: Stack(
                                    children: [
                                      //gambar banner
                                      Positioned(
                                          bottom: -5,
                                          right: 6,
                                          child: Image(
                                            image: AssetImage(
                                                "assets/images/drawkit1.png"),
                                            height: 136,
                                          )),
                                      //text and button
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            child: ProductText(
                                              text:
                                                  "Discover anything you want here...",
                                              size: 18,
                                              weight: FontWeight.w700,
                                              color: white,
                                              height: 1.6,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 12,
                                          ),
                                          //button explore
                                          ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CatalogPage()));
                                            },
                                            child: SmallText(
                                              text: "Explore",
                                              color: primaryColor,
                                              size: 14.5,
                                              weight: FontWeight.w600,
                                            ),
                                            style: ElevatedButton.styleFrom(
                                              primary: white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12), // <-- Radius
                                              ),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20, vertical: 9),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                BigText(
                                  text: "Best Seller Products",
                                  size: 18,
                                ),
                                SizedBox(
                                  height: 16,
                                ),

                                // Container(
                                //   height: 196,
                                //   child: ListView.builder(
                                //       scrollDirection: Axis.horizontal,
                                //       itemCount: bannerList.length,
                                //       itemBuilder: (context, index) {
                                //         return Container(
                                //           height: 196,
                                //           width: 135,
                                //           margin: EdgeInsets.symmetric(
                                //             horizontal: 6,
                                //           ),
                                //           padding: EdgeInsets.all(5),
                                //           decoration: BoxDecoration(
                                //             border:
                                //                 Border.all(color: primaryColor, width: 2),
                                //             color: white,
                                //             borderRadius: BorderRadius.circular(15),
                                //           ),
                                //           child: Column(
                                //             crossAxisAlignment: CrossAxisAlignment.start,
                                //             children: [
                                //               Container(
                                //                 width: 125,
                                //                 height: 125,
                                //                 decoration: BoxDecoration(
                                //                     borderRadius:
                                //                         BorderRadius.circular(14),
                                //                     image: DecorationImage(
                                //                         image: AssetImage(
                                //                             "assets/images/craft0.png"),
                                //                         fit: BoxFit.cover)),
                                //               ),
                                //               SizedBox(
                                //                 height: 5,
                                //               ),
                                //               Padding(
                                //                 padding: const EdgeInsets.only(
                                //                     left: 4, right: 4),
                                //                 child: SmallText(
                                //                   text: bannerList[index].name,
                                //                   size: 12,
                                //                 ),
                                //               ),
                                //               SizedBox(
                                //                 height: 6,
                                //               ),
                                //               Padding(
                                //                 padding: const EdgeInsets.only(
                                //                     left: 4, right: 4),
                                //                 child: BigText(
                                //                   text: "Rp " +
                                //                       bannerList[index].price.toString(),
                                //                   size: 13,
                                //                   color: primaryColor,
                                //                 ),
                                //               ),
                                //               SizedBox(
                                //                 height: 12,
                                //               )
                                //             ],
                                //           ),
                                //         );
                                //       }),
                                // ),

                                Container(
                                  // color: grey81,
                                  height:
                                      MediaQuery.of(context).size.height / 3.95,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: products
                                        .map((product) => BestSellerCard(
                                            product: product, id: product.id))
                                        .toList(),
                                  ),
                                ),
                                SizedBox(
                                  height: 32,
                                )
                              ],
                            ),
                          ),
                        ]),
                  ),
          ),
        ),
      ),
    );
  }
}

class BestSellerCard extends StatelessWidget {
  Product product;
  int id;
  BestSellerCard({Key? key, required this.product, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4.5,
      width: MediaQuery.of(context).size.width / 2.8,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor, width: 1.5),
        color: white,
        borderRadius: BorderRadius.circular(9),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailProductPage(id: product.id)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 125,
              height: 125,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                      image: NetworkImage(product.image), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: SmallText(
                text: product.title,
                size: 12.5,
                weight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: BigText(
                // text: "Rp " + product.price.toString(),
                text: CurrencyFormat.convertToIdr(product.price),
                size: 13.5,
                color: primaryColor,
              ),
            ),
            // SizedBox(
            //   height: 10,
            // )
          ],
        ),
      ),
    );
  }
}
