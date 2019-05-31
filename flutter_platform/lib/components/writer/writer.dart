
import 'package:flutter/material.dart';

import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:provider/provider.dart';
import 'dart:async';


class OptionsButton extends StatefulWidget{
  OptionsButton({
    @required this.buttonName, 
    @required this.constraintsHeight, 
    @required this.constraintsWidth,
    @required this.optionOpen,
    @required this.optionOpenFade,
    @required this.changeMessageOptionsBox,
    });
  final String buttonName;
  final double constraintsHeight;
  final double constraintsWidth;
  final String optionOpen;
  final String optionOpenFade;
  final Function changeMessageOptionsBox;
  @override
  _OptionsButton createState() => _OptionsButton();
}

class _OptionsButton extends State<OptionsButton> with TickerProviderStateMixin{

  bool rebuild = false;
  bool forwardAnim = false;

  double topVal;
  double leftVal;
  double rightVal;
  double bottomVal;

  @override
  void initState() {
    super.initState(); 
    if(widget.buttonName=='avatar'){
      setState(() {
        topVal = 5.0;
        leftVal = 5.0;
      });
    }else if(widget.buttonName=='settings'){
      setState(() {
        leftVal = 5.0;
        bottomVal = 60;
      });
    }else if(widget.buttonName=='exit'){
      setState(() {
        rightVal = 5.0;
        bottomVal = 60.0;
      });
    }else if(widget.buttonName=='camera'){
      setState(() {
        rightVal = 5.0;
        topVal = 5.0;
      });
    }
  }

  @override
  void dispose() {
    // _controller.dispose(); 
    super.dispose();
  }    

  buttonColorFunc(buttonColorType, localButtonColor){
    if(buttonColorType=='background'){
    }else if(buttonColorType=='text'){
       if(localButtonColor=='red'){
        return Color.fromRGBO(13, 13, 13, 1.0);
      }else if(localButtonColor=='green'){
        return Color.fromRGBO(242, 242, 242, 1.0);
      }
    }else if(buttonColorType=='border'){
      if(localButtonColor=='red'){
        return Color.fromRGBO(89, 24, 10, 1.0);
      }else if(localButtonColor=='green'){
       return Color.fromRGBO(13, 89, 2, 1.0);
      }
    }else if(buttonColorType=='edgeIcon'){
      if(localButtonColor=='orange'){
        return Color.fromRGBO(140, 91, 48, 1.0);
      }else if(localButtonColor=='brown'){
       return Color.fromRGBO(64, 45, 34, 1.0);
      }
    }
  }

  paddingFunc(){
    print('inside paddingFunc() and value of yadaState');
    print(widget.optionOpen);
    // print(yadaState.getMessageOptionsBox().optionOpen);
    if(widget.buttonName=='avatar'){
      return EdgeInsets.fromLTRB(widget.optionOpen==widget.buttonName?10.0:0.0, widget.optionOpen==widget.buttonName?10.0:0.0, 0.0, 0.0);
    }else if(widget.buttonName=='settings'){
      return EdgeInsets.fromLTRB(widget.optionOpen==widget.buttonName?10.0:0.0, 0.0, 0.0, widget.optionOpen==widget.buttonName?10.0:0.0);
    }else if(widget.buttonName=='camera'){
      return EdgeInsets.fromLTRB(0.0, widget.optionOpen==widget.buttonName?10.0:0.0, widget.optionOpen==widget.buttonName?10.0:0.0, 0.0);
    }else if(widget.buttonName=='exit'){
      return EdgeInsets.fromLTRB(0.0, 0.0, widget.optionOpen==widget.buttonName?10.0:0.0, widget.optionOpen==widget.buttonName?10.0:0.0);
    }
  }
  
  @override
  Widget build(BuildContext context) {

    return new Positioned(
      top: topVal,
      left: leftVal,
      right: rightVal, 
      bottom: bottomVal,
      child: new GestureDetector(
        onTap: (){
          print("Options Button Class gesture detected~");
          widget.changeMessageOptionsBox(widget.buttonName);
          setState(() {
            rebuild = !rebuild;
          });
        },
        child: new AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: widget.optionOpen==widget.buttonName?0.4*widget.constraintsHeight:50.0,
          width: widget.optionOpen==widget.buttonName?0.75*widget.constraintsWidth:50.0,
          padding: paddingFunc(),
          child: new AnimatedContainer(
            duration: new Duration(milliseconds: 300),
            decoration: new BoxDecoration(
              borderRadius: widget.optionOpen==widget.buttonName?new BorderRadius.all(const Radius.circular(20.0)):new BorderRadius.all(const Radius.circular(50.0)),
              color: widget.optionOpen==widget.buttonName?buttonColorFunc('edgeIcon', 'brown'): buttonColorFunc('edgeIcon', 'orange'),
            ),
            child: widget.optionOpen==widget.buttonName?new Text("hello there ${widget.buttonName}"):new Container()
          )
        )
      )
    );
  }
}

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
  String messageButtonText = "Enter Message!";
  String messageButtonColor = "green";
  double buttonOpacity = 1.0;
  // bool showOpacity=false;
  String textType = "greeting";
  Timer _debounce;  
  bool buttonDown = false;
  bool rebuild = false;

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
  void didUpdateWidget(Widget oldWidget) {
    // if (oldWidget.importantProperty != widget.importantProperty) {
    //   _init();
    // }
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
              messageButtonText = '${(text.length - 250).toString()} chars too long!';
              messageButtonColor = 'red';
            });
          });
        }else{
          setState(() {
            buttonOpacity=1.0;
            textType = 'length';
            messageText = text;
            messageButtonText = '${(text.length - 250).toString()} chars too long!';
            messageButtonColor = 'red';
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
              messageButtonText = 'Enter Message!';
              messageButtonColor = 'green';
            });
          });
        }else{
          setState(() {
            buttonOpacity=1.0;
            messageText = text;
            textType = "greeting";
            messageButtonText = 'Enter Message!';
            messageButtonColor = 'green';
          });
        }
      }else if(charsLeft>=0){
        if(textType!='length'){
          setState(() {
            buttonOpacity=0.0;
          });
          Future.delayed(const Duration(milliseconds: 300), () {
            setState(() {
              buttonOpacity=1.0;
              messageText = text;
              textType = "length";
              messageButtonText = '${(250 - text.length).toString()} chars left!';
              messageButtonColor = 'green';
            });
          });
        }else{
          setState(() {
            buttonOpacity=1.0;
            messageText = text;
            textType = "length";
            messageButtonText = '${(250 - text.length).toString()} chars left!';
            messageButtonColor = 'green';
          });
        }
      }
      if (_debounce?.isActive ?? false) _debounce.cancel();
      _debounce = Timer(const Duration(milliseconds: 1500), () {
        print("debounce has fired!~");
        if(charsLeft<0){
          if(textType!='warning'){
            setState(() {
              buttonOpacity=0.0;
            });
            Future.delayed(const Duration(milliseconds: 300), () {
              setState(() {
                buttonOpacity=1.0;
                textType = "warning";
                messageButtonText = 'Message too long!';
                messageButtonColor = 'red';
              });
            });
          }else{
            setState(() {
              buttonOpacity=1.0;
              textType = "warning";
              messageButtonText = 'Message too long!';
              messageButtonColor = 'red';
            });
          }
        }else if(charsLeft>=0){
          if(textType!='send'){
            setState(() {
              buttonOpacity=0.0;
            });
            Future.delayed(const Duration(milliseconds: 300), () {
              setState(() {
                buttonOpacity=1.0;
                textType = "send";
                messageButtonText = 'Broadcast Message!';
                messageButtonColor = 'green';
              });
            });
          }else{
            setState(() {
              buttonOpacity=1.0;
              textType = "send";
              messageButtonText = 'Broadcast Message!';
              messageButtonColor = 'green';
            });
          }
        }
      });
    });
    // checkKeyboardVisibility();
  }

  keyboardSubmit(){
    print("keyboard submit happened");
  }

  buttonColorFunc(buttonColorType, localButtonColor){
    if(buttonColorType=='background'){
      //unnecessary - gradient covers this case...
      // if(this.buttonColor=='red'){
      //   return Color.fromRGBO(166, 33, 33, 1.0);
      // }else if(this.buttonColor=='green'){
      //   return Color.fromRGBO(6, 115, 2, 1.0);
      // }
    }else if(buttonColorType=='text'){
       if(localButtonColor=='red'){
        return Color.fromRGBO(13, 13, 13, 1.0);
      }else if(localButtonColor=='green'){
        return Color.fromRGBO(242, 242, 242, 1.0);
      }
    }else if(buttonColorType=='border'){
      if(localButtonColor=='red'){
        return Color.fromRGBO(89, 24, 10, 1.0);
      }else if(localButtonColor=='green'){
       return Color.fromRGBO(13, 89, 2, 1.0);
      }
    }else if(buttonColorType=='edgeIcon'){
      if(localButtonColor=='orange'){
        return Color.fromRGBO(140, 91, 48, 1.0);
      }else if(localButtonColor=='brown'){
       return Color.fromRGBO(64, 45, 34, 1.0);
      }
    }
  }

  handleGradientFunc(){
    if('${this.messageButtonColor}'=='green'){
      if(this.buttonDown){
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.5],
          colors: [
            Color.fromRGBO(13, 89, 2, 1.0),
            Color.fromRGBO(6, 115, 2, 1.0),
          ]
        );
      }else{
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 0.5],
          colors: [
            Color.fromRGBO(6, 115, 2, 1.0),
            Color.fromRGBO(13, 89, 2, 1.0),
          ]
        );
      }
    }else{
      return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.0, 0.5],
        colors: [
          Color.fromRGBO(89, 24, 10, 1.0),
          Color.fromRGBO(166, 33, 33, 1.0)
        ]
      );
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
        child: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints){
            print('inside layoutBuilder and value of contraints:');
            print(constraints.maxHeight);
            return new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                new Positioned(
                  top: 0.0,
                  left: 0.0,
                  child:  new Container(
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 5.0),
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(13, 13, 13, 1.0),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [0.1, 0.5, 0.7],
                        colors: [ 
                          Color.fromRGBO(23, 38, 1, 1.0),
                          Color.fromRGBO(33, 64, 1, 1.0),
                          Color.fromRGBO(13, 82, 2, 1.0),
                        ]
                      )
                    ),
                    child: new Stack(
                      alignment: Alignment.topLeft,
                      children: <Widget>[
                        new Positioned(
                          top: 0,
                          left: 0,
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Container(
                                alignment: Alignment.topLeft,
                                height: constraints.maxHeight - 70.0,
                                width: constraints.maxWidth - 30.0,
                                padding: EdgeInsets.fromLTRB(60.0, 60.0, 60.0, 60.0),
                                decoration: new BoxDecoration(
                                  borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
                                  color: Color.fromRGBO(217, 191, 160, 1),
                                ),
                                child:  new Scrollbar(
                                  child: new SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    reverse: true,
                                    child: new TextField(
                                      onTap: (){
                                        FocusScope.of(context).requestFocus(focusMessage);
                                      },
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
                                height: 50.0,
                                padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
                                child: AnimatedSize(
                                  vsync: this,
                                  duration: Duration(milliseconds: 300),
                                  child: new GestureDetector(
                                    onTap: (){
                                      print("message button clicked");
                                    },
                                    onTapDown: (TapDownDetails details) {
                                      print("inside onTapDown");
                                      setState(() {
                                        buttonDown=true;
                                      });
                                    },
                                    onTapUp: (TapUpDetails details) {
                                      print("inside onTapUp");
                                      setState(() {
                                        buttonDown=false;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      decoration: new BoxDecoration(
                                        borderRadius: new BorderRadius.all(const Radius.circular(20.0)),
                                        border: new Border.all(
                                          color: buttonColorFunc('border', this.messageButtonColor), 
                                          width: 5.0
                                        ),
                                        gradient: handleGradientFunc()
                                      ),
                                      // height: constraints.maxHeight*0.3 - 10.0,
                                      width: this.messageButtonText.length*14.0,
                                      padding: EdgeInsets.all(10.0),
                                      alignment: Alignment(0.0, 0.0),
                                      child: IgnorePointer(
                                        child: AnimatedOpacity(
                                          duration: Duration(milliseconds: 300),
                                          opacity: buttonOpacity,
                                          child: Text(
                                            '${this.messageButtonText}', 
                                            style: TextStyle(
                                              fontFamily: 'Americantypewriter',
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: buttonColorFunc('text', this.messageButtonColor)
                                            ),
                                          ),
                                        )
                                      )
                                    ) 
                                  )
                                ),
                              ),
                            ],  
                          ),
                        ),
                        OptionsButton(
                          buttonName: 'exit', 
                          changeMessageOptionsBox: (newMessageOption){
                            yadaState.changeMessageOptionsBox(newMessageOption);
                            setState((){});
                          },
                          optionOpen: yadaState.getMessageOptionsBox().optionOpen,
                          optionOpenFade: yadaState.getMessageOptionsBox().optionOpenFade,
                          constraintsHeight: constraints.maxHeight,
                          constraintsWidth: constraints.maxWidth
                        ),
                        new OptionsButton(
                          buttonName: 'camera', 
                          changeMessageOptionsBox: (newMessageOption){
                            yadaState.changeMessageOptionsBox(newMessageOption);
                            setState((){});
                          },
                          optionOpen: yadaState.getMessageOptionsBox().optionOpen,
                          optionOpenFade: yadaState.getMessageOptionsBox().optionOpenFade,
                          constraintsHeight: constraints.maxHeight,
                          constraintsWidth: constraints.maxWidth
                        ),
                        new OptionsButton(
                          buttonName: 'avatar', 
                          changeMessageOptionsBox: (newMessageOption){
                            yadaState.changeMessageOptionsBox(newMessageOption);
                            setState((){});
                          },
                          optionOpen: yadaState.getMessageOptionsBox().optionOpen,
                          optionOpenFade: yadaState.getMessageOptionsBox().optionOpenFade,
                          constraintsHeight: constraints.maxHeight,
                          constraintsWidth: constraints.maxWidth
                        ),
                        new OptionsButton(
                          buttonName: 'settings', 
                          changeMessageOptionsBox: (newMessageOption){
                            yadaState.changeMessageOptionsBox(newMessageOption);
                            setState((){});
                          },
                          optionOpen: yadaState.getMessageOptionsBox().optionOpen,
                          optionOpenFade: yadaState.getMessageOptionsBox().optionOpenFade,
                          constraintsHeight: constraints.maxHeight,
                          constraintsWidth: constraints.maxWidth
                        )
                      ],
                    ) 
                  )
                ),
              ],
            );
          })
        );
    }else{
      return Container();
    }
  }
}



            