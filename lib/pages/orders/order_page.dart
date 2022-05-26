import 'package:flutter/material.dart';
import 'package:main/utils/textstyle.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/utils/colors.dart';

enum Delivery { reguler, express }

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();
  Delivery? _character = Delivery.reguler;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgWhite,
      body: SafeArea(
          child: ListView(
        children: [
          Column(
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
                      BigText(text: "Order"),
                      Icon(
                        Icons.close,
                        size: 30,
                        color: Colors.transparent,
                      ),
                    ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: white,
                child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Isikan Alamat Anda',
                          style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Alamat Tidak Boleh Kosong!';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.streetAddress,
                            decoration: InputDecoration(
                                hintText:
                                    'Jln Merdeka Barat No. 12 Kab. Jember Kode Pos 68124',
                                hintStyle: txtForm,
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey)))),
                        SizedBox(height: 10)
                      ],
                    )),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Pesanan Saya',
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
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15)),
                          Text(
                            'Rp 59.000',
                            style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Pesanan',
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
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                color: white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Pengiriman',
                      style: TextStyle(
                          color: primaryColor, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      children: [
                        ListTile(
                          title: const Text('Reguler'),
                          leading: Radio<Delivery>(
                            value: Delivery.reguler,
                            groupValue: _character,
                            onChanged: (Delivery? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: const Text('Express'),
                          leading: Radio<Delivery>(
                            value: Delivery.express,
                            groupValue: _character,
                            onChanged: (Delivery? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Biaya Pengiriman',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        Text(
                          'Rp 20.000',
                          style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                color: white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Pesanan',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Rp 59.000',
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
                          'Rp 20.000',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                          'Total Pembayaran',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Rp 79.000',
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                color: white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Pembayaran',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'Rp 79.000',
                          style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 20),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(150, 50),
                          primary: primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: const Text(
                        'Pesan',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
