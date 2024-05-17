import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';

class Property extends StatelessWidget {
  final String imagePath;
  final String flatName;
  final String address;
  final String bedroom;
  final String livingRoom;
  final String bathroom;
  final String price;
  final VoidCallback onTap;
  final VoidCallback onFavoriteTap; // Callback for favorite button tap

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
    required this.onFavoriteTap, // Add the onFavoriteTap callback
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 320,
        width: MediaQuery.of(context).size.width * 0.6,
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
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      child: Image.asset(imagePath, fit: BoxFit.cover),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: onFavoriteTap, // Handle favorite button tap
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        padding: EdgeInsets.all(8),
                        child: Icon(
                          Icons.favorite_border,
                          color: CustomColors.primaryIconBg,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: CustomDimens.spacerH),
              Text(flatName, style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: CustomDimens.spacerH),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined, color: CustomColors.primaryIconBg),
                  Text(address, style: TextStyle(color: CustomColors.primarySubText)),
                ],
              ),
              SizedBox(height: CustomDimens.spacerH),
              Padding(
                padding: EdgeInsets.only(right: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.bed_outlined, color: CustomColors.primaryIconBg),
                        Text(bedroom),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.chair_outlined, color: CustomColors.primaryIconBg),
                        Text(livingRoom),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.bathtub_outlined, color: CustomColors.primaryIconBg),
                        Text(bathroom),
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
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    TextSpan(
                      text: '/month',
                      style: TextStyle(
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
