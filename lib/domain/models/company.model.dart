import 'package:json_annotation/json_annotation.dart';
import 'package:tractian/domain/domain.dart';

part 'company.model.g.dart';

@JsonSerializable()
class Company extends BaseModel {
  final String name;
  final List<Location> locations;
  final List<Asset> assets;

  const Company({
    required super.id,
    required this.name,
    this.locations = const [],
    this.assets = const [],
  });

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  @override
  List<Object?> get props => [
        ...super.props,
        name,
        locations,
        assets,
      ];

  @override
  Map<String, dynamic> toJson() => _$CompanyToJson(this);

  Company copyWith({
    String? id,
    String? name,
    List<Location>? locations,
    List<Asset>? assets,
  }) {
    return Company(
      id: id ?? this.id,
      name: name ?? this.name,
      locations: locations ?? this.locations,
      assets: assets ?? this.assets,
    );
  }
}
