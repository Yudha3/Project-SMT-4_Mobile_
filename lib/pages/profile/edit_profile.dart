import 'package:flutter/material.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/utils/colors.dart';
import 'package:main/utils/textstyle.dart';

enum Gender { pria, wanita }

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  Gender? _gender = Gender.pria;
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
                  BigText(text: "Edit Profil"),
                  Icon(
                    Icons.close,
                    size: 30,
                    color: Colors.transparent,
                  ),
                ]),
          ),
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 20),
            color: white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: CircleAvatar(
                      radius: 60,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1585155770447-2f66e2a397b5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60'),
                        radius: 58,
                        child: Row(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 70)),
                            Column(
                              children: [
                                Padding(padding: EdgeInsets.only(top: 70)),
                                CircleAvatar(
                                  backgroundColor: primaryColor,
                                  child: Icon(Icons.photo_camera_rounded),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: white,
                  child: Column(
                    children: [
                      Form(
                          child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 1, color: primaryColor)),
                              hintText: "Yoga Andrian",
                              hintStyle: txtForm,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 1, color: primaryColor)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Radio<Gender>(
                                          value: Gender.pria,
                                          groupValue: _gender,
                                          onChanged: (value) {
                                            setState(() {
                                              _gender = value;
                                            });
                                          },
                                        ),
                                        Expanded(
                                          child: Text('Laki-Laki'),
                                        )
                                      ],
                                    ),
                                    flex: 1,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Radio<Gender>(
                                          value: Gender.wanita,
                                          groupValue: _gender,
                                          onChanged: (value) {
                                            setState(() {
                                              _gender = value;
                                            });
                                          },
                                        ),
                                        Expanded(child: Text('Perempuan'))
                                      ],
                                    ),
                                    flex: 1,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 1, color: primaryColor)),
                              hintText: "081540988168",
                              hintStyle: txtForm,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 1, color: primaryColor)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          // form email
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 1, color: primaryColor)),
                              hintText: "yogaandrianp21@gmail.com",
                              hintStyle: txtForm,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 1, color: Color(0xFF818181))),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          // form kota
                          TextFormField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 1, color: primaryColor)),
                              hintText: "Jombang",
                              hintStyle: txtForm,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 1, color: primaryColor)),
                            ),
                          ),
                        ],
                      )),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
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
                        child: const Text(
                          'Simpan',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ],
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
