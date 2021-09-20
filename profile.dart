import 'dart:convert';

import 'package:exam_flutter/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'regestration.dart';
import 'Auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    Provider.of<UserDatass>(context, listen: false).fetchData();
    super.initState();
    Firebase.initializeApp();
  }

  String email = "";
  String password = "";
  String username = "";
  String phone = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                  labelText: "username", hintText: "Add username"),
              onChanged: (val) => setState(() => username = val),
            ),
            TextField(
              decoration:
                  InputDecoration(labelText: "email", hintText: "Add email"),
              onChanged: (val) => setState(() => email = val),
            ),
            TextField(
              decoration: InputDecoration(
                  labelText: "password", hintText: "Add password"),
              onChanged: (val) => setState(() => password = val),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                  labelText: "phone", hintText: "Paste your image url here"),
              onChanged: (val) => setState(() => phone = val),
            ),
          ],
        ));
  }
}
