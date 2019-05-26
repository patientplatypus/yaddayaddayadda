
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:provider/provider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Header extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    print('~~~HEADER~~~');
    
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    final yadaState = Provider.of<YadaState>(context);

    if(orientation==Orientation.portrait){
      return Container(
        child: new Scaffold(
          appBar: new AppBar(
            title: new Text(
              "YaddaYaddaYadda",
              style: TextStyle(
                fontFamily: 'Signpainter',
                fontSize: height*.05,
                color: Color.fromRGBO(140, 91, 48, 1)
              )
            ),
            backgroundColor: Color.fromRGBO(217, 191, 160, 1),
          ),
          drawer: new Drawer(
            child: new Text("\n\n\nDrawer Is Here"),
          ),
        ),
        width: width, 
        height: height
      );
      
      // return Container(
      //   child: new Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: <Widget>[
      //       new Align(
      //         alignment: Alignment.bottomLeft,
      //         child: new IconButton(
      //           icon: new Icon(MdiIcons.menu), 
      //           onPressed:  () => yadaState.hamburgerClicked(),
      //           iconSize: 0.1*height,
      //         )
      //       ),
      //       new Align(
      //         alignment: Alignment.bottomRight,
      //         child:  new Text(
      //           "YaddaYaddaYadda",
      //           style: TextStyle(
      //             fontFamily: 'Signpainter',
      //             fontSize: height*.05,
      //           ),
      //         )
      //       ),
      //     ]
      //   ),
      //   color: Color.fromRGBO(217, 191, 160, 1),
      //   width: width,
      //   height: .1 * height
      // );
    }else{
      return Container(
        child: new Row(
          children: <Widget>[
            new Text("YaddaYaddaYadda")
          ]
        ),
        color: Color.fromRGBO(217, 191, 160, 1),
        width: width,
        height: .05 * height
      );
    }
  }
}
