package com.example.canbus

import android.os.Bundle
import android.hardware.usb.UsbManager
import android.content.Context
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import java.nio.ByteBuffer
import android.app.PendingIntent
import android.content.Intent


class MainActivity: FlutterActivity() {
    private val CHANNEL = "can_usb_channel"
    companion object {
      const val ACTION_USB_PERMISSION = "com.example.canbus.USB_PERMISSION"
    }

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
      print("Find USB devices")
        val usbManager = getSystemService(USB_SERVICE) as UsbManager
      val deviceList = usbManager.deviceList
      if (deviceList.isEmpty()) return "No USB device found."

      print("Get USB permission ")
      val device = deviceList.values.first()
      val permissionIntent = PendingIntent.getBroadcast(
          this, 0, Intent(ACTION_USB_PERMISSION), 0
      )
      usbManager.requestPermission(device, permissionIntent)

      print("Get connection")
      val connection = usbManager.openDevice(device)
      val endpoint = device.getInterface(0).getEndpoint(0) // 根据设备调整
      connection.claimInterface(device.getInterface(0), true)

      print("Read USB Data")
      val buffer = ByteArray(16)
      val bytesRead = connection.bulkTransfer(endpoint, buffer, buffer.size, 1000)
      return if (bytesRead > 0) String(buffer, 0, bytesRead) else "No data"
    }
}