import 'package:flutter/material.dart';

import '../utilities/color_manager.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.textColor,
    this.fontSize,this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? ColorManager.kTextColor,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
