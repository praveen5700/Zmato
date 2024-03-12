import 'package:country_calling_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class FlagAndDropDown extends StatelessWidget {
  final String flag;
  const FlagAndDropDown({
    super.key,
    required this.flag,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          flag,
          package: countryCodePackageName,
          width: 35,
        ),
        const Icon(
          Icons.arrow_drop_down_outlined,
          size: 28,
        ),
      ],
    );
  }
}