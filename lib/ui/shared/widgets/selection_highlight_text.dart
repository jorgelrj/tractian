import 'package:extensions_pack/extensions_pack.dart';
import 'package:flutter/material.dart';

class SelectionHighlightText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final String selection;

  const SelectionHighlightText(
    this.data, {
    required this.selection,
    super.key,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final mappedString = data.splitMapJoin(
      RegExp(selection, caseSensitive: false),
      onMatch: (match) => '<b>${match.group(0)}<b>',
      onNonMatch: (nonMatch) => nonMatch,
    );

    final spans = mappedString.split('<b>').map((e) {
      if (e.toLowerCase() == selection.toLowerCase()) {
        return TextSpan(
          text: e,
          style: (style ?? const TextStyle()).copyWith(
            color: context.colorScheme.primary,
            backgroundColor: context.colorScheme.primary.withOpacity(0.1),
          ),
        );
      } else {
        return TextSpan(text: e, style: style);
      }
    }).toList();

    return Text.rich(
      TextSpan(children: spans),
    );
  }
}
