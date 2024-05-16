import 'package:flutter/material.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/widgets/Selectable_button.dart';
import 'package:tappal_app/widgets/primary_button.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double _value = 2000;
  final double _minValue = 1000;
  final double _maxValue = 10000;

  //bedrooms
  int _selectedIndexBedroom = 0;
  List<String> buttonValuesBedroom = ['Any', '1', '2', '3', '4+'];
  int _selectedIndexBathroom = 0;
  List<String> buttonValuesBathroom = ['Any', '1', '2', '3', '4+'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        centerTitle: true,
        backgroundColor: Colors.grey[200],
      ),
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Price Range'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Slider(
                                      value: _value,
                                      min: _minValue,
                                      max: _maxValue,
                                      divisions: ((_maxValue - _minValue) / 500).toInt(),
                                      onChanged: (double value) {
                                        setState(() {
                                          _value = (value / 500).round() * 500;
                                        });
                                      },
                                      activeColor: CustomColors.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('₹1000'),
                                  Text('$_value'),
                                  Text('₹10000'),
                                ],
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              //   child: Text('Selected Rate: ₹$_value'),
                              // ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: CustomDimens.spacerH),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        height: 130,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Bedrooms'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (int i = 0; i < buttonValuesBedroom.length; i++)
                                    SelectableButton(
                                      onPressed: () {
                                        setState(() {
                                          _selectedIndexBedroom = i;
                                        });
                                      },
                                      text: buttonValuesBedroom[i],
                                      isSelected: _selectedIndexBedroom == i,
                                      minimumSize: Size(10, 30),
                                    )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: CustomDimens.spacerH),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        height: 130,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Bathrooms'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (int i = 0; i < buttonValuesBathroom.length; i++)
                                    SelectableButton(
                                      onPressed: () {
                                        setState(() {
                                          _selectedIndexBathroom = i;
                                        });
                                      },
                                      text: buttonValuesBathroom[i],
                                      isSelected: _selectedIndexBathroom == i,
                                      minimumSize: Size(10, 30),
                                    )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: CustomDimens.spacerH),
                    ],
                  ),
                ),
                SizedBox(height: CustomDimens.spacerH),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: double.infinity,
                child: PrimaryButton(() {
                  // Your callback here
                }, 'Show Properties'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
