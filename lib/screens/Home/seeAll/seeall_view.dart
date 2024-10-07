import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/config/list/property_list.dart';
import 'package:tappal_app/config/list/seeall_list.dart';
import 'package:tappal_app/screens/Home/seeAll/seeall_logic.dart';
import 'package:tappal_app/widgets/progressbar.dart';

class SeeAllPage extends StatelessWidget {
  const SeeAllPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SeeAllLogic());
    return Scaffold(
        appBar: AppBar(
          title: const Text('All Assets'),
        ),
        body: Obx(() => logic.isLoading.value
            ? const Center(child: Progressbar())
            : SeeAllList(logic.propertyData,
                (String userId, String propertyId) {
                logic.gotoHomeDetails(userId, propertyId);
              })));
  }
}
