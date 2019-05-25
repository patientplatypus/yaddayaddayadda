import 'package:mobx/mobx.dart';
import 'package:yaddayaddayadda/components/header/header.dart';

// Include generated file
part 'menu.g.dart';

// This is the class used by rest of your codebase
class Menu = _Menu with _$Menu;

// The store-class
abstract class _Menu with Store {
  
  @observable
  bool menuOpen = false;

  @action
  void hamburgerClicked() {
    print('inside menuClicked');
    print('and value of menuOpen: ');
    print(menuOpen);

    if(menuOpen==true){
      menuOpen = false;
    }else if(menuOpen==false){
      menuOpen = true;
    }
  }
}