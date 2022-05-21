import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main/models/detail_product.dart';
import 'package:main/models/picsum.dart';
import 'package:main/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseURL = 'http://192.168.1.6/coba_api/public/api';
  var token;

  Future<List<Picsum>> get() async {
    try {
      final response =
          await http.get(Uri.parse("https://picsum.photos/v2/list"));
      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        return List<Picsum>.from(json.map((e) => Picsum.fromJson(e)));
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Product>> getAllProducts() async {
    try {
      final response = await http
          .get(Uri.parse("http://192.168.1.6/coba_api/public/api/products"));
      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        return List<Product>.from(json.map((e) => Product.fromJson(e)));
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Product>> getDetailProduct(int id) async {
    try {
      final response = await http.get(baseURL + "/show/$id");
      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        return List<Product>.from(json.map((e) => Product.fromJson(e)));
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
  }

  auth(data, apiURL) async {
    var fullUrl = baseURL + apiURL;
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiURL) async {
    var fullUrl = baseURL + apiURL;
    await _getToken();
    return await http.get(
      fullUrl,
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

  // Future<List<String>> loadUserData() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   var user = jsonDecode(localStorage.getString('user'));

  //   if (user != null) {
  //   return user;
  //     setState(() {
  //       name = user['name'];
  //     });
  //   }
  // }
}
