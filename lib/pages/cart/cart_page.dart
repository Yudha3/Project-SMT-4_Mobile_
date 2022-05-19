import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/utils/colors.dart';
import 'package:main/widgets/small_text.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      body: SafeArea(
          child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
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
                    BigText(text: "Keranjang"),
                    Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.transparent,
                    ),
                  ]),
            ),
          ),
          Positioned(
            top: 60, left: 6, right: 6, bottom: 0,
            // height: double.maxFinite,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 14,
                itemBuilder: (context, index) {
                  return cartItem(index);
                }),
          )
        ],
      )),
    );
  }

  Widget cartItem(int index) {
    return Card(
      elevation: 3,
      child: Container(
        padding: EdgeInsets.all(3),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/craft0.png"),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 12,
                top: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                    text: "Lorem ipsum dolor sit amet",
                    color: black,
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  SmallText(
                    text: "Rp 59.000",
                    color: primaryColor,
                    size: 15,
                    weight: FontWeight.w500,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  SmallText(
                    text: "Qty: 1",
                    color: black,
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
