import 'package:flutter/material.dart';
import 'package:main/pages/product/product_card.dart';
import 'package:main/utils/colors.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/widgets/small_text.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
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
                      Icons.arrow_back_rounded,
                      size: 30,
                    ),
                    color: primaryColor,
                  ),
                  BigText(text: "Pesanan Saya"),
                  Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.transparent,
                  ),
                ]),
          ),
          Container(
            color: white,
            child: Column(
              children: [
                Card(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.network(
                          'https://images.unsplash.com/photo-1585155770447-2f66e2a397b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                          width: 150,
                          height: 100,
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('2022-03-31 20:12:09'),
                            Text('Nama Produk xxxxxxxx'),
                            Text('Total Pesanan'),
                            Text(
                              'Rp 87.000',
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Text(
                              'Sedang Dikirim',
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.network(
                          'https://images.unsplash.com/photo-1585155770447-2f66e2a397b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                          width: 150,
                          height: 100,
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('2022-03-31 20:12:09'),
                            Text('Nama Produk xxxxxxxx'),
                            Text('Total Pesanan'),
                            Text(
                              'Rp 87.000',
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Text(
                              'Sedang Dikirim',
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.network(
                          'https://images.unsplash.com/photo-1585155770447-2f66e2a397b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                          width: 150,
                          height: 100,
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('2022-03-31 20:12:09'),
                            Text('Nama Produk xxxxxxxx'),
                            Text('Total Pesanan'),
                            Text(
                              'Rp 87.000',
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Text(
                              'Sedang Dikirim',
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Image.network(
                          'https://images.unsplash.com/photo-1585155770447-2f66e2a397b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                          width: 150,
                          height: 100,
                        ),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('2022-03-31 20:12:09'),
                            Text('Nama Produk xxxxxxxx'),
                            Text('Total Pesanan'),
                            Text(
                              'Rp 87.000',
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Column(
                          children: [
                            Text(
                              'Sedang Dikirim',
                              style: TextStyle(color: primaryColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
