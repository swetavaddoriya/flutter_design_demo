import 'package:flutter/material.dart';
import 'package:flutter_design_demo/SocialLogin/FbLogin.dart';
import 'dart:convert';
import 'dart:io';
import 'FacebookUser.dart';

import 'package:http/http.dart' as http;

class SocialMediaLogin extends StatefulWidget {
  @override
  _SocialMediaLoginState createState() => _SocialMediaLoginState();
}

class _SocialMediaLoginState extends State<SocialMediaLogin> {

  FacebookUser facebookUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: new Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: new MaterialButton(
                    color: Colors.teal,
                    textColor: Colors.white,
                    child: new Text("fb"),
                    onPressed: ()=>Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => FbLogin(),
                        )
                    )
                )),


          ],
        ),
      ),
    );
  }



}
