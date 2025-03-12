import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CanbusProvider with ChangeNotifier {
  final List<String> _data = [];
  bool _isLoading = false;
  String _error = '';

  List<String> get data => _data;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchCanbusData() async {
    _isLoading = true;
    notifyListeners();

    const channel = MethodChannel('can_usb_channel');
    try {
      // 发送读取指令（例如：请求CAN数据）
      final response = await channel.invokeMethod('readCanData');
      _data.add(response.toString());

      print('Received CAN Data: $data');
    } on PlatformException catch (e) {
      _error = 'Error: $e';
      print("Error: ${e.message}");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

}