import 'dart:async';

import 'package:flutter/material.dart';

enum ResultToastType { error, success }

class ResultToast extends StatefulWidget {
  const ResultToast({
    super.key,
    required this.isMobile,
    required this.message,
    this.countdownDuration = const Duration(seconds: 3),
    required this.countdowntText,
    required this.timeUnit,
    required this.toastType,
  });

  final bool isMobile;
  final String message;
  final Duration countdownDuration;
  final String countdowntText;
  final String timeUnit;
  final ResultToastType toastType;

  @override
  State<ResultToast> createState() => _ResultToastState();
}

class _ResultToastState extends State<ResultToast> {
  late int _remaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _remaining = widget.countdownDuration.inSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remaining > 0) {
        setState(() => _remaining--);
      } else {
        _timer?.cancel();
        if (mounted) {
          Navigator.pop(context);
        }
      }
    });
  }

  bool get _isError => widget.toastType == ResultToastType.error;
  // bool get _isSuccess => widget.toastType == ResultToastType.success;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final IconData icon =
        _isError ? Icons.warning_amber_rounded : Icons.check_rounded;

    final Color iconColor = _isError ? Colors.amber.shade800 : Colors.green;
    final Color iconBackgroundColor = _isError ? Colors.red : Colors.green;

    return Stack(
      children: [
        Positioned(
          right: -10,
          top: -10,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.amber.withAlpha(64),
            ),
          ),
        ),
        Positioned(
          left: _isError ? -100 : -60,
          top: 0,
          child: Icon(
            icon,
            size: 320,
            color: iconBackgroundColor.withAlpha(16),
          ),
        ),
        Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(50),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(6.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Material(
                    elevation: 0,
                    shape: const CircleBorder(),
                    color: Colors.transparent,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      splashRadius: 20,
                      icon: const Icon(
                        Icons.close_rounded,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
                height: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(4.0),
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                child: Column(
                  spacing: 12,
                  children: [
                    Icon(icon, size: 48, color: iconColor),
                    Text(
                      widget.message,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: widget.countdowntText,
                            style: TextStyle(
                              fontFamily:
                                  DefaultTextStyle.of(context).style.fontFamily,
                            ),
                          ),
                          TextSpan(
                            text: " $_remaining ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Theme.of(context).primaryColor,
                              fontFamily:
                                  DefaultTextStyle.of(context).style.fontFamily,
                            ),
                          ),
                          TextSpan(
                            text: widget.timeUnit,
                            style: TextStyle(
                              fontFamily:
                                  DefaultTextStyle.of(context).style.fontFamily,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

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
