import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tappal_app/OWNER/screens/addasset/owadd_asset_logic.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/config/custom_fonts.dart';
import 'package:tappal_app/widgets/Text_input.dart';
import 'package:tappal_app/widgets/customdropdown.dart';
import 'package:tappal_app/widgets/image_uploader.dart';
import 'package:tappal_app/widgets/primary_button.dart';

class AddAssetDetails extends StatelessWidget {
  const AddAssetDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(OwnerHomePageLogic());

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(CustomDimens.commonPadding),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Unveil your Asset",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: CustomFont.fontBold,
                      color: Colors.black),
                ),
                SizedBox(height: CustomDimens.spacerH),
                Obx(
                  () => TextInput(
                    //keyboardType: TextInputType.s,
                    "Asset Name",
                    "Enter your asset name",
                    null,
                    false,
                    (value) {
                      logic.assetName(value);
                    },
                    errorText: logic.assetNameError.value,
                  ),
                ),
                SizedBox(height: CustomDimens.spacerH),
                Obx(
                  () => TextInput(
                    "Location",
                    "Enter your location",
                    null,
                    false,
                    (val) {
                      logic.assetLocation(val);
                    },
                    maxLength: 15,
                    errorText: logic.assetLocationError.value,
                  ),
                ),
                SizedBox(height: CustomDimens.spacerH),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 120,
                        child: Obx(
                          () => CustomDropdownMenu(
                            labelText: "Bedroom",
                            items: List.from(logic.bedroomCount),
                            onItemSelection: (id) {
                              print(id);
                              logic.bedroomCountId = id;
                            },
                            errorText: logic.bedroomError.value,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: CustomDimens.spacerH),
                    Expanded(
                      child: Container(
                        height: 120,
                        child: Obx(
                          () => CustomDropdownMenu(
                            labelText: "Common",
                            items: List.from(logic.commonCount),
                            onItemSelection: (id) {
                              print(id);
                              logic.commonCountId = id;
                            },
                            errorText: logic.commonError.value,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: CustomDimens.spacerH),
                    Expanded(
                      child: Obx(
                        () => Container(
                          height: 120,
                          child: CustomDropdownMenu(
                            labelText: "Bathroom",
                            items: List.from(logic.bathroomCount),
                            onItemSelection: (id) {
                              logic.bathroomCountId = id;
                            },
                            errorText: logic.bathroomError.value,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: CustomDimens.spacerH),
                Obx(
                  () => TextInput(
                    "Description",
                    "Describe your home",
                    null,
                    false,
                    (val) {
                      logic.assetDescription(val);
                    },
                    errorText: logic.assetDescriptionError.value,
                    maxlines: 3,
                  ),
                ),
                SizedBox(height: CustomDimens.spacerH),
                Obx(
                  () => TextInput(
                    "Price",
                    "Enter your price",
                    null,
                    false,
                    (val) {
                      logic.price(val);
                    },
                    keyboardType: TextInputType.number,
                    errorText: logic.priceError.value,
                  ),
                ),
                SizedBox(height: CustomDimens.spacerH),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upload Thumbnail",
                      style: TextStyle(
                          fontFamily: CustomFont.fontSemiBold,
                          fontSize: CustomDimens.txtHintFont,
                          color: CustomColors.txtHint),
                    ),
                    SizedBox(height: CustomDimens.spacerH),
                    Obx(
                      () => ImageUpload(
                        () {
                          logic.uploadFile();
                        },
                        backgroundImage: logic.base64ImagesT.isNotEmpty
                            ? MemoryImage(
                                base64Decode(logic.base64ImagesT.last),
                              )
                            : null,
                      ),
                    ),
                    SizedBox(height: CustomDimens.spacerH),
                    Text(
                      "Upload Gallery Images",
                      style: TextStyle(
                          fontFamily: CustomFont.fontSemiBold,
                          fontSize: CustomDimens.txtHintFont,
                          color: CustomColors.txtHint),
                    ),
                    SizedBox(height: CustomDimens.spacerH),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(
                          () => ImageUpload(
                            () {
                              logic.uploadFileG(0);
                            },
                            backgroundImage: logic.base64ImagesG.isNotEmpty &&
                                    logic.base64ImagesG[0].isNotEmpty
                                ? MemoryImage(
                                    base64Decode(logic.base64ImagesG[0].last))
                                : null,
                          ),
                        ),
                        SizedBox(width: CustomDimens.spacerH),
                        Obx(() => ImageUpload(
                              () {
                                logic.uploadFileG(1);
                              },
                              backgroundImage: logic.base64ImagesG.isNotEmpty &&
                                      logic.base64ImagesG[1].isNotEmpty
                                  ? MemoryImage(
                                      base64Decode(logic.base64ImagesG[1].last),
                                    )
                                  : null,
                            )),
                        SizedBox(width: CustomDimens.spacerH),
                        Obx(() => ImageUpload(
                              () {
                                logic.uploadFileG(2);
                              },
                              backgroundImage: logic.base64ImagesG.isNotEmpty &&
                                      logic.base64ImagesG[2].isNotEmpty
                                  ? MemoryImage(
                                      base64Decode(logic.base64ImagesG[2].last),
                                    )
                                  : null,
                            )),
                      ],
                    ),
                    SizedBox(height: CustomDimens.spacerH),
                    Obx(
                      () => TextInput(
                        "Contact Number",
                        "Add your contact number",
                        null,
                        false,
                        (val) {
                          logic.contact(val);
                        },
                        errorText: logic.contactError.value,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                        width: double.infinity,
                        child: PrimaryButton(() {
                          logic.submit();
                        }, "Upload Asset"))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
