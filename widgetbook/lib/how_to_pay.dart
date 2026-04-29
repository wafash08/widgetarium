import 'package:flutter/material.dart';
import 'package:widgetarium/widgets/how_to_pay.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: HowToPay)
Widget buildHowToPay(BuildContext context) {
  return HowToPay();
}
