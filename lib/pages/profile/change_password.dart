import 'package:flutter/material.dart';
import 'package:main/widgets/big_text.dart';
import 'package:main/utils/colors.dart';
import 'package:main/utils/textstyle.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  var password;
  bool _isObscure1 = true;
  bool _isObscure2 = true;
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
                  BigText(text: "Ubah Password"),
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
            child: Form(
              child: Column(
                children: [
                  TextFormField(
                    obscureText: _isObscure1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password tidak boleh kosong!';
                      } else if (value.length < 8) {
                        return 'Minimal 8 karakter!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value!;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(width: 1, color: primaryColor)),
                      hintText: "Password Baru",
                      hintStyle: txtForm,
                      suffixIcon: IconButton(
                          color: primaryColor,
                          icon: Icon(_isObscure1
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure1 = !_isObscure1;
                            });
                          }),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(width: 1, color: primaryColor)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    obscureText: _isObscure2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password tidak boleh kosong!';
                      } else if (value.length < 8) {
                        return 'Minimal 8 karakter!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      password = value!;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(width: 1, color: primaryColor)),
                      hintText: "Konfirmasi Password Baru",
                      hintStyle: txtForm,
                      suffixIcon: IconButton(
                          color: primaryColor,
                          icon: Icon(_isObscure2
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscure2 = !_isObscure2;
                            });
                          }),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(width: 1, color: primaryColor)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 400,
            color: white,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(400, 50),
                      primary: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Simpan',
                    ))
              ],
            ),
          ),
        ],
      )),
    );
  }
}
