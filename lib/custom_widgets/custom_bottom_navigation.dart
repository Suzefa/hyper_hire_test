import 'package:flutter/material.dart';
import '../utilities/const_text.dart';
import '../utilities/assets.dart';
import '../utilities/color_manager.dart';
import 'custom_text_widget.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int activeIndex;
  final ValueChanged<int>? onIconTap;
  final VoidCallback? onFavTap;

  const CustomBottomNavigation({
    super.key,
    this.activeIndex = 0,
    this.onIconTap,
    this.onFavTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Stack(
        children: [
          Positioned(
            bottom: 0.0,
            child: Container(
              height: 100.0,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: ColorManager.kLightTextColor,
                  width: 0.2
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          if(onIconTap!=null) {
                            onIconTap!(0);
                          }
                        },
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              Assets.kHomeIcons,
                              color: activeIndex == 0
                                  ? null
                                  : ColorManager.kLightTextColor,
                            ),
                            CustomTextWidget(
                              text: ConstText.kHomeIconText,
                              textColor: activeIndex == 0
                                  ? ColorManager.kPinkColor
                                  : ColorManager.kLightTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          if(onIconTap!=null) {
                            onIconTap!(1);
                          }
                        },
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              Assets.kNearbyIcons,
                              color: activeIndex == 1
                                  ? ColorManager.kPinkColor
                                  : ColorManager.kLightTextColor,
                            ),
                            CustomTextWidget(
                              text: ConstText.kNearbyIconText,
                              textColor: activeIndex == 1
                                  ? ColorManager.kPinkColor
                                  : ColorManager.kLightTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),


                    Expanded(
                      flex: 2,
                      child: Container(),
                    ),


                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          if(onIconTap!=null) {
                            onIconTap!(2);
                          }
                        },
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              Assets.kChatIcon,
                              color: activeIndex == 2
                                  ? ColorManager.kPinkColor
                                  : ColorManager.kLightTextColor,
                            ),
                            CustomTextWidget(
                              text: ConstText.kChatIconText,
                              textColor: activeIndex == 2
                                  ? ColorManager.kPinkColor
                                  : ColorManager.kLightTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                          if(onIconTap!=null) {
                            onIconTap!(3);
                          }
                        },
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              Assets.kProfileIcon,
                              color: activeIndex == 3
                                  ? ColorManager.kPinkColor
                                  : ColorManager.kLightTextColor,
                            ),
                            CustomTextWidget(
                              text: ConstText.kProfileIconText,
                              textColor: activeIndex == 3
                                  ? ColorManager.kPinkColor
                                  : ColorManager.kLightTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            child: GestureDetector(
              onTap: (){
                if(onFavTap==null){
                  return;
                }
                onFavTap!();
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade900,
                    border: Border.all(
                      color: ColorManager.kPrimaryColor,
                      width: 1.5,
                    ),
                    boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade900,
                      offset: const Offset(0.2, -0.2),
                      spreadRadius: 2.0,
                    ),
                  ]
                ),
                height: 70,
                width: MediaQuery.sizeOf(context).width,
                alignment: Alignment.center,
                child: Image.asset(
                  Assets.kStarIcon,
                  height: 20.0,
                  width: 20.0,
                  fit: BoxFit.fill,
                  color: ColorManager.kBlackColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
