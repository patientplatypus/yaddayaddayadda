

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:yaddayaddayadda/components/writer/writerFuncs.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ExitOptions extends StatefulWidget{
  ExitOptions({
    @required this.rebuildCallback
  });
  final Function rebuildCallback;
  @override
  _ExitOptions createState() => _ExitOptions();
}

class _ExitOptions extends State<ExitOptions> {
  
  double iconOpacity = 1;
  double boxOpacity = 0;

  optionOpenHandler(optionOpen){
    return optionOpen=='exit'?AnimatedOpacity(
      opacity: boxOpacity,
      duration: Duration(milliseconds: 500),
      child: new Container(
        child: Text("hello there animated exit options"),
        decoration: BoxDecoration(
          color: Colors.purple
        ),
      )
    ):Container(
      child: new AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: iconOpacity,
        child: new Icon(
          MdiIcons.exitToApp,
          color: WriterFuncs.buttonColorFunc('options', 'brown')
        )
      )
    );
  }

    delayOptionHandler(optionOpen){
    if(optionOpen=='exit'){
      setState(() {
        iconOpacity=0;
      });
      Future.delayed(Duration(milliseconds: 500),(){
        setState(() {
          boxOpacity=1;
        });
      });
    }else{
      setState(() {
        boxOpacity=0;
      });
      Future.delayed(Duration(milliseconds: 500),(){
        setState(() {
          iconOpacity=1;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final yadaState = Provider.of<YadaState>(context);
    String optionOpen = yadaState.getMessageOptionsBox().optionOpen;

    delayOptionHandler(optionOpen);

    return Container(
      child: optionOpenHandler(optionOpen),
      decoration: new BoxDecoration(
        color: optionOpen=="exit"?WriterFuncs.buttonColorFunc('options', 'brown'):WriterFuncs.buttonColorFunc('options', 'orange'),
        borderRadius: optionOpen == "exit"? new BorderRadius.all(const Radius.circular(20.0)):new BorderRadius.all(const Radius.circular(50.0))
      ),
    );
  }
}