
import 'package:flutter/material.dart';


import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:provider/provider.dart';


class MiddleHome extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    final yadaState = Provider.of<YadaState>(context);

    if(orientation==Orientation.portrait){
      if(yadaState.getCurrentPage()=='/home'){
        return Container(
          child: new Row(
            children: <Widget>[
              new Text("Hello /home")
            ]
          ),
          width: width
        );
      }else if(yadaState.getCurrentPage()=='/about'){
        return Container(
          child: new Row(
            children: <Widget>[
              new Text("Hello /about")
            ]
          ),
          width: width
        );
      }
    }else{
      return Container(
        child: new Row(
          children: <Widget>[
            new Text("Hello middle")
          ]
        ),
        height: .8*height,
        width: width
      );
    }
  }
}
