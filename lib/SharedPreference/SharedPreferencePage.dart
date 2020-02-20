import 'package:flutter/material.dart';

import 'LanguageShared.dart';

class SharedPreferencePage extends StatefulWidget {
  @override
  _SharedPreferencePageState createState() => _SharedPreferencePageState();
}

class _SharedPreferencePageState extends State<SharedPreferencePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[

            Padding(
                padding: const EdgeInsets.all(8.0),
                child: new MaterialButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: new Text("language selection"),
                    onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => LanguageShared(),
                        )))),

          ],
        ),
      ),
    );
  }
}
