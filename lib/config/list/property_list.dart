import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/widgets/Property_list.dart';

class PropertyList extends StatelessWidget {
  final RxList<dynamic> propertyData;
  final Function(String, String) onPropertySelected;
  const PropertyList(this.propertyData, this.onPropertySelected, {super.key});

  @override
  Widget build(BuildContext context) {
    final int itemCount = propertyData.length > 5 ? 5 : propertyData.length;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount, // Ensure to set the itemCount
      itemBuilder: (context, index) {
        final property = propertyData[index];
        final String propertyId = property['_id'];
        final String userId = property['userId'];

        return Column(
          children: [
            Property(
              //onFavoriteTap: (property),
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
            const SizedBox(width: 50),
          ],
        );
      },
    );
  }
}
