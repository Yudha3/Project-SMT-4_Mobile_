import 'package:flutter/material.dart';
import 'package:main/API/api_services.dart';
import 'package:main/models/order.dart';
import 'package:main/pages/orders/order_item.dart';
import 'package:main/utils/colors.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/widgets/small_text.dart';

class MyOrderPage extends StatefulWidget {
  const MyOrderPage({Key? key}) : super(key: key);

  @override
  State<MyOrderPage> createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> {
  bool _isLoading = true;
  List<Order> orders = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
    setState(() {});
  }

  void fetchData() async {
    var res = await ApiService().getUserOrder();
    setState(() {
      orders.addAll(res);
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
                    backgroundColor: gray,
                    color: primaryColor,
                    strokeWidth: 6,
                  ),
                )
              : Column(
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
                    Expanded(
                        child: Container(
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: orders
                            .map((order) => OrderItem(
                                  order: order,
                                  id: order.id,
                                  date: order.date,
                                  total: order.total,
                                  status: order.status,
                                  image: order.image,
                                ))
                            .toList(),
                      ),
                    ))
                  ],
                )),
    );
  }
}
