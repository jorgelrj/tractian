import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../company.dart';

class CompanyLoadingContent extends StatelessWidget {
  const CompanyLoadingContent({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(
      3,
      (index) => TreeData(
        title: BoneMock.title,
        leadingIcon: const Icon(Icons.add),
        children: [
          ...List.generate(
            2,
            (index) => TreeData(
              title: BoneMock.title,
              leadingIcon: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );

    return Skeletonizer(
      child: CompanyDataContent(data: items),
    );
  }
}
