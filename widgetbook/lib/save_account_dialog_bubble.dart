import 'package:flutter/material.dart';
import 'package:widgetarium/widgets/save_account_dialog_bubble.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: SaveAccountDialogBubble)
Widget buildAlertInfo(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      showModalBottomSheet(
        context: context,
        isDismissible: false,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.transparent,
        isScrollControlled: true,
        clipBehavior: Clip.none,
        builder: (context) {
          return SizedBox(
            height: 240,
            width: 300,
            child: SaveAccountDialogBubble(
              username: 'tanva0001u025',
              password: 'Admin123!',
            ),
          );
        },
      );
    },
    child: Text('show'),
  );
}
