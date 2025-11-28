import 'package:flutter/material.dart';
import 'package:widgetarium/widgets/snackbar_content.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Snackbar Content', type: SnackbarContent)
Widget buildSnackbarContent(BuildContext context) {
  final double width = MediaQuery.sizeOf(context).width;
  final double snackbarWidth = 480;
  final double marginLeft = width - snackbarWidth;
  print('width: $width');
  print('margin left: $marginLeft');
  print('snackbar width: $snackbarWidth');

  return Scaffold(
    backgroundColor: Colors.white,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8,
      children: [
        ElevatedButton(
          child: const Text('Show Help Snackbar'),
          onPressed: () {
            final snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              margin: EdgeInsets.only(left: marginLeft, bottom: 16),
              clipBehavior: Clip.none,
              content: SnackbarContent(
                // width: snackbarWidth,
                title: 'Help',
                message: 'Help description',
                contentType: ContentType.help,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          },
        ),
        ElevatedButton(
          child: const Text('Show Failure Snackbar'),
          onPressed: () {
            final snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              margin: EdgeInsets.only(left: marginLeft, bottom: 16),
              clipBehavior: Clip.none,
              content: SnackbarContent(
                // width: snackbarWidth,
                title: 'Failure',
                message: 'Failure description',
                contentType: ContentType.failure,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          },
        ),
        ElevatedButton(
          child: const Text('Show Success Snackbar'),
          onPressed: () {
            final snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              margin: EdgeInsets.only(left: marginLeft, bottom: 16),
              clipBehavior: Clip.none,
              content: SnackbarContent(
                // width: snackbarWidth,
                title: 'Success',
                message: 'Success description',
                contentType: ContentType.success,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          },
        ),
        ElevatedButton(
          child: const Text('Show Warning Snackbar'),
          onPressed: () {
            final snackBar = SnackBar(
              elevation: 0,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.transparent,
              margin: EdgeInsets.only(left: marginLeft, bottom: 16),
              clipBehavior: Clip.none,
              content: SnackbarContent(
                // width: snackbarWidth,
                title: 'Warning',
                message:
                    'Warning description Warning description Warning description Warning description Warning description',
                contentType: ContentType.warning,
              ),
            );

            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(snackBar);
          },
        ),
      ],
    ),
  );
}
