import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_weather/screen/home_screen.dart';
import 'package:simple_weather/widget/bottom_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // TabController controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Weather',
      theme: ThemeData(
          accentColor: Colors.black,
          brightness: Brightness.light,
          primaryColor: Colors.white),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              HomeScreen(),
              Container(
                child: Center(child: Text('more')),
              )
            ],
          ),
          bottomNavigationBar: Bottom(),
        ),
      ),
    );
  }
}
