
import 'package:flutter/material.dart';

class Header extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      child: new Row(
        children: <Widget>[
          new Text("YaddaYaddaYadda")
        ]
      ),
      color: Color.fromRGBO(217, 191, 160, 1),
      width: width,
      height: .1 * height
    );
  }
}
