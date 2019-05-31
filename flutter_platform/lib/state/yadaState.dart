

import 'dart:typed_data';

import 'package:flutter/material.dart';

class YadaMessage {
  final int id;
  final String username;
  final String message;
  final List<Image> images;

  YadaMessage({this.id, this.username, this.message, this.images});

  factory YadaMessage.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['images'] as List;
    // print(list.runtimeType);
    List<Image> imagesList = list.map((i) => Image.fromJson(i)).toList();


    return YadaMessage(
      id: parsedJson['id'],
      username: parsedJson['username'],
      message: parsedJson['message'],
      images: imagesList
    );
  }
}

class Image {
  final int imageId;
  final String imageName;
  final ByteBuffer imageData; 

  Image({this.imageId, this.imageName, this.imageData});

  factory Image.fromJson(Map<String, dynamic> parsedJson){
   return Image(
     imageId:parsedJson['id'],
     imageName:parsedJson['imageName'],
     imageData: parsedJson['imageData']
   );
  }
}

class MessageOptionsBox {
  String optionOpen;
  String optionOpenFade;

  MessageOptionsBox(this.optionOpen, this.optionOpenFade);
}


class YadaState with ChangeNotifier {

  String currentPage = "/home";
  getCurrentPage() => currentPage;
  void changeCurrentPage(newPage){
    currentPage=newPage;
    notifyListeners();
  }

  String writerStatus = "closed";
  getWriterStatus() => writerStatus;
  void changeWriterStatus(newStatus){
    writerStatus=newStatus;
    notifyListeners();
  }

  bool signedIn = false;
  getSignedIn() => signedIn;
  void changeSignedIn(){
    signedIn=!signedIn;
    notifyListeners();
  }

  var messageOptionsBox = new MessageOptionsBox('closed', 'closed');
  getMessageOptionsBox() => messageOptionsBox;
  void changeMessageOptionsBox(newMessageOption){
    print('inside changeMessageOptionsBox in provider');
    print('and value of newMessageOption: ');
    print(newMessageOption);
    messageOptionsBox.optionOpen=newMessageOption;
    Future.delayed(const Duration(milliseconds: 300), () {
      messageOptionsBox.optionOpenFade=newMessageOption;
    });
  }
}