

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


class YadaState with ChangeNotifier {
  // int _counter = 0;

  // getCounter() => _counter;

  // setCounter(int counter) => _counter = counter;

  // void incrementCounter() {
  //   _counter++;
  //   notifyListeners();
  // }

  // void decrementCounter() {
  //   _counter--;
  //   notifyListeners();
  // }


  // bool menuOpen = false;
  
  // getMenu() => menuOpen;

  // void hamburgerClicked(){
  //   menuOpen=!menuOpen;
  //   notifyListeners();
  // }



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

}