import 'dart:convert';

import 'package:exam_flutter/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'HomeScreen.dart';

class Regestration extends StatefulWidget {
  @override
  _RegestrationState createState() => _RegestrationState();
}

class _RegestrationState extends State<Regestration> {
  void initState() {
    // TODO: implement initState
    Firebase.initializeApp();
  }

  Query getMessageQuery() {
    return _messagesRef;
  }

  final auth = FirebaseAuth.instance;
  final DatabaseReference _messagesRef =
      FirebaseDatabase.instance.reference().child('UserData');
  String email = "";
  String password = "";
  String confirmedPassword = "";
  String userName = "";
  String phone = "";
  String fullname = "";

  void saveMessage(UserData user) {
    final String url =
        'https://examflutter-89c0b-default-rtdb.firebaseio.com/UserData.json';
    http.post(url, body: jsonEncode((user)));
    // _messagesRef.push().set(user.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reagestation'),
        ),
        body: ListView(
          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              key: Key('EnterPhone-TextFormField'),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorMaxLines: 1,
                  labelText: 'username'),
              onChanged: (value) {
                this.userName = value;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              key: Key('EnterPhone-TextFormField'),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorMaxLines: 1,
                  labelText: 'fullname'),
              onChanged: (value) {
                this.fullname = value;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              key: Key('EnterPhone-TextFormField'),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorMaxLines: 1,
                  labelText: 'password'),
              onChanged: (value) {
                this.password = value;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              key: Key('EnterPhone-TextFormField'),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorMaxLines: 1,
                  labelText: 'confirmpassword'),
              onChanged: (value) {
                this.confirmedPassword = value;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.phone,
              key: Key('EnterPhone-TextFormField'),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorMaxLines: 1,
                  labelText: 'phone'),
              onChanged: (value) {
                this.phone = value;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              key: Key('EnterPhone-TextFormField'),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorMaxLines: 1,
                  labelText: 'email'),
              onChanged: (value) {
                this.email = value;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              key: Key('EnterPhone-TextFormField'),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  errorMaxLines: 1,
                  labelText: 'image'),
            ),
            MaterialButton(
              onPressed: () {
                if (this.password == this.confirmedPassword) {
                  auth.createUserWithEmailAndPassword(
                      email: this.email, password: this.password);
                  saveMessage(UserData(
                      this.userName, this.fullname, this.email, this.phone));
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Login()));
                }
              },
              child: Text('Sgin Up'),
            ),
          ],
        ));
  }
}

class UserData {
  final String username;
  final String fullname;
  final String email;
  final String phone;

  UserData(
    this.username,
    this.fullname,
    this.email,
    this.phone,
  );

  UserData.fromJson(Map<dynamic, dynamic> json, param1)
      : username = json['username'] as String,
        fullname = json['fullname'] as String,
        email = json['email'] as String,
        phone = json['phone'] as String;
  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'username': username,
        'fullname': fullname,
        'email': email,
        'phone': phone
      };
}
