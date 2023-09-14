import 'package:flutter/material.dart';

import '../utilities/assets.dart';
import '../utilities/color_manager.dart';
import '../utilities/const_text.dart';
import 'custom_text_widget.dart';
import 'like_chip.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 50.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 5.0,
            ),
            child: Image.asset(
              Assets.kLocationIcon,
            ),
          ),
          const Expanded(
            child: FittedBox(
              child: Row(
                children: [
                  CustomTextWidget(
                    text: ConstText.kAppBarText,
                    fontWeight: FontWeight.w500,
                    fontSize: 17.5,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: LikeChip(
                      text: "323,230",
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 5.0,
            ),
            child: SizedBox(
              height: 28,
              width: 28,
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      Assets.kNotificationIcon,
                      color: ColorManager.kTextColor,
                    ),
                  ),
                  const Positioned(
                    right: 0,
                    top: 0,
                    child: Icon(
                      Icons.circle,
                      color: ColorManager.kRedColor,
                      size: 8.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
