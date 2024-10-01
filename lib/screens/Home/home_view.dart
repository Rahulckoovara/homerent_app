import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/config/custom_fonts.dart';
import 'package:tappal_app/config/list/property_list.dart';
import 'package:tappal_app/screens/Home/home_logic.dart';
import 'package:tappal_app/screens/Home/seeAll/seeall_view.dart';
import 'package:tappal_app/screens/filter/filter_view.dart';
import 'package:tappal_app/widgets/Selectable_button.dart';
import 'package:tappal_app/widgets/filter_button.dart';
// import 'package:carousel_slider/carousel_slider.dart ' as carousel;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<String> buttonValues = ['All', 'Homes', 'PG'];
  final List<String> imgList = [
    'https://th.bing.com/th?id=OIP.EJVVN8C6-3mc5bhO0IXqhwHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',
    'https://th.bing.com/th?id=OIP.iE7mcw3w2aFFDhXP9A1lggHaE8&w=305&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',
    'https://th.bing.com/th?id=OIP.ckg9D6vQqA2BS52933zcLwHaE8&w=306&h=204&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2',
  ];

  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomeLogic());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(CustomDimens.commonPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start, // Align to start
            children: [
              // Title Text
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: 'Find Your dream ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: CustomFont.fontBold,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: '\nproperty',
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: CustomFont.fontBold,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  height: 20), // Add spacing between text and filter buttons
              // Filter Buttons
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[300],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      for (int i = 0; i < buttonValues.length; i++)
                        SelectableButton(
                          onPressed: () {
                            setState(() {
                              _selectedIndex = i;
                            });
                          },
                          text: buttonValues[i],
                          isSelected: _selectedIndex == i,
                        ),
                      FilterButton(
                        onPressed: () {
                          Get.to(const FilterPage());
                        },
                        icon: Icons.filter_alt_outlined,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                  height: 20), // Add spacing between filter and title
              // Properties Title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Properties',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: CustomFont.fontSemiBold),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.to(SeeAllPage());
                      }
                      // Get.to(const FilterPage());
                      ,
                      child: Text('See All',
                          style: TextStyle(
                              fontFamily: CustomFont.fontMedium,
                              fontSize: 15,
                              color: CustomColors.primarySubText))),
                ],
              ),
              const SizedBox(
                  height: 10), // Add spacing between title and property list
              Flexible(
                fit: FlexFit
                    .loose, // Allows the list to grow as needed without forcing expansion
                child: PropertyList(
                  logic.propertyData,
                  (String userId, String propertyId) {
                    logic.gotoHomeDetails(userId, propertyId);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
