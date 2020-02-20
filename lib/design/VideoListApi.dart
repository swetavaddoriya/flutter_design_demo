import 'package:flutter/material.dart';
import 'package:flutter_design_demo/model/VideoModel.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class VideoListApi extends StatefulWidget {
  @override
  _VideoListApiState createState() => _VideoListApiState();
}

class _VideoListApiState extends State<VideoListApi> {
  final scaffoldGlobalKey = new GlobalKey<ScaffoldState>();

  VideoModel video;
  List<Data> videoList = new List();
  bool isLoading = false;
  //using snapshot api caling function

 /* Future<List<VideoModel>> fetchVideo() async{

    Map<String, dynamic> body = {'cat_id': "WkQ9PQ==", 'user_id': "WnQ9PQ==",'lan_id':'WnQ9PQ=='};
    http.Response response1=await http.post('https://status.rainit.in/apis/video_list',
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
      body: body,

    );

    print("Response"+response1.statusCode.toString());
    var responseJson1 =json.decode(response1.body);
    return (responseJson1["data"] as List)
        .map((p)=> VideoModel.fromJson(p)).toList();


  }*/



  Future<List<Data>>  getVideoList() async{
    http.Response response=await http.post(Uri.encodeFull("https://status.rainit.in/apis/home_video"),
    headers: {"Accept":"application/json"},
      body: {"user_id": "WnQ9PQ==", "lan_id": "WnQ9PQ=="}
    );

    if(response.statusCode==200)
      {
        //print("AAAAAAAAAAAAAAAA"+response.body);
        video=new VideoModel.fromJson(json.decode(response.body));

        if(video.status==1)
          {
            videoList.clear();
            setState(() {
              videoList.addAll(video.data);
            });

           /* for(int i=0;i<videoList.length;i++)
              {
                print(videoList[i].toJson());
              }*/
            return videoList;
          }
        else{
          scaffoldGlobalKey.currentState.showSnackBar(SnackBar(content: Text(video.message),
            backgroundColor: Colors.red,));
          return videoList=[];
        }
      }
    else {
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
    return  Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        leading: IconButton(icon: Icon(Icons.arrow_back),

          onPressed: () => Navigator.pop(context, false),
        ),
        title: Text('Api Demo'),
      ),
      body: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),

        child: new ListView.builder(
            itemBuilder: _getRowItemUI,
            itemCount: videoList.length,
            padding: const EdgeInsets.all(0),

        ),
      ),


    );
  }
  Widget _getRowItemUI(BuildContext context,int index)
  {
      return new Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
        side: BorderSide()),
        elevation: 5.0,


        child: new Column(
          children: <Widget>[
            new ListTile(
              title: Align(
                child: Container(
                  width: 400,
                  height: 200,

                    child: Image.network("http://status.rainit.in/upload/video/"+videoList[index].videoThumb,
                    fit: BoxFit.fill,height: 400,width: 200,
                    ),
                ),
              ),
            )
          ],
        ),

      );
  }


}
