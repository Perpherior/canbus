package com.example.canbus

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel


import com.example.canbus.CanbusManager

class MainActivity: FlutterActivity() {
    private val CHANNEL = "can_usb_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
          val canbusManager = CanbusManager()

          if (call.method == "readCanFrame") {
            val canData = canbusManager.readCanFrame()
            result.success(canData)
          
          } else {
            result.notImplemented()
          }
        }
    }
}