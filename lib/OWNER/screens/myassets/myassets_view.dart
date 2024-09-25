import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/OWNER/list/myasset_list.dart';
import 'package:tappal_app/OWNER/screens/myassets/myassets_logic.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/widgets/progressbar.dart';

class MyAssets extends StatelessWidget {
  const MyAssets({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(MyAssetsLogic());
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Assets"),
        ),
        body: Obx(() {
          return logic.isLoading.value
              ? const Center(
                  child: Progressbar(),
                )
              : Padding(
                  padding: EdgeInsets.all(CustomDimens.commonPadding),
                  child: Container(
                    child: MyAssetList(
                      logic.assetData,
                      onTap: (id) {
                        logic.gotoHomeDetails(id);
                      },
                    ),
                  ),
                );
        }));
  }
}
