import 'package:flutter/material.dart';

class RadioGroup extends StatefulWidget {
  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class NumberList {
  String number;
  int index;
  NumberList({this.number, this.index});

}

class RadioGroupWidget extends State {

  // Default Radio Button Selected Item.
  String radioItemHolder = 'One';

  // Group Value for Radio Button.
  int id = 1;

  List<NumberList> nList = [
    NumberList(
      index: 1,
      number: "One",
    ),
    NumberList(
      index: 2,
      number: "Two",
    ),
    NumberList(
      index: 3,
      number: "Three",
    ),
    NumberList(
      index: 4,
      number: "Four",
    ),
    NumberList(
      index: 5,
      number: "Five",
    ),
  ];

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Padding(
            padding : EdgeInsets.all(14.0),
            child: Text('Selected Item = '+'$radioItemHolder', style: TextStyle(fontSize: 23))
        ),

        Expanded(
            child: Container(
              height: 350.0,
              child: Column(
                children:
                nList.map((data) => RadioListTile(
                  title: Text("${data.number}"),
                  groupValue: id,
                  value: data.index,
                  onChanged: (val) {
                    setState(() {
                      radioItemHolder = data.number ;
                      id = data.index;
                    });
                  },
                )).toList(),
              ),
            )),

      ],
    );
  }
}