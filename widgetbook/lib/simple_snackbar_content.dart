import 'package:flutter/material.dart';
import 'package:widgetarium/widgets/simple_snackbar_content.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void showSimpleSnackbar(
  BuildContext context, {
  double? width,
  required String message,
  required bool isMobile,
  required ContentType type,
  Duration duration = const Duration(seconds: 3),
}) {
  final double screenWidth = MediaQuery.sizeOf(context).width;
  final double snackbarWidth = width ?? 400;
  final double marginLeft = screenWidth - snackbarWidth;

  final snackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    duration: duration,
    margin: EdgeInsets.only(left: marginLeft, bottom: 16),
    clipBehavior: Clip.none,
    content: SimpleSnackbarContent(
      width: snackbarWidth,
      isMobile: isMobile,
      message: message,
      type: type,
    ),
  );

  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackBar);
}

@widgetbook.UseCase(
  name: 'Simple snackbar content',
  type: SimpleSnackbarContent,
)
Widget buildSnackbarContent(BuildContext context) {
  return Scaffold(
    body: Column(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          child: const Text('Sukses simpan'),
          onPressed: () {
            showSimpleSnackbar(
              context,
              message: 'Akun Anda berhasil disimpan di perangkat ini',
              isMobile: false,
              type: ContentType.success,
            );
          },
        ),
        ElevatedButton(
          child: const Text('Gagal simpan'),
          onPressed: () {
            showSimpleSnackbar(
              context,
              message: 'Akun Anda gagal disimpan di perangkat ini',
              isMobile: false,
              type: ContentType.failure,
            );
          },
        ),
      ],
    ),
  );
}
