
import 'package:flutter/material.dart';


class writerFuncs{
  static buttonColorFunc(buttonColorType, localButtonColor){
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
    }else if(buttonColorType=='options'){
      if(localButtonColor=='orange'){
        return Color.fromRGBO(140, 91, 48, 1.0);
      }else if(localButtonColor=='brown'){
       return Color.fromRGBO(64, 45, 34, 1.0);
      }
    }
  }
} 
