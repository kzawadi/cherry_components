import 'package:cherry_components/cherry_components.dart';
import 'package:flutter/material.dart';

class DialogRoundView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MaterialButton(
            child: Text('Center rounded dialog'),
            onPressed: () => showRoundDialog(
              context: context,
              title: 'Lorem ipsum',
              children: [
                Center(
                  child: Text('Hello world'),
                ),
              ],
            ),
          ),
          MaterialButton(
            child: Text('Bottom rounded dialog'),
            onPressed: () => showBottomRoundDialog(
              context: context,
              title: 'Lorem ipsum',
              children: [
                Center(
                  child: Text('Hello world'),
                ),
              ],
            ),
          ),
          MaterialButton(
            child: Text('Center rounded dialog with actions'),
            onPressed: () => showRoundDialog(
              context: context,
              title: 'Lorem ipsum',
              children: [
                Center(
                  child: Text('Hello world'),
                ),
              ],
              actions: [
                DialogAction(
                  title: 'Primary',
                  onTap: () => print('Primary'),
                ),
                DialogAction(
                  title: 'Secondary',
                  onTap: () => print('Secondary'),
                  type: DialogActionType.secondary,
                ),
                DialogAction(
                  title: 'Danger!',
                  onTap: () => print('Danger!'),
                  type: DialogActionType.dangerous,
                ),
              ],
            ),
          ),
          MaterialButton(
            child: Text('Bottom rounded dialog with actions'),
            onPressed: () => showBottomRoundDialog(
              context: context,
              title: 'Lorem ipsum',
              children: [
                Center(
                  child: Text('Hello world'),
                ),
              ],
              actions: [
                DialogAction(
                  title: 'Primary',
                  onTap: () => print('Primary'),
                ),
                DialogAction(
                  title: 'Secondary',
                  onTap: () => print('Secondary'),
                  type: DialogActionType.secondary,
                ),
                DialogAction(
                  title: 'Danger!',
                  onTap: () => print('Danger!'),
                  type: DialogActionType.dangerous,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
