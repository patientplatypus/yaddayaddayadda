

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:yaddayaddayadda/components/writer/writerFuncs.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shimmer/shimmer.dart';

class CameraOptions extends StatefulWidget{
  CameraOptions({
    @required this.rebuildCallback
  });
  final Function rebuildCallback;
  @override
  _CameraOptions createState() => _CameraOptions();
}

class _CameraOptions extends State<CameraOptions> {
  
  double iconOpacity = 1;
  double boxOpacity = 0;

  @override
  void initState() {
    super.initState(); 
  }

  @override
  void dispose() {
    super.dispose();
  }


  optionOpenHandler(optionOpen, changeOpen){
    return optionOpen=='camera'?AnimatedOpacity(
      opacity: boxOpacity,
      duration: Duration(milliseconds: 500),
      child: new LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return new Container(
          alignment: Alignment.topCenter,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Shimmer.fromColors(
                    baseColor: WriterFuncs.headlineColorFunc('option', 'base'),
                    highlightColor: WriterFuncs.headlineColorFunc('option', 'highlight'),
                    child: new Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                      child: new Text(
                        "Camera Options", 
                        style: TextStyle(
                          fontFamily: 'Signpainter',
                          fontSize: 0.2*constraints.maxHeight,
                        ),
                      ),
                    )
                  ),
                  new GestureDetector(
                    onTap: (){
                      changeOpen('closed');
                      widget.rebuildCallback();
                    },
                    child: new Icon(
                      MdiIcons.closeCircle,
                      color: WriterFuncs.buttonColorFunc('options', 'orange'),
                      size: 0.25*constraints.maxHeight,
                    )
                  )
                ],
              ), 
              new Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    height: 0.65*constraints.maxHeight,
                    width: constraints.maxWidth,
                    padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                    child: Text('moo'),
                  )
                ],
              )
            ],
          )
        );
      })
    ):Container(
      child: new AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        opacity: iconOpacity,
        child: new Icon(
          MdiIcons.camera,
          color: WriterFuncs.buttonColorFunc('options', 'brown')
        )
      )
    );
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
    Function changeOpen = (newMessageOption) => yadaState.changeMessageOptionsBox(newMessageOption);

    delayOptionHandler(optionOpen);

    return Container(
      child: optionOpenHandler(optionOpen, changeOpen),
      decoration: new BoxDecoration(
        color: optionOpen=="camera"?WriterFuncs.buttonColorFunc('options', 'brown'):WriterFuncs.buttonColorFunc('options', 'orange'),
        borderRadius: optionOpen == "camera"? new BorderRadius.all(const Radius.circular(20.0)):new BorderRadius.all(const Radius.circular(50.0))
      ),
    );
  }
}