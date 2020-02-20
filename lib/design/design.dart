import 'package:flutter/material.dart';

import 'package:flutter_design_demo/design/FollowPage.dart';
import 'package:flutter_design_demo/design/VideoListApi.dart';
import 'package:flutter_design_demo/design/VideoPage.dart';
import 'package:flutter_design_demo/design/favouritePage.dart';

import 'EditProfile.dart';
import 'SwetaPage.dart';
import 'appBarDropDown.dart';


class design extends StatefulWidget {
  @override
  _designState createState() => _designState();
}

class _designState extends State<design> {
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
                      child: new Text("favourite"),
                      onPressed: ()=>Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => favouritePage(),
                          )))),

              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new MaterialButton(
                      color: Colors.teal,
                      textColor: Colors.white,
                      child: new Text("follow"),
                      onPressed: ()=>Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => FollowPage(),
                          )))),

              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new MaterialButton(
                      color: Colors.teal,
                      textColor: Colors.white,
                      child: new Text("open video"),
                      onPressed: ()=>Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => VideoPage(),
                          )))),




              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new MaterialButton(
                      color: Colors.teal,
                      textColor: Colors.white,
                      child: new Text("Video list api with parameter"),
                      onPressed: ()=>Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => VideoListApi(),
                          )))),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new MaterialButton(
                      color: Colors.teal,
                      textColor: Colors.white,
                      child: new Text("App bar"),
                      onPressed: ()=>Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => DropDown(),
                          )))),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new MaterialButton(
                      color: Colors.teal,
                      textColor: Colors.white,
                      child: new Text("popup"),
                      onPressed: ()=>Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => TestScreen(),
                          )))),



            ],
          ),
        )
    );
  }
}
