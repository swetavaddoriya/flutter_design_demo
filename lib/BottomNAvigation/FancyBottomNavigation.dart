import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_demo/BottomNAvigation/tab_item.dart';

import 'SimpleBottomNavigation.dart';
import 'fancy_tab_bar.dart';


class FancyBottomNavigation extends StatefulWidget {
  @override
  _FancyBottomNavigationState createState() => _FancyBottomNavigationState();
}

class _FancyBottomNavigationState extends State<FancyBottomNavigation> {

  bool _bannerHidden = false;
  @override
  void initState() {
    FirebaseAdMob.instance.initialize(appId: getBannerAdUnitId());
    _bannerHidden=true;
    myBanner
      ..load()
      ..show(
        anchorOffset: 0.0,
        anchorType: AnchorType.bottom,
      );
    super.initState();
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
    return new Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: PURPLE,
        title: Text("Bottom Bar Animation"),
      ),

      body: new Column(
        children: <Widget>[
          Expanded(
            flex:4,
            child: Center(
              child: new Text('Animated Bottom Bar.',
                style: new TextStyle(
                    fontSize: 16.0),
              ),
            ),
          ),

          Expanded(

            child: FancyTabBar(),
          ),
          _bannerHidden?Visibility(
              visible: _bannerHidden,
              child: Container(height: 35.0,)
          ):Visibility(
            visible: _bannerHidden,
            child: Container(),
          ),
        ],
      ),



    );
  }
}
