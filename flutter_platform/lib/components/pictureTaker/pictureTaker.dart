import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:provider/provider.dart';
import 'package:yaddayaddayadda/state/yadaState.dart';

class PictureTaker extends StatefulWidget{
  @override 
  _PictureTaker createState()=> _PictureTaker();
}

class _PictureTaker extends State<PictureTaker>{
  
  List<CameraDescription> cameras;
  CameraController controller;
  bool isReady = false;

  @override
  void initState() {
    super.initState();
    print('inside Picture Taker initState');

    setupCameras();
  }

  cameraPreview() {
    print('inside cameraPreview in pictureTaker'); 
    print('value of isReady: ');
    print(isReady);
    print('value of controller:');
    print(controller);
    if (!isReady || !controller.value.isInitialized) {
      return Container();
    }
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller)
    );
  }

  Future<void> setupCameras() async {
    try {
      cameras = await availableCameras();
      controller = new CameraController(cameras[0], ResolutionPreset.medium);
      await controller.initialize();
    } on CameraException catch (_) {
      setState(() {
        isReady = false;
      });
    }
    setState(() {
      isReady = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    final yadaState = Provider.of<YadaState>(context);
    print('value of yadaState.getHomeStatus in picturetaker: ');
    print(yadaState.getHomeStatus());
    if(yadaState.getHomeStatus()=='takepicture'){
      return Container(
        child: cameraPreview()
      );
    }else{
      return new Container();
    }
  }
}