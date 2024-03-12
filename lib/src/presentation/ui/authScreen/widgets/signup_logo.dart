import 'package:flutter/material.dart';

class SignUpLogo extends StatelessWidget {
  final String imagePath;
  const SignUpLogo({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(imagePath),
      ),
    );
  }
}