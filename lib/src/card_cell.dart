import 'package:cherry_components/cherry_components.dart';
import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';

/// This widget applies a custom theme to a [Card] widget.
/// No shadows and a little rounded border :)
class CardCell extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const CardCell({
    Key? key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
  }) : super(key: key);

  /// Custom [CardCell] design, specifically for page headings.
  factory CardCell.header(
    BuildContext context, {
    Key? key,
    Widget? leading,
    required String title,
    List<Widget>? subtitle,
    String? details,
    EdgeInsets padding = const EdgeInsets.all(16),
  }) {
    return CardCell(
      key: key,
      padding: padding,
      child: Column(
        children: Separator.spaceChildren(
          children: [
            Row(
              children: [
                if (leading != null) ...[
                  leading,
                  Separator.spacer(),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: Separator.spaceChildren(
                      space: 8,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                        ),
                        if (subtitle != null)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: Separator.spaceChildren(
                              space: Space.superSmall,
                              children: subtitle,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (details != null) ...[
              Separator.divider(),
              ExpandText(details),
            ]
          ],
        ),
      ),
    );
  }

  /// Custom [CardCell] design, specifically for page body.
  factory CardCell.body(
    BuildContext context, {
    Key? key,
    required String title,
    required Widget child,
    EdgeInsets padding = const EdgeInsets.all(16),
  }) {
    return CardCell(
      key: key,
      padding: padding,
      child: Column(
        children: Separator.spaceChildren(
          children: [
            if (title != null)
              Text(
                title.toUpperCase(),
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
            child
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          width: 2,
          color: Theme.of(context).dividerColor.withOpacity(
                Theme.of(context).brightness == Brightness.dark ? 0.4 : 0.1,
              ),
        ),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }
}
