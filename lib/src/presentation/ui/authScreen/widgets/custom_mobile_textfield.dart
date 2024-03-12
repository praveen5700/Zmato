import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String callingCode;
  final String? hintText;
  final String? Function(String?)? validator;
  final double borderRadius;
  final Color focusedBorderColor;
  final Color outlineBorderColor;

  const CustomTextField({
  super.key, 
  required this.controller,  
  required this.callingCode, 
  this.hintText, 
  this.validator,
  this.borderRadius = 10.0,
  this.focusedBorderColor = Colors.grey,
  this.outlineBorderColor = Colors.black,
  
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        prefix: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Text(
            widget.callingCode,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        hintText: widget.hintText,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
      ),
      validator: widget.validator,
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
