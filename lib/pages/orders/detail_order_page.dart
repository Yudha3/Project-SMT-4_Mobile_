import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:main/API/api_services.dart';
import 'package:main/models/order.dart';
import 'package:main/pages/cart/cart_page.dart';
import 'package:main/pages/orders/my_order_page.dart';
import 'package:main/pages/orders/send_review.dart';
import 'package:main/pages/orders/order_list_item.dart';
import 'package:main/pages/orders/payment_page.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/utils/colors.dart';
import 'package:main/widgets/product_text.dart';
import 'package:main/widgets/small_text.dart';

class DetailOrderPage extends StatefulWidget {
  int id;
  DetailOrderPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailOrderPage> createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  bool _isLoading = true;
  static int id_trx = 0;
  var date, status, recipient, address, phone, subtotal, shipment, total, resi;
  List<OrderItem> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      id_trx = widget.id;
    });
    getOrderDetail();
    getOrderItem();
  }

  void getOrderDetail() async {
    var res = await ApiService().getDataOrder(widget.id);
    var body = jsonDecode(res.body);
    setState(() {
      id_trx = widget.id;
      date = body['date'];
      status = body['status'];
      recipient = body['recipient'];
      address = body['address'];
      phone = body['phone'];
      subtotal = body['subtotal'];
      shipment = body['shipment'];
      total = body['total'];
      resi = body['resi'];
    });
  }

  void getOrderItem() async {
    var res = await ApiService().getOrderItem(widget.id);
    setState(() {
      _isLoading = true;
      items.addAll(res);
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgWhite,
        body: SafeArea(
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    backgroundColor: grey,
                    color: primaryColor,
                    strokeWidth: 6,
                  ),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: 60,
                        color: white,
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        margin: EdgeInsets.only(bottom: 0),
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
                      // Container(
                      //   color: gray,
                      //   height: MediaQuery.of(context).size.height / 6,
                      // ),
                      Container(
                        color: white,
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(
                                text: 'Status Transaksi',
                              ),
                              SmallText(
                                text: '$status',
                                weight: FontWeight.w500,
                                color: primaryColor,
                                size: 13.5,
                              ),
                            ],
                          ),
                          Divider(
                            height: 16,
                            color: grey81,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(
                                text: 'Kode Transaksi',
                              ),
                              SmallText(
                                text: '$id_trx',
                                weight: FontWeight.w500,
                                color: primaryColor,
                                size: 13.5,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(
                                text: 'Tanggal Transaksi',
                              ),
                              SmallText(
                                text: '$date',
                                weight: FontWeight.w500,
                                color: primaryColor,
                                size: 12.8,
                              ),
                            ],
                          ),
                        ]),
                      ),
                      Container(
                        color: white,
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                text: "Alamat Penerima",
                                size: 14,
                                weight: FontWeight.w500,
                                color: primaryColor,
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 40,
                                child: ProductText(
                                  text: '$recipient',
                                  size: 12.8,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 40,
                                child: ProductText(
                                  text: '$address ',
                                  line: 6,
                                  size: 12.8,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.3,
                                child: ProductText(
                                  text: '$phone',
                                  size: 12.8,
                                ),
                              ),
                            ]),
                      ),

                      Container(
                        color: white,
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                        margin: EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              text: "Pesanan Saya",
                              size: 14,
                              weight: FontWeight.w500,
                              color: primaryColor,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            ListView(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: items
                                  .map((item) => OrderProductItem(
                                      title: item.title,
                                      price: item.price,
                                      qty: item.qty,
                                      subtotal: item.subtotal,
                                      image: item.image))
                                  .toList(),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SmallText(
                                  text: 'Total Pesanan',
                                ),
                                SmallText(
                                  text: CurrencyFormat.convertToIdr(subtotal),
                                  weight: FontWeight.w500,
                                  color: primaryColor,
                                  size: 13.5,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // Expanded(
                      //     child: Container(
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       Container(
                      //           width: MediaQuery.of(context).size.width,
                      //           color: white,
                      //           padding: EdgeInsets.only(
                      //               left: 20, right: 20, top: 14, bottom: 6),
                      //           child: BigText(
                      //             text: "Pesanan",
                      //             size: 15,
                      //             weight: FontWeight.w500,
                      //             color: primaryColor,
                      //           )),
                      //       Expanded(
                      //         child: Container(
                      //           color: white,
                      //           child: ListView(
                      //             scrollDirection: Axis.vertical,
                      //             children: items
                      //                 .map((item) => OrderProductItem(
                      //                     title: item.title,
                      //                     price: item.price,
                      //                     qty: item.qty,
                      //                     subtotal: item.subtotal,
                      //                     image: item.image))
                      //                 .toList(),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // )),

                      // Container(
                      //   color: white,
                      //   width: MediaQuery.of(context).size.width,
                      //   padding: EdgeInsets.symmetric(horizontal: 18, vertical: 16),
                      //   margin: EdgeInsets.only(bottom: 14),
                      // ),

                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                        color: white,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SmallText(
                                    text: 'Biaya Pengiriman',
                                  ),
                                  SmallText(
                                    text: CurrencyFormat.convertToIdr(shipment),
                                    weight: FontWeight.w500,
                                    color: primaryColor,
                                    size: 13.5,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SmallText(
                                    text: 'Nomor Resi',
                                  ),
                                  SmallText(
                                    text: "$resi",
                                    weight: FontWeight.w500,
                                    color: black,
                                    size: 13.5,
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 12,
                      ),

                      Container(
                        color: white,
                        width: MediaQuery.of(context).size.width,
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                        margin: EdgeInsets.only(bottom: 16),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(
                                text: 'Total Pesanan',
                              ),
                              SmallText(
                                text: CurrencyFormat.convertToIdr(subtotal),
                                weight: FontWeight.w500,
                                color: black,
                                size: 13.5,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(
                                text: 'Ongkos Kirim',
                              ),
                              SmallText(
                                text: CurrencyFormat.convertToIdr(shipment),
                                weight: FontWeight.w500,
                                color: black,
                                size: 13.5,
                              ),
                            ],
                          ),
                          Divider(
                            height: 16,
                            color: grey81,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SmallText(
                                text: 'Total Pembayaran',
                              ),
                              SmallText(
                                text: CurrencyFormat.convertToIdr(total),
                                weight: FontWeight.w500,
                                color: primaryColor,
                                size: 14,
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),

          //   child: Column(
          // children: [
          //   Container(
          //     width: double.maxFinite,
          //     height: 60,
          //     color: white,
          //     padding: EdgeInsets.symmetric(horizontal: 6),
          //     child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           IconButton(
          //             onPressed: () {
          //               Navigator.pop(context);
          //             },
          //             icon: Icon(
          //               Icons.arrow_back_rounded,
          //               size: 30,
          //             ),
          //             color: primaryColor,
          //           ),
          //           BigText(text: "Detail Pesanan"),
          //           Icon(
          //             Icons.close,
          //             size: 30,
          //             color: Colors.transparent,
          //           ),
          //         ]),
          //   ),
          //   Container(
          //     color: white,
          //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //     child: Column(
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text(
          //       'Status Transaksi',
          //       style: TextStyle(fontWeight: FontWeight.w500),
          //     ),
          //     Text(
          //       'Menunggu Pembayaran',
          //       style: TextStyle(
          //           color: primaryColor, fontWeight: FontWeight.bold),
          //     ),
          //   ],
          // ),
          // Divider(
          //   height: 20,
          //   color: Colors.black87,
          //   thickness: 2,
          // ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               'Nomor Transaksi',
          //               style: TextStyle(fontWeight: FontWeight.w500),
          //             ),
          //             Text(
          //               'TRK-2204022',
          //               style: TextStyle(fontWeight: FontWeight.bold),
          //             ),
          //           ],
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               'Tanggal Transaksi',
          //               style: TextStyle(fontWeight: FontWeight.w500),
          //             ),
          //             Text(
          //               '2022-04-20 21:50:01',
          //               style: TextStyle(fontWeight: FontWeight.bold),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          //   SizedBox(height: 20),
          //   Container(
          //     width: 500,
          //     color: white,
          //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //     child:
          //         Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //       Text(
          //         'Alamat Penerima',
          //         style:
          //             TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
          //       ),
          //       SizedBox(height: 10),
          //       Text('Yoga'),
          //       Text('Jombang'),
          //       Text('082364777645'),
          //     ]),
          //   ),
          //   SizedBox(height: 10),
          //   Container(
          //     color: white,
          //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           'Pesanan',
          //           style: TextStyle(
          //               color: primaryColor, fontWeight: FontWeight.bold),
          //         ),
          //         SizedBox(height: 10),
          //         Expanded(
          //             child: Container(
          //           child: ListView(
          //             scrollDirection: Axis.vertical,
          //             children: items
          //                 .map((item) => OrderProductItem(
          //                     title: item.title,
          //                     price: item.price,
          //                     qty: item.qty,
          //                     subtotal: item.subtotal,
          //                     image: item.image))
          //                 .toList(),
          //           ),
          //         )),
          //         // Card(
          //         //   borderOnForeground: true,
          //         //   shape: RoundedRectangleBorder(
          //         //       side: BorderSide(color: Colors.black),
          //         //       borderRadius: BorderRadius.circular(10)),
          //         //   child: Row(
          //         //     children: [
          //         //       Padding(padding: EdgeInsets.only(left: 10)),
          //         //       Image.network(
          //         //         'https://images.unsplash.com/photo-1585155770447-2f66e2a397b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
          //         //         width: 100,
          //         //         height: 100,
          //         //       ),
          //         //       SizedBox(width: 10),
          //         //       Column(
          //         //         crossAxisAlignment: CrossAxisAlignment.start,
          //         //         children: [
          //         //           Text('Lorem ipsum sir amet'),
          //         //           SizedBox(height: 5),
          //         //           Text(
          //         //             'Rp 59.000',
          //         //             style: TextStyle(
          //         //                 color: primaryColor,
          //         //                 fontWeight: FontWeight.w500),
          //         //           ),
          //         //           SizedBox(height: 10),
          //         //           Text('Qty : 1'),
          //         //         ],
          //         //       ),
          //         //       Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
          //         //       Text(
          //         //         'Rp 59.000',
          //         //         style: TextStyle(
          //         //             color: primaryColor, fontWeight: FontWeight.w500),
          //         //       ),
          //         //     ],
          //         //   ),
          //         // ),
          //         SizedBox(height: 20),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text('Total Belanja',
          //                 style: TextStyle(
          //                   fontWeight: FontWeight.bold,
          //                 )),
          //             Text(
          //               'Rp 59.000',
          //               style: TextStyle(
          //                   color: primaryColor, fontWeight: FontWeight.bold),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          //   SizedBox(height: 20),
          //   Container(
          //     color: white,
          //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text(
          //           'Informasi Pengiriman',
          //           style: TextStyle(
          //               color: primaryColor, fontWeight: FontWeight.bold),
          //         ),
          //         SizedBox(height: 10),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               '...',
          //               style: TextStyle(fontWeight: FontWeight.w500),
          //             ),
          //             Text(
          //               '-',
          //               style: TextStyle(fontWeight: FontWeight.bold),
          //             ),
          //           ],
          //         ),
          //         SizedBox(height: 10),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text(
          //               'Biaya Pengiriman',
          //               style: TextStyle(fontWeight: FontWeight.w500),
          //             ),
          //             Text(
          //               'Rp. 20.000',
          //               style: TextStyle(
          //                   color: primaryColor, fontWeight: FontWeight.bold),
          //             ),
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          //   SizedBox(height: 20),
          //   Container(
          //     color: white,
          //     padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Text(
          //           'Total Transaksi',
          //           style: TextStyle(fontWeight: FontWeight.w500),
          //         ),
          //         Text(
          //           'Rp. 79.000',
          //           style: TextStyle(
          //               color: primaryColor, fontWeight: FontWeight.bold),
          //         )
          //       ],
          //     ),
          //   ),
          //   SizedBox(height: 30),
          //   Container(
          //     margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //     color: white,
          //     child: Column(
          //       children: [
          //         ElevatedButton(
          //           onPressed: () {},
          //           child: Text('Bayar'),
          //           style: ElevatedButton.styleFrom(
          //               minimumSize: Size(340, 50),
          //               primary: primaryColor,
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(20))),
          //         )
          //       ],
          //     ),
          //     ),
          //   ],
          // )
        ),
        bottomNavigationBar: status == "Menunggu Pembayaran"
            ? Container(
                height: 54,
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HowtoPayPage(
                                  id: id_trx,
                                  total: total,
                                )));
                  },
                  child: BigText(
                    text: 'Bayar',
                    size: 15,
                    color: white,
                    weight: FontWeight.w500,
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(340, 56),
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              )
            : status == "Dikirim"
                ? Container(
                    height: 54,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             SendReviewPage(order_id: id_trx)));
                        confirmDelete(context);
                      },
                      child: BigText(
                        text: 'Konfirmasi',
                        size: 15,
                        color: white,
                        weight: FontWeight.w500,
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(340, 56),
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  )
                : Container(
                    height: 54,
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: BigText(
                        text: 'Kembali',
                        size: 15,
                        color: white,
                        weight: FontWeight.w500,
                      ),
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(340, 56),
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                    ),
                  ));
  }

  confirmDelete(BuildContext context) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: SmallText(
        text: "Batal",
        color: grey40,
        size: 13.5,
        weight: FontWeight.w500,
      ),
      // color: Color(0xFFD9D9D9),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = FlatButton(
      child: SmallText(
        text: "Konfirmasi",
        color: primaryColor,
        size: 13.5,
        weight: FontWeight.w500,
      ),
      onPressed: () async {
        Navigator.of(context).pop(true);
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Container(
                  height: 135,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          backgroundColor: gray,
                          color: primaryColor,
                          strokeWidth: 6,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SmallText(
                          text: "Loading...",
                          size: 14,
                        )
                      ]),
                ),
              );
            });
        // var data = {"id": id_trx, "status": "Selesai"};
        var res = await ApiService().confirmOrder(id_trx);
        var body = jsonDecode(res.body);
        if (body['message'] == "SUCCESS") {
          Navigator.of(context).pop(true);
          // Fluttertoast.showToast(msg: "Berhasil mengkonfirmasi pesanan");
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SendReviewPage(
                  order_id: id_trx,
                ),
              ));
        } else {
          Fluttertoast.showToast(
              msg: "Terjadi kesalahan saat mengkonfirmasi pesanan");
        }
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: SmallText(
        text: "Konfirmasi Pesanan",
        size: 14,
        weight: FontWeight.w500,
      ),
      content: ProductText(
          text: "Apakah Anda yakin ingin melakukan konfirmasi pesanan ini ?"),
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

class DetailOrder extends StatefulWidget {
  const DetailOrder({Key? key}) : super(key: key);

  @override
  State<DetailOrder> createState() => _DetailOrderState();
}

class _DetailOrderState extends State<DetailOrder> {
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
