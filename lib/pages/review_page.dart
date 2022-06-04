import 'package:flutter/material.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/utils/colors.dart';
import 'package:main/utils/textstyle.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
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
                  BigText(text: "Ulasan"),
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
                Form(
                    child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 10,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 1, color: primaryColor)),
                    hintText: ".......",
                    hintStyle: txtForm,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(width: 1, color: primaryColor)),
                  ),
                )),
              ],
            ),
          ),
          Container(
            height: 250,
            color: white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(400, 50),
                        primary: primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {},
                    child: Text('Simpan Ulasan')),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
