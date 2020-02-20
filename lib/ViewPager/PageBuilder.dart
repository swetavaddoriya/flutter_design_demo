import 'package:flutter/material.dart';

class PageBuilder extends StatefulWidget {
  @override
  _PageBuilderState createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("pageview.builder"),
      ),
      body: PageView.builder(
        pageSnapping: false,
          itemBuilder: (context,position){
            return Container(
              color: position % 2==0 ? Colors.pink: Colors.green,
            );
          },

      ),

    );
  }
}
