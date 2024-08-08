import 'package:json_annotation/json_annotation.dart';
import 'package:tractian/domain/domain.dart';

part 'asset.model.g.dart';

@JsonSerializable()
class Asset extends BaseModel {
  final String? locationId;
  final String name;
  final String? parentId;
  final SensorType? sensorType;
  final AssetStatus? status;
  final List<Asset> assets;

  const Asset({
    required super.id,
    required this.name,
    this.locationId,
    this.parentId,
    this.sensorType,
    this.status,
    this.assets = const [],
  });

  factory Asset.fromJson(Map<String, dynamic> json) => _$AssetFromJson(json);

  AssetType get type {
    if (sensorType != null) {
      return AssetType.component;
    } else {
      return AssetType.asset;
    }
  }

  @override
  List<Object?> get props => [
        ...super.props,
        name,
        locationId,
        parentId,
        sensorType,
        status,
        assets,
      ];

  @override
  Map<String, dynamic> toJson() => _$AssetToJson(this);

  Asset copyWith({
    String? id,
    String? name,
    String? locationId,
    String? parentId,
    SensorType? sensorType,
    AssetStatus? status,
    List<Asset>? assets,
  }) {
    return Asset(
      id: id ?? this.id,
      name: name ?? this.name,
      locationId: locationId ?? this.locationId,
      parentId: parentId ?? this.parentId,
      sensorType: sensorType ?? this.sensorType,
      status: status ?? this.status,
      assets: assets ?? this.assets,
    );
  }
}
