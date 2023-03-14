import 'package:flutter/material.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget(
      {Key? key, required this.fontSize, required this.message})
      : super(key: key);
  final double fontSize;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(
      message,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: fontSize,
          color: Colors.grey[500]!),
    );
  }
}
