import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:good_say/pages/say_one/say_one_view.dart';
import 'package:good_say/pages/say_two/say_two_view.dart';

import '../../main.dart';
import 'say_tab_logic.dart';

class SayTabPage extends GetView<SayTabLogic> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          SayOnePage(),
          SayTwoPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navSayBars()),
    );
  }

  Widget _navSayBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,color: Colors.grey.withOpacity(0.5)),
          activeIcon:const Icon(Icons.home,color: Colors.black),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: Colors.grey.withOpacity(0.5)),
          activeIcon:const Icon(Icons.settings,color: Colors.black),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        controller.currentIndex.value = index;
        controller.pageController.jumpToPage(index);
      },
    );
  }
}
