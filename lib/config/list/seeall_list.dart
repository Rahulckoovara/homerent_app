import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/widgets/Property_list.dart';

class SeeAllList extends StatelessWidget {
  final RxList<dynamic> propertyData;
  final Function(String, String) onPropertySelected;
  const SeeAllList(this.propertyData, this.onPropertySelected, {super.key});

  @override
  Widget build(BuildContext context) {
    final reversedData = propertyData.reversed.toList();
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        mainAxisSpacing: 10, // Vertical spacing between rows
        crossAxisSpacing: 10, // Horizontal spacing between columns
        childAspectRatio:
            3 / 5, // Aspect ratio for each grid item (width/height)
      ),
      itemCount: propertyData.length,
      itemBuilder: (context, index) {
        final property = reversedData[index];
        final String propertyId = property['_id'];
        final String userId = property['userId'];
        return Column(
          children: [
            Property(
              // onFavoriteTap: (property),
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
