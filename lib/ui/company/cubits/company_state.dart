part of 'company_cubit.dart';

class CompanyState extends Equatable {
  final List<Location> locations;
  final List<Asset> rootAssets;
  final bool loading;
  final String titleFilter;
  final SensorType? typeFilter;
  final AssetStatus? statusFilter;

  const CompanyState({
    this.locations = const [],
    this.rootAssets = const [],
    this.loading = false,
    this.titleFilter = '',
    this.typeFilter,
    this.statusFilter,
  });

  @override
  List<Object?> get props => [
        locations,
        rootAssets,
        loading,
        titleFilter,
        typeFilter,
        statusFilter,
      ];

  List<TreeData> get data {
    return [
      ...locations.map(TreeData.fromLocation),
      ...rootAssets.map(TreeData.fromAsset),
    ].filterByTitle(titleFilter).filterByAssetStatus(statusFilter).filterByAssetType(typeFilter);
  }

  CompanyState copyWith({
    List<Location>? locations,
    List<Asset>? rootAssets,
    bool? loading,
    String? titleFilter,
    SensorType? Function()? typeFilter,
    AssetStatus? Function()? statusFilter,
  }) {
    return CompanyState(
      locations: locations ?? this.locations,
      rootAssets: rootAssets ?? this.rootAssets,
      loading: loading ?? this.loading,
      titleFilter: titleFilter ?? this.titleFilter,
      typeFilter: typeFilter != null ? typeFilter() : this.typeFilter,
      statusFilter: statusFilter != null ? statusFilter() : this.statusFilter,
    );
  }
}
