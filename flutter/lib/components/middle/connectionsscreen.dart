import 'package:flutter/material.dart';
import 'package:yaddayaddayadda/state/yadaState.dart';
import 'package:provider/provider.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'dart:async';


class ConnectionsScreen extends StatefulWidget {
  @override
  _ConnectionsScreen createState() => _ConnectionsScreen();
}

class _ConnectionsScreen extends State<ConnectionsScreen> {
  FlutterBlue _flutterBlue = FlutterBlue.instance;
  BluetoothState state = BluetoothState.unknown;
  StreamSubscription _stateSubscription;
  StreamSubscription _scanSubscription;
  Map<DeviceIdentifier, ScanResult> scanResults = new Map();
  bool isScanning = false;

  _startScan() {
    print("inside StartScan in connections screen");
    _scanSubscription = _flutterBlue.scan(
      timeout: const Duration(seconds: 10),
    ).listen((scanResult) {
      print('inside scanResult callback');
      print('and value of scanResult');
      print(scanResult);
      print('localName: ${scanResult.advertisementData.localName}');
      print('manufacturerData: ${scanResult.advertisementData.manufacturerData}');
      print('serviceData: ${scanResult.advertisementData.serviceData}');
      setState(() {
        scanResults[scanResult.device.id] = scanResult;
      });
    }, onDone: _stopScan);

    setState(() {
      isScanning = true;
    });
    // _scanSubscription = _flutterBlue.scan().listen((scanResult) {
    //   print('inside scanResult callback');
    //   print('and value of scanResult');
    //   print(scanResult);
    // });
    // Future.delayed(const Duration(seconds: 5), () {
    //   _scanSubscription.cancel();
    // });
  }

  _stopScan() {
    print('inside stopScan');
    print('value of this.scanResults');
    print(this.scanResults);
    _scanSubscription?.cancel();
    _scanSubscription = null;
    setState(() {
      isScanning = false;
    });
  }

  @override
  void initState() {
    super.initState();  
    _flutterBlue.state.then((s) {
      setState(() {
        state = s;
      });
    });
    // Subscribe to state changes
    _stateSubscription = _flutterBlue.onStateChanged().listen((s) {
      setState(() {
        state = s;
      });
    });
    this._startScan();
    // Future.delayed(const Duration(seconds: 5), () {
    //   this._stopScan();
    // });
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final yadaState = Provider.of<YadaState>(context);

    return Container(
      child: Text("hello there connectionsscreen")
    );
  }
}