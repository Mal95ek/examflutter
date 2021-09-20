import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:convert';

class UserData {
  final String username;
  final String fullname;
  final String email;
  final String phone;

  UserData({
    required this.username,
    required this.fullname,
    required this.email,
    required this.phone,
  });
}

class UserDatass with ChangeNotifier {
  List<UserData> productsList = [];

  Future<void> fetchData() async {
    var user;

    User userdata = FirebaseAuth.instance.currentUser;
    const url = "https://flutter-app-568d3.firebaseio.com/product.json";

    try {
      final http.Response res = await http.get(url);
      final extractedData = jsonDecode(res.body) as Map<String, dynamic>;
      extractedData.forEach((prodId, prodData) {
        final prodIndex =
            productsList.indexWhere((element) => element.phone == prodId);
        if (prodIndex >= 0) {
          productsList[prodIndex] = UserData(
              username: prodData['username'],
              fullname: prodData['fullname'],
              email: prodData['email'],
              phone: prodId);
        }
      });

      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}

void signin(String email, String password) {}
