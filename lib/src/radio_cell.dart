import 'package:cherry_components/cherry_components.dart';
import 'package:flutter/material.dart';

const _kRadioSize = 22.0;

/// Widget similar to [RadioListTile] with custon theming.
class RadioCell<T> extends StatelessWidget {
  final String title;
  final T groupValue, value;
  final ValueChanged<T> onChanged;

  const RadioCell({
    Key? key,
    required this.title,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  bool get _isChecked => groupValue == value;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        color: _isChecked
            ? Theme.of(context).colorScheme.secondary.withOpacity(0.24)
            : null,
        child: Row(
          children: [
            Icon(
              _isChecked ? Icons.check_circle : Icons.panorama_fish_eye,
              size: _kRadioSize,
              color: _isChecked
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).textTheme.caption?.color,
            ),
            Separator.spacer(Space.large),
            Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
      ),
    );
  }
}
