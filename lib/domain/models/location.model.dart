import 'package:json_annotation/json_annotation.dart';
import 'package:tractian/domain/domain.dart';

part 'location.model.g.dart';

@JsonSerializable()
class Location extends BaseModel {
  final String name;
  final String? parentId;
  final List<Location> locations;
  final List<Asset> assets;

  const Location({
    required super.id,
    required this.name,
    this.parentId,
    this.locations = const [],
    this.assets = const [],
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  @override
  List<Object?> get props => [
        ...super.props,
        name,
        parentId,
        locations,
        assets,
      ];

  @override
  Map<String, dynamic> toJson() => _$LocationToJson(this);

  Location copyWith({
    String? id,
    String? name,
    String? parentId,
    List<Location>? locations,
    List<Asset>? assets,
  }) {
    return Location(
      id: id ?? this.id,
      name: name ?? this.name,
      parentId: parentId ?? this.parentId,
      locations: locations ?? this.locations,
      assets: assets ?? this.assets,
    );
  }
}
