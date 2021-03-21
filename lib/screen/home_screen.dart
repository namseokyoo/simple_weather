import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String input = '';

  @override
  void initState() {
    super.initState();
  }

  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?q=London&appid=e98ea2051553e4a8f33f31218a26dede'),
        headers: {"Accept": "application/json"});
    // print(response.body);
    Map data = jsonDecode(response.body);
    print("###");
    String weather = data['weather'][0]['main'];
    print(weather);
    setState(() {
      input = weather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Text('날씨 가져오기'),
            ),
            Container(
              child: RaisedButton(
                onPressed: getData,
                child: Text('Get'),
              ),
            ),
            Container(
              child: Text(input),
            )
          ],
        ),
      ),
    );
  }
}
