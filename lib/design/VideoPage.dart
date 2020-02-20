import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
      body: Padding(
          padding: const EdgeInsets.all(10.0),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           Flexible(
             fit: FlexFit.loose,
             child: new Image.asset("assets/images/zh.png",fit:BoxFit.cover,),

           ),
           Padding(
             padding: const EdgeInsets.only(top: 8.0),
             child: new Row(
               
               children: <Widget>[
                 new Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: <Widget>[
                     new Text("Zindgi tere naal",
                       style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 18.0) ,
                       textAlign: TextAlign.left,
                     ),
                     new SizedBox(
                       height: 2.0,
                     ),
                  new Text("Panjabi Song",
                    style:TextStyle(fontWeight: FontWeight.normal,color: Colors.white,fontSize: 15.0) ,
                    textAlign: TextAlign.left,
                    ),
                     
                   ],
                 ),
                 new SizedBox(
                   width:205.0,
                 ),
                 new Column(
                   children: <Widget>[
                     new SvgPicture.asset("assets/images/ic_like.svg",
                       width: 18.0,
                       height: 18.0,
                       color: Colors.red,),
                     new SizedBox(
                       height: 2.0,
                     ),
                    new Text("favourite",
                    style: TextStyle(color: Colors.white,fontSize: 15.0),)
                   ],
                 )
               ],
             ),
           ),

           Padding(
             padding: const EdgeInsets.only(top: 8.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[
                 new SvgPicture.asset("assets/images/ic_like.svg",
                   width: 25.0,
                   height: 25.0,
                   color: Colors.red,),
                 new SizedBox(
                   width: 10.0,
                 ),
                 new Text("300",
                   style: TextStyle(color: Colors.white),),
                 new SizedBox(
                   width: 60.0,
                 ),
                 new Image.asset("assets/images/whatsapp.png",
                   width: 25.0,
                   height: 25.0,),
                 new SizedBox(
                   width: 10.0,
                 ),
                 new Text("3",
                   style: TextStyle(color: Colors.white),),
                 new SizedBox(
                   width: 60.0,
                 ),
                 new Image.asset("assets/images/share.png",
                   width: 25.0,
                   height: 25.0,),
                 new SizedBox(
                   width: 10.0,
                 ),
                 new Text("13",
                   style: TextStyle(color: Colors.white),),
                 new SizedBox(
                   width: 60.0,
                 ),
                 new Image.asset("assets/images/share.png",
                   width: 25.0,
                   height: 25.0,),
                 new SizedBox(
                   width: 10.0,
                 ),
                 new Text("20",
                   style: TextStyle(color: Colors.white),),
               ],
             ),
           ),

           Padding(
             padding: const EdgeInsets.only(top: 8.0),
             child: Row(

               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment:   CrossAxisAlignment.center,
               children: <Widget>[

                 new Container(

                   margin: const EdgeInsets.only(top: 10.0,bottom: 10.0,),
                   width: 50.0,
                   height: 50.0,
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
                     crossAxisAlignment:   CrossAxisAlignment.start,
                     children: <Widget>[

                       new Text("Ketan Vaghasiya",
                         style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white,) ,
                         textAlign: TextAlign.left,

                       ),
                       new SizedBox(
                         height: 2.0,
                       ),
                     ],
                   ),
                 ),
                 new SizedBox(
                   width: 120.0,
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
           ),
           
           Padding(
             padding: const EdgeInsets.only(top: 8.0),
             child: Row(
               children: <Widget>[
                 new Text("Related Videos",style: TextStyle(color: Colors.orange,fontSize: 15.0,),)
               ],
             )
           ),



           Expanded(
             child: new Container(
//               height: 1000,
               child: new ListView.builder(
                 //scrollDirection: Axis.vertical,

                 itemBuilder: _buildVideoItem,
                 itemCount: 25,
               ),
             ),
           ),



         ],
       ),

      )

    );
  }


  Widget _buildVideoItem(BuildContext context,int index)
  {

   return Card(
     color: Colors.grey,
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           new Row(
             children: <Widget>[
               new Image.asset("assets/images/zh.png",
                 width: 110.0,
                 height: 60.0,),
               new SizedBox(
                 width: 10.0,
               ),
              new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text("Shape of You",
                    style:TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15.0) ,
                    textAlign: TextAlign.left,
                  ),
                  new SizedBox(
                    height: 2.0,
                  ),
                  new Text("Ketan Vaghasiya",
                    style:TextStyle(fontWeight: FontWeight.normal,color: Colors.white,fontSize: 12.0) ,
                    textAlign: TextAlign.left,
                  ),
                  new SizedBox(
                    height: 5.0,
                  ),
                 new Row(
                   children: <Widget>[
                     new Image.asset("assets/images/share.png",
                       width: 25.0,
                       height: 25.0,),
                     new SizedBox(
                       width: 10.0,
                     ),
                     new Text("0 Shares",
                       style: TextStyle(color: Colors.white),),

                   ],
                 )
                ],
              )
             ],
           )
         ],
       ),
     ),
   );
  }

}
