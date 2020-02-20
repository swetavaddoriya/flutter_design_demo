import 'dart:io';

import 'package:admob_flutter/admob_flutter.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_demo/Constant/AppString.dart';

class SimpleBottomNavigation extends StatefulWidget {
  @override
  _SimpleBottomNavigationState createState() => _SimpleBottomNavigationState();
}
  bool _bannerHidden = false;
String getBannerAdUnitId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/2934735716';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544/6300978111';
  }
  return null;
}

BannerAd myBanner = BannerAd(
  adUnitId: BannerAd.testAdUnitId,
  size: AdSize.fullBanner,
  targetingInfo: AppString.targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
    if(event==MobileAdEvent.loaded){
      _bannerHidden=true;
      print("loadedddddd");
    }
    if (event == MobileAdEvent.failedToLoad) {
      _bannerHidden=false;
      print("failedtoload"+_bannerHidden.toString());
    } else if (event == MobileAdEvent.closed) {
      _bannerHidden=false;
      print("closed"+_bannerHidden.toString());
    }
  },
);
class _SimpleBottomNavigationState extends State<SimpleBottomNavigation> {

  int _currentTabIndex=0;

  List<Widget> tabs=[
    TabScreen(Colors.green),
    TabScreen(Colors.blue),
    TabScreen(Colors.orange),
  ];

  onTapped(int index){
    setState(() {
      _currentTabIndex=index;
    });
  }





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
    print("widget"+_bannerHidden.toString());
    return Scaffold(
      body: new Column(
        children: <Widget>[
              Expanded(
                flex:7,
                  child:tabs[_currentTabIndex],
              ),
          Expanded(

            child:   BottomNavigationBar(
            onTap: onTapped,
            currentIndex: _currentTabIndex,
            items:[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text("Home")
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.mail),
                  title: Text("Mail")
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text("person"),
              )
            ],
          ),
          ),
        Visibility(
           visible: _bannerHidden,
             child: Container(height: 35.0,)
         )
        ],
      ),
    );
  }
}


class TabScreen extends StatelessWidget {

  final Color color;
  TabScreen(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Simple Navigation"),
      ),
      body: new Container(
        color: color,
      ),
    );
  }
}

