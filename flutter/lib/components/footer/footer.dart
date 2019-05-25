
import 'package:flutter/material.dart';

class Footer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    print('~~~FOOTER~~~');    

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // var orientation = MediaQuery.of(context).orientation;

    return Container(
      child: new Row(
          children: <Widget>[
            new Text("patientplatypus 2019 all rights reserved")
          ]
        ),
      color: Color.fromRGBO(166, 130, 99, 1),
      width: width,
      height: .05 * height
    );

    // if(orientation==Orientation.portrait){
    //   return Container(
    //     child: new Row(
    //         children: <Widget>[
    //           new Text("patientplatypus 2019 all rights reserved")
    //         ]
    //       ),
    //     color: Color.fromRGBO(166, 130, 99, 1),
    //     width: width,
    //     height: .05 * height
    //   );
    // }else{

    // }
  }
}
