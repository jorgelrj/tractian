import 'package:extensions_pack/extensions_pack.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tractian/domain/domain.dart';
import 'package:tractian/ui/home/home.dart';

class HomeLoadingContent extends StatelessWidget {
  const HomeLoadingContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: Column(
        children: List<Widget>.generate(
          3,
          (index) {
            return CompanyCard(
              Company(
                id: index.toString(),
                name: BoneMock.fullName,
              ),
              key: ValueKey(index),
            );
          },
        ).addSpacingBetween(mainAxisSpacing: kSMSize),
      ),
    );
  }
}
