
import 'package:flutter/material.dart';

class MiddleHome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    if(orientation==Orientation.portrait){
      return Container(
        child: new Row(
          children: <Widget>[
            new Text("Hello middle")
          ]
        ),
        width: width,
        height: .85 * height
      );
    }else{
      return Container(
        child: new Row(
          children: <Widget>[
            new Text("Hello middle")
          ]
        ),
        width: width,
        height: .9 * height
      );
    }
  }
}
