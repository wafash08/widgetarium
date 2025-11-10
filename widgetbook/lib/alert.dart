import 'package:flutter/material.dart';
import 'package:widgetarium/widgets/alert.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Info', type: Alert)
Widget buildAlertInfo(BuildContext context) {
  return Alert(
    title: 'Info Title',
    message: 'This is an info message',
    level: AlertLevel.info,
  );
}

@widgetbook.UseCase(name: 'Warning', type: Alert)
Widget buildAlertWarning(BuildContext context) {
  return Alert(
    title: 'Warning Title',
    message: 'This is an warning message',
    level: AlertLevel.warning,
  );
}

@widgetbook.UseCase(name: 'Error', type: Alert)
Widget buildAlertError(BuildContext context) {
  return Alert(
    title: 'Error Title',
    message: 'This is an error message',
    level: AlertLevel.error,
  );
}
