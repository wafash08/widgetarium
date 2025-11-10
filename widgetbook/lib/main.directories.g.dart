// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widgetbook/widgetbook.dart' as _widgetbook;
import 'package:widgetbook_workspace/alert.dart' as _widgetbook_workspace_alert;
import 'package:widgetbook_workspace/say_hello.dart'
    as _widgetbook_workspace_say_hello;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookFolder(
    name: 'widgets',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'Alert',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Error',
            builder: _widgetbook_workspace_alert.buildAlertError,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Info',
            builder: _widgetbook_workspace_alert.buildAlertInfo,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Warning',
            builder: _widgetbook_workspace_alert.buildAlertWarning,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'SayHello',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _widgetbook_workspace_say_hello.buildSayHelloUseCase,
          ),
        ],
      ),
    ],
  ),
];
