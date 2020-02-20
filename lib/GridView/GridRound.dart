import 'package:flutter/material.dart';




class GridRound extends StatefulWidget {
  @override
  _GridRoundState createState() => _GridRoundState();
}

class _GridRoundState extends State<GridRound> {

  List colorsData = [Colors.green,Colors.red,Colors.greenAccent,Colors.cyan,Colors.purple,Colors.yellow,Colors.blue,Colors.black,Colors.brown,Colors.orange, Colors.teal, Colors.purpleAccent, Colors.blueGrey, Colors.tealAccent, Colors.deepOrangeAccent, Colors.lightBlueAccent];
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Color picker"),
        ),
        body: new Container(
          padding: EdgeInsets.all(16.0),
          color: Colors.black12,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: colorsData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4 ,childAspectRatio:1),
            itemBuilder: (BuildContext context,int index){

              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  children: <Widget>[
                    new FloatingActionButton(
                      onPressed: (){
                        setState(() {
                          selectedColor = index;
                        });
                      },
                      child: Icon(Icons.done,color: index == selectedColor ? Colors.white :colorsData.elementAt(index),size: 28),
                      backgroundColor: colorsData.elementAt(index),
                      elevation: 0.0,
                      heroTag: null,

                    ),
                    Offstage(
                      offstage: index != selectedColor,
                      child: Text("Color Name"),
                    ),
                  ],
                ),
              );
            },
            shrinkWrap: true,
          ),
        )
    );
  }
}