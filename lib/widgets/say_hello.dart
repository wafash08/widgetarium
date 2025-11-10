import 'package:flutter/material.dart';

class SayHello extends StatelessWidget {
  const SayHello({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text('Hello, $name!');
  }
}
