import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/screens/Home/landing/landing_logic.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(LandingLogic());
    return Scaffold(
        body: SafeArea(
          child: Obx(
            () => IndexedStack(
              index: logic.currentIndex.value,
              children: logic.pages,
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              backgroundColor: Color.fromARGB(255, 202, 202, 202),
              selectedItemColor: CustomColors.primaryColor,
              currentIndex: logic.currentIndex.value,
              onTap: (index) {
                logic.changePage(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.favorite,
                    ),
                    label: 'Favorites'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ]),
        ));
  }
}
