import 'package:extensions_pack/extensions_pack.dart';
import 'package:flutter/material.dart';
import 'package:tractian/ui/company/company.dart';

class CompanyDataContent extends StatelessWidget {
  final List<TreeData> data;

  const CompanyDataContent({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kXSAll,
      child: CustomScrollView(
        slivers: [
          for (final item in data)
            Builder(
              builder: (context) {
                final items = item.expandItems();

                return SliverList.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return TreeComponent(
                      item.data,
                      depth: item.depth,
                    );
                  },
                );
              },
            ),
        ],
      ),
    );
  }
}
