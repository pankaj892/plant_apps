import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/plant.dart';

class PlantList extends StatelessWidget {
  final List<Plant> plant;
  PlantList({Key key, this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: plant == null ? 0 : plant.length,
        itemBuilder: (BuildContext context, int index) {
          return
            new Card(
              child: new Container(
                child: new Center(
                    child: new Column(
                      // Stretch the cards in horizontal axis
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[

                        new Text(
                          // Read the name field value and set it in the Text widget
                          plant[index].name,
                          // set some style to text
                          style: new TextStyle(
                              fontSize: 20.0, color: Colors.lightBlueAccent),
                        ),
                      ],
                    )),
                padding: const EdgeInsets.all(15.0),
              ),
            );
        });
  }
}