import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'plant.dart';

import 'list.dart';
void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      primaryColor: const Color(0xFF02BB9F),
      primaryColorDark: const Color(0xFF167F67),
      accentColor: const Color(0xFF167F67),
    ),
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  List data;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: new AppBar(
          title: new Text("Plants Info",
            style: new TextStyle(color: Colors.white),),
        ),
        body: new Container(
          child: Center(
            // Use future builder and DefaultAssetBundle to load the local JSON file
            child: new FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('assets/PlantsData.json'),
                builder: (context, snapshot) {
                  List<Plant> plants =
                  parseJson(snapshot.data.toString());
                  return plants != null
                      ? new PlantList(plant: plants)
                      : Center(child: new CircularProgressIndicator());
                }),
          ),
        ));
  }

  List<Plant> parseJson(String response) {
    if(response==null){
      return [];
    }
    final parsed =
    json.decode(response.toString()).cast<Map<String, dynamic>>();
    return parsed.cast<Plant>((json) => new Plant.fromJson(json)).toList();
  }
}
