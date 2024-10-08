import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/OWNER/screens/Messages/message._logic.dart';
import 'package:tappal_app/OWNER/screens/owprofile/owprofile_logic.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/widgets/progressbar.dart';

class OwnerProfilePage extends StatelessWidget {
  const OwnerProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(OwnerProfileLogic());
    return Scaffold(
        body: Obx(
      () => logic.isLoading.value
          ? const Center(child: Progressbar())
          : Column(
              children: [
                // Curved Header with Profile Picture
                Stack(
                  children: [
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.green, CustomColors.primaryColor],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Obx(
                            () => CircleAvatar(
                              radius: 50,
                              backgroundImage: logic.imageBytes.value != null
                                  ? MemoryImage(logic.imageBytes.value!)
                                  : null,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Obx(
                            () => Text(
                              logic.userName.value,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Text(
                            'House Owner',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Profile Options
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      ProfileOption(
                        icon: Icons.edit,
                        label: 'Edit Profile',
                        onTap: () {
                          // Handle tap
                        },
                      ),
                      ProfileOption(
                        icon: Icons.message,
                        label: 'Messages',
                        onTap: () {
                          Get.to(() => MessagePage());
                          // Handle tap
                        },
                      ),
                      ProfileOption(
                        icon: Icons.settings,
                        label: 'Settings',
                        onTap: () {
                          // Handle tap
                        },
                      ),
                      ProfileOption(
                        icon: Icons.logout,
                        label: 'Logout',
                        onTap: () {
                          logic.logout();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
    ));
  }
}

// Profile Option Widget
class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Widget? trailing;

  const ProfileOption({
    required this.icon,
    required this.label,
    required this.onTap,
    this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(label, style: const TextStyle(fontSize: 16)),
      trailing: trailing,
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
    );
  }
}
