import 'dart:async';

import 'package:flutter/material.dart';

import '../models/data_models.dart';
import '../story_view/story_view.dart';
import '../utilities/assets.dart';
import '../utilities/color_manager.dart';
import 'custom_text_widget.dart';
import 'like_chip.dart';

class StoryViewer extends StatefulWidget {
  final DataModels storyData;
  const StoryViewer({super.key, required this.storyData,});

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer> {
  final StoryController _controller = StoryController();
  final StreamController<int> _currentIndex = StreamController.broadcast();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        20.0,
      ),
      child: Stack(
        children: [
          StoryView(
            indicatorColor: ColorManager.kPrimaryColor,
            indicatorForegroundColor: ColorManager.kPinkAlternativeColor,
            currentStoryIndex: (_) {
              _currentIndex.add(_);
            },
            storyItems: [
              for(String url in widget.storyData.images)
                StoryItem.pageImage(
                  url: url,
                  controller: _controller,
                  imageFit: BoxFit.cover,
                ),
            ],
            controller: _controller,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: const Alignment(0.0, -1),
                  begin: const Alignment(0.0, 0.4),
                  colors: <Color>[
                    const Color(0x8A000000),
                    Colors.black12.withOpacity(0.0)
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LikeChip(
                            text: "${widget.storyData.likeCount}",
                            starColor: Colors.grey.shade900,
                          ),
                          CustomTextWidget(
                            text: "${widget.storyData.name} : ${widget.storyData.age}",
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                          StreamBuilder(
                            stream: _currentIndex.stream,
                            initialData: 0,
                            builder: (context, snapShot) {
                              if (snapShot.data == 0) {
                                return CustomTextWidget(
                                  text: widget.storyData.location,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400,
                                );
                              } else if (snapShot.data == 1) {
                                return SizedBox(
                                  width: MediaQuery.sizeOf(context).width - 130,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    alignment: Alignment.centerLeft,
                                    child: CustomTextWidget(
                                      text:widget.storyData.description,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              } else if (snapShot.data == 2 ||
                                  snapShot.data! > 2) {
                                return SizedBox(
                                  width: MediaQuery.sizeOf(context).width - 130,
                                  child: FittedBox(
                                    child: Wrap(
                                      alignment: WrapAlignment.start,
                                      spacing: 2.0,
                                      runSpacing: 2.0,
                                      children: [
                                        for(String result in widget.storyData.tags)
                                          LikeChip(
                                            text: result,
                                            showStarIcon: false,
                                            chipColor: ColorManager.kChipAlternativeColor,
                                            texColor: ColorManager.kPinkColor,
                                            chipBorderColor: ColorManager.kPinkColor,
                                          ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ],
                      ),
                      const Spacer(),
                      Image.asset(
                        Assets.kHeartIcon,
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: ColorManager.kTextColor,
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
  void dispose() {
    _controller.dispose();
    _currentIndex.close();
    super.dispose();
  }
}
