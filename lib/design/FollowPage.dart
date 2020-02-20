import 'package:flutter/material.dart';
import 'package:flutter_design_demo/model/FollowModel.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';



class FollowPage extends StatefulWidget {
  @override
  _FollowPageState createState() => _FollowPageState();
}

class _FollowPageState extends State<FollowPage> {

  var followmodelList = new List<FollowModel>();

  Future<List<FollowModel>> fetchFollowModel() async {

    var url = "http://status.rainit.in/apis/user_following_list";
    var body = {"user_id":"WnQ9PQ=="};
    var response =await http.post(url, body: body,);
    setState(() {
     print("Response"+response.body);
      var responseJson = json.decode(response.body);
//      Iterable list = json.decode(response.body);
//      followmodelList = list.map((model) => FollowModel.fromJson(model)).toList();

      return (responseJson['data'] as List)
          .map((p) => FollowModel.fromJson(p))
          .toList();

    });

  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
     backgroundColor: Colors.black,
      body: new ListView.builder(
        padding: const EdgeInsets.all(20.0),
          itemBuilder: _buildFollowItem,
      itemCount: 15,)
    );
  }

Widget _buildFollowItem(BuildContext context,int index)
{

  return new Container(

    child: new FutureBuilder<List<FollowModel>>(
        future: fetchFollowModel(),
        builder: (context,snapshot)
        {
            return Card(
                color: Colors.grey,
                child: Column(

                  children: <Widget>[
                    new Row(

                      crossAxisAlignment:   CrossAxisAlignment.center,
                      children: <Widget>[

                        new Container(

                          margin: const EdgeInsets.only(top: 10.0,bottom: 10.0,left: 10.0),
                          width: 60.0,
                          height: 60.0,
                          decoration: new BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(image: new NetworkImage("https://f0.pngfuel.com/png/136/22/profile-icon-illustration-user-profile-computer-icons-girl-customer-avatar-png-clip-art-thumbnail.png"))
                          ),
                        ),
                        new SizedBox(
                          width: 10.0,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment:   CrossAxisAlignment.center,
                            children: <Widget>[

                              new Text("Ketan Vaghasiya",
                                style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white,) ,
                                textAlign: TextAlign.left,

                              ),
                              new SizedBox(
                                height: 2.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(0),
                                child: Row(
                                  //crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[

                                    new Image.asset("assets/images/whatsapp.png",
                                      width: 15.0,
                                      height: 15.0,),
                                    new SizedBox(
                                      width: 10.0,
                                    ),
                                    new Text("Surat, Gujarat",
                                      style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.left,),

                                  ],
                                ),

                              ),


                            ],
                          ),
                        ),
                        new SizedBox(
                          width: 65.0,
                        ),

                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.orange,
                                  Colors.blueAccent[100],
                                ],
                                begin: Alignment.topRight,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(5, 5),
                                  blurRadius: 10,
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                'UnFollow',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
                    }
                ),
              );


}


}
