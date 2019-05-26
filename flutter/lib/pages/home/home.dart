
import 'package:flutter/material.dart';

import 'package:yaddayaddayadda/components/footer/footer.dart';
import 'package:yaddayaddayadda/components/middle/middlehome.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:provider/provider.dart';


class MyDrawer extends StatefulWidget {
  MyDrawer({@required this.menuOpen, @required this.changeMenuState});
  final bool menuOpen;
  final void Function(String) changeMenuState;

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  @override
  void initState() {
    super.initState();
    print('inside initState of MyDrawer');
    print('and value of widget');
    print(widget);
    if(widget.menuOpen==false){
      this.dispose();
    }else if(widget.menuOpen==true){
      print('inside widget.menuOpen in initState');
      new Future.delayed(Duration.zero,() {
        print('inside future delayed in initState');
        Scaffold.of(context).openDrawer();
      });
    }
    print("open");
  }

  @override
  void dispose() {
    print("close");
    if(widget.menuOpen==true){
      widget.changeMenuState("close");
      super.dispose();
    }else{
      super.dispose();
    }
  }

  // void openDrawer(context){
  //   print('inside openDrawer function');
  //   Scaffold.of(context).openDrawer();
  // }

  @override
  Widget build(BuildContext context) {
    // if(widget.menuOpen==true){
    //   this.openDrawer(context);
    // }
    return Drawer(
      child: Column(
        children: <Widget>[
          Text("test1"),
          Text("test2"),
          Text("test3"),
        ],
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
    }else if(stateVal=='open'){
      setState(() {
        menuOpen = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    print('~~~HOME~~~');

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

    if(orientation==Orientation.portrait){
      return Container(
        child: new Scaffold(
          primary: true,
           appBar: new AppBar(
            automaticallyImplyLeading: false,
            title: new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new IconButton(
                  icon: new Icon(MdiIcons.menu), 
                  onPressed: (){
                    if(this.menuOpen==false){
                      this.changeMenuState('open');
                    }else{
                      this.changeMenuState('close');
                    }
                  }
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
            backgroundColor: Color.fromRGBO(217, 191, 160, 1),
          ),
          body: new Scaffold(
            key: _scaffoldKey,
            drawer: new MyDrawer(menuOpen: this.menuOpen, changeMenuState: (stateVal)=>this.changeMenuState(stateVal)),
            body: new Container(
              child: new Stack(
                children: <Widget>[
                  new MiddleHome(),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: new Footer(),
                  )
                ],
              ), 
              color:  Color.fromRGBO(64, 45, 34, 1),
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