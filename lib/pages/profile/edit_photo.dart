import 'package:flutter/material.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/utils/colors.dart';

class EditPhotoPage extends StatefulWidget {
  const EditPhotoPage({Key? key}) : super(key: key);

  @override
  State<EditPhotoPage> createState() => _EditPhotoPageState();
}

class _EditPhotoPageState extends State<EditPhotoPage> {
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
                  BigText(text: "Edit Foto Profil"),
                  Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.transparent,
                  ),
                ]),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            color: white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 70,
                        backgroundColor: primaryColor,
                        child: CircleAvatar(
                          radius: 68,
                          child: Text(
                            'Select Image To Upload',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      height: 350,
                      color: white,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  minimumSize: Size(350, 50),
                                  primary: primaryColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15))),
                              onPressed: () {},
                              child: Text('Simpan Foto'))
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
