// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rv_can_frame.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RvCanFrame _$RvCanFrameFromJson(Map<String, dynamic> json) => RvCanFrame(
  dgn: json['dgn'] as String,
  source: json['source'] as String,
  data: (json['data'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$RvCanFrameToJson(RvCanFrame instance) =>
    <String, dynamic>{
      'dgn': instance.dgn,
      'source': instance.source,
      'data': instance.data,
    };
