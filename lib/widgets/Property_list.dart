import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/config/custom_fonts.dart';

// class FavoriteController extends GetxController {
//   var isFavorite = false.obs;

//   void toggleFavorite() {
//     isFavorite.value = !isFavorite.value;
//   }
// }

class Property extends StatelessWidget {
  final String imagePath;
  final String flatName;
  final String address;
  final String bedroom;
  final String livingRoom;
  final String bathroom;
  final String price;
  final VoidCallback onTap;
  final double height;
  final double width;
  // final VoidCallback onFavoriteTap;
  //final String id; // Callback for favorite button tap

  const Property({
    super.key,
    required this.imagePath,
    required this.flatName,
    required this.address,
    required this.bedroom,
    required this.livingRoom,
    required this.bathroom,
    required this.price,
    required this.onTap,
    required this.height,
    required this.width,
    // required this.onFavoriteTap,
    // required this.id // Add the onFavoriteTap callback
  });

  @override
  Widget build(BuildContext context) {
    Uint8List _decodeImage(String base64String) {
      return base64Decode(base64String);
    }

    // final FavoriteController favoriteController =
    //     Get.put(FavoriteController(), tag: id);
    double parentHeight = height;
    double imageHeight = parentHeight * 0.5;
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: parentHeight,
        width: width, //MediaQuery.of(context).size.width * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      height: imageHeight,
                      width: double.infinity,
                      child: Image.memory(
                        _decodeImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 8,
                  //   right: 8,
                  //   child: GestureDetector(
                  //     onTap: favoriteController.toggleFavorite,
                  //     child: Obx(
                  //       () => Container(
                  //         decoration: BoxDecoration(
                  //           color: Colors.white.withOpacity(0.8),
                  //           shape: BoxShape.circle,
                  //         ),
                  //         padding: const EdgeInsets.all(8),
                  //         child: Icon(
                  //           favoriteController.isFavorite.value
                  //               ? Icons.favorite
                  //               : Icons.favorite_border,
                  //           color: favoriteController.isFavorite.value
                  //               ? Colors.red
                  //               : CustomColors.primaryIconBg,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: CustomDimens.spacerH),
              Flexible(
                  child: Text(
                flatName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: CustomFont.fontSemiBold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
              SizedBox(height: CustomDimens.spacerH),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined,
                      color: CustomColors.primaryIconBg),
                  Text(address,
                      style: const TextStyle(
                          color: CustomColors.primarySubText,
                          fontFamily: CustomFont.fontRegular)),
                ],
              ),
              SizedBox(height: CustomDimens.spacerH),
              Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.bed_outlined,
                            color: CustomColors.primaryIconBg),
                        Text(
                          bedroom,
                          style: const TextStyle(
                              fontFamily: CustomFont.fontSemiBold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.chair_outlined,
                            color: CustomColors.primaryIconBg),
                        Text(
                          livingRoom,
                          style: const TextStyle(
                              fontFamily: CustomFont.fontSemiBold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.bathtub_outlined,
                            color: CustomColors.primaryIconBg),
                        Text(
                          bathroom,
                          style: const TextStyle(
                              fontFamily: CustomFont.fontSemiBold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: CustomDimens.spacerH),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '₹$price',
                      style: const TextStyle(
                          fontFamily: CustomFont.fontMedium,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    const TextSpan(
                      text: '/month',
                      style: TextStyle(
                        fontFamily: CustomFont.fontRegular,
                        color: CustomColors.primarySubText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
