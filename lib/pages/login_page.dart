import 'dart:convert';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:flutter/material.dart';
import 'package:main/API/api_services.dart';
import 'package:main/pages/main_page.dart';
import 'package:main/pages/register_page.dart';
import 'package:main/utils/colors.dart';
import 'package:main/utils/textstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;
  var email, password;
  bool _isObscure = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
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
                            _login();
                            // if (email == "yoga@gmail.com" &&
                            //     password == "anjay") {
                            //   Navigator.push(
                            //     context,
                            //     // DetailPage adalah halaman yang dituju
                            //     MaterialPageRoute(
                            //         builder: (context) => MainPage()),
                            //   );
                            // } else {
                            //   Fluttertoast.showToast(
                            //       msg: "Invalid email address or password",
                            //       toastLength: Toast.LENGTH_SHORT,
                            //       gravity: ToastGravity.CENTER,
                            //       timeInSecForIosWeb: 1,
                            //       backgroundColor: Colors.red,
                            //       textColor: Colors.white,
                            //       fontSize: 16.0);
                            // }
                          }
                        },
                        child: Text(_isLoading ? "Loading..." : "Login",
                            style: buttonText20)),
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
                            child: Text("Register", style: textButtonRegister)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'email': email,
      'password': password,
      // 'id': localStorage.getString('id')
    };

    var res = await ApiService().auth(data, '/login');
    var body = json.decode(res.body);
    var id = body['id'];
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      localStorage.setInt('id_user', id);
      // localStorage.
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(builder: (context) => MainPage()),
      );
    } else {
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
