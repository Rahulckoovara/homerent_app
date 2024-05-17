import 'package:flutter/material.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/config/custom_fonts.dart';
import 'package:tappal_app/widgets/primary_button.dart';

class HomeDetails extends StatelessWidget {
  HomeDetails({Key? key}) : super(key: key);
  final List<String> imageUrls = [
    'https://images.pexels.com/photos/1571460/pexels-photo-1571460.jpeg?cs=srgb&dl=interior-design-of-a-house-1571460.jpg&fm=jpg',
    'https://th.bing.com/th/id/R.bf8dc5c2d69ed657cd312f35bb27f0d4?rik=K4xTfkI7Tw8iYg&riu=http%3a%2f%2fdecoholic.org%2fwp-content%2fuploads%2f2013%2f03%2famazing-2-house-interior-design.jpg&ehk=RhHkqguWKBvhMsE51Iifxv1x0miEnaL33TpXAJjkA34%3d&risl=&pid=ImgRaw&r=0',
    'https://hoomdecoration.com/wp-content/uploads/2020/01/Amazing-Modern-Home-Interior-Design-Ideas-24.jpg',
    'https://hoomdecoration.com/wp-content/uploads/2020/01/Amazing-Modern-Home-Interior-Design-Ideas-08.jpg',
    'https://th.bing.com/th/id/OIP.ZM0Lz05dBy2NwgTuFs0Z2wHaFX?rs=1&pid=ImgDetMain',
    'https://th.bing.com/th/id/OIP.0a2TAV6PkgM9yISqbBLEgAHaE8?rs=1&pid=ImgDetMain'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(CustomDimens.commonPadding),
        child: SafeArea(
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                    child: Image.network(
                      'https://th.bing.com/th/id/OIP.DOb51Hz06N1fxw1FK0pjtAAAAA?rs=1&pid=ImgDetMain',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(height: CustomDimens.spacerH),
                  Text(
                    "Flat Name",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold,fontFamily: CustomFont.fontBold),
                  ),
                  SizedBox(height: CustomDimens.spacerH),
                  Row(
                    children: [
                      Icon(Icons.location_pin),
                      Text(
                        ' 84 Kozhikode,678456',
                        style: TextStyle(color: Colors.blueGrey,fontFamily: CustomFont.fontSemiBold),
                      ),
                    ],
                  ),
                  SizedBox(height: CustomDimens.spacerH),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Facilities",
                        style: TextStyle(fontFamily: CustomFont.fontSemiBold,
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "₹30000",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: CustomFont.fontSemiBold,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                              text: '/Mon',
                              style: TextStyle(
                                fontFamily: CustomFont.fontRegular,
                                  fontSize: 17, color: Colors.blueGrey)),
                        ]),
                      )
                    ],
                  ),
                  SizedBox(height: CustomDimens.spacer2H),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.bed_rounded,
                        color: CustomColors.primaryColor,
                      ),
                      Text(
                        '2 Bed ',
                        style: TextStyle(fontFamily: CustomFont.fontMedium,
                            color: Color.fromARGB(255, 114, 114, 114)),
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.weekend_outlined,
                        color: CustomColors.primaryColor,
                      ),
                      Text(
                        '3 Common',
                        style: TextStyle(fontFamily: CustomFont.fontMedium,
                            color: Color.fromARGB(255, 114, 114, 114)),
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.bathtub_outlined,
                        color: CustomColors.primaryColor,
                      ),
                      Text(
                        '2 Bath',
                        style: TextStyle(fontFamily: CustomFont.fontMedium,
                            color: Color.fromARGB(255, 114, 114, 114)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: CustomDimens.spacer2H,
                  ),
                  Text(
                    "Overview",
                    style: TextStyle(fontFamily: CustomFont.fontMedium,fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: CustomDimens.spacerH,
                  ),
                  Text(
                    "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    style: TextStyle(
                      fontFamily: CustomFont.fontRegular,
                      fontSize: 16,
                      color: Color.fromARGB(255, 126, 126, 126),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    height: CustomDimens.spacerH,
                  ),
                  SizedBox(
                      height: 1,
                      width: double.infinity,
                      child: Divider(color: Colors.grey)),
                  SizedBox(
                    height: CustomDimens.spacerH,
                  ),
                  Text(
                    "Gallery",
                    style: TextStyle(fontFamily: CustomFont.fontSemiBold,fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 200, // Set height for the grid view
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageUrls.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(5),
                          width: 150, // Set width for each item
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[300],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              imageUrls[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: CustomDimens.spacer2H,
                  ),
                  Container(
                    height: 70,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                              width: double.infinity,
                              child: PrimaryButton(() {}, "Book Now")),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Container(
                                child: PrimaryButton(() {}, "Call Now"))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
