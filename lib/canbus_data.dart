import 'package:flutter/material.dart';

class CanbusData with ChangeNotifier {
  String _rawData = "";

  String get rawData => _rawData;

  void toString(data) {
    _rawData = data;
    notifyListeners(); // 通知监听者
  }
}