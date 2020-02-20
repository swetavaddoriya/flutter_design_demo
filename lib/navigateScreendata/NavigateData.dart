import 'package:flutter/material.dart';

import 'NavigateForm1.dart';
import 'NavigateScreen1.dart';


class NavigateData extends StatefulWidget {
  @override
  _NavigateDataState createState() => _NavigateDataState();
}

class _NavigateDataState extends State<NavigateData> {
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
                      child: new Text("pass data using counstructor"),
                      onPressed: ()=>Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => NavigateScreen1(),
                          )))),

              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new MaterialButton(
                      color: Colors.teal,
                      textColor: Colors.white,
                      child: new Text("using text field"),
                      onPressed: ()=>Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => MyHomePage(),
                          )))),


            ],
          ),
        )
    );
  }
}
