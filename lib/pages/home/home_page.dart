import 'package:flutter/material.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/models/app_banner.dart';
import 'package:main/pages/cart/cart_page.dart';
import 'package:main/pages/orders/my_order_page.dart';
import 'package:main/pages/product/catalog_page.dart';
import 'package:main/pages/profile/profile_page.dart';
import 'package:main/pages/wishlist/wishlist_page.dart';
import 'package:main/utils/colors.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/widgets/small_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? id;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                          backgroundImage:
                              AssetImage("assets/images/avatar.png"),
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
                            MaterialPageRoute(builder: (context) => CartPage()),
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
                      fontSize: 16, color: grey40, fontWeight: FontWeight.w400),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      filled: true,
                      fillColor: Color(0xFFF1f1f1),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: grey81, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusColor: grey81,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: grey81, width: 1)),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //button produk
                          Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CatalogPage()),
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
                                        builder: (context) => CartPage()),
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
                                        builder: (context) => MyOrderPage()),
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
                                        builder: (context) => WishlistPage()),
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
                                colors: [primaryColor, secondaryColor]),
                            borderRadius: BorderRadius.circular(16)),
                        child: Stack(
                          children: [
                            //gambar banner
                            Positioned(
                                bottom: -5,
                                right: 6,
                                child: Image(
                                  image:
                                      AssetImage("assets/images/drawkit1.png"),
                                  height: 136,
                                )),
                            //text and button
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(
                                  text: "Discover anything\nyou want here",
                                  size: 17,
                                  weight: FontWeight.w500,
                                  color: white,
                                  height: 1.6,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                //button explore
                                ElevatedButton(
                                  onPressed: () {},
                                  child: SmallText(
                                    text: "Explore",
                                    color: primaryColor,
                                    size: 15,
                                    weight: FontWeight.w600,
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
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
                        size: 16,
                      ),
                      SizedBox(
                        height: 16,
                      ),

                      Container(
                        height: 196,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: bannerList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 196,
                                width: 135,
                                margin: EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: primaryColor, width: 2),
                                  color: white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 125,
                                      height: 125,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/images/craft0.png"),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, right: 4),
                                      child: SmallText(
                                        text: bannerList[index].name,
                                        size: 12,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 4, right: 4),
                                      child: BigText(
                                        text: "Rp " +
                                            bannerList[index].price.toString(),
                                        size: 13,
                                        color: primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ]),
            ]),
      ),
    );
  }
}
