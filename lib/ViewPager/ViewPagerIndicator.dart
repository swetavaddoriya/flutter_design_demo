
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_demo/Constant/AppColor.dart';
import 'package:flutter_design_demo/GridView/GridView.dart';
import 'package:flutter_design_demo/helpers/PermissionPage.dart';
import 'package:flutter_design_demo/helpers/PreferenceHelper.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../GridView/GridPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {






  final controller = PageController(keepPage: true,initialPage: 0,);
  static final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xFFf97d27), Color(0xFFfab40d)],
  ).createShader(new Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade300,
      appBar: new AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: new Icon(Icons.arrow_back_ios, color: AppColors.STATUS_BAR_COLOR)),
        backgroundColor: AppColors.SCREEN_BG,
        bottomOpacity: 0.0,
        elevation: 0.0,

        title:new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => GridView1()));
              },
              child: Text(
                'Skip',
                style: TextStyle(foreground: new Paint()..shader = linearGradient),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(


        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Container(
                  //  color:Colors.yellow,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height/1.5,
                    child: PageView.builder(
                      reverse: false,
                      pageSnapping: true,
                      itemCount: _pages.length,
                      physics: BouncingScrollPhysics(),
                      controller: controller,
                     // children: _pages,
                      itemBuilder: (BuildContext context, int index) {
                        return _pages[index ];
                      },

                    ),



                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),

            ),
             Expanded(
                  flex: 1,
                  child: Container(
                  //  color: Colors.yellow,
                    child: new Column(
                    children: <Widget>[
                      SmoothPageIndicator(
                        controller: controller,
                        count: _pages.length,

                        effect: ExpandingDotsEffect(
                          expansionFactor: 2,
                          dotWidth: 10.0,
                          dotHeight: 10.0,
                          dotColor: AppColors.STATUS_BAR_COLOR,

                        ),
                      ),

                    ],
                    ),


                  ),
                ),

            /*SizedBox(
                  height: 5.0,
                ),*/
            Expanded(
              flex: 1,


                child: InkWell(
                  onTap: (){

                      controller.nextPage(duration: _kDuration, curve: _kCurve);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 15.0),
                    width: 90,
                    height: 20,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFFf97d27), Color(0xFFfab40d)
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(5, 5),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),

            ),

          ],
        ),


      ),
    );
  }

  final List<Widget> _pages = <Widget>[

    new Container(
      child: new Column(
        children: <Widget>[
          new Image.asset("assets/images/screen_one.png",
            width: 350.0,
            height: 300.0,
            fit: BoxFit.fill,),
          SizedBox(
            height: 20,
          ),
          new Text("Welcome to Status and ",
            maxLines: 2,
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                foreground: new Paint()..shader = linearGradient),
          ),
          new Text("Videos App",
            maxLines: 2,
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                foreground: new Paint()..shader = linearGradient),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: new Text("Thank u for download status and videos app,Enjoy with this amazing android app with cool features.",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey,fontSize: 16.0),
            ),
          ),

        ],
      ),
    ),
    new Container(
      child: new Column(
        children: <Widget>[
          new Image.asset("assets/images/Screen_two.png",
            width: 350.0,
            height: 300.0,
            fit: BoxFit.fill,),
          SizedBox(
            height: 20,
          ),
          new Text("Everything is ",
            maxLines: 2,
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                foreground: new Paint()..shader = linearGradient),
          ),
          new Text("Organized Here",
            maxLines: 2,
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                foreground: new Paint()..shader = linearGradient),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: new Text("You can find any content easily by using categories,languages,tags.",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey,fontSize: 16.0),
            ),
          ),

        ],
      ),
    ),
    new Container(
      child: new Column(
        children: <Widget>[
          new Image.asset("assets/images/Screen_three.png",
            width: 300.0,
            height: 300.0,
            fit: BoxFit.fill,),
          SizedBox(
            height: 20,
          ),
          new Text("Be Creative",
            maxLines: 2,
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                foreground: new Paint()..shader = linearGradient),
          ),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: new Text("Register now and share you creative idea with many users and be one of our community.",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey,fontSize: 16.0),
            ),
          ),

        ],
      ),
    ),
    new Container(
      child: new Column(
        children: <Widget>[
          new Image.asset("assets/images/Screen_four.png",
            width: 330.0,
            height: 300.0,
            fit: BoxFit.fill,),
          SizedBox(
            height: 20,
          ),
          new Text("Download and Share ",
            maxLines: 2,
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                foreground: new Paint()..shader = linearGradient),
          ),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: new Text("Download any content and keep it on your device to watch it on offline mode, and share it with your friends.",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey,fontSize: 16.0),
            ),
          ),

        ],
      ),
    ),
    new Container(
      child: new Column(
        children: <Widget>[
          new Image.asset("assets/images/Screen_five.png",
            width: 330.0,
            height: 300.0,
            fit: BoxFit.fill,),
          SizedBox(
            height: 20,
          ),
          new Text("Favorites ",
            maxLines: 2,
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                foreground: new Paint()..shader = linearGradient),
          ),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: new Text("Create your favorite list and save any content to view it later.",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey,fontSize: 16.0),
            ),
          ),

        ],
      ),
    ),
    new Container(
      child: new Column(
        children: <Widget>[
          new Image.asset("assets/images/Screen_six.png",
            width: 330.0,
            height: 300.0,
            fit: BoxFit.fill,),
          SizedBox(
            height: 20,
          ),
          new Text("Give your Reactions ",
            maxLines: 2,
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                foreground: new Paint()..shader = linearGradient),
          ),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: new Text("Browse best status collection and give your reactions like,love,haha,lol,angry etc.",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey,fontSize: 16.0),
            ),
          ),

        ],
      ),
    ),
    new Container(
      child: new Column(
        children: <Widget>[
          new Image.asset("assets/images/Screen_seven.png",
            width: 330.0,
            height: 300.0,
            fit: BoxFit.fill,),
          SizedBox(
            height: 20,
          ),
          new Text("Take your Freedom ",
            maxLines: 2,
            style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                foreground: new Paint()..shader = linearGradient),
          ),

          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: new Text("Subscribe with a small price and take your freedom by remove all ads.",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey,fontSize: 16.0),
            ),
          ),

        ],
      ),
    ),

  ];
}