import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_demo/Constant/AppString.dart';

import 'dart:io';
import 'CustomNavigation.dart';
import 'FancyBottomNavigation.dart';
import 'SimpleBottomNavigation.dart';

class BottomNavigationPage extends StatefulWidget {
  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}
String getAppId() {
  if (Platform.isIOS) {
    return 'ca-app-pub-3940256099942544/2934735716';
  } else if (Platform.isAndroid) {
    return 'ca-app-pub-3940256099942544/6300978111';
  }
  return null;
}
class _BottomNavigationPageState extends State<BottomNavigationPage> {
  InterstitialAd _interstitialAd;
  BannerAd _bannerAd;




  BannerAd createBannerAd() {
    return BannerAd(
      adUnitId: getAppId(),
      size: AdSize.banner,
      targetingInfo: AppString.targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.failedToLoad) {
          createBannerAd()
            ..load();
        } else if (event == MobileAdEvent.closed) {
          _bannerAd = createBannerAd()..load();
        }
        if(event==MobileAdEvent.loaded)
          {
            print("loadedddddd");
             hideBanner();
             createBannerAd().dispose();
          }
      },
    );
  }
   void hideBanner() {
    _bannerAd?.dispose();
    _bannerAd = null;
  }
  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>['flutterio', 'beautiful apps'],
    contentUrl: 'https://flutter.io',
    birthday: DateTime.now(),
    childDirected: false,
    designedForFamilies: false,
    gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
    testDevices: <String>[], // Android emulators are considered test devices
  );

  InterstitialAd myInterstitial() {
    return InterstitialAd(
      adUnitId: InterstitialAd.testAdUnitId,
      targetingInfo: targetingInfo,
      listener: (MobileAdEvent event) {
        if (event == MobileAdEvent.failedToLoad) {
          _interstitialAd..load();
        } else if (event == MobileAdEvent.closed) {
          _interstitialAd = myInterstitial()..load();
        }
      },
    );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAdMob.instance.initialize(appId: getAppId());
  /*  _interstitialAd = myInterstitial()..load();
    _interstitialAd..load()..show();
    _bannerAd = createBannerAd()..load();
    createBannerAd()
      ..load()
      ..show();*/
   // WidgetsBinding.instance.addObserver(this);


  }

@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _bannerAd.dispose();

    createBannerAd().dispose();

    _interstitialAd = myInterstitial()..load();
    _interstitialAd?.dispose();
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
                    child: new Text("simple bottom navigation"),
                    onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => SimpleBottomNavigation(),
                        )))),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: new MaterialButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: new Text("fancy bottom navigation"),
                    onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => FancyBottomNavigation(),
                        )))),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: new MaterialButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: new Text("custom bottom navigation"),
                    onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => CustomNavigation(),
                        )
                    ))),
          ],
        ),
       ),
    );
  }
  
}
