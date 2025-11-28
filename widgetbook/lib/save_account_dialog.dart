import 'package:flutter/material.dart';
import 'package:widgetarium/widgets/save_account_dialog.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: SaveAccountDialog)
Widget buildAlertInfo(BuildContext context) {
  return SaveAccountDialog(username: 'tanva0001u025', password: 'Admin123!');
}
