import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tappal_app/screens/profile/profile_logic.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(ProfileLogic());

    return Scaffold(
      appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Obx(
                    () => CircleAvatar(
                      backgroundImage: logic.imageBytes.value != null
                          ? MemoryImage(logic.imageBytes.value!)
                          : null,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
          title: Obx(
            () => Text(
              "Hi, ${logic.userName.value}",
              style: const TextStyle(color: Colors.black),
            ),
          )),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                logic.logout();
              },
              child: const Text("Logout"))
        ],
      ),
    );
  }
}
