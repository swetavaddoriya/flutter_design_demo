import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';


class CustomNavigation extends StatefulWidget {
  @override
  _CustomNavigationState createState() => _CustomNavigationState();
}

class _CustomNavigationState extends State<CustomNavigation>
    with SingleTickerProviderStateMixin{


  int _index=0;
  TabController _controller;

  List<String> pages=['Home','favorite','Videos','Settings'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=TabController(
        length: pages.length,
        vsync: this,
        initialIndex:_index
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: pages.map((title) {
          return Center(
            child: Text(
              '$title',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 52),
            ),
          );
        }).toList(),
      ),
      appBar: AppBar(
        elevation: 1,
        title: new Text("Material Bottom Bar"),
      ),

      bottomNavigationBar: BottomNavyBar(
        onItemSelected: (index) => setState(() {
          _index = index;
          _controller.animateTo(_index);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Favorites'),
              activeColor: Colors.green
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.music_video),
              title: Text('Videos'),
              activeColor: Colors.deepPurple
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              activeColor: Colors.blue
          ),
        ],
      ),

    );
  }
}