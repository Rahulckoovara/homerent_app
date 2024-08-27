import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/OWNER/screens/landing/landing_logic.dart';
import 'package:tappal_app/config/custom_colors.dart';

class OwnerLandingView extends StatelessWidget {
  const OwnerLandingView({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(OwnerLandingLogic());
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
              backgroundColor: const Color.fromARGB(255, 202, 202, 202),
              selectedItemColor: CustomColors.primaryColor,
              currentIndex: logic.currentIndex.value,
              onTap: (index) {
                logic.changePage(index);
              },
              items: [
                const BottomNavigationBarItem(
                    icon: Icon(Icons.dashboard), label: 'Dashboard'),
                const BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'Profile'),
              ]),
        ));
  }
}
