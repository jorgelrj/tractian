import 'package:extensions_pack/extensions_pack.dart';
import 'package:tractian/domain/domain.dart';

typedef CompanyData = ({List<Location> locations, List<Asset> assets});

class GetCompanyData {
  final AssetsRepository _assetsRepository;
  final LocationsRepository _locationsRepository;

  const GetCompanyData({
    required AssetsRepository assetsRepository,
    required LocationsRepository locationsRepository,
  })  : _assetsRepository = assetsRepository,
        _locationsRepository = locationsRepository;

  Future<CompanyData> call(String companyId) async {
    final result = await Future.wait([
      _locationsRepository.listAllByCompany(companyId),
      _assetsRepository.listAllByCompany(companyId),
    ]);

    final allLocations = result[0] as List<Location>;
    final allAssets = result[1] as List<Asset>;

    final mappedAssets = allAssets.mapSubAssetsToParents();
    final rootAssets = mappedAssets.where((asset) => asset.locationId == null).toList();
    final locationAssets = mappedAssets.where((asset) => asset.locationId != null).toList();

    final locationsWithAssets = allLocations.mapAssetsToLocations(locationAssets);
    final mappedLocations = locationsWithAssets.mapSubLocationsToParents();

    return (
      locations: mappedLocations,
      assets: rootAssets,
    );
  }
}

extension AssetListExtension on List<Asset> {
  List<Asset> mapSubAssetsToParents() {
    final groupedAssets = groupListsBy((asset) => asset.parentId);
    final rootAssets = {for (final asset in groupedAssets[null] ?? <Asset>[]) asset.id: asset};

    List<Asset> getSubAssets(String parentId) {
      final subAssets = groupedAssets[parentId] ?? <Asset>[];
      return [
        for (final subAsset in subAssets)
          subAsset.copyWith(
            assets: getSubAssets(subAsset.id),
          ),
      ];
    }

    return [
      for (final asset in rootAssets.values)
        asset.copyWith(
          assets: getSubAssets(asset.id),
        ),
    ];
  }
}

extension LocationListExtension on List<Location> {
  List<Location> mapAssetsToLocations(List<Asset> assets) {
    final groupedAssets = assets.groupListsBy((asset) => asset.locationId);

    return map((location) {
      final locationAssets = groupedAssets[location.id] ?? [];

      return location.copyWith(
        assets: [
          ...locationAssets,
          ...location.assets,
        ],
      );
    }).toList();
  }

  List<Location> mapSubLocationsToParents() {
    final groupedLocations = groupListsBy((location) => location.parentId);
    final rootLocations = {for (final location in groupedLocations[null] ?? <Location>[]) location.id: location};

    List<Location> getSubLocations(String parentId) {
      final subLocations = groupedLocations[parentId] ?? <Location>[];
      return [
        for (final subLocation in subLocations)
          subLocation.copyWith(
            locations: getSubLocations(subLocation.id),
          ),
      ];
    }

    return [
      for (final location in rootLocations.values)
        location.copyWith(
          locations: getSubLocations(location.id),
        ),
    ];
  }
}
