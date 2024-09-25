import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/config/custom_fonts.dart';
import 'package:tappal_app/panorama/panorama_view.dart';
import 'package:tappal_app/screens/filter/filter_view.dart';
import 'package:tappal_app/screens/home_details/home_details_view.dart';
import 'package:tappal_app/widgets/Property_list.dart';
import 'package:tappal_app/widgets/Selectable_button.dart';
import 'package:tappal_app/widgets/Text_input.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(CustomDimens.commonPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              // carousel.CarouselSlider(
              //   options: carousel.CarouselOptions(
              //     height: 150.0,
              //     enlargeCenterPage: true,
              //     autoPlay: true,
              //     aspectRatio: 16 / 9,
              //     autoPlayCurve: Curves.easeOutCubic,
              //     enableInfiniteScroll: true,
              //     autoPlayAnimationDuration: Duration(milliseconds: 800),
              //     viewportFraction: 0.8,
              //     onPageChanged: (index, reason) {
              //       setState(() {
              //         _current = index;
              //       });
              //     },
              //   ),
              //   items: imgList
              //       .map((item) => Container(
              //             child: Center(
              //                 child: Image.network(item,
              //                     fit: BoxFit.cover, width: 800)),
              //           ))
              //       .toList(),
              // ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[300]),

                //color: Colors.grey[900],
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Properties',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: CustomFont.fontSemiBold),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                        fontFamily: CustomFont.fontMedium,
                        fontSize: 15,
                        color: CustomColors.primarySubText),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Property(
                      imagePath: 'assets/flat1.jpg',
                      flatName: 'Park Avenue Apartment',
                      address: '84 kozhikode st usa',
                      bedroom: '3',
                      livingRoom: '2',
                      bathroom: '2',
                      price: '3000',
                      id: 'id1',
                      onFavoriteTap: () {},
                      onTap: () {
                        Get.to(HomeDetails());
                      },
                    ),
                    SizedBox(width: CustomDimens.spacerH),
                    Property(
                        imagePath: 'assets/flat2.jpg',
                        flatName: 'Park Avenue Apartment',
                        address: '84 kozhikode st usa',
                        bedroom: '3',
                        livingRoom: '2',
                        bathroom: '2',
                        price: '3000',
                        id: 'id2',
                        onFavoriteTap: () {},
                        onTap: () {
                          Get.to(const Panorama());
                        }),
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
// import 'package:flutter/material.dart';

// class ButtonPage extends StatefulWidget {
//   @override
//   _ButtonPageState createState() => _ButtonPageState();
// }

// class _ButtonPageState extends State<ButtonPage> {
//   int _selectedIndex = -1; // Default value for no selection
//   List<String> buttonValues = ['Button 1', 'Button 2', 'Button 3'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Button Page'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Column(
//             children: buttonValues
//                 .asMap()
//                 .entries
//                 .map(
//                   (entry) => Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         setState(() {
//                           // Update the selected index
//                           _selectedIndex = entry.key;
//                         });
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: _selectedIndex == entry.key
//                             ? Color.fromARGB(255, 4, 85, 92) // Change color of selected button
//                             : Colors.white,
//                       ),
//                       child: Text(entry.value),
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//           SizedBox(height: 20), // Add spacing between buttons and selected value
//           _selectedIndex != -1
//               ? Text(
//                   'Selected Value: ${buttonValues[_selectedIndex]}',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 )
//               : SizedBox(), // Display nothing if no button is selected
//         ],
//       ),
//     );
//   }
// }