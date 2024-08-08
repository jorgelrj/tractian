import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:tractian/config/assets.dart';
import 'package:tractian/domain/domain.dart';

class TreeData extends Equatable {
  final String title;
  final Widget leadingIcon;
  final Widget? trailingIcon;
  final List<TreeData> children;

  final Asset? asset;
  final Location? location;

  const TreeData({
    required this.title,
    required this.leadingIcon,
    this.trailingIcon,
    this.children = const [],
    this.asset,
    this.location,
  });

  factory TreeData.fromAsset(Asset asset) {
    return TreeData(
      title: asset.name,
      trailingIcon: asset.status == AssetStatus.alert ? asset.status?.iconIndicator : asset.sensorType?.iconIndicator,
      leadingIcon: Image.asset(asset.type.assetImage, width: 14, height: 14),
      children: asset.assets.map(TreeData.fromAsset).toList(),
      asset: asset,
    );
  }

  factory TreeData.fromLocation(Location location) {
    return TreeData(
      title: location.name,
      leadingIcon: Image.asset(AppAssets.location, width: 14, height: 14),
      children: [
        ...location.locations.map(TreeData.fromLocation),
        ...location.assets.map(TreeData.fromAsset),
      ].sortedBy<String>((data) => data.title),
      location: location,
    );
  }

  List<({int depth, TreeData data})> expandItems([int depth = 0]) {
    return [
      (depth: depth, data: this),
      ...children.expand((data) => data.expandItems(depth + 1)),
    ];
  }

  @override
  List<Object?> get props => [title, leadingIcon, trailingIcon, children];

  TreeData copyWith({
    String? title,
    Widget? leadingIcon,
    Widget? trailingIcon,
    List<TreeData>? children,
    Asset? asset,
    Location? location,
  }) {
    return TreeData(
      title: title ?? this.title,
      leadingIcon: leadingIcon ?? this.leadingIcon,
      trailingIcon: trailingIcon ?? this.trailingIcon,
      children: children ?? this.children,
      asset: asset ?? this.asset,
      location: location ?? this.location,
    );
  }
}

extension TreeDataListExtension on List<TreeData> {
  List<TreeData> filterByTitle(String title) {
    if (title.isEmpty) {
      return this;
    }

    return where((data) => data.titleContains(title)).map((data) {
      final children = data.children.filterByTitle(title);

      return data.copyWith(children: children);
    }).toList();
  }

  List<TreeData> filterByAssetStatus(AssetStatus? status) {
    if (status == null) {
      return this;
    }

    return where((data) => data.statusContains(status)).map((data) {
      final children = data.children.filterByAssetStatus(status);

      return data.copyWith(children: children);
    }).toList();
  }

  List<TreeData> filterByAssetType(SensorType? type) {
    if (type == null) {
      return this;
    }

    return where((data) => data.typeContains(type)).map((data) {
      final children = data.children.filterByAssetType(type);

      return data.copyWith(children: children);
    }).toList();
  }
}

extension TreeDataExtension on TreeData {
  bool titleContains(String title) {
    final containsTitle = this.title.toLowerCase().contains(title.toLowerCase());
    final containsTitleInChildren = children.any((data) => data.titleContains(title));

    return containsTitle || containsTitleInChildren;
  }

  bool statusContains(AssetStatus status) {
    final containsStatus = asset?.status == status;
    final containsStatusInChildren = children.any((data) => data.statusContains(status));

    return containsStatus || containsStatusInChildren;
  }

  bool typeContains(SensorType type) {
    final containsType = asset?.sensorType == type;
    final containsTypeInChildren = children.any((data) => data.typeContains(type));

    return containsType || containsTypeInChildren;
  }
}
