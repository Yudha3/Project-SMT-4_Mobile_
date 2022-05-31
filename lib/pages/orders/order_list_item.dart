import 'package:flutter/material.dart';
import 'package:main/models/order.dart';
import 'package:main/pages/orders/detail_order_page.dart';
import 'package:main/pages/product/detail_product_page.dart';
import 'package:main/utils/colors.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/widgets/product_text.dart';
import 'package:main/widgets/small_text.dart';

class OrderListItem extends StatelessWidget {
  Order order;
  var id, total, date, status, image;

  OrderListItem({
    Key? key,
    required this.order,
    required this.id,
    required this.date,
    required this.total,
    required this.status,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 100,
      margin: EdgeInsets.symmetric(vertical: 8),
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
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Tapped"),
            backgroundColor: Color.fromARGB(255, 70, 163, 58),
          ));
        },
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(
                    text: '$date',
                    size: 12,
                    color: grey40,
                    weight: FontWeight.w500,
                  ),
                  ProductText(
                    text: '$status',
                    size: 13,
                    weight: FontWeight.w500,
                    color: primaryColor,
                    align: TextAlign.end,
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                            image: NetworkImage(
                              image ??
                                  "https://thumbs.dreamstime.com/b/flat-isolated-vector-eps-illustration-icon-minimal-design-long-shadow-error-file-not-found-web-118526724.jpg",
                            ),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.36,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12),
                            BigText(
                              text: 'Total Transaksi :',
                              size: 12.5,
                              weight: FontWeight.w400,
                              color: black,
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            ProductText(
                              text: CurrencyFormat.convertToIdr(total),
                              size: 13,
                              weight: FontWeight.w600,
                              color: primaryColor,
                              align: TextAlign.end,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailOrderPage(
                                          id: order.id,
                                        )));
                          },
                          child: SmallText(
                            text: "Lihat",
                            color: white,
                            size: 13,
                            weight: FontWeight.w600,
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: 7),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ]),

        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Row(
        //       children: [
        //         Container(
        //           width: 80,
        //           height: 80,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(5),
        //               image: DecorationImage(
        //                   image: NetworkImage(
        //                     image ??
        //                         "https://thumbs.dreamstime.com/b/flat-isolated-vector-eps-illustration-icon-minimal-design-long-shadow-error-file-not-found-web-118526724.jpg",
        //                   ),
        //                   fit: BoxFit.cover)),
        //         ),
        //         SizedBox(
        //           width: 12,
        //         ),
        //         SizedBox(
        //           width: MediaQuery.of(context).size.width / 1.48,
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //             children: [
        //               SizedBox(
        //                 height: 3,
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 children: [
        //                   SmallText(
        //                     text: '$date',
        //                     size: 12,
        //                     color: grey40,
        //                     weight: FontWeight.w500,
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(
        //                 height: 5,
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 crossAxisAlignment: CrossAxisAlignment.center,
        //                 children: [
        //                   BigText(
        //                     text: "Status :",
        //                     size: 12.5,
        //                     weight: FontWeight.w400,
        //                     color: black,
        //                   ),
        //                   SizedBox(
        //                     width: MediaQuery.of(context).size.width / 2.0,
        //                     child: ProductText(
        //                       text: '$status',
        //                       size: 13,
        //                       weight: FontWeight.w500,
        //                       color: primaryColor,
        //                       align: TextAlign.end,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(
        //                 height: 8,
        //               ),
        //               Row(
        //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 children: [
        //                   BigText(
        //                     text: 'Total Transaksi :',
        //                     size: 12.5,
        //                     weight: FontWeight.w400,
        //                     color: black,
        //                   ),
        //                   SizedBox(
        //                     width: MediaQuery.of(context).size.width / 3.1,
        //                     child: ProductText(
        //                       text: CurrencyFormat.convertToIdr(total),
        //                       size: 13,
        //                       weight: FontWeight.w600,
        //                       color: primaryColor,
        //                       align: TextAlign.end,
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //               SizedBox(
        //                 height: 8,
        //               )
        //             ],
        //           ),
        //         )

        //         // SizedBox(
        //         //   width: MediaQuery.of(context).size.width / 2.5,
        //         //   child: Column(
        //         //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         //     crossAxisAlignment: CrossAxisAlignment.start,
        //         //     children: [
        //         //       BigText(
        //         //         text: '$date',
        //         //         size: 13,
        //         //         weight: FontWeight.w500,
        //         //         color: black,
        //         //       ),
        //         //       BigText(
        //         //         text: CurrencyFormat.convertToIdr(total),
        //         //         size: 13,
        //         //         weight: FontWeight.w600,
        //         //         color: primaryColor,
        //         //       ),
        //         //       SizedBox(
        //         //         height: 4,
        //         //       ),
        //         //       SizedBox(
        //         //         height: 3,
        //         //       )
        //         //     ],
        //         //   ),
        //         // ),
        //         // SizedBox(
        //         //   width: MediaQuery.of(context).size.width / 4.5,
        //         //   child: Column(
        //         //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         //     crossAxisAlignment: CrossAxisAlignment.end,
        //         //     children: [
        //         //       BigText(
        //         //         text: '$date',
        //         //         size: 14,
        //         //         weight: FontWeight.w500,
        //         //         color: black,
        //         //       ),
        //         //       BigText(
        //         //         text: CurrencyFormat.convertToIdr(total),
        //         //         size: 14,
        //         //         weight: FontWeight.w600,
        //         //         color: primaryColor,
        //         //       ),
        //         //       SizedBox(
        //         //         height: 4,
        //         //       ),
        //         //       SizedBox(
        //         //         height: 3,
        //         //       )
        //         //     ],
        //         //   ),
        //         // ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class OrderProductItem extends StatelessWidget {
  var title, price, qty, subtotal, image;
  OrderProductItem({
    Key? key,
    required this.title,
    required this.price,
    required this.qty,
    required this.subtotal,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 84,
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 0),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(width: 1, color: Color.fromARGB(255, 204, 204, 204)),
        // boxShadow: [
        //   BoxShadow(
        //       color: Color(0xFF818181), offset: Offset(0, 3), blurRadius: 5)
        // ],
      ),
      padding: EdgeInsets.only(left: 6, top: 6, bottom: 6, right: 0),
      child: Row(
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: DecorationImage(
                    image: NetworkImage(
                      image ??
                          "https://thumbs.dreamstime.com/b/flat-isolated-vector-eps-illustration-icon-minimal-design-long-shadow-error-file-not-found-web-118526724.jpg",
                    ),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 1.58,
                      child:
                          ProductText(text: "$title", height: 1.0, size: 12.8)),
                ],
              ),
              Row(
                children: [
                  ProductText(
                      text: CurrencyFormat.convertToIdr(price),
                      color: primaryColor,
                      weight: FontWeight.w500,
                      size: 12.8),
                ],
              ),
              SizedBox(
                height: 4,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.58,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductText(text: "Jumlah : $qty", size: 12.8),
                      ProductText(
                          text: CurrencyFormat.convertToIdr(subtotal),
                          color: primaryColor,
                          weight: FontWeight.w500,
                          size: 13),
                    ]),
              ),
            ],
          )
          // Column(
          //   children: [
          //     ProductText(text: "$title"),
          //     SizedBox(
          //       height: 8,
          //     ),
          //     ProductText(
          //       text: CurrencyFormat.convertToIdr(price),
          //       color: primaryColor,
          //       weight: FontWeight.w500,
          //     ),
          //     SizedBox(
          //       height: 8,
          //     ),
          //     ProductText(
          //       text: CurrencyFormat.convertToIdr(subtotal),
          //       color: primaryColor,
          //       weight: FontWeight.w500,
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
