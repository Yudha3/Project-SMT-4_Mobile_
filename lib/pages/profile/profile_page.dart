import 'package:flutter/material.dart';
import 'package:main/pages/cart/cart_page.dart';
import 'package:main/pages/orders/my_order_page.dart';
import 'package:main/pages/wishlist/wishlist_page.dart';
import 'package:main/utils/textstyle.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/utils/colors.dart';
import 'package:main/widgets/product_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      body: SafeArea(
          child: Column(
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
                      Icons.arrow_back,
                      size: 30,
                    ),
                    color: primaryColor,
                  ),
                  BigText(text: "Profil Saya"),
                  Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.transparent,
                  ),
                ]),
          ),
          Container(
            color: white,
            padding: EdgeInsets.only(left: 20, right: 16, top: 12, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: 34,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/avatar.png"),
                          radius: 32,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                            text: 'Yoga Andrian',
                            color: black,
                            size: 16,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          BigText(
                            text: '081540988168',
                            color: black,
                            size: 13,
                            weight: FontWeight.w400,
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          BigText(
                            text: 'yogaandrianp21@gmail.com',
                            color: black,
                            size: 13,
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit_rounded,
                      color: primaryColor,
                    ),
                    iconSize: 30),
              ],
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            color: white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => MyOrderPage()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(
                        text: "10",
                        size: 32,
                        weight: FontWeight.w500,
                        color: primaryColor,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      BigText(
                        text: "Pesanan",
                        size: 14,
                        color: black,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(
                        text: "2",
                        size: 32,
                        weight: FontWeight.w500,
                        color: primaryColor,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      BigText(
                        text: "Keranjang",
                        size: 14,
                        color: black,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => WishlistPage()),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BigText(
                        text: "3",
                        size: 32,
                        weight: FontWeight.w500,
                        color: primaryColor,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      BigText(
                        text: "Wishlist",
                        size: 14,
                        color: black,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                color: white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.vpn_key_sharp,
                          size: 24,
                          color: grey40,
                        ),
                        SizedBox(width: 16),
                        BigText(
                          text: 'Ubah Password',
                          size: 15,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.navigate_next_rounded,
                      size: 30,
                      color: primaryColor,
                    ),
                  ],
                ),
              )),
          SizedBox(height: 16),
          InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                color: white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.logout_rounded,
                          size: 24,
                          color: grey40,
                        ),
                        SizedBox(width: 16),
                        BigText(
                          text: 'Logout',
                          size: 15,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    Icon(
                      Icons.navigate_next_rounded,
                      size: 30,
                      color: primaryColor,
                    ),
                  ],
                ),
              )),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: white,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.black.withOpacity(0.4),
        selectedFontSize: 0,
        unselectedFontSize: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 15,
        items: [
          BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home_rounded,
                size: 30,
              )),
          BottomNavigationBarItem(
              label: "Wishlist",
              icon: Icon(
                Icons.favorite_rounded,
                size: 30,
              )),
          // BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(
              label: "Order",
              icon: Icon(
                Icons.receipt_long_rounded,
                size: 30,
              )),
          BottomNavigationBarItem(
              label: "Me",
              icon: Icon(
                Icons.person,
                size: 30,
              )),
        ],
      ),
    );
  }
}
