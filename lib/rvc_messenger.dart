// import 'package:canbus/canbus_provider.dart';

class RvcMessenger {
  final int id ;
  final List<int> data;

  RvcMessenger(this.id, this.data);

  factory RvcMessenger.fromCanFrame(List<int> frame) {
    final id = frame[0]; // 假设 ID 是第一个字节
    final data = frame.sublist(1); // 假设数据从第二个字节开始
    return RvcMessenger(id, data);
  }

  void printMessage() {
    print("ID: $id, Data: $data");
  }
}

// void main() async {
//   final frame = await CanbusProvider.readCanFrame();
//   if (frame.isNotEmpty) {
//     final rvcMessenger = RvcMessenger.fromCanFrame(frame);
//     rvcMessenger.printMessage();
//   }
// }