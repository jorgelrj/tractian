import 'package:extensions_pack/extensions_pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian/ui/company/company.dart';
import 'package:tractian/ui/shared/shared.dart';

class TreeComponent extends StatelessWidget {
  final TreeData data;
  final int depth;

  const TreeComponent(
    this.data, {
    required this.depth,
    super.key,
  });

  TreeData get _data => data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          depth,
          (index) {
            return Container(
              width: kXSSize,
              height: kXSSize,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Theme.of(context).dividerColor, width: 0.5),
                ),
              ),
            );
          },
        ),
        const Spacing(),
        _data.leadingIcon,
        const Spacing(),
        Flexible(
          child: BlocSelector<CompanyCubit, CompanyState, String>(
            selector: (state) => state.titleFilter,
            builder: (context, state) {
              return SelectionHighlightText(
                _data.title,
                selection: state,
              );
            },
          ),
        ),
        if (_data.trailingIcon != null) ...[
          const Spacing(),
          _data.trailingIcon!,
        ]
      ],
    );
  }
}
