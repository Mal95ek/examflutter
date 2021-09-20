import 'package:exam_flutter/HomeScreen.dart';
import 'package:exam_flutter/login.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Auth.dart';

void main() async {
  runApp(
    ChangeNotifierProvider<UserDatass>(
      create: (_) => UserDatass(),
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {}

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {}

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
            splash: Image.asset(
              "images/Cars_logo.jpeg",
            ),
            nextScreen: Login(),
            splashTransition: SplashTransition.slideTransition,
            backgroundColor: Colors.blue,
            duration: 2500,
          ),
        );
      },
    );
  }
}
