

import 'package:flutter/material.dart';

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

}