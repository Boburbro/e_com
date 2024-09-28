import 'package:flutter/material.dart';

class HomeCategoryTitle extends StatelessWidget {
  const HomeCategoryTitle({
    required this.firstTitle,
    required this.secondTitle,
    super.key,
  });

  final String firstTitle, secondTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          firstTitle,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          secondTitle,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
