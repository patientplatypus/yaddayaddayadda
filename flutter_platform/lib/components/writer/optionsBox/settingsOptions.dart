
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:yaddayaddayadda/components/writer/writerFuncs.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SettingsOptions extends StatefulWidget{
  
  @override
  _SettingsOptions createState() => _SettingsOptions();
}

class _SettingsOptions extends State<SettingsOptions> {
    
  optionOpenHandler(optionOpenVal){
    if(optionOpenVal=='open'){
      return Container();
    }else if(optionOpenVal=='closed'){
      return Container(
        child: new Icon(
          MdiIcons.settings,
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
      child: optionOpen=='settings'?optionOpenHandler('open'):optionOpenHandler('closed'),
      decoration: new BoxDecoration(
        color: optionOpen=="settings"?writerFuncs.buttonColorFunc('options', 'brown'):writerFuncs.buttonColorFunc('options', 'orange'),
        borderRadius: optionOpen == "settings"? new BorderRadius.all(const Radius.circular(20.0)):new BorderRadius.all(const Radius.circular(50.0))
      ),
    );
  }
}