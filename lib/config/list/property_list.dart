import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/widgets/Property_list.dart';

class PropertyList extends StatelessWidget {
  final RxList<dynamic> propertyData;
  final Function(String, String) onPropertySelected;
  const PropertyList(this.propertyData, this.onPropertySelected, {super.key});

  @override
  Widget build(BuildContext context) {
    final reversedData = propertyData.reversed.toList();
    final int itemCount = reversedData.length > 5 ? 5 : reversedData.length;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final property = reversedData[index]; // use for reversing the data
        final String propertyId = property['_id'];
        final String userId = property['userId'];

        return Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 8.0), // Add horizontal space between items
          child: Column(
            children: [
              Property(
                imagePath: property['thumbimage'],
                flatName: property['assetname'],
                address: property['location'],
                bedroom: property['bedrooms'].toString(),
                livingRoom: property['commonHall'].toString(),
                bathroom: property['bathroom'].toString(),
                price: property['price'].toString(),
                onTap: () {
                  onPropertySelected(userId, propertyId);
                },
                height: 330,
                width: MediaQuery.of(context).size.width * 0.6,
              ),
            ],
          ),
        );
      },
    );
  }
}
