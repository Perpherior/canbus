import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';

part 'rv_can_frame.g.dart';

@JsonSerializable()
class RvCanFrame {
  final String pgn;       // 参数组编号 (PGN，16进制格式)
  final String source;    // 源地址 (16进制格式)
  final List<String> data; // 数据 (16进制字符串列表)

  RvCanFrame({
    required this.pgn,
    required this.source,
    required this.data,
  });

  /// 解析 RV-C 帧的字节数据
  factory RvCanFrame.fromBytes(Uint8List bytes) {
    if (bytes.length < 8) {
      throw FormatException("Invalid RV-C frame: length < 8 bytes");
    }

    // 解析 PGN (3字节)
    final pgnBytes = bytes.sublist(1, 4);
    final pgn = pgnBytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();

    // 解析源地址 (1字节)
    final source = bytes[4].toRadixString(16).padLeft(2, '0');

    // 解析数据 (假设后续字节为数据)
    final dataBytes = bytes.sublist(5, 8);
    final data = dataBytes.map((b) => b.toRadixString(16).padLeft(2, '0')).toList();

    return RvCanFrame(pgn: pgn, source: source, data: data);
  }

  /// 转换为 JSON
  Map<String, dynamic> toJson() => _$RvCanFrameToJson(this);

  /// 从 JSON 反序列化
  factory RvCanFrame.fromJson(Map<String, dynamic> json) =>
      _$RvCanFrameFromJson(json);

  @override
  String toString() {
    return 'RvCanFrame(pgn: $pgn, source: $source, data: $data)';
  }
}