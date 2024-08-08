// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i5;
import 'package:tractian/domain/domain.dart' as _i4;
import 'package:tractian/ui/company/company.screen.dart' as _i1;
import 'package:tractian/ui/home/home.screen.dart' as _i2;

/// generated route for
/// [_i1.CompanyScreen]
class CompanyRoute extends _i3.PageRouteInfo<CompanyRouteArgs> {
  CompanyRoute({
    required String companyId,
    _i4.Company? company,
    _i5.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          CompanyRoute.name,
          args: CompanyRouteArgs(
            companyId: companyId,
            company: company,
            key: key,
          ),
          rawPathParams: {'id': companyId},
          initialChildren: children,
        );

  static const String name = 'CompanyRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<CompanyRouteArgs>(
          orElse: () =>
              CompanyRouteArgs(companyId: pathParams.getString('id')));
      return _i1.CompanyScreen(
        companyId: args.companyId,
        company: args.company,
        key: args.key,
      );
    },
  );
}

class CompanyRouteArgs {
  const CompanyRouteArgs({
    required this.companyId,
    this.company,
    this.key,
  });

  final String companyId;

  final _i4.Company? company;

  final _i5.Key? key;

  @override
  String toString() {
    return 'CompanyRouteArgs{companyId: $companyId, company: $company, key: $key}';
  }
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i3.PageRouteInfo<void> {
  const HomeRoute({List<_i3.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}
