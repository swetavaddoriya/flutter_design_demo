import 'package:firebase_admob/firebase_admob.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'ApiPage.dart';
import 'Constant/AppColor.dart';
import 'DrawerPage.dart';

import 'ThemeDarkLight/ThemeNotifier.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;



Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      builder: (_) => ThemeNotifier(darkTheme),
      child: MyApp(),
    ),
  );



}
bool _darkTheme=true;



class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);
    return new MaterialApp(

      home: new DrawerPage(),
      theme: themeNotifier.getTheme(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAdMob.instance.initialize(appId:getAppId());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Splash"),
        ),
        body: new Container(

        )
    );
  }



  String getAppId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544~1458002511';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544~3347511713';
    }
    return null;
  }
}
