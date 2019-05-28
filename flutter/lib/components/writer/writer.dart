
import 'package:flutter/material.dart';

import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:provider/provider.dart';

class Writer extends StatefulWidget{
  // Writer({@required this.fadeBackground});
  // final bool fadeBackground;
  @override
  _Writer createState() => _Writer();
}

class _Writer extends State<Writer> {

  KeyboardVisibilityNotification _keyboardVisibility = new KeyboardVisibilityNotification();
  int _keyboardVisibilitySubscriberId;
  bool _keyboardState;
  final myKeyboardController = new TextEditingController();
  String messageText = "";

  @override
  void initState() {
    super.initState();
    myKeyboardController.addListener(() {
      final text = myKeyboardController.text.toLowerCase();
      setState(() {
        messageText = text;
      });
    });
    // checkKeyboardVisibility();
  }

  // void checkKeyboardVisibility(){
  //   _keyboardState = _keyboardVisibility.isKeyboardVisible;

  //   _keyboardVisibilitySubscriberId = _keyboardVisibility.addNewListener(
  //     onChange: (bool visible) {
  //       new Future.delayed(Duration(seconds: 1),() {
  //         setState(() {
  //           _keyboardState = visible;
  //         });
  //       });
  //     },
  //   );
  // }

  @override
  void dispose() {
    super.dispose();
  }

// MediaQuery.of(context).viewInsets.bottom

 @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final yadaState = Provider.of<YadaState>(context);
    var focusMessage = new FocusNode();
    FocusScope.of(context).requestFocus(focusMessage);

    if(yadaState.getWriterStatus()=='homeMessage1'){
      return Align(
        alignment: Alignment.topLeft,
        child: new Container(
          padding: EdgeInsets.fromLTRB(20.0, 5.0, 10.0, 5.0),
          width: width,
          color:Color.fromRGBO(100, 100, 100, 1),
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              print('inside layoutBuilder and value of contraints:');
              print(constraints.maxHeight);
              return new Container(
                height: constraints.maxHeight - 15.0,
                width: constraints.maxWidth,
                child: new Container(
                  padding: EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                      border: new Border.all(color: Colors.black)
                  ),
                  child: new TextField(
                    focusNode: focusMessage,
                    style: new TextStyle(
                      fontSize: 16.0,
                      color: Colors.black
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    )
                  ),
                )
              );
            }
          )
        )
      );
    }else{
      return Container();
    }
  }
}