// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$Menu on _Menu, Store {
  final _$menuOpenAtom = Atom(name: '_Menu.menuOpen');

  @override
  bool get menuOpen {
    _$menuOpenAtom.reportObserved();
    return super.menuOpen;
  }

  @override
  set menuOpen(bool value) {
    _$menuOpenAtom.context.checkIfStateModificationsAreAllowed(_$menuOpenAtom);
    super.menuOpen = value;
    _$menuOpenAtom.reportChanged();
  }

  final _$_MenuActionController = ActionController(name: '_Menu');

  @override
  void hamburgerClicked() {
    final _$actionInfo = _$_MenuActionController.startAction();
    try {
      return super.hamburgerClicked();
    } finally {
      _$_MenuActionController.endAction(_$actionInfo);
    }
  }
}
