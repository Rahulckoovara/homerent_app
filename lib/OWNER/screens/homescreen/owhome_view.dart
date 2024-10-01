import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/OWNER/screens/addasset/owadd_asset_view.dart';
import 'package:tappal_app/OWNER/screens/myassets/myassets_view.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';

class OwnerHomeScreen extends StatelessWidget {
  const OwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColors.primaryColor.withOpacity(0.5),
        ),
        body: Padding(
          padding: EdgeInsets.all(CustomDimens.commonPadding),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.asset(
                    "assets/home_img.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: CustomDimens.spacerH,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(223, 238, 238, 1),
                  border: Border.all(
                      //color: CustomColors.menuBorder,
                      width: 0.1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: const Text("Register your asset"),
                  leading: const Icon(Icons.add_home_outlined),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  onTap: () {
                    Get.to(() => const AddAssetDetails());
                  },
                ),
              ),
              SizedBox(
                height: CustomDimens.spacerH,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(223, 238, 238, 1),
                  border: Border.all(
                      //color: CustomColors.menuBorder,
                      width: 0.1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ListTile(
                  title: const Text("Your Assets"),
                  leading: const Icon(Icons.home_work_outlined),
                  trailing: const Icon(Icons.keyboard_arrow_right_rounded),
                  onTap: () {
                    Get.to(() => const MyAssets());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
