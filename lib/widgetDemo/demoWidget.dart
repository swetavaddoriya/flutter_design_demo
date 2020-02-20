import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_demo/BottomNAvigation/SimpleBottomNavigation.dart';

import 'RadioCheckPage.dart';
import 'SwitchWidget.dart';
import 'TimeAgo.dart';

class demoWidget extends StatefulWidget {
  @override
  _demoWidgetState createState() => _demoWidgetState();
}
class _demoWidgetState extends State<demoWidget> {

  void handleEvent(
      AdmobAdEvent event, Map<String, dynamic> args, String adType) {
    switch (event) {
      case AdmobAdEvent.loaded:
        print('New Admob $adType Ad loaded!');
        break;
      case AdmobAdEvent.opened:
        print('Admob $adType Ad opened!');
        break;
      case AdmobAdEvent.closed:
        print('Admob $adType Ad closed!');
        break;
      case AdmobAdEvent.failedToLoad:
        print('Admob $adType failed to load. :(');
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[
            Expanded(
              flex:1,
              child: new Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new MaterialButton(
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: new Text("Radio checkbox"),
                          onPressed: ()=>Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => RadioCheckPage(),
                              )))),


                   Padding(
                padding: const EdgeInsets.all(8.0),
                child: new MaterialButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: new Text("Time Ago widget"),
                    onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => TimeAgo(),
                        )))),
                ],
              )

            ),


            Expanded(
              flex:1,
              child: AdmobBanner(
                adUnitId: getBannerAdUnitId(),
                adSize: AdmobBannerSize.FULL_BANNER,
                listener: (AdmobAdEvent event, Map<String, dynamic> args) {
                  handleEvent(event, args, 'Banner');
                },
              ),
            ),



          ],

        ),
      ),
    );
  }
}
