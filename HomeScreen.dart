import 'package:exam_flutter/main.dart';
import 'package:exam_flutter/weather.dart';
import 'package:exam_flutter/weather.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'weather.dart';

import 'profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home screen'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Cars',
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ),
            Divider(
              color: Colors.grey,
              height: 10,
            ),
            ListTile(
              title: Text('profile'),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            Divider(
              color: Colors.grey,
              height: 10,
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: getweather(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text('${snapshot.error} has occurred.'),
            );
          else if (snapshot.hasData) {
            final InfoWeather data = snapshot.data as InfoWeather;
            return ListView.builder(
                itemCount: data.weather.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      '${data.base}',
                      style: TextStyle(fontSize: 20),
                    ),
                    subtitle: Text(data.name),
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
