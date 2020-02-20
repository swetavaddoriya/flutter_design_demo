import 'package:flutter/material.dart';

import 'SimpleForm.dart';

class FormDesignDemo extends StatefulWidget {
  @override
  _FormDesignDemoState createState() => _FormDesignDemoState();
}

class _FormDesignDemoState extends State<FormDesignDemo> {
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
                    child: new Text("Form Designs"),
                    onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SimpleForm(),
                        )))),
          ],
        )
      ),
    );
  }
}
