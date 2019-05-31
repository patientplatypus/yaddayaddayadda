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
        val textArg = call.argument<String>("text")
        result.success("hello ${textArg}");
      } else {
        result.notImplemented()
      }
    }
  }
}
