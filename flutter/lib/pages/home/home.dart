
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

import 'package:yaddayaddayadda/components/footer/footer.dart';
import 'package:yaddayaddayadda/components/middle/middlehome.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:provider/provider.dart';

class ShadowDrawer extends StatefulWidget{
  ShadowDrawer({@required this.fadeBackground});
  final bool fadeBackground;

  @override
  _ShadowDrawer createState() => _ShadowDrawer();
}

class _ShadowDrawer extends State<ShadowDrawer> {
 @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Align(
      alignment: Alignment.bottomRight,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: widget.fadeBackground?Color.fromRGBO(100, 100, 100, 0.5):Color.fromRGBO(100, 100, 100, 0.0),
        height: 0.9*height,
        width: 0.5*width
      )
    );
  }
}

class DrawerMenu extends StatefulWidget {
  DrawerMenu({@required this.menuOpen, @required this.changeMenuState});
  final bool menuOpen;
  final void Function(String) changeMenuState;

  @override
  _DrawerMenu createState() => _DrawerMenu();
}

class _DrawerMenu extends State<DrawerMenu> {

  void _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left) {
        print('Swiped left!');
        widget.changeMenuState('close');
      } else {
        print('Swiped right!');
        widget.changeMenuState('open');
      }
    });
  }
  
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double leftInset = widget.menuOpen?0.0:-0.5*width+10;
    final yadaState = Provider.of<YadaState>(context);

    return Container(
      child: SimpleGestureDetector(
        // onVerticalSwipe: _onVerticalSwipe,
        onHorizontalSwipe: _onHorizontalSwipe,
        swipeConfig: SimpleSwipeConfig(
          verticalThreshold: 5.0,
          horizontalThreshold: 5.0,
          swipeDetectionBehavior: SwipeDetectionBehavior.continuousDistinct,
        ),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          transform: Matrix4.translationValues(leftInset, 0.0, 0.0),
          padding: EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 0),
          width: 0.5*width,
          height: 0.9*height,
          child: new Container(
            child: new Column(
              children: <Widget>[
                new GestureDetector(
                  onTap: (){
                    print("Home row clicked");
                    yadaState.changeCurrentPage("/home");
                    widget.changeMenuState('close');
                  },
                  child: new Row( // Replace with a Row for horizontal icon + text
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Padding(padding:EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0)),
                      new Icon(
                        MdiIcons.home, 
                        color: Color.fromRGBO(217, 191, 160, 1)
                      ),
                      new Padding(padding:EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0)),
                      new Text(
                        "Home", 
                        style: TextStyle(
                          fontFamily: 'Signpainter',
                          fontSize: height*.05,
                          color: Color.fromRGBO(140, 91, 48, 1)
                        ),
                      ),
                    ],
                  )
                ),
                new GestureDetector(
                  onTap: (){
                    print("About row clicked");
                    yadaState.changeCurrentPage("/about");
                    widget.changeMenuState('close');
                  },
                  child: new Row( // Replace with a Row for horizontal icon + text
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Padding(padding:EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0)),
                      new Icon(
                        MdiIcons.cloudQuestion, 
                        color: Color.fromRGBO(217, 191, 160, 1)
                      ),
                      new Padding(padding:EdgeInsets.fromLTRB(5.0, 0.0, 00.0, 0)),
                      new Text(
                        "About", 
                        style: TextStyle(
                          fontFamily: 'Signpainter',
                          fontSize: height*.05,
                          color: Color.fromRGBO(140, 91, 48, 1)
                        ),
                      ),
                    ],
                  )
                )
              ],
            ),
            width: 0.5*width,
            height: 0.9*height,
          ),
          color: Color.fromRGBO(64, 45, 34, 1),
        ),
      ),
    );
  }
}


class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home>{

  bool menuOpen = false;
  bool fadeBackground = false;
  

  @override
  void initState() {
    super.initState();
    print("open");
  }

  @override
  void dispose() {
    print("close");
    super.dispose();
  }

  void changeMenuState(stateVal){
    print('inside changeMenuState and value of stateVal');
    print(stateVal);
    if(stateVal=='na'){
      setState(() {
        menuOpen = !menuOpen;
      });
    }else if(stateVal=='close'){
      setState(() {
        menuOpen = false;
      });
      setState(() {
        fadeBackground = false;
      });
    }else if(stateVal=='open'){
      setState(() {
        menuOpen = true;
      });
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          fadeBackground = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    print('~~~HOME~~~');

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    // GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

    if(orientation==Orientation.portrait){
      return Container(
        child: new Scaffold(
          primary: true,
           appBar: new AppBar(
            automaticallyImplyLeading: false,
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(MdiIcons.menu), 
                  color: Color.fromRGBO(217, 191, 160, 1),
                  onPressed: (){
                    if(this.menuOpen==false){
                      this.changeMenuState('open');
                    }else{
                      this.changeMenuState('close');
                    }
                  },
                  splashColor: Colors.transparent,  
                  highlightColor: Colors.transparent,
                ),
                new Text(
                  "YaddaYaddaYadda",
                  style: TextStyle(
                    fontFamily: 'Signpainter',
                    fontSize: height*.05,
                    color: Color.fromRGBO(140, 91, 48, 1)
                  ),
                ),
              ],
            ),
            brightness: Brightness.dark,
            backgroundColor: Color.fromRGBO(64, 45, 34, 1)
          ),
          body: new Scaffold(
            // key: _scaffoldKey,
            // drawer: new MyDrawer(menuOpen: this.menuOpen, changeMenuState: (stateVal)=>this.changeMenuState(stateVal)),
            body: new Container(
              child: new Stack(
                children: <Widget>[
                  new MiddleHome(),
                  new ShadowDrawer(fadeBackground: this.fadeBackground),
                  new DrawerMenu(menuOpen: this.menuOpen, changeMenuState: (stateVal)=>this.changeMenuState(stateVal)),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: new Footer(),
                  )
                ],
              ), 
              color: Color.fromRGBO(217, 191, 160, 1),
              width: width,
            )
          )
        ),
        width: width, 
        height: height
      );
    }else if(orientation==Orientation.landscape){
      return Container(
        child: new Scaffold(
          primary: false,
          appBar: new AppBar(
            // centerTitle: true,
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new Text(
                  "YaddaYaddaYadda",
                  style: TextStyle(
                    fontFamily: 'Signpainter',
                    fontSize: height*.075,
                    color: Color.fromRGBO(140, 91, 48, 1)
                  ),
                ),
              ],
            ),
            brightness: Brightness.dark,
            backgroundColor: Color.fromRGBO(217, 191, 160, 1),
          ),
          body: new Container(
            child: new Column(
              children: <Widget>[
                new MiddleHome(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: new Footer(),
                )
              ],
            ), 
            color: Color.fromRGBO(64, 45, 34, 1),
            width: width,
          )
        ),
        width: width, 
        height: height
      );
    }
  }
}

// class MyDrawer extends StatefulWidget {
//   MyDrawer({@required this.menuOpen, @required this.changeMenuState});
//   final bool menuOpen;
//   final void Function(String) changeMenuState;

//   @override
//   _MyDrawerState createState() => _MyDrawerState();
// }

// class _MyDrawerState extends State<MyDrawer> {

//   @override
//   void initState() {
//     super.initState();
//     print('inside initState of MyDrawer');
//     print('and value of widget');
//     print(widget);
//     if(widget.menuOpen==false){
//       this.dispose();
//     }else if(widget.menuOpen==true){
//       print('inside widget.menuOpen in initState');
//       new Future.delayed(Duration.zero,() {
//         print('inside future delayed in initState');
//         Scaffold.of(context).openDrawer();
//       });
//     }
//     print("open");
//   }

//   @override
//   void dispose() {
//     print("close");
//     if(widget.menuOpen==true){
//       widget.changeMenuState("close");
//       super.dispose();
//     }else{
//       super.dispose();
//     }
//   }

//   // void openDrawer(context){
//   //   print('inside openDrawer function');
//   //   Scaffold.of(context).openDrawer();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // if(widget.menuOpen==true){
//     //   this.openDrawer(context);
//     // }
//     return Drawer(
//       child: Column(
//         children: <Widget>[
//           Text("test1"),
//           Text("test2"),
//           Text("test3"),
//         ],
//       ),
//     );
//   }
// }