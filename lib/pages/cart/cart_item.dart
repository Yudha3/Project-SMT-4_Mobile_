import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:main/API/api_services.dart';
import 'package:main/models/cart.dart';
import 'package:main/pages/login_page.dart';
import 'package:main/pages/product/detail_product_page.dart';
import 'package:main/utils/colors.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/widgets/product_text.dart';

class CartItem extends StatelessWidget {
  Cart cart;
  var id, product_id, title, images, price, qty, subtotal;

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  CartItem(
      {Key? key,
      required this.cart,
      this.id,
      this.qty,
      this.product_id,
      this.title,
      this.price,
      this.subtotal,
      this.images})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _showMsg(msg) {
      final snackBar = SnackBar(
        content: Text(msg),
        duration: const Duration(seconds: 1),
        backgroundColor: Color.fromARGB(255, 11, 122, 15),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    return Container(
      width: double.maxFinite,
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: white,
        // borderRadius: BorderRadius.circular(8),
        // border: Border.all(width: 1, color: Color.fromARGB(255, 194, 194, 194)),
        // boxShadow: [
        //   BoxShadow(
        //       color: Color(0xFF818181), offset: Offset(0, 3), blurRadius: 5)
        // ],
      ),
      padding: EdgeInsets.only(left: 14, top: 10, bottom: 10, right: 14),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailProductPage(id: product_id)));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: NetworkImage(images
                              // "https://thumbs.dreamstime.com/b/flat-isolated-vector-eps-illustration-icon-minimal-design-long-shadow-error-file-not-found-web-118526724.jpg"
                              ),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  width: 12,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: '$title',
                        size: 12.5,
                        weight: FontWeight.w500,
                        color: black,
                      ),
                      BigText(
                        text: CurrencyFormat.convertToIdr(price),
                        size: 12.5,
                        weight: FontWeight.w600,
                        color: primaryColor,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      BigText(
                        text: "Jumlah: $qty",
                        size: 12.5,
                        weight: FontWeight.w500,
                        color: black,
                      ),
                      SizedBox(
                        height: 3,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.delete_outline_rounded,
                      color: Colors.red,
                    ),
                    onTap: () async {
                      confirmDelete(context);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BigText(
                    text: CurrencyFormat.convertToIdr(subtotal),
                    size: 13,
                    weight: FontWeight.w600,
                    color: primaryColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void deleteCart() async {
    var res = await ApiService().getDataProduct(id);
    var body = json.decode(res.body);
    String message = body['message'];
    if (message == "SUCCESS") {
      // _showMsg("Berhasil hapus");
      Fluttertoast.showToast(msg: 'anjay');
    } else {
      // _showMsg("Gagal!");
    }
  }

  confirmDelete(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () async {
        var res = await ApiService().deleteCart(id);
        var body = json.decode(res.body);
        String message = body['message'];
        if (message == "SUCCESS") {
          // _showMsg("Berhasil hapus");
          Fluttertoast.showToast(
              msg: 'Berhasil menghapus item\ndari Keranjang');
        } else {
          // _showMsg("Gagal!");
          Fluttertoast.showToast(msg: 'Gagal menghapus item\ndari keranjang!');
        }
        Navigator.of(context).pop();
        // await ApiService().getUserCarts();
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Hapus Keranjang"),
      content: Text("Apakah Anda yakin menghapus item ini dari Keranjang?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
