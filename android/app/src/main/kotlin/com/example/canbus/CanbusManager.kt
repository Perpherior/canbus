package com.example.canbus

class CanbusManager {
    //TODO: 
    //Read frame from Canbus to USB cable
    fun readCanFrame(): String? {
      print("Reading canbus frame....")
      return "this is a can frame"
    }
    //TODO: 
    //Write frame from Canbus to USB cable
    fun writeCanFrame(): Boolean? {
      print("Writing canbus frame....")
      return false
    }
}
