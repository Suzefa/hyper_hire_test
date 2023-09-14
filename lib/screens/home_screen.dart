import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hyper_hyer_test/custom_widgets/custom_text_widget.dart';
import 'package:hyper_hyer_test/custom_widgets/story_viewer.dart';
import 'package:hyper_hyer_test/models/data_models.dart';
import 'package:hyper_hyer_test/utilities/color_manager.dart';
import 'package:hyper_hyer_test/utilities/const_text.dart';
import 'package:hyper_hyer_test/web_service/firebase_rtdb_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseRTDBService _service = FirebaseRTDBService();
  List<DataModels> data = <DataModels>[];

  @override
  void initState() {
    super.initState();
    getDataModels();
  }

  void getDataModels() async {
    data = await _service.getRecords();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 10.0,
      ),
      child: Builder(
        builder: (context) {
          if (data.isEmpty) {
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: CustomTextWidget(
                    text: ConstText.kHomeScreenEmptyStateHanding,
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                  ),
                ),
                CustomTextWidget(
                  text: ConstText.kHomeScreenEmptyStateSubHanding,
                  fontSize: 16.0,
                  textColor: ColorManager.kLightTextColor,
                ),
              ],
            );
          }
          return CarouselSlider(
            options: CarouselOptions(
              height: double.infinity,
              viewportFraction: 0.97,
              autoPlay: false,
              enlargeCenterPage: true,
            ),
            items: data.map((item) {
              return Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Builder(
                  builder: (BuildContext context) {
                    return StoryViewer(storyData: item,);
                  },
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
