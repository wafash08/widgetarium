import 'package:flutter/material.dart';
import 'package:widgetarium/widgets/confirmation_dialog.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

Future<void> showConfirmationDialog(
  BuildContext context, {
  bool isMobile = false,
}) async {
  if (isMobile) {
    return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black12,
      isDismissible: true,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          clipBehavior: Clip.hardEdge,
          child: ConfirmationDialog(),
        );
      },
    );
  } else {
    return showGeneralDialog<void>(
      context: context,
      barrierLabel: 'confirmationDialog',
      barrierDismissible: true,
      transitionBuilder: (_, animation, __, child) {
        return SlideTransition(
          position: Tween(
            begin: const Offset(0, 1),
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
          child: SizedBox(width: 400, child: ConfirmationDialog()),
        );
      },
    );
  }
}

@widgetbook.UseCase(name: 'Desktop', type: ConfirmationDialog)
Widget buildCopyHotelSummaryDesktop(BuildContext context) {
  return IconButton(
    onPressed: () {
      showConfirmationDialog(context, isMobile: false);
    },
    tooltip: 'konfirmasi',
    icon: const Icon(Icons.ac_unit_rounded),
  );
}

@widgetbook.UseCase(name: 'Mobile', type: ConfirmationDialog)
Widget buildCopyHotelSummaryMobile(BuildContext context) {
  return IconButton(
    onPressed: () {
      showConfirmationDialog(context, isMobile: true);
    },
    tooltip: 'konfirmasi',
    icon: const Icon(Icons.ac_unit_rounded),
  );
}
