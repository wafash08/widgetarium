import 'package:flutter/material.dart';

enum ContentType { failure, success }

class SimpleSnackbarContent extends StatelessWidget {
  const SimpleSnackbarContent({
    super.key,
    required this.width,
    required this.message,
    required this.type,
    required this.isMobile,
  });

  final double width;
  final String message;
  final ContentType type;
  final bool isMobile;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.only(left: 16, top: 8, right: 8, bottom: 8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: _getColor(type),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 8,
        children: [
          Expanded(
            child: Text(message, maxLines: 4, style: TextStyle(fontSize: 14)),
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            tooltip: 'Tutup',
            splashRadius: 16,
            icon: Icon(Icons.close_rounded, color: Colors.white, size: 16),
          ),
        ],
      ),
    );
  }

  Color _getColor(ContentType type) {
    return switch (type) {
      ContentType.failure => Colors.red,
      ContentType.success => Colors.green,
    };
  }
}
