
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart' as prefix0;

import 'package:yaddayaddayadda/components/footer/footer.dart';
import 'package:yaddayaddayadda/components/middle/middlehome.dart';
import 'package:yaddayaddayadda/components/pictureTaker/pictureTaker.dart';
import 'package:yaddayaddayadda/components/writer/writer.dart';
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
void initState() {
  super.initState();
}

@override
void dispose() {
  super.dispose();
}

 @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double rightInset = widget.fadeBackground?0.0:0.5*width;
    return Align(
      alignment: Alignment.bottomRight,
      child: new AnimatedContainer(
        duration: Duration(milliseconds: 500),
        transform: Matrix4.translationValues(rightInset, 0.0, 0.0),
        child: new AnimatedContainer(
          duration: Duration(milliseconds: 500),
          color: widget.fadeBackground?Color.fromRGBO(100, 100, 100, 0.5):Color.fromRGBO(100, 100, 100, 0.0),
          height: 0.9*height,
          width: 0.5*width
        )
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
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                    yadaState.changeHomeStatus('close');
                    widget.changeMenuState('close');
                  },
                  child: new Row( // Replace with a Row for horizontal icon + text
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Padding(padding:EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0)),
                      new AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: yadaState.getCurrentPage()=='/home'?1.0:0.0,
                        child: new Icon(
                          MdiIcons.home, 
                          color: Color.fromRGBO(217, 191, 160, 1)
                        ), 
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
                    print("signin row clicked");
                    yadaState.changeCurrentPage("/signin");
                    yadaState.changeHomeStatus('closed');
                    widget.changeMenuState('close');
                  },
                  child: new Row( // Replace with a Row for horizontal icon + text
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Padding(padding:EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0)),
                      new AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: yadaState.getCurrentPage()=='/signin'?1.0:0.0,
                        child: new Icon(
                          MdiIcons.login, 
                          color: Color.fromRGBO(217, 191, 160, 1)
                        ), 
                      ),
                      new Padding(padding:EdgeInsets.fromLTRB(5.0, 0.0, 00.0, 0)),
                      new Text(
                        "Sign-In", 
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
                    print("connections row clicked");
                    yadaState.changeCurrentPage("/connections");
                    yadaState.changeHomeStatus('closed');
                    widget.changeMenuState('close');
                  },
                  child: new Row( // Replace with a Row for horizontal icon + text
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Padding(padding:EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0)),
                      new AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: yadaState.getCurrentPage()=='/connections'?1.0:0.0,
                        child: new Icon(
                          MdiIcons.consoleNetwork, 
                          color: Color.fromRGBO(217, 191, 160, 1)
                        ), 
                      ),
                      new Padding(padding:EdgeInsets.fromLTRB(5.0, 0.0, 00.0, 0)),
                      new Text(
                        "Connections", 
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
                    yadaState.changeHomeStatus('close');
                    widget.changeMenuState('close');
                  },
                  child: new Row( // Replace with a Row for horizontal icon + text
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Padding(padding:EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0)),
                      new AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: yadaState.getCurrentPage()=='/about'?1.0:0.0,
                        child: new Icon(
                          MdiIcons.accountQuestion, 
                          color: Color.fromRGBO(217, 191, 160, 1)
                        ), 
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
  bool fadeIgnorePointer = true;
  

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
        fadeBackground = true;
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
            body: new Container(
              child: new Stack(
                children: <Widget>[
                  new MiddleHome(),
                  new Writer(),
                  new PictureTaker(),
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