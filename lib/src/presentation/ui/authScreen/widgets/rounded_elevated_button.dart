import 'package:flutter/material.dart';
import 'package:zomato/src/core/utility/styles.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              buttontxt,
              style:  AppStyle.mediumTextStyle(size: 18,color: Colors.white),
            ),
          )),
    );
  }
}
