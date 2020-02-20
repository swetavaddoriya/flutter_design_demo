import 'package:flutter/material.dart';

class ExtraColumn extends StatefulWidget {
  @override
  _ExtraColumnState createState() => _ExtraColumnState();
}

class _ExtraColumnState extends State<ExtraColumn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("dfdfdsf"),
      ),
      body: Column(
        children: <Widget>[
          new Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right:8.0),
                child: new Text("note:-",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 20.0),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0),
                  child: new Text("fdsgdsgdsgdfffffffffffffffffffffffffffdgvdggggggggggggggggggg",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
