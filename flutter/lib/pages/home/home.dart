
import 'package:flutter/material.dart';
import 'package:yaddayaddayadda/components/header/header.dart';
import 'package:yaddayaddayadda/components/footer/footer.dart';
import 'package:yaddayaddayadda/components/middle/middle.dart';

class Home extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: new Stack(
          children: <Widget>[
            new Positioned(
              top: 0, 
              left: 0,
              child: new Header()
            ), 
            new Positioned(
              top: .1*height, 
              left: 0,
              child: new Middle()
            ), 
            new Positioned(
              top: .95*height, 
              left: 0,
              child: new Footer()
            )
          ],
        ),
        color: Color.fromRGBO(64, 45, 34, 1),
        width: width,
        height: height,
      ) 
    );
  }
}