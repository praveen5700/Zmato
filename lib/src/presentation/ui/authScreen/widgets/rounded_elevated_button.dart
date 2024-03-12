import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final double width;
  final String buttontxt;
  final Color color;
  final VoidCallback? onpressed;
  final double borderRadius;
  const RoundedButton(
      {super.key,
      this.buttontxt = "Continue",
      this.color = const Color(0xFFE23744),
      required this.width,
      this.onpressed,
      this.borderRadius = 10.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                color,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              )),
          onPressed: onpressed,
          child: Text(
            buttontxt,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          )),
    );
  }
}
