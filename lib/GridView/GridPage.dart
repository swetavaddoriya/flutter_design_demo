import 'package:flutter/material.dart';
import 'package:flutter_design_demo/model/Category.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class GridPage extends StatefulWidget {
  @override
  _GridPageState createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {

  Future<List<Category>> fetchCategory() async {
    http.Response response = await http.post(
        'https://status.rainit.in/apis/category_list');
    //print("Rsponsee"+response.body);
    var responseJson = json.decode(response.body);
    return (responseJson['data'] as List)
        .map((p) => Category.fromJson(p))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: new Container(
        child:new FutureBuilder<List<Category>>(
          future: fetchCategory(),
            builder: (context,snapshot){

                  return Center(
                    child: snapshot.hasData ? new GridView.count(
                      crossAxisCount: 2,
                      children: new List<Widget>.generate(snapshot.data.length, (index) {
                          return new GridTile(
                                 child: Stack(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(top: 2.0,left: 8.0,right: 8.0,bottom: 2.0),
                                    child: new  Container(
                                      decoration: new BoxDecoration(
                                        image: DecorationImage(
                                          //image: new AssetImage('assets/images/zh.png'),

                                          image: new NetworkImage("https://status.rainit.in/upload/category/"+snapshot.data[index].cat_image),
                                          fit: BoxFit.fill,),
                                      ),
                                    ),
                                  ),

                                  Container(

                                    alignment: Alignment.bottomLeft,
//                                    decoration: new BoxDecoration(
//                                      gradient: LinearGradient(
//                                        begin: FractionalOffset.topCenter,
//                                        end: FractionalOffset.bottomCenter,
//                                        colors: [
//                                          Colors.grey.withOpacity(0.0),
//                                          Colors.black,
//                                        ],
//                                        stops: [0.50, 1.5],
//                                      ),
//
//                                    ),

                                    child: new Padding(
                                      padding: const EdgeInsets.only(left: 18,right: 10,top:6,bottom: 30),

                                      child: new Text(

                                      snapshot.data[index].cat_name,
                                        style: new TextStyle(fontSize: 20, color: Colors.white),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),


                                  ),
                                ],
                              ),

                          );
                        }),
                      ) : new CircularProgressIndicator(),
                  );


                }

        ),

      ),);
  }
}


