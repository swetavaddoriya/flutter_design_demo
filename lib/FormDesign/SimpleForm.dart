import 'package:flutter/material.dart';



class SimpleForm extends StatefulWidget {
  @override
  _SimpleFormState createState() => _SimpleFormState();
}

class _SimpleFormState extends State<SimpleForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _textNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("form design"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter name"
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  new SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: _textNameController,
                    decoration: InputDecoration(
                      hintText: "An Outline Border TextField",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                  ),
                  new SizedBox(
                    height: 20.0,
                  ),

                  new TextFormField(
                      decoration:  InputDecoration(
                          hintText: "Password",
                          labelText: "Password",
                          errorStyle: TextStyle(
                            color: Colors.red,
                            wordSpacing: 5.0,
                          ),
                          labelStyle: TextStyle(
                              color: Colors.green,
                              letterSpacing: 1.3
                          ),
                          hintStyle: TextStyle(
                              letterSpacing: 1.3
                          ),
                          contentPadding: EdgeInsets.all(15.0), // Inside box padding
                          border: OutlineInputBorder(
                              gapPadding: 0.0,
                              borderRadius: BorderRadius.circular(1.5)
                          )
                      ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    },
                  ),
                  new SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelStyle: Theme.of(context).textTheme.subhead,
                      labelText: 'One',
                      contentPadding: EdgeInsets.all(15.0),
                      isDense: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter one';
                      }
                      return null;
                    },
                  ),

                  new SizedBox(
                    height: 20.0,
                  ),

                  TextFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person,color: Colors.red,),
                      hintText: 'enter your text?',
                      labelText: 'Name ',
                    ),
                    onSaved: (String value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String value) {
                      return value.contains('') ? 'Plz enter value.' : null;
                    },
                  ),

                  new SizedBox(
                    height: 20.0,
                  ),


                  TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter text",
                          prefixIcon: Icon(Icons.business_center,color: Colors.amber,),
                          suffixIcon: Icon(Icons.delete,color: Colors.red,),
                      ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter one';
                      }
                      return null;
                    },
                  ),

                  new SizedBox(
                    height: 20.0,
                  ),

                  new Text("Add prefix value dollar"),
                  TextFormField(
                      decoration: InputDecoration(
                          prefix: Text("\$"),
                        hintText: "enter price"
                      ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter one';
                      }
                      return null;
                    },
                  ),

                  new SizedBox(
                    height: 20.0,
                  ),

                  TextFormField(
                      decoration: InputDecoration(
                          hintText: "Input box",
                          labelText: "Input box",
                      ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter one';
                      }
                      return null;
                    },
                  ),




                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text('Processing Data')));
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
