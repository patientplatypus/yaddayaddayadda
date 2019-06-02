

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:yaddayaddayadda/components/writer/writerFuncs.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ExitOptions extends StatefulWidget{
  
  @override
  _ExitOptions createState() => _ExitOptions();
}

class _ExitOptions extends State<ExitOptions> {
  
  optionOpenHandler(optionOpenVal){
    if(optionOpenVal=='open'){
      return Container();
    }else if(optionOpenVal=='closed'){
      return Container(
        child: new Icon(
          MdiIcons.exitToApp,
          color: writerFuncs.buttonColorFunc('options', 'brown')
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final yadaState = Provider.of<YadaState>(context);
    String optionOpen = yadaState.getMessageOptionsBox().optionOpen;
    String optionOpenFade = yadaState.getMessageOptionsBox().optionOpenFade;
    return Container(
      child: optionOpen=='exit'?optionOpenHandler('open'):optionOpenHandler('closed'),
      decoration: new BoxDecoration(
        color: optionOpen=="exit"?writerFuncs.buttonColorFunc('options', 'brown'):writerFuncs.buttonColorFunc('options', 'orange'),
        borderRadius: optionOpen == "exit"? new BorderRadius.all(const Radius.circular(20.0)):new BorderRadius.all(const Radius.circular(50.0))
      ),
    );
  }
}