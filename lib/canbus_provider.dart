import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'utils/rv_can_frame.dart';

class CanbusProvider with ChangeNotifier {
  final List<RvCanFrame> _data = [];
  bool _isLoading = false;
  String _error = '';
  static const _channel = MethodChannel('can_usb_channel');

  List<RvCanFrame> get data => _data;
  bool get isLoading => _isLoading;
  String get error => _error;

  Future<void> fetchCanbusData() async {
    _isLoading = true;
    notifyListeners();

    try {
      // Read canbus frame
      final response = await _channel.invokeMethod('readCanFrame');
      print('CAN Data: $response');

      if (response != null) {
        // _data.add(_processRvFrame());
        _processRvFrame();
        print('Received CAN Data: $data');
      } else {
        print('No data available');        
      }
    } on PlatformException catch (e) {
      _error = 'Error: $e';
      print("Error: ${e.message}");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // TODO
  // Pass raw data in and add it to the frames list
  void _processRvFrame() {
    // RV-c Example
    final bytes = Uint8List.fromList([
      0x01, 0x00, 0xF0, 0x01, // PGN (0x00F001)
      0x20, // 源地址 (0x20)
      0x12, 0x34, 0x56, // 数据
    ]);

    try {
      final frame = RvCanFrame.fromBytes(bytes);
      final json = frame.toJson();
      print('Parsed RV-C Frame: $frame');
      print('JSON: $json');

      _data.add(frame);
    } catch (e) {
      print('Error: $e');
    }
  }
}