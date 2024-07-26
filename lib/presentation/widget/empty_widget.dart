import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final String message;
  final double iconSize;
  final double fontSize;

  const EmptyWidget(
      {super.key, required this.message, this.iconSize = 64.0, this.fontSize = 16.0});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.insert_drive_file, size: iconSize, color: Colors.black45),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black45, fontSize: fontSize),
            ),
          )
        ],
      ),
    );
  }
}