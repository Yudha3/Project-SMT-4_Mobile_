import 'package:flutter/material.dart';
import 'package:main/utils/textstyle.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/utils/colors.dart';

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
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 150, left: 30),
                ),
                CircleAvatar(
                    radius: 50,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/avatar.png"),
                      radius: 48,
                    )),
                Padding(padding: EdgeInsets.only(left: 20)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yoga Andrian',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 25),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      '081540988168',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'yogaandrianp21@gmail.com',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.only(left: 50)),
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit_rounded),
                    iconSize: 30),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            color: white,
            child: Row(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 200)),
                      Text(
                        '2',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue[900]),
                      ),
                      Text(
                        'Pesanan',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Text(
                        '10',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue[900]),
                      ),
                      Text(
                        'Keranjang',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 200)),
                      Text(
                        '0',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue[900]),
                      ),
                      Text(
                        'Wishlist',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                color: white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        Icon(
                          Icons.vpn_key_outlined,
                          size: 30,
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Ubah Password',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.navigate_next_rounded,
                      size: 30,
                      color: Colors.blue[900],
                    ),
                  ],
                ),
              )),
          SizedBox(height: 30),
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              color: white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.logout,
                    size: 30,
                  ),
                  SizedBox(width: 20),
                  Text(
                    'Logout',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
          ),
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
