import 'package:flutter/material.dart';
import 'package:hyper_hyer_test/screens/home_screen.dart';

import '../custom_widgets/custom_app_bar.dart';
import '../custom_widgets/custom_bottom_navigation.dart';
import '../utilities/color_manager.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _pageIndex = 0;
  final GlobalKey<ScaffoldState> screenKey = GlobalKey<ScaffoldState>();
  final PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: screenKey,
      body: PageView(
        controller: controller,
        children: screens,
        onPageChanged: (_){
          _pageIndex=_;
          setState(() {});
        },
      ),
      appBar: const CustomAppBar(),
      backgroundColor: ColorManager.kPrimaryColor,
      bottomNavigationBar: CustomBottomNavigation(
        activeIndex: _pageIndex,
        onIconTap: (_) {
          _pageIndex = _;
          controller.jumpToPage(_pageIndex);
          setState(() {
          });
        },
      ),
    );
  }

  List<Widget> screens = <Widget>[
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
