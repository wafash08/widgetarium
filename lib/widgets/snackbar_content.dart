import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SnackbarContent extends StatelessWidget {
  /// `IMPORTANT NOTE` for SnackBar properties before putting this in `content`
  /// backgroundColor: Colors.transparent
  /// behavior: SnackBarBehavior.floating
  /// elevation: 0.0

  final String? title;

  final String message;

  final Color? color;

  final ContentType contentType;

  final TextStyle? titleTextStyle;

  final TextStyle? messageTextStyle;

  // final double width;

  const SnackbarContent({
    super.key,
    this.color,
    this.titleTextStyle,
    this.messageTextStyle,
    this.title,
    required this.message,
    required this.contentType,
  });

  @override
  Widget build(BuildContext context) {
    final double iconSize = 24;
    final Color color = contentType.color;
    final Color backgroundColor = color.withAlpha(32);
    final double iconWrapperSize = iconSize * 1.4;
    final double iconWrapperOffset = iconWrapperSize / 2;
    final EdgeInsets contentPadding = EdgeInsets.all(iconWrapperOffset);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Stack(
          children: [
            Container(
              padding: contentPadding,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 4,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      maxLines: 4,
                      style:
                          titleTextStyle ??
                          TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15,
                          ),
                    ),
                  Text(
                    message,
                    maxLines: 4,
                    style:
                        messageTextStyle ??
                        TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: 128,
                width: 2,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
              ),
            ),
            Positioned(
              top: -iconWrapperOffset,
              left: -iconWrapperOffset,
              child: Container(
                width: iconWrapperSize,
                height: iconWrapperSize,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: color),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: -iconWrapperOffset,
          left: -iconWrapperOffset,
          child: SizedBox(
            width: iconWrapperSize,
            height: iconWrapperSize,
            child: DecoratedBox(
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Center(child: contentType.icon),
            ),
          ),
        ),
      ],
    );
  }
}

class ContentType {
  final String message;

  final Color color;

  final Widget icon;

  const ContentType(this.message, {required this.color, required this.icon});

  static const ContentType help = ContentType(
    'help',
    color: DefaultColors.helpBlue,
    icon: Icon(FontAwesomeIcons.question, size: 24, color: Colors.white),
  );
  static const ContentType failure = ContentType(
    'failure',
    color: DefaultColors.failureRed,
    icon: Icon(FontAwesomeIcons.exclamation, size: 24, color: Colors.white),
  );
  static const ContentType success = ContentType(
    'success',
    color: DefaultColors.successGreen,
    icon: Icon(FontAwesomeIcons.check, size: 24, color: Colors.white),
  );
  static const ContentType warning = ContentType(
    'warning',
    color: DefaultColors.warningYellow,
    icon: Icon(FontAwesomeIcons.info, size: 24, color: Colors.white),
  );
}

class DefaultColors {
  static const Color helpBlue = Colors.blue;

  static const Color failureRed = Colors.red;

  static const Color successGreen = Colors.green;

  static const Color warningYellow = Colors.amber;
}
