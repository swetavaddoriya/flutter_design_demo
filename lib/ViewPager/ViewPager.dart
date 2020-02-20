import 'package:flutter/material.dart';

import 'IntroViewPager.dart';
import 'PageBuilder.dart';
import 'PageSwipper.dart';
import 'ViewPagerIndicator.dart';

class ViewPager extends StatefulWidget {
  @override
  _ViewPagerState createState() => _ViewPagerState();
}

class _ViewPagerState extends State<ViewPager> {
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
                    child: new Text("using pageview.builder"),
                    onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => PageBuilder(),
                        )))),


            Padding(
                padding: const EdgeInsets.all(8.0),
                child: new MaterialButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: new Text("page swipper"),
                    onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => PageSwipper(),
                        )))),

            Padding(
                padding: const EdgeInsets.all(8.0),
                child: new MaterialButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: new Text("intro view pager with indicator"),
                    onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => IntroViewPager(),
                        )))),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: new MaterialButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: new Text("intro view pager with next skip button"),
                    onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => HomePage(),
                        )))),

          ],

        ),
      ),
    );
  }
}
