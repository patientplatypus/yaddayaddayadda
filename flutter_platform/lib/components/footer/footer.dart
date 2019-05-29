
import 'package:flutter/material.dart';
import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    print('~~~FOOTER~~~');    
    final yadaState = Provider.of<YadaState>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    if(yadaState.getWriterStatus()!='closed'&&yadaState.getWriterStatus()!='close'){
      return Container();
    }else{
      return Container(
        child: new Row(
            children: <Widget>[
              new Text("patientplatypus 2019 all rights reserved")
            ]
          ),
        color: Color.fromRGBO(166, 130, 99, 1),
        width: width,
      );
    }
  }
}
