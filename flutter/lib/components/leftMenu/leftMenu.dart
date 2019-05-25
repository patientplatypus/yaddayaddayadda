
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:yaddayaddayadda/state/menu.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LeftMenu extends StatefulWidget {
  const LeftMenu();

  @override
  LeftMenuState createState() => LeftMenuState();
}

class LeftMenuState extends State<LeftMenu>{
  final menu = Menu();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _hacker_news.getNewsList();
  }

  @override
  Widget build(BuildContext context) {
    
    print('~~~LeftMenu~~~');
    print('value of menuOpen: ');
    print(menu.menuOpen);

    // print('value of menuOpenGet: ');
    // print(menu.menuOpenGet);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    return Container(
      child: Observer(
        builder: (_){
          print("inside builder");
          print("and value of menu: ");
          print(menu);
          print("and value of menu.menuOpen: ");
          print(menu.menuOpen);
          return Container(
            child: new Card(
              child: new Text('${menu.menuOpen}'), 
            ),
            padding: EdgeInsets.fromLTRB(0, 0.1*height, 0, 0),
            height: 0.9*height,
            width: 0.5*width
          );
        }
      )
    );
  
 //   builder: (context)=> (menu.menuOpen)?
      //     Container(
      //       child: Card(
      //         child: Column(
      //           children: <Widget>[
      //             new Text('hello this is first option ${menu.menuOpen}')
      //           ],
      //         )
      //       ),
      //       padding: EdgeInsets.fromLTRB(0, 0.1*height, 0, 0),
      //       height: 0.9*height,
      //       width: 0.5*width
      //     ):Container(
      //       child: Card(
      //         child: Column(
      //           children: <Widget>[
      //             new Text('hello this is second option ${menu.menuOpen}')
      //           ],
      //         )
      //       ),
      //       padding: EdgeInsets.fromLTRB(0, 0.1*height, 0, 0),
      //       height: 0.9*height,
      //       width: 0.5*width
      //     )
      // )

      //   builder: (_) => Container(
      //         '${counter.value}',
      //         style: Theme.of(context).textTheme.display1,
      //       ),
      // );

    // return Container(
    //   child: Card(
    //     child: Column(
    //       children: <Widget>[
    //         new Text('hello this is dog')
    //       ],
    //     )
    //   ),
    //   padding: EdgeInsets.fromLTRB(0, 25, 0, 0),
    //   height: 0.95*height,
    //   width: 0.5*width
    // );

    // if(orientation==Orientation.portrait){
    //   return Container(
    //     child: new Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: <Widget>[
    //         new Align(
    //           alignment: Alignment.bottomLeft,
    //           child: new Icon(
    //             MdiIcons.menu, 
    //             size: .08*height,
    //           )
    //         ),
    //         new Align(
    //           alignment: Alignment.bottomRight,
    //           child:  new Text(
    //             "YaddaYaddaYadda",
    //             style: TextStyle(
    //               fontFamily: 'Signpainter',
    //               fontSize: height*.05,
    //             ),
    //           )
    //         ),
    //       ]
    //     ),
    //     color: Color.fromRGBO(217, 191, 160, 1),
    //     width: width,
    //     height: .1 * height
    //   );
    // }else{
    //   return Container(
    //     child: new Row(
    //       children: <Widget>[
    //         new Text("YaddaYaddaYadda")
    //       ]
    //     ),
    //     color: Color.fromRGBO(217, 191, 160, 1),
    //     width: width,
    //     height: .05 * height
    //   );
    // }

  }
}
