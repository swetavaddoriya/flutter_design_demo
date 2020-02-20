import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_demo/BottomNAvigation/SimpleBottomNavigation.dart';

import 'ListCheck.dart';


class ListViews extends StatefulWidget {
  @override
  _ListViewsState createState() => _ListViewsState();
}

class _ListViewsState extends State<ListViews> {

 static bool _bannerHidden = false;





/*
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
 }*/

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
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new MaterialButton(
                      color: Colors.teal,
                      textColor: Colors.white,
                      child: new Text("list with checkbox"),
                      onPressed: ()=>Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => ListCheck(),
                          )))),
            ),
            Expanded(
              flex:6,
              child: Container(
              ),
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
