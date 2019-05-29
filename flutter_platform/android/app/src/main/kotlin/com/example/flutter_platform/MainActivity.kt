package com.example.flutter_platform

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  private val CHANNEL1 = "flutter.dev/helloThereSailor"
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    MethodChannel(flutterView, CHANNEL1).setMethodCallHandler { call, result ->
      if (call.method == "getHello") {
        // String text = call.arguments("text");
        // let args = call.arguments as? [String];
        // val arguments = call.arguments as java.util.HashMap<String, String>
        // textArg = call.argument<String>("text");
        val textArg = call.argument<String>("text")
        result.success("hello ${textArg}");
      } else {
        result.notImplemented()
      }
    }
    //  public void onMethodCall(MethodCall CHANNEL1, MethodChannel.Result result) {
    //   if (call.method.equals("getHello")) {
    //     text = call.argument("text");
    //     result.success(text);
    //   } else {
    //       result.notImplemented();
    //   }
    // }
  }
}
