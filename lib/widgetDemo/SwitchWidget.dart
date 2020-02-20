import 'package:flutter/material.dart';
import 'package:flutter_design_demo/helpers/PreferenceHelper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BasicSwitch extends StatefulWidget {
  @override
  BasicSwitchState createState() {
    return new BasicSwitchState();
  }
}

class BasicSwitchState extends State<BasicSwitch> {
  bool _isSwitched = true;
  var textHolder = 'Switch is ON';
  SharedPreferences prefs;
  PreferenceHelper preferenceHelper;

  @override
  void initState() {
    super.initState();
    getSharedPreferenceObject();
  }


  Future<void> getSharedPreferenceObject() async {
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      prefs = sp;
      preferenceHelper = new PreferenceHelper(prefs);
    });
  }

  onSwitchValueChanged(bool newVal) {
    setState(() {
      _isSwitched = newVal;
      preferenceHelper.saveIsSwitchNotification(_isSwitched);
      if(preferenceHelper.getIsSwitchNotification())
        {
          textHolder = 'Switch is ON';
          print("switch is true");
        }
      else
        {
          textHolder = 'Switch is OFF';
          print("switch is false");
        }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch Example"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[

          Switch(
           // onChanged: (val) => setState(() => _isSwitched = val),
            value: _isSwitched,

              onChanged: (newVal) {

                onSwitchValueChanged(newVal);
              }
          ),
            Text('$textHolder', style: TextStyle(fontSize: 24),),

        ],
        ),

      ),
    );
  }



}