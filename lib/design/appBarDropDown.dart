import 'package:flutter/material.dart';




class DropDown extends StatefulWidget {
  @override
  DropDownWidget createState() => DropDownWidget();
}

class DropDownWidget extends State {

  String dropdownValue = 'GUAP';

  List <String> actorsName = [
    'GUAP',
    'BTC'

  ] ;

  String _password;
  bool _obscureText=true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: new AppBar(
          title:
          new Row(
            children: <Widget>[
              DropdownButton<String>(
                value: dropdownValue,
                elevation: 0,
                style: TextStyle( fontSize: 18),

                onChanged: (String data) {
                  setState(() {
                    dropdownValue = data;
                  });
                },
                items: actorsName.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
        ),

      ),
    );
  }
}