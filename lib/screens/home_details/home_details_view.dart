import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/config/custom_dia.dart';
import 'package:tappal_app/config/custom_fonts.dart';
import 'package:tappal_app/screens/home_details/home_details_logic.dart';
import 'package:tappal_app/widgets/primary_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tappal_app/widgets/shimmer_widget.dart'; // Import the shimmer package

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
    final logic = Get.put(HomeDetailsLogic());
    return Scaffold(
      //backgroundColor: Colors.green,
      body: Padding(
        padding: EdgeInsets.all(CustomDimens.commonPadding),
        child: SafeArea(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => logic.isLoading.value // Check if the image is loading
                        ? Shimmer.fromColors(
                            baseColor: Colors.grey[300]!,
                            highlightColor: Colors.grey[100]!,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              width: double.infinity,
                              color: Colors
                                  .white, // Dummy container for shimmer effect
                            ),
                          )
                        : Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 225, 237, 231),
                            ),
                            child: logic.imageBytes.value != null
                                ? Image(
                                    image: MemoryImage(logic.imageBytes.value!),
                                    fit: BoxFit.contain,
                                  )
                                : const Image(
                                    image: AssetImage(
                                        'assets/default_image.png'), // Provide a default image path
                                    fit: BoxFit.cover,
                                  ),
                          ),
                  ),
                  SizedBox(height: CustomDimens.spacerH),
                  Obx(
                    () => ShimmerWidget(
                      isLoading: logic.isLoading.value,
                      height: 23,
                      child: Text(
                        logic.houseName.value,
                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          fontFamily: CustomFont.fontBold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: CustomDimens.spacerH),
                  Obx(
                    () => ShimmerWidget(
                      height: 20,
                      isLoading: logic.isLoading.value,
                      child: Row(
                        children: [
                          const Icon(Icons.location_pin),
                          Text(
                            logic.houseLocation.value,
                            style: const TextStyle(
                                color: Colors.blueGrey,
                                fontFamily: CustomFont.fontSemiBold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: CustomDimens.spacerH),
                  Obx(
                    () => ShimmerWidget(
                      height: 30,
                      isLoading: logic.isLoading.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Facilities",
                            style: TextStyle(
                                fontFamily: CustomFont.fontSemiBold,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: logic.housePrice.value,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontFamily: CustomFont.fontSemiBold,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const TextSpan(
                                  text: '/Mon',
                                  style: TextStyle(
                                      fontFamily: CustomFont.fontRegular,
                                      fontSize: 17,
                                      color: Colors.blueGrey)),
                            ]),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: CustomDimens.spacer2H),
                  Obx(
                    () => ShimmerWidget(
                      height: 30,
                      isLoading: logic.isLoading.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.bed_rounded,
                            color: CustomColors.primaryColor,
                          ),
                          Text(
                            '${logic.houseBedroom.value} Bed ',
                            style: const TextStyle(
                                fontFamily: CustomFont.fontMedium,
                                color: Color.fromARGB(255, 114, 114, 114)),
                          ),
                          const SizedBox(width: 15),
                          const Icon(
                            Icons.weekend_outlined,
                            color: CustomColors.primaryColor,
                          ),
                          Text(
                            '${logic.houseCommon.value} Common',
                            style: const TextStyle(
                                fontFamily: CustomFont.fontMedium,
                                color: Color.fromARGB(255, 114, 114, 114)),
                          ),
                          const SizedBox(width: 15),
                          const Icon(
                            Icons.bathtub_outlined,
                            color: CustomColors.primaryColor,
                          ),
                          Text(
                            '${logic.houseBathroom.value} Bath',
                            style: const TextStyle(
                                fontFamily: CustomFont.fontMedium,
                                color: Color.fromARGB(255, 114, 114, 114)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: CustomDimens.spacer2H,
                  ),
                  Obx(
                    () => ShimmerWidget(
                      height: 30,
                      isLoading: logic.isLoading.value,
                      child: const Text(
                        "Overview",
                        style: TextStyle(
                            fontFamily: CustomFont.fontMedium,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: CustomDimens.spacerH,
                  ),
                  Obx(
                    () => ShimmerWidget(
                      height: 30,
                      isLoading: logic.isLoading.value,
                      child: Text(
                        logic.houseDescription.value,
                        style: const TextStyle(
                          fontFamily: CustomFont.fontRegular,
                          fontSize: 16,
                          color: Color.fromARGB(255, 126, 126, 126),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: CustomDimens.spacerH,
                  ),
                  const SizedBox(
                      height: 1,
                      width: double.infinity,
                      child: Divider(color: Colors.grey)),
                  SizedBox(
                    height: CustomDimens.spacerH,
                  ),
                  Obx(
                    () => ShimmerWidget(
                      height: 30,
                      isLoading: logic.isLoading.value,
                      child: const Text(
                        "Gallery",
                        style: TextStyle(
                            fontFamily: CustomFont.fontSemiBold,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Obx(
                    () => ShimmerWidget(
                      height: 210,
                      isLoading: logic.isLoading.value,
                      child: SizedBox(
                        height: 200, // Set height for the grid view
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageUrls.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.all(5),
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
                        const SizedBox(
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
