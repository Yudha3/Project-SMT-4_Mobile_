import 'package:flutter/material.dart';
import 'package:main/pages/login_page.dart';
import 'package:main/utils/colors.dart';
import 'package:main/utils/textstyle.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        padding: const EdgeInsets.only(left: 32, right: 32),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [primaryColor, secondaryColor],
        )),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            Column(
              children: [
                Text("Discover more", style: textHeading),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "assets/images/drawkit2.png",
                  width: 340,
                ),
                Text(
                  "Temukan berbagai produk menarik dengan kemudahan transaksi",
                  style: textSubheading,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            SizedBox(
              height: 32,
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 22, horizontal: 36),
                    minimumSize: Size(200, 60),
                    textStyle: buttonText18,
                    primary: white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    side: BorderSide(width: 1, color: white),
                  ),
                  child: Text('Get started'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      // DetailPage adalah halaman yang dituju
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ))
          ],
        ),
      )),
    );
  }
}
