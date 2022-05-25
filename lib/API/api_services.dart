import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:main/models/cart.dart';
import 'package:main/models/detail_product.dart';
import 'package:main/models/order.dart';
import 'package:main/models/picsum.dart';
import 'package:main/models/product.dart';
import 'package:main/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final String baseURL = 'http://192.168.1.2/coba_api/public/api';
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
      final response = await http.get(Uri.parse("$baseURL/products"));
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

  // detail produk
  getDataProduct(id) async {
    var fullURL = baseURL + "/product/show/$id";
    return await http.get(fullURL, headers: _setHeaders());
  }

  getImages(var id) async {
    return await http.get(Uri.parse("$baseURL/product/images/$id"),
        headers: _setHeaders());
  }

  Future<List<ProductImage>> getProductImage(var id) async {
    try {
      final response = await http.get(Uri.parse("$baseURL/product/images/$id"));
      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        return List<ProductImage>.from(
            json.map((e) => ProductImage.fromJson(e)));
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  _getProductImage(var id) async {
    return await http.get("$baseURL/product/images/$id",
        headers: _setHeaders());
  }

  // ambil data keranjang user
  Future<List<Cart>> getUserCarts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('id_user');
    try {
      final response = await http.get(Uri.parse("$baseURL/carts/$id"),
          headers: _setHeaders());
      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        return List<Cart>.from(json.map((e) => Cart.fromJson(e)));
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // ambil data keranjang
  _getUserCart(id) async {
    var fullURL = baseURL + "/carts/$id";
    return await http.get(fullURL, headers: _setHeaders());
  }

  // masukkan keranjang
  addToCart(data) async {
    var fullURL = baseURL + "/add/cart";
    return await http.post(fullURL,
        body: jsonEncode(data), headers: _setHeaders());
  }

  deleteCart(id) async {
    return await http.delete(baseURL + "/carts/$id", headers: _setHeaders());
  }

  // ambil data pesanan user
  Future<List<Order>> getUserOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('id_user');
    try {
      final response = await http.get(Uri.parse("$baseURL/orders/$id"));
      if (response.statusCode == 200) {
        List<dynamic> json = jsonDecode(response.body);
        return List<Order>.from(json.map((e) => Order.fromJson(e)));
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  // auth login, register, logout
  auth(data, apiURL) async {
    var fullUrl = baseURL + apiURL;
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var id = prefs.getInt('id_user');
    return await http.get("$baseURL/user/$id", headers: _setHeaders());
  }

  Future _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
  }

  // ambil data user
  // Future<List<User>> _getUserData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var id = prefs.getInt('id_user');
  //   try {
  //     final response = await http.get(Uri.parse("$baseURL/user/$id"),
  //         headers: _setHeaders());
  //     if (response.statusCode == 200) {
  //       List<dynamic> json = jsonDecode(response.body);
  //       return List<User>.from(json.map((e) => User.fromJson(e)));
  //     } else {
  //       return [];
  //     }
  //   } catch (e) {
  //     return [];
  //   }
  // }

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
