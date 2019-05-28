
import 'package:flutter/material.dart';
import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:yaddayaddayadda/pages/home/home.dart';
// import 'package:yaddayaddayadda/components/header/header.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        cursorColor: Color.fromRGBO(242, 140, 15, 1)
      ),
      home: ChangeNotifierProvider<YadaState>(
        builder: (_) => YadaState(),
        child: Home(),
      ),
    );
  }
}