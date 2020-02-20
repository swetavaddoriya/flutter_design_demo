import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_demo/BottomNAvigation/BottomNavigationPage.dart';
import 'package:flutter_design_demo/widgetDemo/demoWidget.dart';
import 'package:launch_review/launch_review.dart';
import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BottomNAvigation/SimpleBottomNavigation.dart';
import 'Constant/AppColor.dart';
import 'ExtraDemo/DemoExtra.dart';
import 'FirebaseData/FbPage.dart';
import 'FormDesign/FormDesignDemo.dart';
import 'GridView/GridPage.dart';
import 'GridView/GridView.dart';
import 'widgetDemo/RadioCheckPage.dart';
import 'SharedPreference/SharedPreferencePage.dart';
import 'ThemeDarkLight/ThemeNotifier.dart';
import 'ViewPager/ViewPager.dart';
import 'design/design.dart';
import 'Listview/ListViews.dart';
import 'navigateScreendata/NavigateData.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class DrawerPage extends StatefulWidget {
  final drawerItems = [

    new DrawerItem("Extra", Icons.rss_feed),
    new DrawerItem("Gridview", Icons.rss_feed),
    new DrawerItem("Bottom Navigation Bar", Icons.rss_feed),
    new DrawerItem("View Pager", Icons.rss_feed),
    new DrawerItem("ListView", Icons.rss_feed),
    new DrawerItem("Firebase", Icons.rss_feed),
    new DrawerItem("Widget", Icons.rss_feed),
    new DrawerItem("Shared Preference", Icons.rss_feed),
    new DrawerItem("Navigate screen", Icons.rss_feed),
    new DrawerItem("Design", Icons.rss_feed),
    new DrawerItem("Share app", Icons.rss_feed),
    new DrawerItem("Form design", Icons.rss_feed),
  ];

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

bool _darkTheme = true;
PackageInfo packageInfo;

class _DrawerPageState extends State<DrawerPage> {
  int _selectedDrawerIndex = 0;
  var drawerItems = [];

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new DemoExtra();

      case 1:
        return new GridView1();
      case 2:
      return new BottomNavigationPage();
      case 3:
      return new ViewPager();
      case 4:

      return new ListViews();

      case 5:
      return new FbPage();
      case 6:
        return new demoWidget();
      case 7:
        return new SharedPreferencePage();
      case 8:
        return new NavigateData();
      case 9:
        return new design();
      case 11:
        return new FormDesignDemo();



      default:
        return new Text("Error");
    }
  }

  _onSelectedItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
    });

    if (index == 10) {
        ShareApp();
    }

    Navigator.of(context).pop(); //close drawer
  }

  void ShareApp() {
    Share.share('check out my website https://example.com');
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    _darkTheme = (themeNotifier.getTheme() == darkTheme);

    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new ListTile(
          leading: new Icon(d.icon,color: Colors.deepOrange,),
          title: new Text(d.title,style: TextStyle(color: Colors.deepOrange),),
          selected: i == _selectedDrawerIndex,
          onTap: () => _onSelectedItem(i),
        ),
      );
    }

    return Scaffold(
      appBar: new AppBar(
        //
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
        actions: <Widget>[
          Transform.scale(
            scale: 0.5,
            child: DayNightSwitch(
              value: _darkTheme,
              moonImage: AssetImage('assets/images/profile.png'),
              sunImage: AssetImage('assets/images/share.png'),
              height: 10.0,
              onChanged: (val) {
                setState(() {
                  _darkTheme = val;
                  //print(_darkTheme);
                });
                onThemeChanged(val, themeNotifier);
              },
            ),
          ),
        ],
      ),
      drawer: new Drawer(
        child: SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              new UserAccountsDrawerHeader(
                accountName: new Text("sweta Vaddoriya"),
                accountEmail: new Text("swetavaddoriya9@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor:
                          Colors.blue,
                  child: new Text(
                    "s",
                    style: TextStyle(fontSize: 40.0,color: Colors.white),
                  ),
                ),
              ),
              new Column(children: drawerOptions)
            ],
          ),
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }

  void onThemeChanged(bool value, ThemeNotifier themeNotifier) async {
    (value)
        ? themeNotifier.setTheme(darkTheme)
        : themeNotifier.setTheme(lightTheme);
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('darkMode', value);
    print("AAAdrawer" + prefs.getBool('darkMode').toString());
  }
}
