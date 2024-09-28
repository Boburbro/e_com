import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    required this.icon,
    required this.lableText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    super.key,
  });

  final IconData icon;
  final String lableText;

  final FormFieldValidator<String>? validator;

  final TextEditingController? controller;

  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue[800]!,
            ),
          ),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.grey,
              ),
              const SizedBox(width: 5),
              Text(
                lableText,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText,
      ),
    );
  }
}
