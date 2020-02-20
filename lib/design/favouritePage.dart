import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class favouritePage extends StatefulWidget {
  @override
  _favouritePageState createState() => _favouritePageState();
}

class _favouritePageState extends State<favouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
       body: Padding(
         padding: const EdgeInsets.all(10.0),
         child: Column(
           children: <Widget>[
             new Row(
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.only(top: 30.0),
                      width: 60.0,
                      height: 60.0,
                      decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                          image: new DecorationImage(image: new NetworkImage("https://f0.pngfuel.com/png/136/22/profile-icon-illustration-user-profile-computer-icons-girl-customer-avatar-png-clip-art-thumbnail.png"))
                      ),
                    ),
                    new SizedBox(
                      width: 15.0,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Column(

                        children: <Widget>[

                          new Text("Ketan Vaghasiya",
                            style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0,color: Colors.white,) ,
                            textAlign: TextAlign.left,

                            ),
                          new SizedBox(
                            height: 2.0,
                          ),
                          Text("16 November 2019",
                            style: TextStyle(color: Colors.white,),
                            textAlign: TextAlign.left,),
                        ],
                      ),
                    )
                  ],
             ),
             new SizedBox(
               height: 15.0,
             ),
             Flexible(
               fit: FlexFit.loose,
               child: new Image.asset("assets/images/zh.png",fit:BoxFit.cover,),

             ),
             new SizedBox(
               height: 10.0,
             ),
             Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new SvgPicture.asset("assets/images/ic_like.svg",
                      width: 25.0,
                      height: 25.0,
                      color: Colors.red,),
                    new SizedBox(
                      width: 10.0,
                    ),
                    new Text("20",
                    style: TextStyle(color: Colors.white),),
                    new SizedBox(
                      width: 15.0,
                    ),
                    new Image.asset("assets/images/whatsapp.png",
                      width: 25.0,
                      height: 25.0,),
                    new SizedBox(
                      width: 10.0,
                    ),
                    new Text("20",
                      style: TextStyle(color: Colors.white),),
                    new SizedBox(
                      width: 15.0,
                    ),
                    new Image.asset("assets/images/share.png",
                        width: 25.0,
                      height: 25.0,),
                    new SizedBox(
                      width: 10.0,
                    ),
                    new Text("20",
                      style: TextStyle(color: Colors.white),),
                    new SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),

             ),
           ],
         ),
       ),
    );
  }
}
