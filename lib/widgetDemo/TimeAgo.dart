import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'package:intl/intl.dart';

class TimeAgo extends StatefulWidget {
  @override
  _TimeAgoState createState() => _TimeAgoState();
}

class _TimeAgoState extends State<TimeAgo> {
  var time = '';


  @override
  void initState() {

    final fifteenAgo = new DateTime.now().subtract(new Duration(minutes: 15));
    var now = new DateTime.now();
    var format = new DateFormat('HH:mm a');
    final time1=new DateTime.fromMicrosecondsSinceEpoch(1581738003*1000);
    print(time1);
  var diff=  time1.difference(now);
    if (diff.inSeconds <= 0 || diff.inSeconds > 0 && diff.inMinutes == 0 || diff.inMinutes > 0 && diff.inHours == 0 || diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(time1);
    } else {
      if (diff.inDays == 1) {
        time = diff.inDays.toString() + 'DAY AGO';
      } else {
        time = diff.inDays.toString() + 'DAYS AGO';
      }
    }
    print(time);
  print(time1);
    /*  print(diff);
    print(timeago.format(fifteenAgo)); // 15 minutes ago
    print(timeago.format(time1));*/

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("TimeAgo"),
      ),

    );
  }
}
