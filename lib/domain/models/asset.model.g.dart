// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Asset _$AssetFromJson(Map<String, dynamic> json) => Asset(
      id: json['id'] as String,
      name: json['name'] as String,
      locationId: json['locationId'] as String?,
      parentId: json['parentId'] as String?,
      sensorType: $enumDecodeNullable(_$SensorTypeEnumMap, json['sensorType']),
      status: $enumDecodeNullable(_$AssetStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$AssetToJson(Asset instance) => <String, dynamic>{
      'id': instance.id,
      'locationId': instance.locationId,
      'name': instance.name,
      'parentId': instance.parentId,
      'sensorType': _$SensorTypeEnumMap[instance.sensorType],
      'status': _$AssetStatusEnumMap[instance.status],
    };

const _$SensorTypeEnumMap = {
  SensorType.energy: 'energy',
  SensorType.vibration: 'vibration',
};

const _$AssetStatusEnumMap = {
  AssetStatus.operating: 'operating',
  AssetStatus.alert: 'alert',
};
