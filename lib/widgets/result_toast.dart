import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        _isError ? FontAwesomeIcons.exclamation : Icons.check_rounded;

    final MaterialColor iconColor = _isError ? Colors.amber : Colors.green;

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
              color: Colors.amber.withAlpha(128),
            ),
          ),
        ),
        Positioned(
          left: -60,
          bottom: -60,
          child: Container(
            width: 320,
            height: 320,
            decoration: BoxDecoration(
              color: iconColor.withAlpha(16),
              shape: BoxShape.circle,
            ),
            child: Center(child: Icon(icon, size: 240, color: Colors.white)),
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
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: iconColor,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(icon, size: 32, color: Colors.white),
                      ),
                    ),
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
