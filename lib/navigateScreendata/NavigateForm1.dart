import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Page"),
      ),
      body: new Column(
        children: <Widget>[


          new TextField(
            controller: _textController,
            decoration: new InputDecoration(
              hintText: "enter name",
            ),
          ),
          new RaisedButton(
            child: new Text("Next"),
            onPressed: () {
              var route = new MaterialPageRoute(
                builder: (BuildContext context) =>
                new NextPage(name: _textController.text),
              );
              Navigator.of(context).push(route);
            },
          ),
        ],
      ),
    );
  }
}

class NextPage extends StatefulWidget {
  final String name;

  NextPage({Key key, this.name}) : super(key: key);

  @override
  _NextPageState createState() => new _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Next Page"),
      ),
      body: new Text("${widget.name}"),
    );
  }
}