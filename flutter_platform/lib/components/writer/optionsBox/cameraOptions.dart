
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:yaddayaddayadda/components/writer/writerFuncs.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CameraOptions extends StatefulWidget{
  
  @override
  _CameraOptions createState() => _CameraOptions();
}

class _CameraOptions extends State<CameraOptions> {

  double iconOpacity = 1;
  double boxOpacity = 0;

  @override
  void initState(){
   
  }

  optionOpenHandler(optionOpen){
    return optionOpen=='camera'?AnimatedOpacity(
      opacity: boxOpacity,
      duration: Duration(milliseconds: 500),
      child: new Container(
        child: Text("hello there animated camera options"),
        decoration: BoxDecoration(
          color: Colors.purple
        ),
      )
    ):Container(
      child: new AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: iconOpacity,
        child: new Icon(
          MdiIcons.camera,
          color: writerFuncs.buttonColorFunc('options', 'brown')
        )
      )
    );

    // return Container(
    //   child: Stack(
    //     children: <Widget>[
    //       AnimatedOpacity(
    //         opacity: iconOpacity,
    //         duration: Duration(milliseconds: 500),
    //         child: new Icon(
    //           MdiIcons.camera,
    //           size: 40.0,
    //           color: writerFuncs.buttonColorFunc('options', 'brown')
    //         )
    //       ),
    //       optionOpen=='camera'?AnimatedOpacity(
    //         opacity: boxOpacity,
    //         duration: Duration(milliseconds: 500),
    //         child: new Container(
    //           child: Text("hello there animated camera options"),
    //           decoration: BoxDecoration(
    //             color: Colors.purple
    //           ),
    //         )
    //       ):Container()
    //     ],
    //   )
    // );    

    // if(optionOpen!='camera'){
    //   if(iconOpacity != 1){
    //     Future.delayed(Duration(milliseconds: 500),(){
    //       setState(() {
    //         iconOpacity = 1;
    //       });
    //     });
    //   }
    //   return AnimatedOpacity(
    //     opacity: iconOpacity,
    //     duration: Duration(milliseconds: 200),
    //     child: new Icon(
    //       MdiIcons.camera,
    //       color: writerFuncs.buttonColorFunc('options', 'brown')
    //     )
    //   );
    // }else{
    //   Future.delayed(Duration(milliseconds: 500),(){
    //     setState(() {
    //       iconOpacity = 0;
    //       boxOpacity = 1;
    //     });
    //   });
    //   return AnimatedOpacity(
    //     opacity: boxOpacity,
    //     duration: Duration(milliseconds: 200),
    //     child: new Container(
    //       child: Text("hello there animated camera options"),
    //       decoration: BoxDecoration(
    //         color: Colors.purple
    //       ),
    //     )
    //   );
    // }
    // if(optionOpenVal=='open'){
    //   return Container();
    // }else if(optionOpenVal=='closed'){
    //   return Container(
    //     child: new Icon(
    //       MdiIcons.camera,
    //       color: writerFuncs.buttonColorFunc('options', 'brown')
    //     )
    //   );
    // }
  }

  delayOptionHandler(optionOpen){
    if(optionOpen=='camera'){
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
      child: optionOpenHandler(optionOpen),
      decoration: new BoxDecoration(
        color: optionOpen=="camera"?writerFuncs.buttonColorFunc('options', 'brown'):writerFuncs.buttonColorFunc('options', 'orange'),
        borderRadius: optionOpen == "camera"? new BorderRadius.all(const Radius.circular(20.0)):new BorderRadius.all(const Radius.circular(50.0))
      ),
    );
  }
}