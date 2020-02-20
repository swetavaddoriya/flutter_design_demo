import 'package:flutter/material.dart';

class GridMultiCheck extends StatefulWidget {
  @override
  _GridMultiCheckState createState() => _GridMultiCheckState();
}

class _GridMultiCheckState extends State<GridMultiCheck> {
  List<bool> SelectList = [];
  List<int> SelectListIndex = [];
  List<bool> inputs = new List<bool>();

  void initState() {
    setState(() {
      for (int i = 0; i < 20; i++) {
        inputs.add(false);
      }
    });
  }

  void ItemChange(bool val, int index) {
    setState(() {
      inputs[index] = val;
      if (val) {
        SelectListIndex.add(index);
        print(SelectListIndex);
      } else {
        SelectListIndex.remove(index);
        print(SelectListIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Multi selection Gridview"),
      ),
      body: new Container(
        child: Center(
            child: new GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: inputs.length,
          itemBuilder: (BuildContext context, int index) {
            return builditem(index);
          },
        )),
      ),
    );
  }

  Widget builditem(int index) {
    return new Card(
      child: new Container(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    Image.network(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOcNILzeIoHM8hzxLNsIdi1YTIwOrIQStap9wVGm5xjddzbCcd&s",
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 70.0, left: 40.0),
                  child: new Container(
                    child: new CheckboxListTile(
                      value: inputs[index],
                      onChanged: (bool val) {
                        ItemChange(val, index);
                      },
                      title: new Text('item ${index}'),
                      controlAffinity: ListTileControlAffinity.leading,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
