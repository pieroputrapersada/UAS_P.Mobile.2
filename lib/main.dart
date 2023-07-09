import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> stationData = [];

  Future<void> fetchStationData() async {
    var response = await http.get(Uri.parse('https://booking.kai.id/api/stations2'));
    if (response.statusCode == 200) {
      setState(() {
        stationData = json.decode(response.body) as List<dynamic>;
      });
    } else {
      print('Failed to fetch data from API.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchStationData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Nama-Nama Stasiun',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(
          itemCount: stationData.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(stationData[index]['name']),
              subtitle: Text(stationData[index]['city']),
            );
          },
        ),
      ),
    );
  }
}
