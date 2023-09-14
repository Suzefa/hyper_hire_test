import 'package:flutter/material.dart';

import '../utilities/assets.dart';
import '../utilities/color_manager.dart';
import 'custom_text_widget.dart';

class LikeChip extends StatelessWidget {
  final String text;
  final Color? starColor;
  final Color? chipColor;
  final Color? chipBorderColor;
  final Color? texColor;
  final bool showStarIcon;

  const LikeChip({
    super.key,
    required this.text,
    this.starColor,
    this.showStarIcon = true,
    this.chipColor,
    this.texColor,
    this.chipBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: chipColor ?? ColorManager.kBlackColor,
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        border: Border.all(
          color: chipBorderColor ?? ColorManager.kLightTextColor.withOpacity(0.4),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Visibility(
            visible: showStarIcon,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 5.0,
              ),
              child: Image.asset(
                Assets.kStarIcon,
                color: starColor,
              ),
            ),
          ),
          CustomTextWidget(
            text: text,
            textColor: texColor,
            fontWeight: FontWeight.w500,
            fontSize: 17.5,
          ),
        ],
      ),
    );
  }
}
