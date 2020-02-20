import 'package:flutter/material.dart';


class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Edit Profile"),
        ),
      body: new Column(
        children: <Widget>[
          new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Align(
                  alignment: Alignment.center,
                  child: new Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      image: new DecorationImage(
                        image: new NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6AMD3JOvBY-Q_3u4H2HtZ-hqegF61NXhhe4baeDdBOetyV6hy&s",
                        ),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
                      border: new Border.all(
                        color: Colors.red,
                        width: 3.0,
                      ),
                    ),
                  ),
                ),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Text("Sweta Vaddoriya",
                style: TextStyle(fontSize: 20.0,),
                textAlign: TextAlign.center,),
            ],
          ),
          new SizedBox(
            height: 20.0,
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: new Column(
              children: <Widget>[
                new Form(
                    child: new Column(
                      children: <Widget>[
                           Container(
                             child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: "Full Name",
                                    prefixIcon: Icon(Icons.person),
                                  ),

                             ),
                           ),
                      ],
                    ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
