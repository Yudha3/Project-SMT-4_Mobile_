import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/utils/colors.dart';

class DetailOrderPage extends StatefulWidget {
  const DetailOrderPage({Key? key}) : super(key: key);

  @override
  State<DetailOrderPage> createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      body: SafeArea(
          child: ListView(
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
                  BigText(text: "Detail Pesanan"),
                  Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.transparent,
                  ),
                ]),
          ),
          Container(
            color: white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status Transaksi',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Menunggu Pembayaran',
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  color: Colors.black87,
                  thickness: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nomor Transaksi',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'TRK-2204022',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tanggal Transaksi',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '2022-04-20 21:50:01',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: 500,
            color: white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Alamat Penerima',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text('Yoga'),
              Text('Jombang'),
              Text('082364777645'),
            ]),
          ),
          SizedBox(height: 10),
          Container(
            color: white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pesanan',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Card(
                  borderOnForeground: true,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Image.network(
                        'https://images.unsplash.com/photo-1585155770447-2f66e2a397b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Lorem ipsum sir amet'),
                          SizedBox(height: 5),
                          Text(
                            'Rp 59.000',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10),
                          Text('Qty : 1'),
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
                      Text(
                        'Rp 59.000',
                        style: TextStyle(
                            color: primaryColor, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Belanja',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      'Rp 59.000',
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            color: white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Informasi Pengiriman',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '...',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '-',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Biaya Pengiriman',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Rp. 20.000',
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            color: white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Transaksi',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  'Rp. 79.000',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: white,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Bayar'),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(340, 50),
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
