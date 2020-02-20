import 'package:flutter/material.dart';

import 'NavigateScreen1.dart';

class NavigationScreen2 extends StatelessWidget {

  final Data data;


  NavigationScreen2({this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: new Container(
          padding: const EdgeInsets.all(12.0),
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Container(
                height: 54.0,
                padding: const EdgeInsets.all(8.0),
                child: new Text("Data pass to 1st screen"),
              ),
              Text('name: ${data.text}'),
              Text('counter: ${data.counter}'),
              Text('Date: ${data.Datetime}'),
            ],
          ),
        ),
      ),
    );
  }
}

