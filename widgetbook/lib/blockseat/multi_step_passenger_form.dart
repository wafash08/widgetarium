import 'package:flutter/material.dart';
import 'package:widgetarium/widgets/blockseat/multi_step_passenger_form.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Multi step passenger form',
  type: MultiStepPassengerForm,
)
Widget buildMultiStepPassengerForm(BuildContext context) {
  return MultiStepPassengerForm();
}
