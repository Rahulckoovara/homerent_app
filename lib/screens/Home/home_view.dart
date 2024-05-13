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


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/common/custom_colors.dart';
import 'package:tappal_app/common/custom_dimens.dart';
import 'package:tappal_app/widgets/Property_list.dart';
import 'package:tappal_app/widgets/Selectable_button.dart';
import 'package:tappal_app/widgets/filter_button.dart';
import 'package:tappal_app/widgets/primary_button.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Default value for selected button

  List<String> buttonValues = ['All', 'Homes', 'PG'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 224, 224),
        body: Padding(
          padding: EdgeInsets.all(CustomDimens.commonPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Find Your dream ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black),
                    ),
                    TextSpan(
                      text: '\nproperty',
                      style: TextStyle(fontSize: 30, color: Colors.black),
                    ),
                  ],
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: const EdgeInsets.all(12.0),
                  hintText: 'Search for your dream property',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
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
                    onPressed: () {},
                    icon: Icons.filter_alt_outlined,
                  )
                ],
              ),
              // Text(
              //   'Selected Value: ${buttonValues[_selectedIndex]}',
              //   style: TextStyle(
              //     fontSize: 18,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Properties',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'See All',
                    style: TextStyle(fontSize: 15, color: CustomColors.primarySubText),
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
                        price: '3000'),
                    SizedBox(width: CustomDimens.spacerH),
                    Property(
                        imagePath: 'assets/flat2.jpg',
                        flatName: 'Park Avenue Apartment',
                        address: '84 kozhikode st usa',
                        bedroom: '3',
                        livingRoom: '2',
                        bathroom: '2',
                        price: '3000'),
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



