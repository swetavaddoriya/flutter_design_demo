import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:popup_menu/popup_menu.dart';

class RadioCheckPage extends StatefulWidget {
  @override
  _RadioCheckPageState createState() => _RadioCheckPageState();
}

class _RadioCheckPageState extends State<RadioCheckPage> {
  String radioItem = "Dance";
  String _pickedGender = "Female";
  String _pickedHobby = "Dance";
  List<String> _CheckedWeek = ["Monday","tuesday"];
  List<String> _checkedList = ["A"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Radio and Checkbox"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            new Text("Custom Radio buton horizontal"),
            RadioButtonGroup(
              orientation: GroupedButtonsOrientation.HORIZONTAL,
              margin: const EdgeInsets.only(left: 12.0),
              onSelected: (String selected) => setState(() {
                _pickedGender = selected;
              }),
              labels: <String>["male", "Female"],
              picked: _pickedGender,
              itemBuilder: (Radio rb, Text txt, int i) {
                return Column(
                  children: <Widget>[
                    rb,
                    txt,
                  ],
                );
              },
            ),
            new Text(
              'Output:- $_pickedGender',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            new Text("basic Radio buton horizontal"),
            RadioButtonGroup(
              labels: <String>[
                "Dance",
                "Read",
              ],
              picked: _pickedHobby,
              onSelected: (String selected) => setState(() {
                _pickedHobby = selected;
              }),
            ),
            new Text(
              'Output:- $_pickedHobby',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: new Text("basic checkbox buton horizontal"),
            ),
            CheckboxGroup(
              labels: <String>['Monday', 'tuesday', 'wednesday', 'thursday'],
              onSelected: (List<String> checked) => setState(() {
                _CheckedWeek = checked;
              }),
              checked: _CheckedWeek,
            ),
            new Text(
              'Output:- $_CheckedWeek',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: new Text("custom checkbox buton horizontal"),
            ),
            CheckboxGroup(
              orientation: GroupedButtonsOrientation.HORIZONTAL,
              margin: const EdgeInsets.only(left: 12.0),
              onSelected: (List selected) => setState(() {
                if (selected.length > 1) {
                  selected.removeAt(0);
                  print('selected length  ${selected.length}');
                } else {
                  print("only one");
                }
                _checkedList = selected;
              }),
              labels: <String>["A", "B", "c", "D"],
              checked: _checkedList,
              itemBuilder: (Checkbox cb, Text txt, int i) {
                return Column(
                  children: <Widget>[
                    cb,
                    txt,
                  ],
                );
              },
            ),
            new Text(
              'Output:- $_checkedList',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),


          ],
        ),
      ),
    );
  }

}
