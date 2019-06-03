
import 'package:flutter/material.dart';


class WriterFuncs{
  static headlineColorFunc(headlineColorType, localHeadlineColor){
    if(headlineColorType=='option'){
      if(localHeadlineColor=='base'){
        return Color.fromRGBO(242, 140, 15, 1);
      }else if(localHeadlineColor=='highlight'){
        return Color.fromRGBO(217, 156, 43, 0.75);
      }
    }
  }
  static buttonColorFunc(buttonColorType, localButtonColor){
    if(buttonColorType=='text'){
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
    }else if(buttonColorType=='options'){
      if(localButtonColor=='orange'){
        return Color.fromRGBO(140, 91, 48, 1.0);
      }else if(localButtonColor=='brown'){
       return Color.fromRGBO(64, 45, 34, 1.0);
      }
    }
  }
} 
