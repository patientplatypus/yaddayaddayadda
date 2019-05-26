
import 'package:flutter/material.dart';
import 'package:yaddayaddayadda/components/header/header.dart';
import 'package:yaddayaddayadda/components/footer/footer.dart';
import 'package:yaddayaddayadda/components/leftMenu/leftMenu.dart';
import 'package:yaddayaddayadda/components/middle/middlehome.dart';

class Home extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {

    print('~~~HOME~~~');

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var orientation = MediaQuery.of(context).orientation;

    if(orientation==Orientation.portrait){
      return Container(
        child: new Scaffold(
          primary: true,
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
                    fontSize: height*.05,
                    color: Color.fromRGBO(140, 91, 48, 1)
                  ),
                ),
              ],
            ),
            brightness: Brightness.dark,
            backgroundColor: Color.fromRGBO(217, 191, 160, 1),
          ),
          drawer: new Drawer(
            child: new Text("\n\n\nDrawer Is Here"),
          ),
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
            color:  Color.fromRGBO(64, 45, 34, 1),
            width: width,
          )
        ),
        width: width, 
        height: height
      );
    }



//  new PreferredSize(
//             preferredSize: Size.fromHeight(50.0), // here the desired height
//             child: new AppBar(
//               title: new Text(
//                 "YaddaYaddaYadda",
//                 style: TextStyle(
//                   fontFamily: 'Signpainter',
//                   fontSize: 20.0,
//                   color: Color.fromRGBO(140, 91, 48, 1)
//                 )
//               ),
//               backgroundColor: Color.fromRGBO(217, 191, 160, 1),
//             )
//           ),



    // print("Inside home and the value of orientation: ");
    // print(orientation);
    // print(orientation==Orientation.portrait);

    // return Scaffold(
    //   body: Container(
    //     child: new Stack( 
    //       children: <Widget>[
    //         new Positioned(
    //           top: 0, 
    //           left: 0,
    //           child: new Header()
    //         ), 
    //         new Positioned(
    //           top: .1*height, 
    //           left: 0,
    //           child: new MiddleHome()
    //         ), 
    //         new Positioned(
    //           top: .95*height, 
    //           left: 0,
    //           child: new Footer()
    //         ),
    //         // new LeftMenu()
    //       ],
    //     ),
    //     color: Color.fromRGBO(64, 45, 34, 1),
    //     width: width,
    //     height: height,
    //   ) 
    // );
  }
}