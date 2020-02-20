import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';



class PageSwipper extends StatefulWidget {
  PageSwipper({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PageSwipperState createState() => new _PageSwipperState();
}

class _PageSwipperState extends State<PageSwipper> {

  final List<Widget> _pages = <Widget>[
    new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: new Column(
          children: <Widget>[
            new Image.asset("assets/images/ic_ice_cream.jpg",height: 150.0,  ),

            new Text("ice cream sandwitch",style: TextStyle(fontSize: 20.0),),
          ],
        )
    ),
    new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: new Column(
          children: <Widget>[
            new Image.asset("assets/images/ic_jellybean.jpg",height: 150.0, ),
            new Text("Jelly Bean",style: TextStyle(fontSize: 20.0),),
          ],
        )
    ),
    new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: new Column(
          children: <Widget>[
            new Image.asset("assets/images/ic_kitkat.jpg", height: 150.0, ),
            new Text("Kit kat",style: TextStyle(fontSize: 20.0),),
          ],
        )
    ),
    new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: new Column(
          children: <Widget>[
            new Image.asset("assets/images/ic_lolipop.png",height: 150.0,  ),
            new Text("Lolipop",style: TextStyle(fontSize: 20.0),),
          ],
        )
    ),
    new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: new Column(
          children: <Widget>[
            new Image.asset("assets/images/ic_nougut.jpg", height: 150.0, ),
            new Text("Nougut",style: TextStyle(fontSize: 20.0),),
          ],
        )
    ),
    new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: new Column(
          children: <Widget>[
            new Image.asset("assets/images/ic_oreo.jpg",height: 150.0,  ),
            new Text("oreo",style: TextStyle(fontSize: 20.0),),
          ],
        )
    ),
    new ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: new Column(
        children: <Widget>[
          new Image.asset("assets/images/ic_pie.jpg",height: 150.0, ),
          new Text("pie",style: TextStyle(fontSize: 20.0),),
        ],
      )
    ),
    new ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: new Column(
          children: <Widget>[
            new Image.asset("assets/images/ic_q.png",height: 150.0, ),
            new Text("Q",style: TextStyle(fontSize: 20.0),),
          ],
        )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("page"),
      ),
      body: new Swiper(
          layout: SwiperLayout.CUSTOM,
          //start index with 4------------------------
          customLayoutOption: new CustomLayoutOption(
              startIndex: 2,
              stateCount: 3
          ).addRotate([
            -45.0/180,
            0.0,
            45.0/180
          ]).addTranslate([
            new Offset(-300.0, -40.0),
            new Offset(0.0, 0.0),
            new Offset(300.0, -40.0)
          ]),
          itemWidth: 300.0,
          itemHeight: 200.0,
          itemBuilder: (context, index) {
          /*  return new Container(
              color: Colors.grey,
              child: new Center(
                child: new Text("$index"),
              ),
            );*/

            return _pages[index ];
          },
          itemCount: _pages.length)

    );
  }
}
