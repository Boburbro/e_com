import 'package:flutter/material.dart';

class OrLine extends StatelessWidget {
  const OrLine({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Colors.grey[300]!;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Divider(
            color: color,
            thickness: 1.0,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          "OR",
          style: TextStyle(
            color: Colors.grey[600],
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Divider(
            color: color,
            thickness: 1.0,
          ),
        ),
      ],
    );
  }
}
