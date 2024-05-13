import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tappal_app/common/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';

class Property extends StatelessWidget {
  final String imagePath;
  final String flatName;
  final String address;
  final String bedroom;
  final String livingRoom;
  final String bathroom;
  final String price;
  const Property({super.key,
   required this.imagePath,
    required this.flatName, 
    required this.address, 
    required this.bedroom,
    required this.livingRoom,
    required this.bathroom,
    required this.price});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('tapped');
      },
      child: Container(
        height: 320,
        width: MediaQuery.of(context).size.width*0.6,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20), 
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: Container(
                 
                  height: 150,
                  width: double.infinity,
                  child: Image.asset(imagePath),
                ),
              ),
             SizedBox(height: CustomDimens.spacerH ),
      
              Text(flatName,style: TextStyle(fontWeight: FontWeight.bold), ),
              SizedBox(height: CustomDimens.spacerH ),
              Row(
                children: [
                  const Icon(Icons.location_on_outlined,
                  color: CustomColors.primaryIconBg),
                  Text(address,style: TextStyle(color: CustomColors.primarySubText), ),
                ],
              ),
              SizedBox(height: CustomDimens.spacerH ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.bedroom_parent_outlined,
                      color:CustomColors.primaryIconBg),
                      Text(bedroom, ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.living_outlined,
                      color:CustomColors.primaryIconBg),
                      Text(livingRoom, ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.bathroom_outlined,
                      color: CustomColors.primaryIconBg),
                      Text(bathroom, ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: CustomDimens.spacerH ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '₹$price',
                      style: TextStyle(fontWeight: FontWeight.bold,
                      color: Colors.black),
                    ),
                    TextSpan(
                      text: '/month',
                      style: TextStyle(
                        color: CustomColors.primarySubText, // Change the color of the "month" text
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
