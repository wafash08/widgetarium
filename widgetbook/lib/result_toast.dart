import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:widgetarium/widgets/result_toast.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

Future<void> showResultToast(
  BuildContext context, {
  bool isMobile = false,
  required String message,
  Duration countdownDuration = const Duration(seconds: 3),
  String countdownText = 'Popup menutup dalam',
  String timeUnit = 'detik',
  required ResultToastType toastType,
}) async {
  if (isMobile) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      isDismissible: true,
      builder: (context) {
        return Container(
          height: 320,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 248, 248, 248),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: ResultToast(
            isMobile: true,
            message: message,
            toastType: toastType,
            countdownDuration: countdownDuration,
            countdowntText: countdownText,
            timeUnit: timeUnit,
          ),
        );
      },
    );
  } else {
    return showGeneralDialog<void>(
      context: context,
      barrierLabel: 'errorRegisterDialog',
      barrierDismissible: true,
      transitionBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, -1),
            end: const Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
      pageBuilder: (_, __, ___) {
        return Dialog(
          clipBehavior: Clip.hardEdge,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(
            height: 320,
            width: 400,
            child: ResultToast(
              isMobile: false,
              message: message,
              toastType: toastType,
              countdownDuration: countdownDuration,
              countdowntText: countdownText,
              timeUnit: timeUnit,
            ),
          ),
        );
      },
    );
  }
}

@widgetbook.UseCase(name: 'Desktop success', type: ResultToast)
Widget buildResultToastDesktopSuccess(BuildContext context) {
  return IconButton(
    onPressed: () {
      showResultToast(
        context,
        isMobile: false,
        toastType: ResultToastType.success,
        message: 'Berhasil disalin',
      );
    },
    tooltip: 'Salin',
    icon: const FaIcon(FontAwesomeIcons.clipboard),
  );
}

@widgetbook.UseCase(name: 'Desktop failed', type: ResultToast)
Widget buildResultToastDesktopFailed(BuildContext context) {
  return IconButton(
    onPressed: () {
      showResultToast(
        context,
        isMobile: false,
        toastType: ResultToastType.error,
        message: 'Gagal disalin',
      );
    },
    tooltip: 'Salin',
    icon: const FaIcon(FontAwesomeIcons.clipboard),
  );
}

@widgetbook.UseCase(name: 'Mobile success', type: ResultToast)
Widget buildResultToastMobileSuccess(BuildContext context) {
  return IconButton(
    onPressed: () {
      showResultToast(
        context,
        isMobile: true,
        toastType: ResultToastType.success,
        message: 'Berhasil disalin',
      );
    },
    tooltip: 'Salin',
    icon: const FaIcon(FontAwesomeIcons.clipboard),
  );
}

@widgetbook.UseCase(name: 'Mobile failed', type: ResultToast)
Widget buildResultToastMobileFailed(BuildContext context) {
  return IconButton(
    onPressed: () {
      showResultToast(
        context,
        isMobile: true,
        toastType: ResultToastType.error,
        message: 'Gagal disalin',
      );
    },
    tooltip: 'Salin',
    icon: const FaIcon(FontAwesomeIcons.clipboard),
  );
}
