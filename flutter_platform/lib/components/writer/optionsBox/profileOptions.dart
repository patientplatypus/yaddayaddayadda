
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:yaddayaddayadda/components/writer/writerFuncs.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ProfileOptions extends StatefulWidget{
  
  @override
  _ProfileOptions createState() => _ProfileOptions();
}

class _ProfileOptions extends State<ProfileOptions> {
    
  optionOpenHandler(optionOpenVal){
    if(optionOpenVal=='open'){
      return Container();
    }else if(optionOpenVal=='closed'){
      return Container(
        child: new Icon(
          MdiIcons.faceProfile,
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
      child: optionOpen=='profile'?optionOpenHandler('open'):optionOpenHandler('closed'),
      decoration: new BoxDecoration(
        color: optionOpen=="profile"?writerFuncs.buttonColorFunc('options', 'brown'):writerFuncs.buttonColorFunc('options', 'orange'),
        borderRadius: optionOpen == "profile"? new BorderRadius.all(const Radius.circular(20.0)):new BorderRadius.all(const Radius.circular(50.0))
      ),
    );
  }
}