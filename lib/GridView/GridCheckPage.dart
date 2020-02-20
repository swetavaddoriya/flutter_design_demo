import 'package:flutter/material.dart';

class GridCheckPage extends StatefulWidget {
  @override
  _GridCheckPageState createState() => _GridCheckPageState();
}

class _GridCheckPageState extends State<GridCheckPage> {

  List<whatsapp> inputs1 = new List<whatsapp>();
 // List<bool> SelectList=[];
 // List<int> SelectListIndex=[];
//  bool isSelect=true;

  void initState() {
    setState(() {
      inputs1.clear();
      for(int i=0;i<20;i++){
        whatsapp w = new whatsapp();

        w.image=i;
        w.selected=false;
        inputs1.add(w);
      }
     print("len : "+inputs1.length.toString());




    });
  }
  void ItemChange(bool val,int index){
    setState(() {
      for(int i=0;i<inputs1.length;i++) {
        inputs1[i].selected=false;
      }
      inputs1[index].selected=true;
    });
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        child: Center(
            child:  new GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: inputs1.length,
              itemBuilder: (BuildContext context,int index) {
               return builditem(index);
              },
            )
        ),

      ),

    );
  }

 Widget builditem(int index){
   return new Card(
     child: new Container(
       padding: const EdgeInsets.all(8.0),
       child: new Column(
         children: <Widget>[
           Stack(
             children: <Widget>[
               new Column(
                 children: <Widget>[
                   Image.network(
                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOcNILzeIoHM8hzxLNsIdi1YTIwOrIQStap9wVGm5xjddzbCcd&s",
                     fit: BoxFit.cover,
                   ),
                 ],
               ),
               Padding(
                 padding: const EdgeInsets.only(top:70.0,left:40.0),
                 child: new Container(

                   child:   new CheckboxListTile(

                     value: inputs1[index].selected,
                    onChanged: (bool val){

                       setState(() {

                         inputs1[index].selected=val;
                         ItemChange(val,index);

                       });


                       },
                     title: new Text('item ${index}'),
                     controlAffinity: ListTileControlAffinity.leading,

                   ),
                 ),
               ),
             ],
           ),
         ],
       ),
     ),
   );
 }
}


class whatsapp{

 int image;
 bool selected;

 //whatsapp(this.image,this.selected);


}

