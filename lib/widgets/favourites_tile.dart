import 'package:flutter/material.dart';
import 'package:tappal_app/config/custom_dia.dart';

class CustomListTile extends StatelessWidget {
  final String leadingImageUrl;
  final String title;
  final String subtitle;
  final int bedCount;
  final int sofaCount;
  final int bathroomCount;

  CustomListTile({
    required this.leadingImageUrl,
    required this.title,
    required this.subtitle,
    required this.bedCount,
    required this.sofaCount,
    required this.bathroomCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100, // Adjust width as needed
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 143, 54, 54),
                borderRadius: BorderRadius.circular(
                  10,
                ), // Border radius for the leading area
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  leadingImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '\₹' + title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                      Text('/mon')
                    ],
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  SizedBox(height: CustomDimens.spacerH),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.king_bed),
                      Text('$bedCount'),
                      SizedBox(width: 15),
                      Icon(Icons.weekend),
                      Text('$sofaCount'),
                      SizedBox(width: 15),
                      Icon(Icons.bathtub),
                      Text('$bathroomCount'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
