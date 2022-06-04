import 'package:flutter/material.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/utils/colors.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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
                  BigText(text: "Pembayaran"),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Silahkan Transfer ke ',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      '35171234567',
                      style: TextStyle(
                          fontSize: 30,
                          color: primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'A.n. BUMDES Mandiri',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Image.asset(
                  'images/bni_logo.png',
                  width: 100,
                  height: 100,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            color: white,
            child: Row(
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
          ),
          Container(
            color: white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Divider(
              height: 10,
              color: black,
              thickness: 2,
            ),
          ),
          Container(
            color: white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Petunjuk Pembayaran',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      color: primaryColor,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Buka aplikasi M-Banking dari masing-masing Bank \n atau pergi ke mesin ATM jika anda menggunakan \n kartu debit atau kartu kredit',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      color: primaryColor,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Masuk ke menu Transfer',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      color: primaryColor,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Masukkan kode Bank BNI yaitu 009 diikitui nomor \n rekening yang tersedia diatas',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      color: primaryColor,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Masukkan jumlah nominal transfer sesuai dengan \n total pembayaran pada pesanan',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      color: primaryColor,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Periksa informasi yang tertera, jika sudah benar \n klik Ya',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.circle,
                      color: primaryColor,
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Jika berhasil melakukan transfer, unggah bukti \n pembayaran di daftar pesanan',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Lihat Pesanan'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(400, 50),
                    primary: primaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
