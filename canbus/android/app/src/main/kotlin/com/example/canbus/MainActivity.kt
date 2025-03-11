package com.example.canbus

import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val CHANNEL = "can_usb_channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "readCanData") {
                val canData = readCanData()
                result.success(canData)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun readCanData(): String {
        // 这里实现CAN总线数据的读取逻辑
        // 例如，使用SocketCAN或其他库读取CAN数据
        return "CAN Data from Android"
    }
}