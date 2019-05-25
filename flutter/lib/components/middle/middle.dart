
import 'package:flutter/material.dart';

class Middle extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: new Row(
        children: <Widget>[
          new Text("Hello middle")
        ]
      ),
      width: width,
      height: .85 * height
    );
  }
}
