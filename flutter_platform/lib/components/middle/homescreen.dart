import 'package:flutter/material.dart';
import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final yadaState = Provider.of<YadaState>(context);

    return Container(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new RaisedButton(
            onPressed: (){
              yadaState.changeHomeStatus("writemessage");
            },
            child: Text(
              'Write Message',
              style: TextStyle(fontSize: 20)
            ),
            color: Color.fromRGBO(130, 130, 130, 1),
          ), 
          new RaisedButton(
            onPressed: (){
              yadaState.changeHomeStatus("takepicture");
            },
            child: Text(
              'Take Picture',
              style: TextStyle(fontSize: 20)
            ),
            color: Color.fromRGBO(130, 130, 130, 1),
          ), 
        ]
      ),
      width: width
    );
  }
}