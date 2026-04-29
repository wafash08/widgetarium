import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: -40,
          bottom: -40,
          child: SizedBox.square(
            dimension: 200,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.blue.withAlpha(64),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Positioned(
          top: -20,
          right: -20,
          child: SizedBox.square(
            dimension: 96,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.amber.withAlpha(64),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),

        // content
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 16,
                  top: 6,
                  right: 12,
                  bottom: 6,
                ),
                decoration: BoxDecoration(color: Colors.white.withAlpha(128)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.watch_rounded),
                          Text('Konfirmasi'),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close_rounded),
                    ),
                  ],
                ),
              ),
              Text('bfjkajkfjkafjkafjka'),
              Text('bfjkajkfjkafjkafjka'),
              Text('bfjkajkfjkafjkafjka'),
              Text('bfjkajkfjkafjkafjka'),
              Text('bfjkajkfjkafjkafjka'),
            ],
          ),
        ),
      ],
    );
  }
}
