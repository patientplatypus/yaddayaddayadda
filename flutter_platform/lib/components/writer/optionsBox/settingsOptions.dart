
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:yaddayaddayadda/components/writer/writerFuncs.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:shimmer/shimmer.dart';

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
  void initState() {
    super.initState(); 
  }

  @override
  void dispose() {
    super.dispose();
  }


  optionOpenHandler(optionOpen, changeOpen){
    return optionOpen=='settings'?AnimatedOpacity(
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
                        "Settings Options", 
                        style: TextStyle(
                          fontFamily: 'Signpainter',
                          fontSize: 0.2*constraints.maxHeight,
                          // color: Color.fromRGBO(140, 91, 48, 1)
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
                    color: Colors.teal,
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
          MdiIcons.settings,
          color: WriterFuncs.buttonColorFunc('options', 'brown')
        )
      )
    );
  }

  delayOptionHandler(optionOpen){
    if(optionOpen=='settings'){
      mounted?setState(() {
        iconOpacity=0;
      }):null;
      Future.delayed(Duration(milliseconds: 500),(){
        mounted?setState(() {
          boxOpacity=1;
        }):null;
      });
    }else{
      mounted?setState(() {
        boxOpacity=0;
      }):null;
      Future.delayed(Duration(milliseconds: 500),(){
        mounted?setState(() {
          iconOpacity=1;
        }):null;
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
      child:  optionOpenHandler(optionOpen, changeOpen),
      decoration: new BoxDecoration(
        color: optionOpen=="settings"?WriterFuncs.buttonColorFunc('options', 'brown'):WriterFuncs.buttonColorFunc('options', 'orange'),
        borderRadius: optionOpen == "settings"? new BorderRadius.all(const Radius.circular(20.0)):new BorderRadius.all(const Radius.circular(50.0))
      ),
    );
  }
}