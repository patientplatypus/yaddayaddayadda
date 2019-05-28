
import 'package:flutter/material.dart';

import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class Writer extends StatefulWidget{
  // Writer({@required this.fadeBackground});
  // final bool fadeBackground;
  @override
  _Writer createState() => _Writer();
}

class _Writer extends State<Writer> with TickerProviderStateMixin {

  KeyboardVisibilityNotification _keyboardVisibility = new KeyboardVisibilityNotification();
  int _keyboardVisibilitySubscriberId;
  bool _keyboardState;
  final myKeyboardController = new TextEditingController();
  String messageText = "";
  String buttonText = "Enter Message!";
  String buttonColor = "green";
  double buttonOpacity = 1.0;
  // bool showOpacity=false;
  String textType = "greeting";
  Timer _debounce;  

  buttonOpacityHandler(textTypeVal){
    if(textType!=textTypeVal){
      setState(() {
        buttonOpacity=0.0;
        // showOpacity=true;
      });
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          buttonOpacity=1.0;
          // showOpacity=true;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    myKeyboardController.addListener(() {
      print("inside myKeyboardController");
      final text = myKeyboardController.text.toLowerCase();
      var charsLeft = 250 - text.length;
      if(charsLeft < 0){
        if(textType!='length'){
          setState(() {
            buttonOpacity=0.0;
          });
          Future.delayed(const Duration(milliseconds: 300), () {
            setState(() {
              buttonOpacity=1.0;
              textType = 'length';
              messageText = text;
              buttonText = '${(text.length - 250).toString()} chars too long!';
              buttonColor = 'red';
            });
          });
        }else{
          setState(() {
            buttonOpacity=1.0;
            textType = 'length';
            messageText = text;
            buttonText = '${(text.length - 250).toString()} chars too long!';
            buttonColor = 'red';
          });
        }
      }else if(charsLeft==250){
        if(textType!='greeting'){
          setState(() {
            buttonOpacity=0.0;
          });
          Future.delayed(const Duration(milliseconds: 300), () {
            setState(() {
              buttonOpacity=1.0;
              messageText = text;
              textType = "greeting";
              buttonText = 'Enter Message!';
              buttonColor = 'green';
            });
          });
        }else{
          setState(() {
            buttonOpacity=1.0;
            messageText = text;
            textType = "greeting";
            buttonText = 'Enter Message!';
            buttonColor = 'green';
          });
        }
      }else if(charsLeft>0){
        if(textType!='length'){
          setState(() {
            buttonOpacity=0.0;
          });
          Future.delayed(const Duration(milliseconds: 300), () {
            setState(() {
              buttonOpacity=1.0;
              messageText = text;
              textType = "length";
              buttonText = '${(250 - text.length).toString()} chars left!';
              buttonColor = 'green';
            });
          });
        }else{
          setState(() {
            buttonOpacity=1.0;
            messageText = text;
            textType = "length";
            buttonText = '${(250 - text.length).toString()} chars left!';
            buttonColor = 'green';
          });
        }
      }
      if (_debounce?.isActive ?? false) _debounce.cancel();
      _debounce = Timer(const Duration(milliseconds: 300), () {
        print("debounce has fired!~");
        if(this.messageText.length>250){
          if(textType!='warning'){
            setState(() {
              buttonOpacity=0.0;
            });
            Future.delayed(const Duration(milliseconds: 300), () {
              setState(() {
                buttonOpacity=1.0;
                textType = "warning";
                buttonText = 'Message too long!';
                buttonColor = 'red';
              });
            });
          }else{
            setState(() {
              buttonOpacity=1.0;
              textType = "warning";
              buttonText = 'Message too long!';
              buttonColor = 'red';
            });
          }
        }else if(this.messageText.length>0){
          if(textType!='send'){
            setState(() {
              buttonOpacity=0.0;
            });
            Future.delayed(const Duration(milliseconds: 300), () {
              setState(() {
                buttonOpacity=1.0;
                textType = "send";
                buttonText = 'Broadcast Message!';
                buttonColor = 'green';
              });
            });
          }else{
            setState(() {
              buttonOpacity=1.0;
              textType = "send";
              buttonText = 'Broadcast Message!';
              buttonColor = 'green';
            });
          }
        }
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

  keyboardSubmit(){
    print("keyboard submit happened");
  }

  buttonColorFunc(){
    if(this.buttonColor=='red'){
      return Colors.red;
    }else if(this.buttonColor=='green'){
      return Colors.green;
    }
  }

  @override
  void dispose() {
    myKeyboardController.dispose();
    super.dispose();
  }

// MediaQuery.of(context).viewInsets.bottom

 @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final yadaState = Provider.of<YadaState>(context);
    bool bounceDetect = false;

    var focusMessage = new FocusNode();
    FocusScope.of(context).requestFocus(focusMessage);

    if(yadaState.getWriterStatus()=='homeMessage1'){
      return Align(
        alignment: Alignment.topLeft,
        child: new Container(
          padding: EdgeInsets.fromLTRB(20.0, 5.0, 10.0, 5.0),
          width: width,
          color: new Color.fromRGBO(100, 100, 100, 1),
          child: new LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              print('inside layoutBuilder and value of contraints:');
              print(constraints.maxHeight);
              return new ConstrainedBox(
                constraints: new BoxConstraints(
                  minHeight: constraints.maxHeight - .15*height,
                  minWidth: constraints.maxWidth,
                ),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      height: 0.7*constraints.maxHeight,
                      alignment: Alignment(-1.0, -1.0),
                      padding: EdgeInsets.all(20.0),
                      decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
                        color: Color.fromRGBO(217, 191, 160, 1),
                      ),
                      child:  new Scrollbar(
                        child: new SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          reverse: true,
                          child: new TextField(
                            keyboardType: TextInputType.multiline,
                            maxLines: null, //grow automatically
                            focusNode: focusMessage,
                            controller: myKeyboardController,
                            onSubmitted: keyboardSubmit(),
                            decoration: new InputDecoration.collapsed(
                              hintText: "Please enter your message: ",
                            ),
                          ),
                        ),
                      ), 
                    ),
                    new Container(
                      height: 0.1*height,
                      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                      child: new GestureDetector(
                        onTap: (){
                          print("message button clicked");
                        },
                        child: AnimatedSize(
                          vsync: this,
                          duration: Duration(milliseconds: 300),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 300),
                            decoration: new BoxDecoration(
                              borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
                              color: buttonColorFunc(), 
                            ),
                            height: constraints.maxHeight*0.3 - 10.0,
                            width: this.buttonText.length*12.0,
                            padding: EdgeInsets.all(10.0),
                            alignment: Alignment(0.0, 0.0),
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 300),
                              opacity: buttonOpacity,
                              child: Text(
                                '${this.buttonText}', 
                                style: TextStyle(
                                ),
                              ),
                            )
                          ) 
                        )
                      ),
                    )
                  ],  
                ), 
              );
            })
          )
        );
    }else{
      return Container();
    }
  }
}