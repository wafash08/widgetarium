import 'package:flutter/material.dart';

enum AlertLevel { info, warning, error }

class Alert extends StatelessWidget {
  const Alert({
    super.key,
    this.title,
    required this.message,
    this.level = AlertLevel.info,
    this.padding,
    this.iconSize = 24,
  });

  final String? title;
  final String message;
  final AlertLevel level;
  final EdgeInsets? padding;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final Widget icon = _getLevelIcon(level);
    final Color color = _getBackgroundColor(level);
    final Color backgroundColor = color.withAlpha(32);
    final double iconWrapperSize = iconSize * 1.4;
    final double iconWrapperOffset = iconWrapperSize / 2;
    final EdgeInsets contentPadding =
        padding ?? EdgeInsets.all(iconWrapperOffset);

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
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Text(message),
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
            child: Center(child: icon),
          ),
        ),
      ],
    );
  }

  Widget _getLevelIcon(AlertLevel level) {
    switch (level) {
      case AlertLevel.info:
        return Icon(
          Icons.help_outline_rounded,
          color: Colors.blue,
          size: iconSize,
        );
      case AlertLevel.warning:
        return Icon(
          Icons.info_outline_rounded,
          color: Colors.amber,
          size: iconSize,
        );
      case AlertLevel.error:
        return Icon(
          Icons.error_outline_rounded,
          color: Colors.red,
          size: iconSize,
        );
    }
  }

  Color _getBackgroundColor(AlertLevel level) {
    switch (level) {
      case AlertLevel.info:
        return Colors.blue;
      case AlertLevel.warning:
        return Colors.amber;
      case AlertLevel.error:
        return Colors.red;
    }
  }
}
