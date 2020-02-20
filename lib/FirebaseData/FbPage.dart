import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_demo/BottomNAvigation/SimpleBottomNavigation.dart';

import 'FireNotification.dart';
import '../widgetDemo/SwitchWidget.dart';

class FbPage extends StatefulWidget {
  @override
  _FbPageState createState() => _FbPageState();
}

class _FbPageState extends State<FbPage> {


  static bool _bannerHidden = false;
  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: getBannerAdUnitId());
    _bannerHidden=true;
    myBanner
      ..load()
      ..show(
        anchorOffset: 0.0,
        anchorType: AnchorType.bottom,
      );
  }

  @override
  void dispose() {
    _bannerHidden=false;
    print("dispose"+_bannerHidden.toString());
    myBanner.dispose();
    super.dispose();
  }
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
                      child: new Text("Firebase notification"),
                      onPressed: ()=>Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => FireNotification(),
                          )))),





            ],
          ),
        )
    );
  }
}
