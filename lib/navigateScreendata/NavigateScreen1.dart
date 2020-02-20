import 'package:flutter/material.dart';

import 'NavigationScreen2.dart';



class NavigateScreen1 extends StatefulWidget {
  @override
  _NavigateScreen1State createState() => _NavigateScreen1State();
}

class _NavigateScreen1State extends State<NavigateScreen1> {

  TextEditingController name=new TextEditingController();

  final data=Data(
    counter: 1,
    Datetime: DateTime.now().toString(),
    text: "sweta",
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: new Container(
                  child:new Text("pass data using counstructor"),

                ),
              ),

              RaisedButton(
                child: Text('Send data to the second page'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NavigationScreen2(
                          data: data,
                        )),
                  );
                },
              ),
            ],
          ),
        ),
    );
  }
}

class Data{
  String text;
  int counter;
  String Datetime;

  Data({this.text,this.counter,this.Datetime});

}
