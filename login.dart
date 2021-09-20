// import 'package:firebase_core/firebase_core.dart';
import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'HomeScreen.dart';
// ignore: unused_import
import 'regestration.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:firebase_auth/firebase_auth.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flushbar/flushbar.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final formkey = new GlobalKey<FormState>();
  void validateandsave() {
    final form = formkey.currentState;
    if (form!.validate()) {
      print('from is valid');
    } else {
      print("invild");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    Firebase.initializeApp();
  }

  final auth = FirebaseAuth.instance;
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('login'),
        ),
        body: ListView(
          children: [
            TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                key: Key('EnterPhone-TextFormField'),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    errorMaxLines: 1,
                    labelText: 'email'),
                onChanged: (value) {
                  this.email = value;
                },
                validator: (value) {
                  value!.isEmpty ? 'plese enter the email' : null;
                },
                onSaved: (value) => _email = value as TextEditingController),
            TextFormField(
                controller: _password,
                keyboardType: TextInputType.visiblePassword,
                key: Key('EnterPhone-TextFormField'),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    errorMaxLines: 1,
                    labelText: 'password'),
                onChanged: (value) {
                  this.password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return ('plese enter the password');
                  }
                },
                onSaved: (value) => _password = value as TextEditingController),
            MaterialButton(
              onPressed: () {
                auth
                    .signInWithEmailAndPassword(
                        email: email, password: password)
                    .then((value) => {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()))
                        });
              },
              child: Text('Login'),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Regestration()));
              },
              child: Text('Regestration'),
            )
          ],
        ));
  }
}
