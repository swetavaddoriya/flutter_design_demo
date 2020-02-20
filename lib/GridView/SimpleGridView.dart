import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_design_demo/model/VideoModel.dart';
import 'package:http/http.dart' as http;

class SimpleGridView extends StatefulWidget {
  @override
  _SimpleGridViewState createState() => _SimpleGridViewState();
}

class _SimpleGridViewState extends State<SimpleGridView> {
  final scaffoldGlobalKey = new GlobalKey<ScaffoldState>();

  VideoModel video;
  List<Data> videoList = new List();

  Future<List<Data>> getVideoList() async {
    http.Response response = await http.post(Uri.encodeFull("https://status.rainit.in/apis/home_video"),
        headers: {"Accept": "application/json"}, body: {"user_id": "WnQ9PQ==", "lan_id": "WnQ9PQ=="});

    if (response.statusCode == 200) {
      //print("AAAAAAAAAAAAAAAA"+response.body);
      video = new VideoModel.fromJson(json.decode(response.body));

      if (video.status == 1) {
        videoList.clear();
        setState(() {
          videoList.addAll(video.data);
        });

        /* for(int i=0;i<videoList.length;i++)
              {
                print(videoList[i].toJson());
              }*/
        return videoList;
      } else {
        scaffoldGlobalKey.currentState.showSnackBar(SnackBar(
          content: Text(video.message),
          backgroundColor: Colors.red,
        ));
        return videoList = [];
      }
    } else {
      scaffoldGlobalKey.currentState.showSnackBar(SnackBar(content: Text("Something went Wrong!!!"), backgroundColor: Colors.red));
      throw Exception('Failed to load post');
    }
  }

  @override
  void initState() {
    super.initState();
    getVideoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Simple gridview"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(videoList.length, (index) {
          return new GridTile(
            child: _getRowItemUI(context, index),
          );
        }),
      ),
    );
  }

  Widget _getRowItemUI(BuildContext context, int index) {

     return new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top:8.0,right:8.0),
            child: Container(

                height:197,
                width: 300,
              child: new Image.network(
                "http://status.rainit.in/upload/video/" + videoList[index].videoThumb,
                fit: BoxFit.fill,
                height: 197,
                width: 300,
              ),
            ),
          ),
        ],
      );

  }
}
