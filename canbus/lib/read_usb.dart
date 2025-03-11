import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReadCanbusData extends StatelessWidget {
  final IconData icon; // 按钮图标
  final String tooltip; // 长按提示
  final Color backgroundColor; // 按钮背景颜色

  const ReadCanbusData({
    super.key,
    this.icon = Icons.add,
    this.tooltip = 'Add',
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        const channel = MethodChannel('can_usb_channel');
        try {
          // 发送读取指令（例如：请求CAN数据）
          final String data = await channel.invokeMethod('readCanData');
          print('Received CAN Data?: $data');
        } on PlatformException catch (e) {
          print("Error: ${e.message}");
        }
      },
      tooltip: tooltip,
      backgroundColor: backgroundColor,
      child: Icon(icon),
    );
  }
}
