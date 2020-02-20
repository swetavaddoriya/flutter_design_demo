import 'package:flutter/material.dart';



class ListCheck extends StatefulWidget {
  @override
  _ListCheckState createState() => _ListCheckState();
}

class _ListCheckState extends State<ListCheck> {


  List<bool> inputs = new List<bool>();
  void initState() {
    // TODO: implement initState
    setState(() {
      for(int i=0;i<20;i++){
        inputs.add(true);
      }
    });
  }
  void ItemChange(bool val,int index){
    setState(() {
      inputs[index] = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Checked listview'),
      ),
      body:new ListView.builder(
          itemCount: inputs.length,
          itemBuilder: (BuildContext context,int index){
            return new Card(
              child: new Container(
                padding: const EdgeInsets.all(8.0),
                child: new Column(
                  children: <Widget>[
                    new CheckboxListTile(
                        value: inputs[index],
                        onChanged: (bool val){ItemChange(val,index);},
                      title: new Text('item ${index}'),
                      controlAffinity: ListTileControlAffinity.leading,

                    ),
                  ],
                ),
              ),
            );
          },
      ),
    );
  }
}
