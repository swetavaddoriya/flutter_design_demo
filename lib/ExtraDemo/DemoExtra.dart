import 'package:flutter/material.dart';
import 'package:flutter_design_demo/ExtraDemo/ExtraColumn.dart';
import 'package:flutter_design_demo/SocialLogin/SocialMediaLogin.dart';
import 'package:flutter_design_demo/ViewPager/PageBuilder.dart';
import 'package:flutter_design_demo/admobAds/AdMobAd.dart';

class DemoExtra extends StatefulWidget {
  @override
  _DemoExtraState createState() => _DemoExtraState();
}

class _DemoExtraState extends State<DemoExtra> {
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
                    child: new Text("Admob"),
                    onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => AdMobAd(),
                        )))),

            Padding(
                padding: const EdgeInsets.all(8.0),
                child: new MaterialButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: new Text("fb login"),
                    onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SocialMediaLogin(),
                        )))),

            Padding(
                padding: const EdgeInsets.all(8.0),
                child: new MaterialButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: new Text("extra"),
                    onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => ExtraColumn(),
                        )))),


          ],

        ),
      ),
    );
  }
}
