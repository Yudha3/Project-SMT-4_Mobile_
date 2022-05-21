import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:main/API/api_services.dart';
import 'package:main/pages/home/home_page.dart';
import 'package:main/pages/login_page.dart';
import 'package:main/utils/colors.dart';
import 'package:main/utils/textstyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email, password, confpass, name, username, phone;
  bool _isObscure = true;

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
                    "Register",
                    style: textHeadingDark,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Create your account here...",
                    style: textHeadingDark,
                  ),
                  // form nama
                  TextFormField(
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nama tidak boleh kosong!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name = value!;
                    },
                    decoration: InputDecoration(
                      hintText: "Nama Lengkap",
                      hintStyle: txtForm,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFF818181))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // form username
                  TextFormField(
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Username tidak boleh kosong!';
                      } else if (value.length < 4) {
                        return 'Minimum username adalah 4 karakter!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      username = value!;
                    },
                    decoration: InputDecoration(
                      hintText: "Username",
                      hintStyle: txtForm,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFF818181))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // form email
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Alamat Email tidak boleh kosong!';
                      } else if (!value.contains("@") || !value.contains(".")) {
                        return 'Alamat Email tidak valid!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      email = value!;
                    },
                    decoration: InputDecoration(
                      hintText: "Email",
                      hintStyle: txtForm,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFF818181))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // form telepon
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nomor Telepon tidak boleh kosong!';
                      } else if (value.length < 11 || value.length > 15) {
                        return 'Nomor Telepon tidak valid';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      phone = value!;
                    },
                    decoration: InputDecoration(
                      hintText: "Nomor Telepon",
                      hintStyle: txtForm,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide:
                              BorderSide(width: 1, color: Color(0xFF818181))),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // form password
                  TextFormField(
                    obscureText: _isObscure,
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
                  // form confirm password
                  TextFormField(
                    obscureText: _isObscure,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Masukkan kembali password yang dibuat!';
                      } else if (value.length < 8) {
                        return 'Minimal 8 karakter!';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      confpass = value!;
                    },
                    decoration: InputDecoration(
                      hintText: "Konfirmasi Password",
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

                            if (password == confpass) {
                              _register();
                            } else {
                              _showMsg("Konfirmasi Password tidak sesuai!");
                            }
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
                        child: Text(_isLoading ? "Loading..." : "Register",
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
                          'Already have account?',
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
                                    builder: (context) => LoginPage()),
                              );
                            },
                            child: Text("Login", style: textButtonRegister)),
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

  void _register() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'username': username
    };

    var res = await ApiService().auth(data, '/register');
    var body = json.decode(res.body);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      localStorage.setString('id_user', json.encode(body['user']['id']));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      if (body['message']['name'] != null) {
        _showMsg(body['message']['name'][0].toString());
      } else if (body['message']['email'] != null) {
        _showMsg(body['message']['email'][0].toString());
      } else if (body['message']['password'] != null) {
        _showMsg(body['message']['password'][0].toString());
      }
    }

    setState(() {
      _isLoading = false;
    });
  }
}
