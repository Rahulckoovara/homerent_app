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
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        child: Padding(
          padding: const EdgeInsets.all(
              16.0), // Adds space around the navigation bar
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.0), // Adds curved corners
            child: Obx(
              () => BottomNavigationBar(
                backgroundColor: Color.fromARGB(255, 200, 223, 215),
                selectedItemColor: CustomColors.primaryColor,
                unselectedItemColor: Color.fromARGB(
                    255, 81, 87, 85), // Define color for unselected items
                currentIndex: logic.currentIndex.value,
                onTap: (index) {
                  logic.changePage(index);
                },
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.dashboard), label: 'Dashboard'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: 'Profile'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
