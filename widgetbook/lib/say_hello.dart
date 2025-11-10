import 'package:flutter/material.dart';
import 'package:widgetarium/widgets/say_hello.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: SayHello)
Widget buildSayHelloUseCase(BuildContext context) {
  return SayHello(name: 'Wafa');
}
