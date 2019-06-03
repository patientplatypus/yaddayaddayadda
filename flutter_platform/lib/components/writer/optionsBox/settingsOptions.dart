
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:yaddayaddayadda/components/writer/writerFuncs.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SettingsOptions extends StatefulWidget{
  SettingsOptions({
    @required this.rebuildCallback
  });
  final Function rebuildCallback;
  @override
  _SettingsOptions createState() => _SettingsOptions();
}

class _SettingsOptions extends State<SettingsOptions> {
    
  double iconOpacity = 1;
  double boxOpacity = 0;

  @override
  void initState(){
   
  }

  optionOpenHandler(optionOpen){
    return optionOpen=='settings'?AnimatedOpacity(
      opacity: boxOpacity,
      duration: Duration(milliseconds: 500),
      child: new Container(
        child: Text("hello there animated settings options"),
        decoration: BoxDecoration(
          color: Colors.purple
        ),
      )
    ):Container(
      child: new AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: iconOpacity,
        child: new Icon(
          MdiIcons.settings,
          color: WriterFuncs.buttonColorFunc('options', 'brown')
        )
      )
    );
  }

  delayOptionHandler(optionOpen){
    if(optionOpen=='settings'){
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
    String optionOpenFade = yadaState.getMessageOptionsBox().optionOpenFade;

    delayOptionHandler(optionOpen);

    return Container(
      child:  optionOpenHandler(optionOpen),
      decoration: new BoxDecoration(
        color: optionOpen=="settings"?WriterFuncs.buttonColorFunc('options', 'brown'):WriterFuncs.buttonColorFunc('options', 'orange'),
        borderRadius: optionOpen == "settings"? new BorderRadius.all(const Radius.circular(20.0)):new BorderRadius.all(const Radius.circular(50.0))
      ),
    );
  }
}