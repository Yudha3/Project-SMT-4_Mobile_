import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:main/pages/main_page.dart';
import 'package:main/pages/register_page.dart';
import 'package:main/utils/colors.dart';
import 'package:main/utils/textstyle.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 64,
                    ),
                    Text(
                      "Please Login",
                      style: textHeadingDark,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Image.asset(
                      "assets/images/drawkit3.png",
                      width: 200,
                    ),
                    SizedBox(
                      height: 54,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email Address cannot be empty!';
                        } else if (!value.contains("@")) {
                          return 'Invalid email address!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email = value!;
                      },
                      decoration: InputDecoration(
                        hintText: "Email Address",
                        hintStyle: txtForm,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFF818181))),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TextFormField(
                      obscureText: _isObscure,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password cannot be empty!';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password = value!;
                      },
                      decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: txtForm,
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide:
                                BorderSide(width: 1, color: Color(0xFF818181))),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 68,
                      decoration: BoxDecoration(
                          color: primaryLight,
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [primaryColor, secondaryColor])),
                      child: TextButton(
                          style: TextButton.styleFrom(
                              shadowColor: Color(0xFFd9d9d9),
                              backgroundColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              )),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              if (email == "yoga@gmail.com" &&
                                  password == "anjay") {
                                Navigator.push(
                                  context,
                                  // DetailPage adalah halaman yang dituju
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()),
                                );
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Invalid email address or password",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            }
                          },
                          child: Text("Login", style: buttonText20)),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Not have account yet?',
                            style: textRegister,
                          ),
                          // Text(" Register", style: textButtonRegister,),
                          TextButton(
                              style: TextButton.styleFrom(
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  // DetailPage adalah halaman yang dituju
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()),
                                );
                              },
                              child:
                                  Text("Register", style: textButtonRegister)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
