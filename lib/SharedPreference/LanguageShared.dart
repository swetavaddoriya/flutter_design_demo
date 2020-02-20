import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LanguageShared extends StatefulWidget {
  @override
  LanguageSharedState createState() {
    return LanguageSharedState();
  }
}

class LanguageSharedState extends State<LanguageShared> {

  var counter = 0;
  var key = "counter";

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt(key) ?? 0);
    });
  }

  _onIncrementHit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      counter = (prefs.getInt(key) ?? 0) + 1;
    });

    prefs.setInt("counter", counter);
  }

  _onDecrementHit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      counter = (prefs.getInt(key) ?? 0) - 1;
    });

    prefs.setInt("counter", counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("shared preference demo"),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$counter',
                textScaleFactor: 10.0,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              RaisedButton(
                  onPressed: _onIncrementHit,
                  child: Text('Increment Counter')),
              Padding(padding: EdgeInsets.all(10.0)),
              RaisedButton(
                  onPressed: _onDecrementHit,
                  child: Text('Decrement Counter')),
            ],
          ),
        ),
      ),
    );
  }
}