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
import 'package:widgetbook_workspace/copy_summary_hotel.dart'
    as _widgetbook_workspace_copy_summary_hotel;
import 'package:widgetbook_workspace/result_toast.dart'
    as _widgetbook_workspace_result_toast;
import 'package:widgetbook_workspace/save_account_dialog.dart'
    as _widgetbook_workspace_save_account_dialog;
import 'package:widgetbook_workspace/save_account_dialog_bubble.dart'
    as _widgetbook_workspace_save_account_dialog_bubble;
import 'package:widgetbook_workspace/saved_account_card.dart'
    as _widgetbook_workspace_saved_account_card;
import 'package:widgetbook_workspace/say_hello.dart'
    as _widgetbook_workspace_say_hello;
import 'package:widgetbook_workspace/simple_snackbar_content.dart'
    as _widgetbook_workspace_simple_snackbar_content;
import 'package:widgetbook_workspace/snackbar_content.dart'
    as _widgetbook_workspace_snackbar_content;

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
        name: 'CopyHotelSummary',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Desktop',
            builder:
                _widgetbook_workspace_copy_summary_hotel
                    .buildCopyHotelSummaryDesktop,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Mobile',
            builder:
                _widgetbook_workspace_copy_summary_hotel
                    .buildCopyHotelSummaryMobile,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'ResultToast',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Desktop failed',
            builder:
                _widgetbook_workspace_result_toast
                    .buildResultToastDesktopFailed,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Desktop success',
            builder:
                _widgetbook_workspace_result_toast
                    .buildResultToastDesktopSuccess,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Mobile failed',
            builder:
                _widgetbook_workspace_result_toast.buildResultToastMobileFailed,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Mobile success',
            builder:
                _widgetbook_workspace_result_toast
                    .buildResultToastMobileSuccess,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'SaveAccountDialog',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder: _widgetbook_workspace_save_account_dialog.buildAlertInfo,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'SaveAccountDialogBubble',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder:
                _widgetbook_workspace_save_account_dialog_bubble.buildAlertInfo,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'SavedAccoutCard',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Default',
            builder:
                _widgetbook_workspace_saved_account_card.buildSavedAccountCard,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'List',
            builder:
                _widgetbook_workspace_saved_account_card.buildSavedAccountList,
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
      _widgetbook.WidgetbookComponent(
        name: 'SimpleSnackbarContent',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Simple snackbar content',
            builder:
                _widgetbook_workspace_simple_snackbar_content
                    .buildSnackbarContent,
          ),
        ],
      ),
      _widgetbook.WidgetbookComponent(
        name: 'SnackbarContent',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Snackbar Content',
            builder:
                _widgetbook_workspace_snackbar_content.buildSnackbarContent,
          ),
        ],
      ),
    ],
  ),
];
