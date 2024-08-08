import 'package:tractian/config/config.dart';

enum AssetType {
  asset,
  component;

  String get assetImage => this == AssetType.asset ? AppAssets.asset : AppAssets.component;
}
