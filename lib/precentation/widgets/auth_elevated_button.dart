import 'package:flutter/material.dart';

class AuthElevatedButton extends StatelessWidget {
  const AuthElevatedButton({
    required this.imagePath,
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String imagePath;
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imagePath,
              width: 26,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
